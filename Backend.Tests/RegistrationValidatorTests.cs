using MroBackend.Validation;
using Xunit;

public class RegistrationValidatorTests
{
    [Fact]
    public void Validate_ReturnsNull_WhenAllFieldsValid()
    {
        var result = RegistrationValidator.Validate("ahmet", "Ahmet Yılmaz", "1234");
        Assert.Null(result);
    }

    [Fact]
    public void Validate_ReturnsError_WhenUsernameEmpty()
    {
        var result = RegistrationValidator.Validate("", "Ahmet Yılmaz", "1234");
        Assert.Equal("Username and full name are required.", result);
    }

    [Theory]
    [InlineData("123", false)]   // 3 karakter — sınırın altı, geçersiz olmalı
    [InlineData("1234", true)]   // tam 4 karakter — sınırın kendisi, geçerli olmalı
    [InlineData("12345", true)]  // 5 karakter — sınırın üstü, geçerli olmalı
    public void Validate_ChecksPasswordLengthBoundary(string password, bool shouldBeValid)
    {
        var result = RegistrationValidator.Validate("ahmet", "Ahmet Yılmaz", password);

        if (shouldBeValid)
            Assert.Null(result);
        else
            Assert.NotNull(result);
    }
}