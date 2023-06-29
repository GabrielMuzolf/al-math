codeunit 80001 "Library - Vector Test"
{

    /// <summary>
    /// Returns a list of zeroes with the specified size.
    /// </summary>
    /// <param name="Size">The size of the list.</param>
    /// <returns>A list of zeroes with the specified size.</returns>
    procedure GetListOfZeros(Size: Integer) ListOfZeros: List of [Integer]
    var
        i: Integer;
    begin
        for i := 1 to Size do
            ListOfZeros.Add(0);
    end;

    /// <summary>
    /// Generates a list of random integers.
    /// </summary>
    /// <param name="Size">The size of the desired list.</param>
    /// <returns>A list of random integers.</returns>
    procedure GetRandomList(Size: Integer) RandomList: List of [Integer]
    var
        Any: Codeunit Any;
        i: Integer;
    begin
        for i := 1 to Size do
            RandomList.Add(Any.IntegerInRange(10));
    end;
}