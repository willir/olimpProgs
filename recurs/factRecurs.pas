program factorialRec;
uses 
    SysUtils, DateUtils;
var
    i, res: longint;
    bt, et: TDateTime;
function factRec(n: byte):longint;
begin
    if n = 0 then
        factRec := 1
    else
        factRec := n * factRec(n - 1);
end;

function factIter(n: byte):longint;
begin
    factIter := 1;
    while n > 1 do
    begin
        factIter := factIter * n;
        n := n - 1;
    end;
end;

begin
    bt := timeof(now);
    res := 1;
    for i := 0 to 5000000 do
    begin
        res := res + factRec(127);
    end;
    et := timeof(now);
    writeln('res:', res, ' time:', MilliSecondSpan(bt, et):1:16);

    bt := timeof(now);
    res := 1;
    for i := 0 to 5000000 do
    begin
        res := res + factIter(127);
    end;
    et := timeof(now);
    writeln('res:', res, ' time:', MilliSecondSpan(bt, et):1:16);
end.

