program apple_div1;
var
    boys, fullApples, eachApples:integer;
begin
    writeln('Enter number of schoolboys:');
    readln(boys);
    writeln('Enter number of apples:');
    readln(fullApples);

    eachApples := fullApples mod boys;
    writeln('The answer is:');
    writeln(eachApples);
end.

