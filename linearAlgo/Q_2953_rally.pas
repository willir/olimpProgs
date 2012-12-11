program rally;
var
    n, m, res:word;
begin
    writeln('Enter n:');
    readln(n);
    writeln('Enter m:');
    readln(m);

    res :=  (m - 1) div n + 1;
    writeln('The answer is:');
    writeln(res);
end.

