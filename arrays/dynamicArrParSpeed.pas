program dynamicArrParSpeed;
uses 
    SysUtils, DateUtils;
var
    arr: array of integer;
    i: longword;
    tmp: longint;
    bt, et: TDateTime;
{----------------------------------------}
procedure fillArr(var arr:array of integer);
var
    i:longword;
begin
    for i:=low(arr) to high(arr) do
    begin
        arr[i] := i;
    end;
end;
{----------------------------------------}
function avgArrLink(var arr:array of integer): longint;
var
    i:longword;
begin
    avgArrLink := 0;
    if length(arr) = 0 then
        exit;
    arr[0] := 1;

    for i:=low(arr) to high(arr) do
    begin
        avgArrLink := avgArrLink + arr[i];
    end;
    avgArrLink := avgArrLink div length(arr);
end;
{----------------------------------------}
function avgArrValue(arr:array of integer): longint;
var
    i:longword;
begin
    avgArrValue := 0;
    if length(arr) = 0 then
        exit;
    arr[0] := 1;

    for i:=low(arr) to high(arr) do
    begin
        avgArrValue := avgArrValue + arr[i];
    end;
    avgArrValue := avgArrValue div length(arr);
end;
{----------------------------------------}
begin
    setLength(arr, 99999);
    fillArr(arr);

    bt := timeof(now);
    for i := 0 to 999 do
    begin
        tmp := avgArrValue(arr);
    end;
    et := timeOf(now);
    writeln('Value, time of execution:', MilliSecondSpan(bt, et):1:8);
    writeln('arr[0]:', arr[0]);

    bt := timeof(now);
    for i := 0 to 999 do
    begin
        tmp := avgArrLink(arr);
    end;
    et := timeOf(now);
    writeln('Link, time of execution:', MilliSecondSpan(bt, et):1:8); 
    writeln('arr[0]:', arr[0]);

end.

