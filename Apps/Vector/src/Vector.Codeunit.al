/// <summary>
/// Codeunit representing a vector and providing operations on vectors, such as addition, multiplication, length calculation, scalar operations, and more.
/// </summary>
codeunit 70000 Vector
{
    Access = Public;

    /// <summary>
    /// Initializes a vector with the specified number of dimensions.
    /// All vector values are set to zero by default.
    /// </summary>
    /// <param name="Dim">The number of dimensions for the vector.</param>
    procedure Initalize(Dim: Integer)
    begin

    end;

    /// <summary>
    /// Initializes a vector based on a list of coordinates.
    /// </summary>
    /// <param name="CoordinatesList">The list of coordinates to initialize the vector.</param>
    procedure Initalize(CoordinatesList: List of [Integer])
    begin

    end;

    /// <summary>
    /// Initializes a vector based on a well-formatted string representation.
    /// The available formats are: [x,y,z...] and (x,y,z...).
    /// </summary>
    /// <param name="FormattedVector">The well-formatted string representation of the vector.</param>
    procedure Initalize(FormatedVector: Text)
    begin

    end;

    /// <summary>
    /// Retrieves the vector.
    /// </summary>
    /// <returns>The vector as a list of integers.</returns>
    procedure GetVector(): List of [Integer]
    begin

    end;
    /// <summary>
    /// Converts the vector to a string representation in the format of square brackets like [x, y, z, ...].
    /// </summary>
    /// <returns>A string representation of the vector in the specified format.</returns>
    procedure ToString(): Text
    begin

    end;
}