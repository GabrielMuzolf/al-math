codeunit 70003 "Combinatorics Impl."
{
    Access = Internal;

    procedure Factorial(n: Integer): BigInteger
    var
        IncorrectFactorialErr: Label 'The value of n must be greater than or equal to 0.';
    begin
        if n < 0 then
            Error(IncorrectFactorialErr);

        if n = 0 then
            exit(1);

        exit(n * Factorial(n - 1));
    end;

    procedure Combination(n: Integer; k: Integer): BigInteger
    var
        IncorrectCombinationErr: Label 'The value of k must be less than or equal to the value of n and both numbers must be greater than or equal to 1.';
    begin
        if (n < 1) or (k < 1) or (n < k) then
            Error(IncorrectCombinationErr);

        exit(Factorial(n) / (Factorial(k) * (Factorial(n - k))))
    end;

    procedure CombinationWithRepetition(n: Integer; k: Integer): BigInteger
    var
        IncorrectCombinationWithRepetitionErr: Label 'Both numbers must be greater than or equal to 1.';
    begin
        if (n < 1) or (k < 1) then
            Error(IncorrectCombinationWithRepetitionErr);

        exit(Factorial(n + k - 1) / (Factorial(k) * Factorial(n - 1)));
    end;

    procedure Variation(n: Integer; l: Integer): BigInteger
    begin

    end;

    procedure VariationWithRepetition(n: Integer; k: Integer): BigInteger
    begin

    end;
}