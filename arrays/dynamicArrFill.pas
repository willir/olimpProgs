program dynamicArrFill1;
type
    MyArrType = array[1..20] of integer;
var
    arr1:array of integer;
    arr2:MyArrType;
{----------------------------------------}
procedure fillArrValue(arr:array of integer);
var
    i:integer;
begin
    for i:=low(arr) to high(arr) do
    begin
        arr[i] := i;
    end;
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
    for i:=0 to length(arr) - 1 do
    begin
        write(arr[i], ' ');
    end;
    writeln;
end;
{----------------------------------------}
procedure showStaticArr(var arr:MyArrType);
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
    fillArr(arr2);
    showArr(arr2);
    writeln('-------------------');
    showStaticArr(arr2);
    writeln('-------------------');

end.

