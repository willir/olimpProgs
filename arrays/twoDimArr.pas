program dynamicArrFill1;
type
    twoDimIntArr = array of array of integer;
var
    arr1:twoDimIntArr;
    arr2:array[1..20, 2..10] of integer;
    arr3:array[1..20] of array[2..10] of integer;
{----------------------------------------}
procedure fillTwoDimArr(var arr:twoDimIntArr);
var
    i, j:integer;
begin
    for i:=low(arr) to high(arr) do
    begin
        for j:=low(arr[i]) to high(arr[i]) do
        begin
            arr[i][j] := i * length(arr[i]) + j;
        end;
    end;
end;
{----------------------------------------}
procedure showTwoDimArr(var arr:twoDimIntArr);
var
    i, j:integer;
begin
    writeln('length(arr):', length(arr), '; low(arr):', low(arr), '; high(arr):', high(arr));
    for i:=low(arr) to high(arr) do
    begin
        for j:=low(arr[i]) to high(arr[i]) do
        begin
            write(arr[i,j], ' ');
        end;
        writeln;
    end;
    writeln;
end;
{----------------------------------------}
procedure fillArr(var arr:array of integer);
var
    i:integer;
begin
    for i:=low(arr) to high(arr) do
    begin
        arr[i] := i;
    end;
end;
{----------------------------------------}
procedure showArr(var arr:array of integer);
var
    i:integer;
begin
    writeln('length(arr):', length(arr), '; low(arr):', low(arr), '; high(arr):', high(arr));
    for i:=low(arr) to high(arr) do
    begin
        write(arr[i], ' ');
    end;
    writeln;
end;
{----------------------------------------}
begin

    writeln('length(arr2):', length(arr2), '; low(arr2):', low(arr2), '; high(arr2):', high(arr2));
    writeln('length(arr3):', length(arr3), '; low(arr3):', low(arr3), '; high(arr3):', high(arr3));
    writeln('length(arr2):', length(arr2[1]), '; low(arr2):', low(arr2[1]), '; high(arr2):', high(arr2[1]));

    setLength(arr1, 10, 5);
    fillTwoDimArr(arr1);
    showTwoDimArr(arr1);

    fillArr(arr2[low(arr3)]);
    showArr(arr2[low(arr3)]);

    setLength(arr1, 9);
    setLength(arr1[high(arr1)], 2);
    showTwoDimArr(arr1);
    writeln(arr1[high(arr1)][high(arr1[high(arr1)]) + 1]);
{
    setLength(arr1, 17);
    showArr(arr1);
    writeln('-------------------');

    writeln('fillArrValue:');
    fillArrValue(arr1);
    showArr(arr1);
    writeln('-------------------');

    fillArr(arr1);
    showArr(arr1);
    writeln('-------------------');

    setLength(arr1, 20);
    showArr(arr1);
    writeln('-------------------');

    setLength(arr1, 10);
    showArr(arr1);
    writeln('-------------------');

    writeln('length(arr2):', length(arr2), '; low(arr2):', low(arr2), '; high(arr2):', high(arr2));
    showArr(arr2);
    writeln('-------------------');
}
end.

