pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
--0,0 to 128,128

	function _init()
		poke(0x5f2d, 1)
		-- stat(32) --x coord		
		-- stat(33) --y coord
		-- stat(34) --button bitmask (1=primary, 2=secondary, 4=middle)
	end
	
	x = 64
	y = 64
	points = {}
	mousePosition = {
		mousex = 0,
		mousey = 0
	}
	
	box = {
		startposx = 0,
		startposy = 0,
		color = 7,
		xPadding = 2,
		yPadding = 3,
		textColor = 7,
		text = "",
		textWidth = 0,
		xlength = 0,
		ylength = 10
	}
	
	box.text = "standard text test"
	box.textWidth = #box.text * 4--text width is character length * 4
	box.xlength = box.xPadding + box.textWidth + box.xPadding


	function _update60()
		mousePosition.mousex = stat(32)
		mousePosition.mousey = stat(33)
		if(stat(34) == 1) then
			add(points,{ mousePosition.mousex, mousePosition.mousey})
		end
	end

	function _draw()
		cls(0)

		if(isMouseInsideBox(mousePosition, box)) then
			box.color = 8
			drawRectBorderWithText(box)
		else
			box.color = 7
			drawRectBorderWithText(box)
		end

		for i=1,#points,1 do
			rectfill(points[i][1], points[i][2],points[i][1],points[i][2],8)
		end

		rectfill(mousePosition.mousex,mousePosition.mousey, mousePosition.mousex,mousePosition.mousey,11)
	end

	function drawRectBorderWithText(_box)
		rect(_box.startposx, _box.startposy, _box.xlength, _box.ylength, _box.color)
		print(_box.text,_box.xPadding,_box.yPadding,_box.textColor)
	end

	function isMouseInsideBox(_mouseposition, _box)
		if(_mouseposition.mousex >= _box.startposx and _mouseposition.mousex <= (_box.startposx + _box.xlength) and _mouseposition.mousey >= _box.startposy and _mouseposition.mousey <= (_box.startposy + _box.ylength)) then
			return true
		else
			return false
		end
	end