'****************************************************************
'*  Name    : UNTITLED.BAS                                      *
'*  Author  : [select VIEW...EDITOR OPTIONS]                    *
'*  Notice  : Copyright (c) 2021 [select VIEW...EDITOR OPTIONS] *
'*          : All Rights Reserved                               *
'*  Date    : 07/07/2021                                        *
'*  Version : 1.0                                               *
'*  Notes   :                                                   *
'*          :                                                   *
'****************************************************************
;-------------------------------------------------------------------------------
;**** Added by Fuse Configurator ****
; Use the Fuse Configurator plug-in to change these settings

Device = 16F84A

Config FOSC_HS, WDTE_OFF, PWRTE_OFF, CP_OFF

;**** End of Fuse Configurator Settings ****
;-------------------------------------------------------------------------------
Declare Xtal 20
TRISA=0
TRISB=0

PORTB=0

Inicio:
PORTB.0=0
DelayMS 500
PORTB.0=1
DelayMS 500
GoTo Inicio
End
