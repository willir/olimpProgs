program procTimeTest;
uses 
    SysUtils, DateUtils;
var 
    ctr, i, step: uint64;
    bt, et: TDateTime;
function mul(a, b:longint):longint;
begin
        mul := a * b;
end;
function myMod(a, b, c:longint):longint;
begin
    myMod := (a mod b) * c;
end;
begin
    ctr := 1;
    bt := timeof(now);
    step := 3;
    for i:=1 to 500000000 do
    begin
{        ctr := mul(ctr, step);}
        ctr := ctr * step;
{        ctr := myMod(ctr, step, i);}
{        ctr := (ctr mod step) * i;}
    end;
    et := timeOf(now);
    writeln('ctr:', ctr);
    writeln('Time of execution:', MilliSecondSpan(bt, et):30:8); 
end.

