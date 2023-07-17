codeunit 70002 Combinatorics
{
    Access = Public;

    var
        CombinatoricsImpl: Codeunit "Combinatorics Impl.";

    /// <summary>
    /// Calculates the factorial of an integer n.
    /// </summary>
    /// <param name="n">The integer for which factorial is calculated.</param>
    /// <returns>The factorial of n as an integer.</returns>
    procedure Factorial(n: Integer): BigInteger
    begin
        exit(CombinatoricsImpl.Factorial(n));
    end;

    /// <summary>
    /// Calculates the combination (n choose k).
    /// </summary>
    /// <param name="n">The total number of items.</param>
    /// <param name="k">The number of items to be chosen.</param>
    /// <returns>The number of combinations (n choose k) as an integer.</returns>
    procedure Combination(n: Integer; k: Integer): BigInteger
    begin
        exit(CombinatoricsImpl.Combination(n, k));
    end;

    /// <summary>
    /// Calculates the combination with repetition (n choose k), which represents the number of ways to choose k items from a set of n items with repetition allowed.
    /// </summary>
    /// <param name="n">The total number of items.</param>
    /// <param name="k">The number of items to be chosen.</param>
    /// <returns>The number of combinations with repetition (n choose k) as an integer.</returns>
    procedure CombinationWithRepetition(n: Integer; k: Integer): BigInteger
    begin
        exit(CombinatoricsImpl.CombinationWithRepetition(n, k));
    end;

    /// <summary>
    /// Calculates the variation without repetition.
    /// </summary>
    /// <param name="n">The total number of items.</param>
    /// <param name="k">The number of items selected in each variation.</param>
    /// <returns>The number of variations without repetition as an integer.</returns>
    procedure Variation(n: Integer; k: Integer): BigInteger
    begin
        exit(CombinatoricsImpl.Variation(n, k));
    end;

    /// <summary>
    /// Calculates the variation with repetition.
    /// </summary>
    /// <param name="n">The total number of items.</param>
    /// <param name="k">The number of items selected in each variation.</param>
    /// <returns>The number of variations with repetition as an integer.</returns>
    procedure VariationWithRepetition(n: Integer; k: Integer): BigInteger
    begin
        exit(CombinatoricsImpl.VariationWithRepetition(n, k));
    end;
}