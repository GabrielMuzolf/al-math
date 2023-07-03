codeunit 70001 "Vector Impl."
{
    Access = Internal;

    var
        Math: Codeunit Math;
        Coordinates: List of [Integer];
        Dim: Integer;
        InvalidDimensionErr: Label 'The vector dimension cannot be equal to ''%1''. It must be greater than zero.', Comment = '%1 = The Invalid Dimension';
        UnparsableTextErr: Label 'The text ''%1'' cannot be parsed to the vector. The available format is [x,y,z, ...] ', Comment = '%1 = Unparsable Text';
        VectorNotInitalizedErr: Label 'The vector is not initialized.';

    procedure Initialize(NewDim: Integer)
    var
        ListOfZeros: List of [Integer];
        i: Integer;
    begin
        Clear(Dim);
        Clear(Coordinates);
        SetDim(NewDim);
        for i := 1 to Dim do
            ListOfZeros.Add(0);

        SetCoordinates(ListOfZeros);
    end;

    procedure Initialize(VectorAsText: Text)
    var
        NewCoordinates: List of [Integer];
    begin
        if not ParseTextToCoordinates(VectorAsText, NewCoordinates) then
            Error(UnparsableTextErr, VectorAsText);

        Initialize(NewCoordinates);
    end;

    procedure Initialize(NewCoordinates: List of [Integer])
    begin
        Clear(Dim);
        Clear(Coordinates);
        SetDim(NewCoordinates.Count());
        SetCoordinates(NewCoordinates);
    end;

    procedure GetDim(): Integer
    begin
        ErrIfVectorIsNotInitalized();
        exit(Dim);
    end;

    procedure GetVector(): List of [Integer]
    begin
        ErrIfVectorIsNotInitalized();
        exit(Coordinates);
    end;

    procedure ToString() VectorAsString: Text
    var
        i: Integer;
    begin
        ErrIfVectorIsNotInitalized();
        VectorAsString := '[';
        for i := 1 to Coordinates.Count() - 1 do
            VectorAsString += Format(Coordinates.Get(i)) + ',';

        VectorAsString += Format(Coordinates.Get(Coordinates.Count())) + ']';
    end;

    procedure CalculateEuclideanNorm() EuclideanNorm: Decimal
    var
        i: Integer;
    begin
        ErrIfVectorIsNotInitalized();
        for i := 1 to Coordinates.Count do
            EuclideanNorm += Math.Pow(Coordinates.Get(i), 2);

        EuclideanNorm := Math.Sqrt(EuclideanNorm);
    end;

    procedure CalculateTaxicabNorm() TaxicabNorm: Decimal
    var
        i: Integer;
    begin
        ErrIfVectorIsNotInitalized();
        for i := 1 to Coordinates.Count do
            TaxicabNorm += Math.Abs(Coordinates.Get(i));
    end;

    procedure ScalarMultiplication(Scalar: Decimal)
    begin

    end;

    local procedure SetDim(NewDim: Integer)
    begin
        if NewDim <= 0 then
            Error(InvalidDimensionErr, NewDim);

        Dim := NewDim;
    end;

    local procedure SetCoordinates(NewCoordinates: List of [Integer])
    begin
        Coordinates := NewCoordinates;
    end;

    local procedure ParseTextToCoordinates(VectorAsText: Text; var NewCoordinates: List of [Integer]): Boolean
    var
        CoordinatesAsText: List of [Text];
    begin
        if not (VectorAsText.Substring(1, 1) in ['[']) then
            exit;

        if not (VectorAsText.Substring(StrLen(VectorAsText), 1) in [']']) then
            exit;

        RemoveFirstAndLastChar(VectorAsText);

        CoordinatesAsText := VectorAsText.Split(',');
        if ConvertListOfTextsToIntegers(CoordinatesAsText, NewCoordinates) then
            exit(true);
    end;

    local procedure RemoveFirstAndLastChar(var Text: Text)
    begin
        if StrLen(Text) < 2 then
            exit;

        Text := DelStr(Text, 1, 1);
        Text := DelStr(Text, StrLen(Text), 1);
    end;

    [TryFunction]
    local procedure ConvertListOfTextsToIntegers(ListOfText: List of [Text]; var ListOfIntegers: List of [Integer])
    var
        i: Integer;
        IntegerValue: Integer;
    begin
        Clear(ListOfIntegers);
        for i := 1 to ListOfText.Count() do begin
            Evaluate(IntegerValue, ListOfText.Get(i));
            ListOfIntegers.Add(IntegerValue);
        end;
    end;

    local procedure ErrIfVectorIsNotInitalized()
    begin
        if Dim > 0 then
            exit;

        Error(VectorNotInitalizedErr);
    end;
}