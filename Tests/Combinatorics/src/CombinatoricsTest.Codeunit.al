codeunit 80002 "Combinatorics Test"
{
    Subtype = Test;

    var
        LibraryAssert: Codeunit "Library Assert";

    [Test]
    procedure FactorialTests()
    var
        Combinatorics: Codeunit Combinatorics;
        IncorrectFactorialErr: Label 'The value of n must be greater than or equal to 0.', Locked = true;
    begin
        //[SCENARIO] Tests different factorial calculations.
        LibraryAssert.AreEqual(1, Combinatorics.Factorial(0), '0! is incorrectly calculated.');
        LibraryAssert.AreEqual(1, Combinatorics.Factorial(1), '1! is incorrectly calculated.');
        LibraryAssert.AreEqual(6, Combinatorics.Factorial(3), '3! is incorrectly calculated.');
        LibraryAssert.AreEqual(120, Combinatorics.Factorial(5), '5! is incorrectly calculated.');
        LibraryAssert.AreEqual(3628800, Combinatorics.Factorial(10), '10! is incorrectly calculated.');

        asserterror Combinatorics.Factorial(-5);
        LibraryAssert.ExpectedError(IncorrectFactorialErr);
    end;

    [Test]
    procedure CombinationTests()
    var
        Combinatorics: Codeunit Combinatorics;
        IncorrectCombinationErr: Label 'The value of k must be less than or equal to the value of n and both numbers must be greater than or equal to 0.', Locked = true;
    begin
        //[SCENARIO] Tests different combination calculations.
        LibraryAssert.AreEqual(20, Combinatorics.Combination(6, 3), '6 choose 3 is incorrectly calculated.');
        LibraryAssert.AreEqual(21, Combinatorics.Combination(7, 2), '7 choose 2 is incorrectly calculated.');
        LibraryAssert.AreEqual(1, Combinatorics.Combination(8, 8), '8 choose 8 is incorrectly calculated.');
        LibraryAssert.AreEqual(1, Combinatorics.Combination(4, 0), '4 choose 0 is incorrectly calculated.');
        LibraryAssert.AreEqual(54740, Combinatorics.Combination(70, 3), '70 choose 3 is incorrectly calculated.');

        asserterror Combinatorics.Combination(-4, 3);
        LibraryAssert.ExpectedError(IncorrectCombinationErr);

        asserterror Combinatorics.Combination(4, -3);
        LibraryAssert.ExpectedError(IncorrectCombinationErr);

        asserterror Combinatorics.Combination(-4, -3);
        LibraryAssert.ExpectedError(IncorrectCombinationErr);

        asserterror Combinatorics.Combination(5, 7);
        LibraryAssert.ExpectedError(IncorrectCombinationErr);
    end;
}