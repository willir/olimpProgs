program B_next_prev;
var
    num: integer;
begin
    writeln('Enter some integer');
    readln(num);

    write('The next number for the number ');
    write(num);
    write(' is ');
    write(num + 1);
    writeln('.');

    write('The next prev for the number ');
    write(num);
    write(' is ');
    write(num - 1);
    writeln('.');
end.

