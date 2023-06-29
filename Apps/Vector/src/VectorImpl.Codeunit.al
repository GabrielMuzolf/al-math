codeunit 70001 "Vector Impl."
{
    Access = Internal;

    var
        Coordinates: List of [Integer];
        Dim: Integer;
        InvalidDimensionErr: Label 'The vector dimension cannot be equal to ''%1''. It must be greater than zero.', Comment = '%1 = The Invalid Dimension';

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

    procedure Initialize(NewCoordinates: List of [Integer])
    begin
        Clear(Dim);
        Clear(Coordinates);
        SetDim(NewCoordinates.Count());
        SetCoordinates(NewCoordinates);
    end;

    procedure GetDim(): Integer
    begin
        exit(Dim);
    end;

    procedure GetVector(): List of [Integer]
    begin
        exit(Coordinates);
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
}