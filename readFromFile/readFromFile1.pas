Program fileWorkExample;
Var
    fileInput,fileOutput: text;
    input,output,d: string;
    s: char;
Begin
    input:= 'input.txt'; 
    assign(fileInput,input);
    reset(fileInput); 
    output:= 'output.txt'; 
    assign(fileOutput,output);
    rewrite(fileOutput); 

    while Not Eof(fileInput) do
    begin
        while Not Eoln(fileInput) do
        begin
          read(fileInput,s); 
          write(fileOutput,s); 
        end;
      readln(fileInput); 
      writeln(fileOutput); 
    end;
  close(fileOutput); 
  close(fileInput); 
End.
