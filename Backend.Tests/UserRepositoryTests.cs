using Dapper;
using MroBackend.Data;
using Npgsql;
using Testcontainers.PostgreSql;
using Xunit;

public class UserRepositoryTests : IAsyncLifetime
{
    private readonly PostgreSqlContainer _postgres = new PostgreSqlBuilder()
        .WithImage("postgres:18-alpine")
        .Build();

    private UserRepository _repository = null!;

    public async Task InitializeAsync()
    {
        await _postgres.StartAsync();

        await using var connection = new NpgsqlConnection(_postgres.GetConnectionString());
        await connection.OpenAsync();
        await connection.ExecuteAsync(@"
            CREATE TABLE roles (id integer NOT NULL, name text NOT NULL);
            CREATE TABLE users (
                id serial NOT NULL,
                username text NOT NULL,
                password_hash text NOT NULL,
                full_name text NOT NULL,
                role_id integer
            );
            INSERT INTO roles (id, name) VALUES (1, 'Kullanici');
        ");

        _repository = new UserRepository(_postgres.GetConnectionString());
    }

    public Task DisposeAsync() => _postgres.DisposeAsync().AsTask();

    [Fact]
    public async Task UsernameExistsAsync_ReturnsFalse_WhenNoUserRegistered()
    {
        var exists = await _repository.UsernameExistsAsync("ahmet");
        Assert.False(exists);
    }

    [Fact]
    public async Task RegisterAsync_ThenUsernameExists_ReturnsTrue()
    {
        await _repository.RegisterAsync("ahmet", "hashed-value", "Ahmet Yılmaz", roleId: 1);

        var exists = await _repository.UsernameExistsAsync("ahmet");
        Assert.True(exists);
    }

    [Fact]
    public async Task GetRoleIdAsync_ReturnsNull_WhenRoleDoesNotExist()
    {
        var roleId = await _repository.GetRoleIdAsync("Olmayan Rol");
        Assert.Null(roleId);
    }
}