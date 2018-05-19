pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
--0,0 to 128,128

	function _init()
		poke(0x5f2d, 1)
		stat(32) --x coord		
		stat(33) --y coord
		stat(34) --button bitmask (1=primary, 2=secondary, 4=middle)
	end
	
	x = 64
	y = 64
	mousex = 0
	mousey = 0
	
	function _update60()
		if (btn(0)) then x=x-10 end
		if (btn(1)) then x=x+10 end
		if (btn(2)) then y=y-10 end
		if (btn(3)) then y=y+10 end
		mousex = stat(32)
		mousey = stat(33)
	end

	function _draw()
		--rectfill(0,0,127,127,5)
		circfill(mousex,mousey,7,14)
	end
