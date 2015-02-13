package source;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.debug.FlxDebugger.ButtonAlignment;
import flixel.util.FlxColor;
import flixel.util.FlxAngle;

/**
 * ...
 * @author panoramix360
 */
class Player extends FlxSprite
{
	public var speed:Float = 400;
	
	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y);
		makeGraphic(50, 100, FlxColor.BLUE);
		
		drag.x = drag.y = 1000;
	}
	
	override function update():Void
	{
		this.movement();
		this.shoot();
		super.update();
	}
	
	private function movement():Void
	{
		var _up:Bool = false;
		var _down:Bool = false;
		var _left:Bool = false;
		var _right:Bool = false;
		
		_up = FlxG.keys.anyPressed(["UP"]);
		_down = FlxG.keys.anyPressed(["DOWN"]);
		_left = FlxG.keys.anyPressed(["LEFT"]);
		_right = FlxG.keys.anyPressed(["RIGHT"]);
		
		if (_up && _down)
			_up = _down = false;
		if (_left && _right)
			_left = _right = false;
		
		if (_up || _down || _left || _right)
		{
			var mA:Float = 0;
			
			if (_up)
			{
				mA = -90;
				if (_left)
					mA -= 45;
				else if (_right)
					mA += 45;
			}
			else if (_down)
			{
				mA = 90;
				if (_left)
					mA += 45;
				else if (_right)
					mA -= 45;
			}
			else if (_left)
			{
				mA = 180;
			}
			else if (_right)
			{
				mA = 0;
			}
			
			FlxAngle.rotatePoint(speed, 0, 0, 0, mA, velocity);
		}
	}
	
	private function shoot():Void
	{
		var _space:Bool = false;
		
		_space = FlxG.keys.anyPressed(["SPACE"]);
		
		if (_space)
		{
			// shoot
		}
	}
	
}