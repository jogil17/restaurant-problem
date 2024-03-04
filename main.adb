with Ada.Text_IO;  use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO; use Ada.Text_IO.Unbounded_IO;
with def_maitre;  use def_maitre;
with Ada.Numerics.Discrete_Random;


procedure main is

   MAX_FUMADORES : constant Integer := 7; --Número de tareas
   MAX_NO_FUMADORES : constant Integer := 7; --Número de tareas
   nombresFum: array(1..7) of Ada.Strings.Unbounded.Unbounded_String;
   nombresNoFum : array(1..7) of Ada.Strings.Unbounded.Unbounded_String;

   monitorRest : Monitor;

      -- Función que genera números aleatorios
   function getRandom return Duration is
      type randRange is new Integer range 1 .. 5_000;
      package Rand_Int is new Ada.Numerics.Discrete_Random (randRange);
      use Rand_Int;
      gen : Generator;
      res : Float;
   begin
      Reset (gen);
      res := Float (Random (gen)) / 1_000.0;
      return Duration (res);
   end getRandom;

   -- Tasks
   task type fumador is
      entry Start (nombre : in Unbounded_String; Idx : in Integer);
   end fumador;

   task type noFumador is
      entry Start (nombre : in Unbounded_String; Idx : in Integer);
   end noFumador;

   -- cuerpo tareas
   task body fumador is
      My_Idx : integer;
      My_nombre : Unbounded_String;
      numSalon : Integer;
   begin
      accept Start (nombre : in Unbounded_String; Idx : in Integer) do
         My_nombre := nombre;
         My_Idx := Idx;
         numSalon := 0;
      end Start;
      Put_Line("BON DIA som en " &My_nombre &" i sóm fumador");
      monitorRest.ocuparMesaF(numSalon => numSalon,
                              nombreF  => My_nombre);
      Put_Line("En " &My_nombre &" diu: Prendré el menú del dia. Som al saló " &Integer'Image (numSalon));
      delay getRandom;
      Put_Line("En " &My_nombre &" diu: Ja he dinat, el compte per favor");
      monitorRest.liberarMesaF(numSalon => numSalon,
                           nombreF  => My_nombre);
      Put_Line("En " &My_nombre &" SE'N VA");
   end fumador;

   task body noFumador is
      My_Idx : integer;
      My_nombre : Unbounded_String;
      numSalon : Integer;
   begin
      accept Start (nombre : in Unbounded_String; Idx : in Integer) do
         My_nombre := nombre;
         My_Idx := Idx;
         numSalon := 0;
      end Start;
      Put_Line("BON DIA som en " &My_nombre &" i sóm No fumador");
      monitorRest.ocuparMesaNF(numSalon => numSalon,
                               nombreNF => My_nombre);
      Put_Line("En " &My_nombre &" diu: Prendré el menú del dia. Som al saló " &Integer'Image (numSalon));
      delay getRandom;
      Put_Line("En " &My_nombre &" diu: Ja he dinat, el compte per favor");
      monitorRest.liberarMesaF(numSalon => numSalon,
                           nombreF  => My_nombre);
      Put_Line("En " &My_nombre &" SE'N VA");
   end noFumador;

   type fum is array (1..MAX_NO_FUMADORES) of fumador;
   tF: fum;

   type noFum is array (1..MAX_NO_FUMADORES) of noFumador;
   tNF: noFum;
begin
   Put_Line("++++++++++ El maître està preparat");
   Put_Line("++++++++++ Hi ha 3 salons amb capacitat de 3 comensal cada un");

   nombresFum(1) := Ada.Strings.Unbounded.To_Unbounded_String ("Manolo");
   nombresFum(2) := Ada.Strings.Unbounded.To_Unbounded_String ("Jose");
   nombresFum(3) := Ada.Strings.Unbounded.To_Unbounded_String ("Pedro");
   nombresFum(4) := Ada.Strings.Unbounded.To_Unbounded_String ("Paco");
   nombresFum(5) := Ada.Strings.Unbounded.To_Unbounded_String ("Julio");
   nombresFum(6) := Ada.Strings.Unbounded.To_Unbounded_String ("Bernat");
   nombresFum(7) := Ada.Strings.Unbounded.To_Unbounded_String ("Pere");

   nombresNoFum(1) := Ada.Strings.Unbounded.To_Unbounded_String ("Manuel");
   nombresNoFum(2) := Ada.Strings.Unbounded.To_Unbounded_String ("Jogil");
   nombresNoFum(3) := Ada.Strings.Unbounded.To_Unbounded_String ("Guiem");
   nombresNoFum(4) := Ada.Strings.Unbounded.To_Unbounded_String ("Jaden");
   nombresNoFum(5) := Ada.Strings.Unbounded.To_Unbounded_String ("Ray");
   nombresNoFum(6) := Ada.Strings.Unbounded.To_Unbounded_String ("Juan");
   nombresNoFum(7) := Ada.Strings.Unbounded.To_Unbounded_String ("Igor");

   for Idx in 1 .. MAX_FUMADORES loop
      tF(Idx).Start(nombresFum(Idx),Idx);
      tNF(Idx).Start(nombresNoFum(Idx),Idx);
   end loop;


end main;
