Provides functionality to work with vectors.

It includes functionality for vector initialization, dimension retrieval, coordinate retrieval, string representation conversion, norm calculation (Euclidean and Taxicab), scalar multiplication, vector equality comparison, vector addition, vector subtraction, and dot product calculation.

```
    procedure VectorDemo()
    var
        Vector_X: Codeunit "Vector GM";
        Vector_Y: Codeunit "Vector GM";
        Coordinates_X: List of [Decimal];
    begin
        Coordinates_X.Add(1);
        Coordinates_X.Add(2);
        Coordinates_X.Add(3);
        Vector_X.Initialize(Coordinates_X);
        Vector_Y.Initialize('[4,5,6]');

        Vector_X.AddVector(Vector_Y);
        Message(Vector_X.ToString());

        Vector_X.DotProduct(Vector_Y);
        Message(Vector_X.ToString());

        Vector_Y.ScalarMultiplication(5);
        Message(Vector_Y.ToString());

        Message(Format(Vector_Y.CalculateEuclideanNorm()));
    end;
```