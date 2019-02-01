program carreMagique;

uses crt;

CONST
    size = 7;

VAR
    x, y, nbr, cases, i : INTEGER;
    carre : ARRAY[1..size,1..size] of INTEGER;

procedure Init;
begin
    FOR x:=1 TO size DO
    begin
        FOR y:=1 TO size DO
        begin
            carre[x,y]:=0;
        end;
    end;
end;

procedure InitPos;
begin
    nbr:=1;
    cases:=size*size;
    x:=((size DIV 2)+1)-1;
    y:=((size DIV 2)+1);
end;

procedure Fill;
begin
    carre[x,y]:=nbr;
    FOR i:=1 TO (cases-1) DO
    begin
        nbr:=nbr+1;
        x:=x-1;
        y:=y+1;
        //Test dépassement bordure
        IF y>size THEN
            y:=1;
        IF x<1 THEN
            x:=size;
        IF y<1 THEN
            y:=size;
        //Test cellule occopée 
        WHILE carre[x,y]<>0 DO
        begin
            x:=x-1;
            y:=y-1;
            //Test dépassement bordure
            IF y>size THEN
            y:=1;
            IF x<1 THEN
                x:=size;
            IF y<1 THEN
                y:=size;
        end;
        carre[x,y]:=nbr;
    end;
end;

procedure Print;
begin
    FOR x:=1 TO size DO
    begin
        FOR y:=1 TO size DO
        begin
            write('|');
            Write(carre[x,y]:2);
        end;
        write('|');
        WriteLn();
    end;    
end;

begin
    Init;

    InitPos;

    Fill;

    Print;
end.