with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO; use Ada.Text_IO.Unbounded_IO;

package body def_maitre is

   protected body Monitor is

    entry ocuparMesaF (numSalon: out Integer; nombreF : in Unbounded_String) when (salon(1) > 0 and
        (estadoSalon(1) = FUMADORS or estadoSalon(1) = CAP)) or (salon(2) > 0 and
        (estadoSalon(2) = FUMADORS or estadoSalon(2) = CAP)) or (salon(3) > 0 and
        (estadoSalon(3) = FUMADORS or estadoSalon(3) = CAP)) is
    begin
      if (salon(1) > 0 and
        (estadoSalon(1) = FUMADORS or estadoSalon(1) = CAP)) then
            salon(1) := salon(1) - 1;
            numSalon := 1;
            if estadoSalon(1) = CAP then
               estadoSalon(1) := FUMADORS;
            end if;
            Put_Line("---------- En " &nombreF& " té taula al saló de fumadors "
                  & Integer'Image (1) & ". Disponibilitat: "
                  & Integer'Image (salon(1)));
       elsif (salon(2) > 0 and
                (estadoSalon(2) = FUMADORS or estadoSalon(2) = CAP)) then
            salon(2) := salon(2) - 1;
            numSalon := 2;
            if estadoSalon(2) = CAP then
               estadoSalon(2) := FUMADORS;
            end if;
            Put_Line("---------- En " &nombreF& " té taula al saló de fumadors "
                  & Integer'Image (2) & ". Disponibilitat: "
                  & Integer'Image (salon(2)));

       else
            salon(3) := salon(3) - 1;
            numSalon := 3;
            if estadoSalon(3) = CAP then
               estadoSalon(3) := FUMADORS;
            end if;
            Put_Line("---------- En " &nombreF& " té taula al saló de fumadors "
                  & Integer'Image (3) & ". Disponibilitat: "
                  & Integer'Image (salon(3)));

       end if;
    end ocuparMesaF;


    entry ocuparMesaNF (numSalon: out Integer; nombreNF : in Unbounded_String) when (salon(1) > 0 and
        (estadoSalon(1) = NOFUMADORS or estadoSalon(1) = CAP)) or (salon(2) > 0 and
        (estadoSalon(2) = NOFUMADORS or estadoSalon(2) = CAP)) or (salon(3) > 0 and
        (estadoSalon(3) = NOFUMADORS or estadoSalon(3) = CAP)) is
    begin
      if (salon(1) > 0 and
        (estadoSalon(1) = NOFUMADORS or estadoSalon(1) = CAP)) then
            salon(1) := salon(1) - 1;
            numSalon := 1;
            if estadoSalon(1) = CAP then
               estadoSalon(1) := NOFUMADORS;
            end if;
            Put_Line("********** En " &nombreNF& " té taula al saló de NO fumadors "
                  & Integer'Image (1) & ". Disponibilitat: "
                  & Integer'Image (salon(1)));

       elsif (salon(2) > 0 and
                (estadoSalon(2) = NOFUMADORS or estadoSalon(2) = CAP)) then
            salon(2) := salon(2) - 1;
            numSalon := 2;
            if estadoSalon(2) = CAP then
               estadoSalon(2) := NOFUMADORS;
            end if;
            Put_Line("********** En " &nombreNF& " té taula al saló de NO fumadors "
                  & Integer'Image (2) & ". Disponibilitat: "
                  & Integer'Image (salon(2)));
       else
            salon(3) := salon(3) - 1;
            numSalon := 3;
            if estadoSalon(3) = CAP then
               estadoSalon(3) := NOFUMADORS;
            end if;
            Put_Line("********** En " &nombreNF& " té taula al saló de NO fumadors "
                  & Integer'Image (3) & ". Disponibilitat: "
                  & Integer'Image (salon(3)));
       end if;
    end ocuparMesaNF;

    procedure liberarMesaF (numSalon: in Integer; nombreF : in Unbounded_String) is
    begin
         salon(numSalon) := salon(numSalon) + 1;
         if salon(numSalon) = 3 then
            estadoSalon(numSalon) := CAP;
         end if;
         Put_Line("---------- En " &nombreF& " allibera una taula del saló "
                  & Integer'Image (numSalon) & ". Disponibilitat: "
                  & Integer'Image (salon(numSalon)) & " Tipus: " & TIPO'Image (estadoSalon(numSalon)));
    end liberarMesaF;


    procedure liberarMesaNF (numSalon: in Integer; nombreNF : in Unbounded_String) is
    begin
         salon(numSalon) := salon(numSalon) + 1;
         if salon(numSalon) = 3 then
            estadoSalon(numSalon) := CAP;
         end if;
         Put_Line("********** En " &nombreNF& " allibera una taula del saló "
                  & Integer'Image (numSalon) & ". Disponibilitat: "
                  & Integer'Image (salon(numSalon)) & " Tipus: " & TIPO'Image (estadoSalon(numSalon)));
    end liberarMesaNF;
  end Monitor;

end def_maitre;
