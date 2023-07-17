Provides functionality to work with combinatorics.

It includes functionality for factorial, combination, combination with repetition, variation, and variation with repetition.

```
    procedure CombinatoricsDemo()
    var
        Combinatorics: Codeunit Combinatorics;
    begin
        Message('5! = ' + Format(Combinatorics.Factorial(5)));
        Message('Combination (5 choose 3) = ' + Format(Combinatorics.Combination(5, 3)));
        Message('Combination with repetition (6 choose 3) = ' + Format(Combinatorics.CombinationWithRepetition(6, 3)));
        Message('Variation (7 choose 2) = ' + Format(Combinatorics.Variation(7, 2)));
        Message('Variation with repetition (9 choose 4) = ' + Format(Combinatorics.VariationWithRepetition(9, 4)));
    end;
```