/// <summary>
/// Codeunit representing a vector and providing operations on vectors, such as addition, multiplication, length calculation, scalar operations, and more.
/// </summary>
codeunit 70000 "Vector GM"
{
    Access = Public;

    var
        VectorImplGm: Codeunit "Vector Impl. GM";

    /// <summary>
    /// Initializes a vector with the specified number of dimensions.
    /// All vector values are set to zero by default.
    /// </summary>
    /// <param name="Dim">The number of dimensions for the vector.</param>
    procedure Initialize(Dim: Integer)
    begin
        VectorImplGm.Initialize(Dim);
    end;

    /// <summary>
    /// Initializes a vector based on a list of coordinates.
    /// </summary>
    /// <param name="Coordinates">The list of coordinates to initialize the vector.</param>
    procedure Initialize(Coordinates: List of [Decimal])
    begin
        VectorImplGm.Initialize(Coordinates);
    end;

    /// <summary>
    /// Initializes a vector based on a well-formatted string representation of a vector.
    /// The available format are: [x,y,z, ...]. The decimal separator must be a dot.
    /// </summary>
    /// <param name="FormattedVector">The well-formatted string representation of the vector.</param>
    procedure Initialize(VectorAsText: Text)
    begin
        VectorImplGm.Initialize(VectorAsText);
    end;

    /// <summary>
    /// Gets the dimension of a vector.
    /// </summary>
    /// <returns>The dimension of the vector as an integer.</returns>
    procedure GetDim(): Integer
    begin
        exit(VectorImplGm.GetDim());
    end;

    /// <summary>
    /// Retrieves the vector as a list of coordinates.
    /// </summary>
    /// <returns>The vector as a list of coordinates.</returns>
    procedure GetVector(): List of [Decimal]
    begin
        exit(VectorImplGm.GetVector());
    end;

    /// <summary>
    /// Converts the vector to a string representation in the format of square brackets like [x, y, z, ...].
    /// </summary>
    /// <returns>A string representation of the vector in the specified format.</returns>
    procedure ToString(): Text
    begin
        exit(VectorImplGm.ToString());
    end;

    /// <summary>
    /// Calculates and returns the Euclidean norm for a vector.
    /// </summary>
    /// <returns>The Euclidean norm as a Decimal value.</returns>
    procedure CalculateEuclideanNorm(): Decimal
    begin
        exit(VectorImplGm.CalculateEuclideanNorm());
    end;

    /// <summary>
    /// Calculates and returns the Taxicab norm for a vector.
    /// </summary>
    /// <returns>The Taxicab norm as a Decimal value.</returns>
    procedure CalculateTaxicabNorm(): Decimal
    begin
        exit(VectorImplGm.CalculateTaxicabNorm());
    end;

    /// <summary>
    /// Multiplies the vector by a scalar.
    /// </summary>
    /// <param name="Scalar">The scalar value to multiply the vector by.</param>
    procedure ScalarMultiplication(Scalar: Decimal)
    begin
        VectorImplGm.ScalarMultiplication(Scalar);
    end;

    /// <summary>
    /// Determines if the vector is equal to the <paramref name="OtherVector"/>.
    /// </summary>
    /// <param name="OtherVector">The vector to compare with.</param>
    /// <returns>True if the vector is equal to the OtherVector; otherwise, false.</returns>
    procedure AreEqual(OtherVector: Codeunit "Vector GM"): Boolean
    begin
        exit(VectorImplGm.AreEqual(OtherVector));
    end;

    /// <summary>
    /// Adds the <paramref name="OtherVector"/> to the vector.
    /// </summary>
    /// <param name="OtherVector">The vector to add.</param>
    procedure AddVector(OtherVector: Codeunit "Vector GM")
    begin
        VectorImplGm.AddVector(OtherVector);
    end;

    /// <summary>
    /// Subtracts the <paramref name="OtherVector"/> from the vector.
    /// </summary>
    /// <param name="OtherVector">The vector to subtract.</param>
    procedure SubtractVector(OtherVector: Codeunit "Vector GM")
    begin
        VectorImplGm.SubtractVector(OtherVector);
    end;

    /// <summary>
    /// Calculates the dot product of the vector with the <paramref name="OtherVector"/>.
    /// </summary>
    /// <param name="OtherVector">The vector to calculate the dot product with.</param>
    procedure DotProduct(OtherVector: Codeunit "Vector GM")
    begin
        VectorImplGm.DotProduct(OtherVector);
    end;

    /// <summary>
    /// Raises an error if the vector is not initialized.
    /// </summary>
    procedure ErrIfVectorIsNotInitialized()
    begin
        VectorImplGm.ErrIfVectorIsNotInitialized();
    end;
}