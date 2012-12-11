program exit_text;
function test1(i: integer):integer;
begin
    if i = 1 then
    begin
        test1 := 2;
        exit;
    end;
    test1 := 1;
end;
begin
    writeln('test1(1):', test1(1), ' test1(3):', test1(3));
end.

