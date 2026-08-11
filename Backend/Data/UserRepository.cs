using Npgsql;
using Dapper;

namespace MroBackend.Data;

public class UserRepository
{
    private readonly string _connectionString;

    public UserRepository(string connectionString)
    {
        _connectionString = connectionString;
    }

    public async Task<bool> UsernameExistsAsync(string username)
    {
        await using var connection = new NpgsqlConnection(_connectionString);
        var existing = await connection.QuerySingleOrDefaultAsync<int?>(
            "SELECT id FROM users WHERE username = @Username",
            new { Username = username }
        );
        return existing != null;
    }

    public async Task<int?> GetRoleIdAsync(string roleName)
    {
        await using var connection = new NpgsqlConnection(_connectionString);
        return await connection.QuerySingleOrDefaultAsync<int?>(
            "SELECT id FROM roles WHERE name = @RoleName",
            new { RoleName = roleName }
        );
    }

    public async Task RegisterAsync(string username, string passwordHash, string fullName, int roleId)
    {
        await using var connection = new NpgsqlConnection(_connectionString);
        await connection.ExecuteAsync(
            "INSERT INTO users (username, password_hash, full_name, role_id) VALUES (@Username, @PasswordHash, @FullName, @RoleId)",
            new { Username = username, PasswordHash = passwordHash, FullName = fullName, RoleId = roleId }
        );
    }
}