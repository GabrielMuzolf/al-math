codeunit 80000 "Vector Test"
{
    Subtype = Test;

    var
        Any: Codeunit Any;
        LibraryMathAssert: Codeunit "Library - Math Assert";
        LibraryAssert: Codeunit "Library Assert";
        LibraryVectorTest: Codeunit "Library - Vector Test";


    [Test]
    procedure InitalizeVectorByDimTest()
    var
        Vector: Codeunit Vector;
        Dim: Integer;
    begin
        //[SCENARIO] Tests the initialization of a vector based on vector dimension.

        //[GIVEN] The vector dimension.
        Dim := Any.IntegerInRange(1, 10);

        //[WHEN] The Initialize method is called for the dimension.
        Vector.Initalize(Dim);

        //[THEN] The GetDim method returns the dimension.
        LibraryAssert.AreEqual(Dim, Vector.GetDim(), 'The vector dimension is incorrect.');

        //[AND] The GetVector returns the list of size dimension with all zero elements.
        LibraryMathAssert.AreEqual(LibraryVectorTest.GetListOfZeros(Dim), Vector.GetVector(), 'The vector coordinates are incorrect.');
    end;

    [Test]
    procedure InitalizeVectorByListOfCoordinatesTest()
    begin
        //[SCNARIO] Tests the initialization of a vector based on a list of coordinates.
    end;

    [Test]
    procedure InitalizeVectorByWellFormatedTextTest()
    begin
        //[SCNARIO] Tests the initialization of a vector based on a well formated text.
    end;

    [Test]
    procedure InitalizeVectorByBadFormatedTextTest()
    begin
        //[SCNARIO] Tests the initialization of a vector based on a bad formated text.
    end;

    [Test]
    procedure VectorToStringTest()
    begin
        //[SCNARIO] Tests the conversion vector to string.
    end;


}