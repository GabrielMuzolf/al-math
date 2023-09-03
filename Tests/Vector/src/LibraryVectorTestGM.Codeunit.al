codeunit 80001 "Library - Vector Test GM"
{

    /// <summary>
    /// Returns a list of zeroes with the specified size.
    /// </summary>
    /// <param name="Size">The size of the list.</param>
    /// <returns>A list of zeroes with the specified size.</returns>
    procedure GetListOfZeros(Size: Integer) ListOfZeros: List of [Decimal]
    var
        i: Integer;
    begin
        for i := 1 to Size do
            ListOfZeros.Add(0);
    end;

    /// <summary>
    /// Generates a list of random decimals.
    /// </summary>
    /// <param name="Size">The size of the desired list.</param>
    /// <returns>A list of random decimals.</returns>
    procedure GetRandomList(Size: Integer) RandomList: List of [Decimal]
    var
        Any: Codeunit Any;
        i: Integer;
    begin
        for i := 1 to Size do
            RandomList.Add(Any.DecimalInRange(10, 2));
    end;

    /// <summary>
    /// Converts a list of decimals into a comma-separated coordinate format.
    /// </summary>
    /// <param name="Coordinates">The list of decimals representing coordinates.</param>
    /// <returns>A formatted string containing the coordinates separated by commas.</returns>
    procedure GetListAsCommaSeparatedCoordinates(Coordinates: List of [Decimal]) FormattedCoordinates: Text
    var
        i: Integer;
    begin
        for i := 1 to Coordinates.Count() - 1 do
            FormattedCoordinates += Format(Coordinates.Get(i)) + ',';

        FormattedCoordinates += Format(Coordinates.Get(Coordinates.Count()));
    end;

    /// <summary>
    /// Multiplies each element of the <paramref name="DecimalsList"/> by a specified <paramref name="Number"/>.
    /// </summary>
    /// <param name="DecimalsList">The list of decimals to be multiplied.</param>
    /// <param name="Number">The number to multiply each element of the list by.</param>
    procedure MultipleListByNumber(var DecimalsList: List of [Decimal]; Number: Integer)
    var
        i: Integer;
    begin
        for i := 1 to DecimalsList.Count() do
            DecimalsList.Set(i, DecimalsList.Get(i) * Number);
    end;
}