codeunit 80000 "Vector Test GM"
{
    Subtype = Test;

    var
        Any: Codeunit Any;
        LibraryMathAssert: Codeunit "Library - Math Assert";
        LibraryAssert: Codeunit "Library Assert";
        LibraryVectorTestGM: Codeunit "Library - Vector Test GM";

    [Test]
    procedure InitializeVectorByDimTest()
    var
        VectorGM: Codeunit "Vector GM";
        Dim: Integer;
    begin
        //[SCENARIO] Tests the initialization of a vector based on vector dimension.

        //[GIVEN] The vector dimension.
        Dim := Any.IntegerInRange(1, 10);

        //[WHEN] The Initialize method is called for the dimension.
        VectorGM.Initialize(Dim);

        //[THEN] The GetDim method returns the dimension.
        LibraryAssert.AreEqual(Dim, VectorGM.GetDim(), 'The vector dimension is incorrect.');

        //[AND] The GetVector returns the list of size dimension with all zero elements.
        LibraryMathAssert.AreEqual(LibraryVectorTestGM.GetListOfZeros(Dim), VectorGM.GetVector(), 'The vector coordinates are incorrect.');
    end;

    [Test]
    procedure InitializeVectorBySmallerThanZeroDimTest()
    var
        VectorGM: Codeunit "Vector GM";
        Dim: Integer;
        InvalidDimensionErr: Label 'The vector dimension cannot be equal to ''%1''. It must be greater than zero.', Comment = '%1 = The Invalid Dimension', Locked = true;
    begin
        //[SCENARIO] Tests the initialization of a vector based on vector dimension while the dimension is smaller than zero.

        //[GIVEN] The vector dimension.
        Dim := Any.IntegerInRange(-10, 0);

        //[WHEN] The Initialize method is called for the dimension.
        //[THEN] An error should occur.
        asserterror VectorGM.Initialize(Dim);

        //[AND] The expected error message should match the predefined label.
        LibraryAssert.ExpectedError(StrSubstNo(InvalidDimensionErr, Dim));
    end;

    [Test]
    procedure InitializeVectorByListOfCoordinatesTest()
    var
        VectorGM: Codeunit "Vector GM";
        Coordinates: List of [Decimal];
        Dim: Integer;
    begin
        //[SCENARIO] Testing the initialization of a vector based on a list of coordinates.

        //[GIVEN] The vector dimension.
        Dim := Any.IntegerInRange(1, 10);

        //[AND] A list of random vector coordinates.
        Coordinates := LibraryVectorTestGM.GetRandomList(Dim);

        //[WHEN] The Initialize method is called with the list of coordinates.
        VectorGM.Initialize(Coordinates);

        //[THEN] The GetDim method should return the expected dimension.
        LibraryAssert.AreEqual(Dim, VectorGM.GetDim(), 'The vector dimension is incorrect.');

        //[AND] The GetVector method should return the expected coordinates.
        LibraryMathAssert.AreEqual(Coordinates, VectorGM.GetVector(), 'The vector coordinates are incorrect.');
    end;

    [Test]
    procedure InitializeVectorByAnEmptyListOfCoordinatesTest()
    var
        VectorGM: Codeunit "Vector GM";
        Coordinates: List of [Decimal];
        InvalidDimensionErr: Label 'The vector dimension cannot be equal to ''%1''. It must be greater than zero.', Comment = '%1 = The Invalid Dimension', Locked = true;
    begin
        //[SCENARIO] Testing the initialization of a vector based on an empty list of coordinates.

        //[GIVEN] An empty list of vector coordinates.

        //[WHEN] The Initialize method is called with the empty list of coordinates.
        //[THEN] An error should occur.
        asserterror VectorGM.Initialize(Coordinates);

        //[AND] The expected error message should match the predefined label.
        LibraryAssert.ExpectedError(StrSubstNo(InvalidDimensionErr, Coordinates.Count()));
    end;

    [Test]
    procedure InitializeVectorByWellFormatedTextTest()
    var
        VectorGM: Codeunit "Vector GM";
        Coordinates: List of [Decimal];
        Dim: Integer;
    begin
        //[SCNARIO] Tests the initialization of a vector based on a well formated text.

        //[GIVEN] The vector dimension.
        Dim := Any.IntegerInRange(1, 10);

        //[AND] A list of random vector coordinates.
        Coordinates := LibraryVectorTestGM.GetRandomList(Dim);

        //[WHEN] The Initialize method is called for the well formated coordinates in the square brackets [].
        VectorGM.Initialize('[' + LibraryVectorTestGM.GetListAsCommaSeparatedCoordinates(Coordinates) + ']');

        //[THEN] The GetDim method should return the expected dimension.
        LibraryAssert.AreEqual(Dim, VectorGM.GetDim(), 'The vector dimension is incorrect.');

        //[AND] The GetVector method should return the expected coordinates.
        LibraryMathAssert.AreEqual(Coordinates, VectorGM.GetVector(), 'The vector coordinates are incorrect.');
    end;

    [Test]
    procedure InitializeVectorByBadFormatedTextTest()
    var
        VectorGM: Codeunit "Vector GM";
        UnparsableText: Text;
        UnparsableTextErr: Label 'The text ''%1'' cannot be parsed to the vector. The available format is [x,y,z, ...]. The decimal separator must be a dot.', Comment = '%1 = Unparsable Text', Locked = true;
    begin
        //[SCNARIO] Tests the initialization of a vector based on a bad formated text.

        //[GIVEN] Unparsable text.
        UnparsableText := Any.AlphabeticText(100);

        //[WHEN] The Initialize method is called for the bad formated text.
        //[THEN] An error should occur.
        asserterror VectorGM.Initialize(UnparsableText);

        //[AND] The expected error message should match the predefined label.
        LibraryAssert.ExpectedError(StrSubstNo(UnparsableTextErr, UnparsableText));
    end;

    [Test]
    procedure VectorNotIntializedTest()
    var
        VectorGM: Codeunit "Vector GM";
        VectorNotInitalizedErr: Label 'The vector is not initialized.', Locked = true;
    begin
        //[SCENARIO] Tests raising an error if the vector is not initialized for a non-initialized vector.

        //[GIVEN] A non-initialized vector.

        //[WHEN] The ErrIfVectorIsNotInitialized method is called.
        //[THEN] An error should occur.
        asserterror VectorGM.ErrIfVectorIsNotInitialized();

        //[AND] The expected error message should match the predefined label.
        LibraryAssert.ExpectedError(VectorNotInitalizedErr);
    end;

    [Test]
    procedure VectorIntializedTest()
    var
        VectorGM: Codeunit "Vector GM";
    begin
        //[SCENARIO] Tests raising an error if the vector is not initialized for an initialized vector.

        //[GIVEN] An initialized vector.
        VectorGM.Initialize(Any.IntegerInRange(1, 10));

        //[WHEN] The ErrIfVectorIsNotInitialized method is called.
        //[THEN] No error should occur.
        VectorGM.ErrIfVectorIsNotInitialized();
    end;

    [Test]
    procedure VectorToStringTest()
    var
        VectorGM: Codeunit "Vector GM";
        Coordinates: List of [Decimal];
        ExpectedVector: Text;
    begin
        //[SCENARIO] Tests the conversion of a vector to a string.

        //[GIVEN] A list of random vector coordinates.
        Coordinates := LibraryVectorTestGM.GetRandomList(Any.IntegerInRange(1, 10));

        //[AND] An initialized vector.
        VectorGM.Initialize(Coordinates);

        //[AND] An expected Vector as a string representation.
        ExpectedVector := '[' + LibraryVectorTestGM.GetListAsCommaSeparatedCoordinates(Coordinates) + ']';

        //[WHEN] The ToString method is called.
        //[THEN] The method returns the Vector as a string in the format of [x, y, z, ...].
        LibraryAssert.AreEqual(ExpectedVector, VectorGM.ToString(), 'The Vector string representation is incorrect.');
    end;

    [Test]
    procedure VectorEuclideanNormTest()
    var
        VectorGM: Codeunit "Vector GM";
        Coordinates: List of [Decimal];
    begin
        //[SCENARIO] Tests the Euclidean Norm calculation.

        //[GIVEN] Default test coordinates.
        Coordinates := GetDefaultCoordinates();

        //[AND] An initialized vector.
        VectorGM.Initialize(Coordinates);

        //[WHEN] The CalculateEuclideanNorm method is called.
        //[THEN] The method returns 5, which is the Euclidean Norm for the default coordinates.
        LibraryAssert.AreEqual(5, VectorGM.CalculateEuclideanNorm(), 'The Euclidean Norm is incorrect.');
    end;

    [Test]
    procedure VectorTaxicabNormTest()
    var
        VectorGM: Codeunit "Vector GM";
        Coordinates: List of [Decimal];
    begin
        //[SCENARIO] Tests the Taxicab Norm calculation.

        //[GIVEN] Default test coordinates.
        Coordinates := GetDefaultCoordinates();

        //[AND] An initialized vector.
        VectorGM.Initialize(Coordinates);

        //[WHEN] The CalculateTaxicabNorm method is called.
        //[THEN] The method returns 7, which is the Taxicab Norm for the default coordinates.
        LibraryAssert.AreEqual(7, VectorGM.CalculateTaxicabNorm(), 'The Taxicab Norm is incorrect.');
    end;

    [Test]
    procedure MultipleVectorByScalarTest()
    var
        VectorGM: Codeunit "Vector GM";
        Coordinates: List of [Decimal];
        Dim: Integer;
        Scalar: Decimal;
    begin
        //[SCENARIO] Tests the multiplication of vector by scalar.

        //[GIVEN] The vector dimension.
        Dim := Any.IntegerInRange(1, 10);

        //[AND] A list of random vector coordinates.
        Coordinates := LibraryVectorTestGM.GetRandomList(Dim);

        //[AND] An initialized vector.
        VectorGM.Initialize(Coordinates);

        //[AND] A random scalar value.
        Scalar := Any.IntegerInRange(100);

        //[WHEN] The ScalarMultiplication method is called.
        VectorGM.ScalarMultiplication(Scalar);

        //[THEN] The GetVector method should return the coordinates multiplied by the scalar.
        LibraryVectorTestGM.MultipleListByNumber(Coordinates, Scalar);
        LibraryMathAssert.AreEqual(Coordinates, VectorGM.GetVector(), 'The vector coordinates multiplied by scalar are incorrect.');
    end;

    [Test]
    procedure AreVectorsEqualTest()
    var
        VectorGM_X, VectorGM_Y : Codeunit "Vector GM";
        Coordinates: List of [Decimal];
        Dim: Integer;
    begin
        //[SCENARIO] Tests the equality of vectors.

        //[GIVEN] The vector dimension.
        Dim := Any.IntegerInRange(1, 10);

        //[AND] A list of random vector coordinates.
        Coordinates := LibraryVectorTestGM.GetRandomList(Dim);

        //[AND] An initialized Vector_X by Coordinates.
        VectorGM_X.Initialize(Coordinates);

        //[AND] An initialized Vector_Y by Coordinates.
        VectorGM_Y.Initialize(Coordinates);

        //[WHEN] The AreEqual method is called.
        //[THEN] The method returns true.
        LibraryAssert.IsTrue(VectorGM_X.AreEqual(VectorGM_Y), 'The vectors are not equal.');
    end;

    [Test]
    procedure VectorsAdditionTest()
    var
        VectorGM_X: Codeunit "Vector GM";
        VectorGM_Y: Codeunit "Vector GM";
        VectorGM_Z: Codeunit "Vector GM";
    begin
        //[SCENARIO] Tests the addition of vectors.

        //[GIVEN] An initialized first Vector_X.
        VectorGM_X.Initialize('[1,2,3]');

        //[AND] An initialized second Vector_Y.
        VectorGM_Y.Initialize('[3,2,1]');

        //[AND] An initialized Vector_Z which is the sum of Vector_X and Vector_Y.
        VectorGM_Z.Initialize('[4,4,4]');

        //[WHEN] Vector_Y is added to Vector_X.
        VectorGM_X.AddVector(VectorGM_Y);

        //[THEN] The AreEqual method returns true for Vector_X and Vector_Z.
        LibraryAssert.IsTrue(VectorGM_X.AreEqual(VectorGM_Z), 'The vectors have not been added properly.');
    end;

    [Test]
    procedure VectorsSubtractionTest()
    var
        VectorGM_X: Codeunit "Vector GM";
        VectorGM_Y: Codeunit "Vector GM";
        VectorGM_Z: Codeunit "Vector GM";
    begin
        //[SCENARIO] Tests the subtraction of vectors.

        //[GIVEN] An initialized first Vector_X.
        VectorGM_X.Initialize('[1,2,3]');

        //[AND] An initialized second Vector_Y.
        VectorGM_Y.Initialize('[3,2,1]');

        //[AND] An initialized Vector_Z which is the subtraction of Vector_X by Vector_Y.
        VectorGM_Z.Initialize('[-2,0,2]');

        //[WHEN] Vector_Y is subtracted from Vector_X.
        VectorGM_X.SubtractVector(VectorGM_Y);

        //[THEN] The AreEqual method returns true for Vector_X and Vector_Z.
        LibraryAssert.IsTrue(VectorGM_X.AreEqual(VectorGM_Z), 'The vectors have not been subtracted properly.');
    end;

    [Test]
    procedure VectorsDotProductTest()
    var
        VectorGM_X: Codeunit "Vector GM";
        VectorGM_Y: Codeunit "Vector GM";
        VectorGM_Z: Codeunit "Vector GM";
    begin
        //[SCENARIO] Tests the dot product of vectors.

        //[GIVEN] An initialized first Vector_X.
        VectorGM_X.Initialize('[1,2,3]');

        //[AND] An initialized second Vector_Y.
        VectorGM_Y.Initialize('[3,2,1]');

        //[AND] An initialized Vector_Z which is the dot product of Vector_X and Vector_Y.
        VectorGM_Z.Initialize('[3,4,3]');

        //[WHEN] Vector_Y is multiplied by Vector_X.
        VectorGM_X.DotProduct(VectorGM_Y);

        //[THEN] The AreEqual method returns true for Vector_X and Vector_Z.
        LibraryAssert.IsTrue(VectorGM_X.AreEqual(VectorGM_Z), 'The vectors have not been multiplied properly.');
    end;


    local procedure GetDefaultCoordinates() Coordinates: List of [Decimal]
    begin
        Coordinates.Add(4);
        Coordinates.Add(-3);
        Coordinates.Add(0);
    end;
}