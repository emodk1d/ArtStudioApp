namespace ArtStudioApp;

public record ParticipantInfo
{
    public required string Nickname { get; init; }
    public required string Role { get; init; }
    public required string Passport{ get; init; } 
};