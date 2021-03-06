{

   Set the LED (NumLock, CapsLock, ...) on or off


               浜様様様様様様様様様様様様様様様様様様様融
               �                                        紺
               �          AVONTURE CHRISTOPHE           紺
               �              AVC SOFTWARE              紺
               �     BOULEVARD EDMOND MACHTENS 157/53   紺
               �           B-1080 BRUXELLES             紺
               �              BELGIQUE                  紺
               �                                        紺
               藩様様様様様様様様様様様様様様様様様様様夕�
               旭旭旭旭旭旭旭旭旭旭旭旭旭旭旭旭旭旭旭旭旭�

}

Procedure SetEtatLED (Interrupteur, Flag : Byte);

{ Modify the LED byte attribut

  Interrupteur = 0     Turn Off
                 1     Turn On
  Flag         = LED constant : one of the following
                 ScrollLock = 16
                 NumLock    = 32
                 CapsLock   = 64
                 Insert     = 128
}

Var Led : Byte Absolute $40:$17;

Begin

     If (Interrupteur = 1) Then
        Led := Led Or Flag
     Else
        Led := Led And Not (Flag);

     { Force BIOS to read the LED }

     Asm

       Mov Ah, 1h
       Int 16h

     End;

End;
