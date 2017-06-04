Check 61D1E936
Auto 8224

# Run-time Variables

Var q: Num = 1
Var r: Num = -1
Var v: Num = 8
Var pdepth: Num = 0
Var phealth: Num = 10
Var phealthmax: Num = 10
Var pwealth: Num = 0
Var pxpos: Num = 14
Var pypos: Num = 15
Var plight: Num = 2
Var pxp: Num = 0
Var rt: Num = 12
Var rc: Num = 2
Var tc: Num = 0
Var roomwidth: Num = 3
Var roomheight: Num = 3
Var roomx: Num = 21
Var roomy: Num = 14
Var pl: Num = -2
Var pm: Num = 4
Var uy: Num = 7
Var ux: Num = 5
Var dy: Num = 14
Var dx: Num = 14
Var c: NumArray(18, 4) = 2, 1, 3, 2, 6, 4, 3, 2, 14, 2, 2, 2, 11, 6, 3, 3, 11, 1, 2, 2, 4, 14, 3, 3, 3, 11, 4, 2, 12, 13, 5, 2, 2, 21, 6, 6, 12, 25, 4, 2, 14, 21, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
Var y: NumFOR = 4, 3, 1, 9125, 2
Var h: NumFOR = 4, 3, 1, 9295, 2
Var j: NumFOR = 3, 2, 1, 9260, 2
Var m: NumFOR = 3, 2, 1, 9065, 2
Var x: NumFOR = 4, 3, 1, 9130, 2
Var w: NumFOR = 2, 10, 1, 9200, 2
Var t: NumFOR = 0, 21, -1, 9235, 2
Var d: NumFOR = 11, 10, 1, 9305, 2
Var r$: StrArray(13) = "\\|/-\\|/-[]()~"

# End Run-time Variables

   1 RANDOMIZE
   2 CLS
   5 PAPER 0: BORDER 0: INK 2
  20 LET pdepth=0: LET phealth=10: LET phealthmax=phealth: LET pwealth=0: LET pxpos=0: LET pypos=0: LET plight=2: LET pxp=0
  21 DIM r$(13)
  22 LET r$="\\|/-\\|/-[]()~": REM LET r$(2)="|": LET r$(3)="/": LET r$(4)="-": LET r$(5)=r$(3): LET r$(6)=r$(2): LET r$(7)=r$(1): LET r$(8)=r$(4):
  30 GO SUB 9000
 500 REM main loop
 510 GO SUB 5000
 520 GO SUB 4000
 530 PAUSE 0
 540 PRINT AT pypos,pxpos; INK 0; BRIGHT 0;" "
 550 IF INKEY$="q" AND ATTR (pypos-1,pxpos)<7 THEN LET pypos=pypos-1
 560 IF INKEY$="a" AND ATTR (pypos+1,pxpos)<7 THEN LET pypos=pypos+1
 570 IF INKEY$="o" AND ATTR (pypos,pxpos-1)<7 THEN LET pxpos=pxpos-1
 580 IF INKEY$="p" AND ATTR (pypos,pxpos+1)<7 THEN LET pxpos=pxpos+1
 590 IF INKEY$="d" AND pxpos=dx AND pypos=dy THEN LET pdepth=pdepth+10: GO SUB 9000
 600 IF INKEY$="u" AND pxpos=ux AND pypos=uy AND pdepth>0 THEN LET pdepth=pdepth-10: GO SUB 9000
 610 GO TO 500
4000 REM stat updates
4010 PRINT AT 0,2; INK 7;"Depth:";pdepth;"ft"
4020 PRINT AT 0,13; INK 7;"HP:";phealth;"/";phealthmax
4030 PRINT AT 0,23; INK 7;"XP:";pxp
4040 RETURN
5000 REM entities updates
5010 IF pdepth>0 THEN PRINT AT uy,ux; INK 2;"<"
5020 IF ABS (pypos-dy)<=plight AND ABS (pxpos-dx)<=plight THEN PRINT AT dy,dx; INK 2;">"
5030 PRINT AT pypos,pxpos; INK 7; BRIGHT 1;"\@"
5040 RETURN
5050 STOP
9000 REM dungeon builder
9005 PRINT AT 0,0; INK 2;"\:'\''\''\''\''\''\''\''\''\''\''\''\''\''\''\''\''\''\''\''\''\''\''\''\''\''\''\''\''\''\''\':"
9010 PRINT AT 21,0; INK 2;"\:.\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\.:"
9020 FOR y=1 TO 20
9025 INK 7: BRIGHT 0: PRINT AT y,0;"################################"
9030 NEXT y
9035 DIM c(18,4)
9040 LET rt=1
9045 FOR h=1 TO 3
9050 FOR j=1 TO 2
9055 LET rc=INT (RND*3)+1
9060 LET tc=0
9065 FOR m=1 TO rc
9070 LET roomwidth=INT (RND*INT (7/rc))+2
9075 LET roomheight=INT (RND*INT (6/rc))+2
9080 LET roomx=(10*(h-1))+INT ((RND*(9-roomwidth)+1))
9085 LET roomy=1+(9*(j-1))+INT ((RND*(8-roomheight)+1))
9090 FOR y=0 TO roomheight
9095 FOR x=0 TO roomwidth
9100 IF SCREEN$ (roomy+y,roomx+x)=" " THEN LET m=m-1: LET tc=tc+1: NEXT m
9105 IF tc>=20 THEN GO TO 9185
9110 PRINT AT 21,30; INK 7;r$(y+1)
9115 NEXT x
9120 NEXT y
9125 FOR y=0 TO roomheight
9130 FOR x=0 TO roomwidth
9135 PRINT AT roomy+y,roomx+x; INK 0; BRIGHT 0;" "
9140 NEXT x
9145 NEXT y
9150 LET c(rt,3)=roomheight
9155 LET c(rt,4)=roomwidth
9160 LET c(rt,2)=roomx
9165 LET c(rt,1)=roomy
9170 LET rt=rt+1
9175 LET tc=0
9180 NEXT m
9185 REM dirty loop break!
9190 NEXT j
9195 NEXT h
9200 FOR w=1 TO rt-2
9205 LET pl=(c(w,1)-c(w+1,1))
9210 LET pm=(c(w,2)-c(w+1,2))
9215 LET q=-1
9220 LET r=-1
9225 IF pl<1 THEN LET q=1
9230 IF pm<1 THEN LET r=1
9235 FOR t=c(w,2) TO c(w+1,2) STEP r
9240 PRINT AT c(w,1)+(c(w,3)/2),t; INK 0; BRIGHT 0;"."
9245 NEXT t
9250 NEXT w
9255 FOR h=1 TO 2
9260 FOR j=1 TO 2
9265 LET t=INT (RND*2)-1
9270 FOR d=0 TO 10
9275 PRINT AT (j*10)-5+t,(h*10)-5+d; INK 0; BRIGHT 0;"."
9280 NEXT d
9285 NEXT j
9290 NEXT h
9295 FOR h=1 TO 3
9300 LET t=INT (RND*2)-1
9305 FOR d=0 TO 10
9310 PRINT AT (10)-5+d,(h*10)-5+t; INK 0; BRIGHT 0;"."
9315 NEXT d
9320 NEXT h
9325 LET w=INT (RND*(rt-1))+1
9330 LET uy=c(w,1)+INT (c(w,3)/2): LET ux=c(w,2)+INT (c(w,4)/2)
9335 LET v=INT (RND*(rt-1))+1
9340 IF v=w THEN GO TO 9335
9345 LET dy=c(v,1)+INT (c(v,3)/2): LET dx=c(v,2)+INT (c(v,4)/2)
9350 LET pxpos=ux-1: LET pypos=uy
9355 PRINT AT 21,0; INK 2;"\:.\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\.:"
9360 RETURN
