			org 30000

loop	    call sc_calc
			ld a,1
			ld (hl),a
			call delay
			ld a,0
			ld (hl),a
			ld hl,ypos
			inc (hl)
			ld a,(ypos)          ; where is it now?
			cp 190               ; past top of screen yet?
			jr nz,loop           ; no, carry on.
			ret

sc_calc  	ld a,(ypos)         ; fetch vertical coordinate.
			ld l,a              ; store that in e.

            ; Find line within character height.

			and 7               ; line 0-7 within character square.
			add a,64            ; 64 * 256 = 16384 = start of screen display.
			ld h,a              ; line * 256.

			; Which third of the screen?

			ld a,l              ; restore the vertical.
			and 192             ; segment 0, 1 or 2 multiplied by 64.
			rrca                ; divide this by 8.
			rrca
			rrca                ; segment 0-2 multiplied by 8.
			add a,h             ; add to d give segment start address.
			ld h,a

			; Whcih character cell?

			ld a,l              ; 8 character squares per segment.
			rlca                ; divide x by 8 and multiply by 32,
			rlca                ; net calculation: multiply by 4.
			and 224             ; mask off bits we don't want.
			ld l,a              ; vertical coordinate calculation done.

			; Easy Peasy Xpos

			ld a,(xpos)       ; y coordinate.
			rrca                ; only need to divide by 8.
			rrca
			rrca
			and 31              ; squares 0 - 31 across screen.
			add a,l             ; add to total so far.
			ld l,a              ; de = address of screen.
			ret

delay		;
			ret

ypos	defb 75
xpos	defb 50
