program dynamicArrSpeed;
uses 
    SysUtils, DateUtils;
var 
    bt, et: TDateTime;
    i: longword;
{----------------------------------------}
procedure fillArr(var arr:array of integer);
var
    i, arrLow, arrHigh:longword;
begin

    for i:=low(arr) to high(arr) do
    begin
        arr[i] := i;
    end;
end;
{----------------------------------------}
procedure createDynamicArr(count: longword);
var
    arr: array of integer;
begin
    setLength(arr, 200);
{
    for i:=low(arr) to high(arr) do
    begin
        arr[i] := i;
    end;
}
    fillArr(arr);

    if count > 0 then
        createDynamicArr(count - 1);
end;
{----------------------------------------}
procedure createStaticArr(count: longword);
var
    arr: array[0..199] of integer;
begin
{
    for i:=low(arr) to high(arr) do
    begin
        arr[i] := i;
    end;
}
    fillArr(arr);

    if count > 0 then
        createStaticArr(count - 1);
end;
{----------------------------------------}

begin

    bt := timeof(now);
    for i:=0 to 900 do
    begin
        createDynamicArr(200);
    end;
    et := timeOf(now);
    writeln('Dynamic time of execution:', MilliSecondSpan(bt, et):30:8); 

    bt := timeof(now);
    for i:=0 to 900 do
    begin
        createStaticArr(200);
    end;
    et := timeOf(now);
    writeln('Static time of execution:', MilliSecondSpan(bt, et):30:8); 

end.

