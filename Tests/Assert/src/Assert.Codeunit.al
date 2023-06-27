codeunit 80100 Assert
{
    var
        ListDifferentSizeErr: Label 'Sizes of lists do not match. Expected: ''%1'', Actual: ''%2''.', Locked = true;
        MissingListValueErr: Label 'The expected list contains a value ''%1'' that cannot be found in the actual list.', Locked = true;

    /// <summary>
    /// Test if the two lists are equal and throws an exception if they are not.
    /// </summary>
    /// <param name="Expected">The expected list of integers.</param>
    /// <param name="Actual">The actual list of integers.</param>
    procedure AreEqual(Expected: List of [Integer]; Actual: List of [Integer])
    var
        ExpectedValue: Integer;
    begin
        if Expected.Count() <> Actual.Count() then
            Error(ListDifferentSizeErr, Expected.Count(), Actual.Count);

        foreach ExpectedValue in Expected do
            if not Actual.Contains(ExpectedValue) then
                Error(MissingListValueErr, ExpectedValue);
    end;

}