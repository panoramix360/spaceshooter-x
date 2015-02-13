package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

/**
 * ...
 * @author panoramix360
 */
class Star extends FlxSprite
{
	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y);
		makeGraphic(3, 2, FlxColor.WHITE);
	}
	
	override function update():Void
	{
		super.update();
		if (this.y == FlxG.height)
		{
			this.destroy();
		}
	}
}