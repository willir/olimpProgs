program max;
var
    a, b, res, da, db, avg, diff, diffA, diffB :integer;
begin
    writeln('Enter a:');
    readln(a);
    writeln('Enter B');
    readln(b);

    da := a * 2;
    db := b * 2;

    avg := (da + db) div 2;

    diffA := (da mod db) mod da;
    diffB := (db mod da) mod db;

    diff := (diffA + diffB) div 2;

    res := (avg + diff) div 2;

    writeln('Max is:');
    writeln(res);
end.

