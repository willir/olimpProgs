program inlineTest1;
uses
    SysUtils,DateUtils;
const
    stepC = 2;
var
    ctr, i, step: longword;
    bt,et: TDateTime;

Function add(a, b: longword) : longword;
begin
    add := a + b;
end;

Function mul(a, b: longword) : longword;
begin
    mul := a * b;
end;

begin
    ctr := 1;
    step := 2;
    bt := timeOf(now);
    for i:=0 to 500000000 do
    begin
        ctr := ctr * step;
{        ctr := add(ctr, step);}
    end;
    et := timeOf(now);
    writeln('ctr:', ctr);
    writeln('Time of execution:', MilliSecondSpan(bt, et):1:16);
end.

