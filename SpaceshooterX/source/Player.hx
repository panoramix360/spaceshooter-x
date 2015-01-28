package source;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxAngle;

/**
 * ...
 * @author panoramix360
 */
class Player extends FlxSprite
{
	public var speed:Float = 100;
	
	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y);
		makeGraphic(100, 100, FlxColor.BLUE);
		
		drag.x = 500;
	}
	
	override function update():Void
	{
		this.movement();
		super.update();
	}
	
	private function movement():Void
	{
		var _left:Bool = false;
		var _right:Bool = false;
		
		_left = FlxG.keys.anyPressed(["LEFT"]);
		_right = FlxG.keys.anyPressed(["RIGHT"]);
		
		if (_left && _right)
			_left = _right = false;
		
		if (_left || _right)
		{
			var mA:Float = 0;
			if (_left)
			{
				mA = 180;
			}
			
			if (_right)
			{
				mA = 0;
			}
			
			FlxAngle.rotatePoint(speed, 0, 0, 0, mA, velocity);
		}
	}
	
}