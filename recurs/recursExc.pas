program recursExc;
function recurs(a: uint64): uint64;
var
    temp:array[0..9999] of integer;
begin
    if a > 0 then
        recurs := recurs(a-1);
end;

begin
    recurs(419);
end.

