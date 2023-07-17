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
        LibraryAssert.AreEqual(1L, Combinatorics.Factorial(0), '0! is incorrectly calculated.');
        LibraryAssert.AreEqual(1L, Combinatorics.Factorial(1), '1! is incorrectly calculated.');
        LibraryAssert.AreEqual(6L, Combinatorics.Factorial(3), '3! is incorrectly calculated.');
        LibraryAssert.AreEqual(120L, Combinatorics.Factorial(5), '5! is incorrectly calculated.');
        LibraryAssert.AreEqual(3628800L, Combinatorics.Factorial(10), '10! is incorrectly calculated.');

        asserterror Combinatorics.Factorial(-5);
        LibraryAssert.ExpectedError(IncorrectFactorialErr);
    end;

    [Test]
    procedure CombinationTests()
    var
        Combinatorics: Codeunit Combinatorics;
        IncorrectCombinationErr: Label 'The value of k must be less than or equal to the value of n and both numbers must be greater than or equal to 1.', Locked = true;
    begin
        //[SCENARIO] Tests different combination calculations.
        LibraryAssert.AreEqual(4L, Combinatorics.Combination(4, 3), 'Combination (4 choose 3) is incorrectly calculated.');
        LibraryAssert.AreEqual(20L, Combinatorics.Combination(6, 3), 'Combination (6 choose 3) is incorrectly calculated.');
        LibraryAssert.AreEqual(21L, Combinatorics.Combination(7, 2), 'Combination (7 choose 2) is incorrectly calculated.');
        LibraryAssert.AreEqual(1L, Combinatorics.Combination(8, 8), 'Combination (8 choose 8) is incorrectly calculated.');
        LibraryAssert.AreEqual(120L, Combinatorics.Combination(10, 3), 'Combination (10 choose 3) is incorrectly calculated.');

        asserterror Combinatorics.Combination(4, 0);
        LibraryAssert.ExpectedError(IncorrectCombinationErr);

        asserterror Combinatorics.Combination(0, 4);
        LibraryAssert.ExpectedError(IncorrectCombinationErr);

        asserterror Combinatorics.Combination(-4, 3);
        LibraryAssert.ExpectedError(IncorrectCombinationErr);

        asserterror Combinatorics.Combination(4, -3);
        LibraryAssert.ExpectedError(IncorrectCombinationErr);

        asserterror Combinatorics.Combination(-4, -3);
        LibraryAssert.ExpectedError(IncorrectCombinationErr);

        asserterror Combinatorics.Combination(5, 7);
        LibraryAssert.ExpectedError(IncorrectCombinationErr);
    end;

    [Test]
    procedure CombinationWithRepetitionTests()
    var
        Combinatorics: Codeunit Combinatorics;
        IncorrectCombinationWithRepetitionErr: Label 'Both numbers must be greater than or equal to 1.', Locked = true;
    begin
        //[SCENARIO] Tests different combination with repetition calculations.
        LibraryAssert.AreEqual(36L, Combinatorics.CombinationWithRepetition(8, 2), 'Combination with repetition (8 choose 2) is incorrectly calculated.');
        LibraryAssert.AreEqual(9L, Combinatorics.CombinationWithRepetition(2, 8), 'Combination with repetition (2 choose 8) is incorrectly calculated.');
        LibraryAssert.AreEqual(1L, Combinatorics.CombinationWithRepetition(1, 5), 'Combination with repetition (1 choose 5) is incorrectly calculated.');
        LibraryAssert.AreEqual(210L, Combinatorics.CombinationWithRepetition(5, 6), 'Combination with repetition (5 choose 6) is incorrectly calculated.');
        LibraryAssert.AreEqual(31824L, Combinatorics.CombinationWithRepetition(8, 11), 'Combination with repetition (8 choose 11) is incorrectly calculated.');

        asserterror Combinatorics.CombinationWithRepetition(4, 0);
        LibraryAssert.ExpectedError(IncorrectCombinationWithRepetitionErr);

        asserterror Combinatorics.CombinationWithRepetition(0, 4);
        LibraryAssert.ExpectedError(IncorrectCombinationWithRepetitionErr);

        asserterror Combinatorics.CombinationWithRepetition(-3, 0);
        LibraryAssert.ExpectedError(IncorrectCombinationWithRepetitionErr);

        asserterror Combinatorics.CombinationWithRepetition(0, -3);
        LibraryAssert.ExpectedError(IncorrectCombinationWithRepetitionErr);

        asserterror Combinatorics.CombinationWithRepetition(-4, -3);
        LibraryAssert.ExpectedError(IncorrectCombinationWithRepetitionErr);
    end;

    [Test]
    procedure VariationTests()
    var
        Combinatorics: Codeunit Combinatorics;
        IncorrectVariationErr: Label 'The value of k must be less than or equal to the value of n and both numbers must be greater than or equal to 0.', Locked = true;
    begin
        //[SCENARIO] Tests different variation calculations.
        LibraryAssert.AreEqual(1L, Combinatorics.Variation(1, 1), 'Variation (1 choose 1) is incorrectly calculated.');
        LibraryAssert.AreEqual(24L, Combinatorics.Variation(4, 4), 'Variation (4 choose 4) is incorrectly calculated.');
        LibraryAssert.AreEqual(60L, Combinatorics.Variation(5, 3), 'Variation (5 choose 4) is incorrectly calculated.');
        LibraryAssert.AreEqual(56L, Combinatorics.Variation(8, 2), 'Variation (8 choose 2) is incorrectly calculated.');
        LibraryAssert.AreEqual(5040L, Combinatorics.Variation(7, 6), 'Variation (7 choose 6) is incorrectly calculated.');

        asserterror Combinatorics.Variation(-4, 3);
        LibraryAssert.ExpectedError(IncorrectVariationErr);

        asserterror Combinatorics.Variation(4, -3);
        LibraryAssert.ExpectedError(IncorrectVariationErr);

        asserterror Combinatorics.Variation(-4, -3);
        LibraryAssert.ExpectedError(IncorrectVariationErr);

        asserterror Combinatorics.Variation(5, 7);
        LibraryAssert.ExpectedError(IncorrectVariationErr);
    end;

    [Test]
    procedure VariationWithRepetitionTests()
    var
        Combinatorics: Codeunit Combinatorics;
        IncorrectVariationWithRepetitionErr: Label 'Both numbers must be greater than or equal to 0.', Locked = true;
    begin
        //[SCENARIO] Tests different variation with repetition calculations.

        LibraryAssert.AreEqual(1L, Combinatorics.VariationWithRepetition(5, 0), 'Variation with repetition (1 choose 1) is incorrectly calculated.');
        LibraryAssert.AreEqual(0L, Combinatorics.VariationWithRepetition(0, 5), 'Variation with repetition (4 choose 4) is incorrectly calculated.');
        LibraryAssert.AreEqual(125L, Combinatorics.VariationWithRepetition(5, 3), 'Variation with repetition (5 choose 4) is incorrectly calculated.');
        LibraryAssert.AreEqual(64L, Combinatorics.VariationWithRepetition(8, 2), 'Variation with repetition (8 choose 2) is incorrectly calculated.');
        LibraryAssert.AreEqual(117649L, Combinatorics.VariationWithRepetition(7, 6), 'Variation with repetition (7 choose 6) is incorrectly calculated.');

        asserterror Combinatorics.Variation(-4, 3);
        LibraryAssert.ExpectedError(IncorrectVariationWithRepetitionErr);

        asserterror Combinatorics.Variation(4, -3);
        LibraryAssert.ExpectedError(IncorrectVariationWithRepetitionErr);

        asserterror Combinatorics.Variation(-4, -3);
        LibraryAssert.ExpectedError(IncorrectVariationWithRepetitionErr);
    end;
}