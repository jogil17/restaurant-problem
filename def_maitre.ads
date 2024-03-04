with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO; use Ada.Text_IO.Unbounded_IO;

package def_maitre is

   type tsalon is array (1..3) of Integer;
   type TIPO is (FUMADORS, NOFUMADORS, CAP);
   type estadoS is array (1..3) of TIPO;

    protected type Monitor is
      entry ocuparMesaF (numSalon: out Integer; nombreF : in Unbounded_String);
      entry ocuparMesaNF (numSalon: out Integer; nombreNF : in Unbounded_String);
      procedure liberarMesaF (numSalon: in Integer; nombreF : in Unbounded_String);
      procedure liberarMesaNF (numSalon: in Integer; nombreNF : in Unbounded_String);
    private
      salon : tsalon := (3,3,3);
      estadoSalon : estadoS := (CAP,CAP,CAP);
    end Monitor;

end def_maitre;
