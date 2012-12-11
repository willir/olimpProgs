program dynamicArrMem;
{----------------------------------------}
procedure createArr(count: longword);
var
    arr: array of integer;
begin
    setLength(arr, 99999);

    if count > 0 then
        createArr(count - 1)
    else
    begin
        write('Enter any key');
        readln;
    end
end;

begin
    createArr(9999);
    write('Enter any key2');
    readln;
    createArr(9999);
    write('Enter any key2');
    readln;
end.

