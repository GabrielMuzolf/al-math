codeunit 70001 "Vector Impl. GM"
{
    Access = Internal;

    var
        Math: Codeunit Math;
        Coordinates: List of [Decimal];
        Dim: Integer;
        InvalidDimensionErr: Label 'The vector dimension cannot be equal to ''%1''. It must be greater than zero.', Comment = '%1 = The Invalid Dimension';
        UnparsableTextErr: Label 'The text ''%1'' cannot be parsed to the vector. The available format is [x,y,z, ...]. The decimal separator must be a dot.', Comment = '%1 = Unparsable Text';
        VectorNotInitalizedErr: Label 'The vector is not initialized.';
        DifferentDimensionsErr: Label 'Vectors have different dimensions.';

    procedure Initialize(NewDim: Integer)
    var
        ListOfZeros: List of [Decimal];
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
        NewCoordinates: List of [Decimal];
    begin
        if not ParseTextToCoordinates(VectorAsText, NewCoordinates) then
            Error(UnparsableTextErr, VectorAsText);

        Initialize(NewCoordinates);
    end;

    procedure Initialize(NewCoordinates: List of [Decimal])
    begin
        Clear(Dim);
        Clear(Coordinates);
        SetDim(NewCoordinates.Count());
        SetCoordinates(NewCoordinates);
    end;

    procedure GetDim(): Integer
    begin
        ErrIfVectorIsNotInitialized();
        exit(Dim);
    end;

    procedure GetVector(): List of [Decimal]
    begin
        ErrIfVectorIsNotInitialized();
        exit(Coordinates);
    end;

    procedure ToString() VectorAsString: Text
    var
        i: Integer;
    begin
        ErrIfVectorIsNotInitialized();
        VectorAsString := '[';
        for i := 1 to Coordinates.Count() - 1 do
            VectorAsString += Format(Coordinates.Get(i)) + ',';

        VectorAsString += Format(Coordinates.Get(Coordinates.Count())) + ']';
    end;

    procedure CalculateEuclideanNorm() EuclideanNorm: Decimal
    var
        i: Integer;
    begin
        ErrIfVectorIsNotInitialized();
        for i := 1 to Coordinates.Count do
            EuclideanNorm += Math.Pow(Coordinates.Get(i), 2);

        EuclideanNorm := Math.Sqrt(EuclideanNorm);
    end;

    procedure CalculateTaxicabNorm() TaxicabNorm: Decimal
    var
        i: Integer;
    begin
        ErrIfVectorIsNotInitialized();
        for i := 1 to Coordinates.Count do
            TaxicabNorm += Math.Abs(Coordinates.Get(i));
    end;

    procedure ScalarMultiplication(Scalar: Decimal)
    var
        i: Integer;
    begin
        ErrIfVectorIsNotInitialized();
        for i := 1 to Coordinates.Count() do
            Coordinates.Set(i, Coordinates.Get(i) * Scalar);
    end;

    procedure AreEqual(OtherVector: Codeunit "Vector GM"): Boolean
    var
        OtherVectorCoordinates: List of [Decimal];
        i: Integer;
    begin
        ErrIfVectorsNotInitialized(OtherVector);

        OtherVectorCoordinates := OtherVector.GetVector();
        for i := 1 to Coordinates.Count() do
            if Coordinates.Get(i) <> OtherVectorCoordinates.Get(i) then
                exit;

        exit(true);
    end;

    procedure AddVector(OtherVector: Codeunit "Vector GM")
    var
        OtherVectorCoordinates: List of [Decimal];
        i: Integer;
    begin
        ErrIfVectorsNotInitialized(OtherVector);
        OtherVectorCoordinates := OtherVector.GetVector();
        for i := 1 to Coordinates.Count() do
            Coordinates.Set(i, Coordinates.Get(i) + OtherVectorCoordinates.Get(i));
    end;

    procedure SubtractVector(OtherVector: Codeunit "Vector GM")
    var
        OtherVectorCoordinates: List of [Decimal];
        i: Integer;
    begin
        ErrIfVectorsNotInitialized(OtherVector);
        OtherVectorCoordinates := OtherVector.GetVector();
        for i := 1 to Coordinates.Count() do
            Coordinates.Set(i, Coordinates.Get(i) - OtherVectorCoordinates.Get(i));
    end;

    procedure DotProduct(OtherVector: Codeunit "Vector GM")
    var
        OtherVectorCoordinates: List of [Decimal];
        i: Integer;
    begin
        ErrIfVectorsNotInitialized(OtherVector);
        OtherVectorCoordinates := OtherVector.GetVector();
        for i := 1 to Coordinates.Count() do
            Coordinates.Set(i, Coordinates.Get(i) * OtherVectorCoordinates.Get(i));
    end;

    procedure ErrIfVectorIsNotInitialized()
    begin
        if Dim > 0 then
            exit;

        Error(VectorNotInitalizedErr);
    end;

    local procedure SetDim(NewDim: Integer)
    begin
        if NewDim <= 0 then
            Error(InvalidDimensionErr, NewDim);

        Dim := NewDim;
    end;

    local procedure SetCoordinates(NewCoordinates: List of [Decimal])
    begin
        Coordinates := NewCoordinates;
    end;

    local procedure ParseTextToCoordinates(VectorAsText: Text; var NewCoordinates: List of [Decimal]): Boolean
    var
        CoordinatesAsText: List of [Text];
    begin
        if not (VectorAsText.Substring(1, 1) in ['[']) then
            exit;

        if not (VectorAsText.Substring(StrLen(VectorAsText), 1) in [']']) then
            exit;

        RemoveFirstAndLastChar(VectorAsText);

        CoordinatesAsText := VectorAsText.Split(',');
        if ConvertListOfTextsToDecimals(CoordinatesAsText, NewCoordinates) then
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
    local procedure ConvertListOfTextsToDecimals(ListOfText: List of [Text]; var ListOfDecimals: List of [Decimal])
    var
        i: Integer;
        DecimalValue: Decimal;
    begin
        Clear(ListOfDecimals);
        for i := 1 to ListOfText.Count() do begin
            Evaluate(DecimalValue, ListOfText.Get(i));
            ListOfDecimals.Add(DecimalValue);
        end;
    end;

    local procedure ErrIfVectorsNotInitialized(var OtherVector: Codeunit "Vector GM")
    begin
        ErrIfVectorIsNotInitialized();
        OtherVector.ErrIfVectorIsNotInitialized();
        if Dim <> OtherVector.GetDim() then
            Error(DifferentDimensionsErr);
    end;
}