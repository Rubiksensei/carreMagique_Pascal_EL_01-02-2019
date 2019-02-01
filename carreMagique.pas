program carreMagique;

uses crt;

CONST
    size = 7;

VAR
    x, y, nbr, cases, i : INTEGER;
    carre : ARRAY[1..size,1..size] of INTEGER;

begin
    nbr:=1;                     {valeur de remplissage}
    cases:=size*size;           {Nombre maximum de case dans le tableau}
    x:=((size DIV 2)+1)-1;
    y:=((size DIV 2)+1);        {Coordonnées nord du centre}
    //Remplissage
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
    //Affichage tableau
    WriteLn();
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
end.