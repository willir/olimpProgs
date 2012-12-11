program mkad;
const
    MKAD_LEN = 109;
var
    v, t, s: integer;
begin
    writeln('Enter velocity:');
    readln(v);
    writeln('Enter time in hours');

    s := (v * t);
    s := s mod MKAD_LEN;
    s := s + MKAD_LEN;
    s := s mod MKAD_LEN;

    writeln('The answer is:');
    writeln(s);

end.

