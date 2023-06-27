codeunit 80100 Assert
{
    var
        ListDifferentSizeErr: Label 'Sizes of lists do not match. Expected: ''%1'', Actual: ''%2''. %3', Comment = '%1 = Expected List Size, %2 = Actual List Size, %3 = Custom Exception Message', Locked = true;
        MissingListValueErr: Label 'The expected list contains a value ''%1'' that cannot be found in the actual list. %2', Comment = '%1 = Expected List Value, %2 = Custom Exception Message', Locked = true;

    /// <summary>
    /// Test if the two lists are equal and throws an exception if they are not.
    /// </summary>
    /// <param name="Expected">The expected list of integers.</param>
    /// <param name="Actual">The actual list of integers.</param>
    /// <param name="Msg">The message to include in the exception when actual is not equal to expected. The message is shown in test results.</param>
    procedure AreEqual(Expected: List of [Integer]; Actual: List of [Integer]; Msg: Text)
    var
        ExpectedValue: Integer;
    begin
        if Expected.Count() <> Actual.Count() then
            Error(ListDifferentSizeErr, Expected.Count(), Actual.Count, Msg);

        foreach ExpectedValue in Expected do
            if not Actual.Contains(ExpectedValue) then
                Error(MissingListValueErr, ExpectedValue, Msg);
    end;

}