codeunit 80000 "Vector Test"
{
    Subtype = Test;

    var
        Any: Codeunit Any;
        LibraryMathAssert: Codeunit "Library - Math Assert";
        LibraryAssert: Codeunit "Library Assert";
        LibraryVectorTest: Codeunit "Library - Vector Test";


    [Test]
    procedure InitializeVectorByDimTest()
    var
        Vector: Codeunit Vector;
        Dim: Integer;
    begin
        //[SCENARIO] Tests the initialization of a vector based on vector dimension.

        //[GIVEN] The vector dimension.
        Dim := Any.IntegerInRange(1, 10);

        //[WHEN] The Initialize method is called for the dimension.
        Vector.Initialize(Dim);

        //[THEN] The GetDim method returns the dimension.
        LibraryAssert.AreEqual(Dim, Vector.GetDim(), 'The vector dimension is incorrect.');

        //[AND] The GetVector returns the list of size dimension with all zero elements.
        LibraryMathAssert.AreEqual(LibraryVectorTest.GetListOfZeros(Dim), Vector.GetVector(), 'The vector coordinates are incorrect.');
    end;

    [Test]
    procedure InitializeVectorBySmallerThanZeroDimTest()
    var
        Vector: Codeunit Vector;
        Dim: Integer;
        InvalidDimensionErr: Label 'The vector dimension cannot be equal to ''%1''. It must be greater than zero.', Comment = '%1 = The Invalid Dimension', Locked = true;
    begin
        //[SCENARIO] Tests the initialization of a vector based on vector dimension while the dimension is smaller than zero.

        //[GIVEN] The vector dimension.
        Dim := Any.IntegerInRange(-10, 0);

        //[WHEN] The Initialize method is called for the dimension.
        //[THEN] An error should occur.
        asserterror Vector.Initialize(Dim);

        //[AND] The expected error message should match the predefined label.
        LibraryAssert.ExpectedError(StrSubstNo(InvalidDimensionErr, Dim));
    end;

    [Test]
    procedure InitializeVectorByListOfCoordinatesTest()
    var
        Vector: Codeunit Vector;
        Coordinates: List of [Integer];
        Dim: Integer;
    begin
        //[SCENARIO] Testing the initialization of a vector based on a list of coordinates.

        //[GIVEN] The vector dimension.
        Dim := Any.IntegerInRange(1, 10);

        //[AND] A list of random vector coordinates.
        Coordinates := LibraryVectorTest.GetRandomList(Dim);

        //[WHEN] The Initialize method is called with the list of coordinates.
        Vector.Initialize(Coordinates);

        //[THEN] The GetDim method should return the expected dimension.
        LibraryAssert.AreEqual(Dim, Vector.GetDim(), 'The vector dimension is incorrect.');

        //[AND] The GetVector method should return the expected coordinates.
        LibraryMathAssert.AreEqual(Coordinates, Vector.GetVector(), 'The vector coordinates are incorrect.');
    end;

    [Test]
    procedure InitializeVectorByAnEmptyListOfCoordinatesTest()
    var
        Vector: Codeunit Vector;
        Coordinates: List of [Integer];
        InvalidDimensionErr: Label 'The vector dimension cannot be equal to ''%1''. It must be greater than zero.', Comment = '%1 = The Invalid Dimension', Locked = true;
    begin
        //[SCENARIO] Testing the initialization of a vector based on an empty list of coordinates.

        //[GIVEN] An empty list of vector coordinates.

        //[WHEN] The Initialize method is called with the empty list of coordinates.
        //[THEN] An error should occur.
        asserterror Vector.Initialize(Coordinates);

        //[AND] The expected error message should match the predefined label.
        LibraryAssert.ExpectedError(StrSubstNo(InvalidDimensionErr, Coordinates.Count()));
    end;

    [Test]
    procedure InitializeVectorByWellFormatedTextTest()
    var
        Vector: Codeunit Vector;
        Coordinates: List of [Integer];
        Dim: Integer;
    begin
        //[SCNARIO] Tests the initialization of a vector based on a well formated text.

        //[GIVEN] The vector dimension.
        Dim := Any.IntegerInRange(1, 10);

        //[AND] A list of random vector coordinates.
        Coordinates := LibraryVectorTest.GetRandomList(Dim);

        //[WHEN] The Initialize method is called for the well formated coordinates in the square brackets [].
        Vector.Initialize('[' + LibraryVectorTest.GetListAsCommaSeparatedCoordinates(Coordinates) + ']');

        //[THEN] The GetDim method should return the expected dimension.
        LibraryAssert.AreEqual(Dim, Vector.GetDim(), 'The vector dimension is incorrect.');

        //[AND] The GetVector method should return the expected coordinates.
        LibraryMathAssert.AreEqual(Coordinates, Vector.GetVector(), 'The vector coordinates are incorrect.');
    end;

    [Test]
    procedure InitializeVectorByBadFormatedTextTest()
    var
        Vector: Codeunit Vector;
        UnparsableText: Text;
        UnparsableTextErr: Label 'The text ''%1'' cannot be parsed to the vector. The available format is [x,y,z, ...] ', Comment = '%1 = Unparsable Text', Locked = true;
    begin
        //[SCNARIO] Tests the initialization of a vector based on a bad formated text.

        //[GIVEN] Unparsable text.
        UnparsableText := Any.AlphabeticText(100);

        //[WHEN] The Initialize method is called for the bad formated text.
        //[THEN] An error should occur.
        asserterror Vector.Initialize(UnparsableText);

        //[AND] The expected error message should match the predefined label.
        LibraryAssert.ExpectedError(StrSubstNo(UnparsableTextErr, UnparsableText));
    end;

    [Test]
    procedure VectorToStringTest()
    var
        Vector: Codeunit Vector;
        Coordinates: List of [Integer];
        Dim: Integer;
        ExpectedVector: Text;
    begin
        //[SCENARIO] Tests the conversion of a vector to a string.

        //[GIVEN] The vector dimension.
        Dim := Any.IntegerInRange(1, 10);

        //[AND] A list of random vector coordinates.
        Coordinates := LibraryVectorTest.GetRandomList(Dim);

        //[AND] An initialized vector.
        Vector.Initialize(Coordinates);

        //[AND] An expected Vector as a string representation.
        ExpectedVector := '[' + LibraryVectorTest.GetListAsCommaSeparatedCoordinates(Coordinates) + ']';

        //[WHEN] The ToString method is called.
        //[THEN] The method returns the Vector as a string in the format of [x, y, z, ...].
        LibraryAssert.AreEqual(ExpectedVector, Vector.ToString(), 'The Vector string representation is incorrect.');
    end;
}