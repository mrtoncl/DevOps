namespace MroBackend.Validation;

public static class RegistrationValidator
{
    public static string? Validate(string username, string fullName, string password)
    {
        if (string.IsNullOrWhiteSpace(username) || string.IsNullOrWhiteSpace(fullName))
        {
            return "Username and full name are required.";
        }

        if (string.IsNullOrEmpty(password) || password.Length < 4)
        {
            return "Password must be at least 4 characters.";
        }

        return null;
    }
}
