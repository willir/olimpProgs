program permutation;
var
    inputNum, convCode :longword;
{ ------------------------------------------------------------------------- }
function power(base:word; pow:byte):longword;
begin
    power := trunc(exp(pow*ln(base)));
end;
{ ------------------------------------------------------------------------- }
function numLen(num:longword):byte;
begin
    numLen := 0;
    while(num > 0) do
    begin
        inc(numLen);
        num := num div 10;
    end;
end;
{ ------------------------------------------------------------------------- }
function swap(num: longword; ind1, ind2, len:byte):longword;
var
    digit1, digit2, exp1Mod, exp1Div, exp2Mod, exp2Div:longword;
begin
    exp1Mod := power(10, len - ind1);
    exp1Div := power(10, len - ind1 - 1);
    exp2Mod := power(10, len - ind2);
    exp2Div := power(10, len - ind2 - 1);

    digit1 := (num mod exp1Mod) div exp1Div;
    digit2 := (num mod exp2Mod) div exp2Div;

    num := num - digit1 * exp1Div;
    num := num - digit2 * exp2Div;

    num := num + digit1 * exp2Div;
    num := num + digit2 * exp1Div;

    swap := num;
end;
{ ------------------------------------------------------------------------- }
procedure showPermutRec(num:longword; len, i:byte);
var
    newNum:longword;
    j, nextI: byte;
begin
    if i >= len then
        exit;

    nextI := i + 1;
    showPermutRec(num, len, nextI);
    for j := 0 to i - 1 do
    begin
        newNum := swap(num, j, i, len);
        writeln(newNum);
        showPermutRec(newNum, len, nextI);
    end;
    
end;
{ ------------------------------------------------------------------------- }
procedure showPermut(num:longword);
var
    len: byte;
begin
    len := numLen(num);
    writeln(num);
    showPermutRec(num, len, 1);
end;
{ ------------------------------------------------------------------------- }

begin
    if ParamCount = 0 then
    begin
        writeln('Please input the number');
        readln(inputNum);
    end 
    else 
    begin
        val(paramStr(1), inputNum, convCode);
        if convCode <> 0 then
        begin
            writeln('Error: ', paramStr(1), ' not a number');
            exit;
        end;
    end;
    
    showPermut(inputNum);
end.

