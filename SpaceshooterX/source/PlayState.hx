package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxRandom;
import source.Player;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private var _background:FlxTypedGroup<Star>;
	private var _player:Player;
	
	private var elapsedTimeForStars:Float = 0xFFFF;
	
	// CONSTANTS
	private var STAR_DELAY = 0.01;
	private var STAR_SPEED = 500;
	private var NUMBER_OF_STARS = 200;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		_background = new FlxTypedGroup<Star>();
		_player = new Player(FlxG.width / 2, FlxG.height - 200);
		
		this.createBackground();
		
		add(_background);
		add(_player);
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		this.animateBackground();
		super.update();
	}
	
	public function createBackground():Void
	{
		var x = FlxRandom.floatRanged(0, FlxG.width);
		var star = new Star(x, 0);
		
		_background.add(star);
		
		// set state to "dead" it will be revived
		star.kill();
	}
	
	public function animateBackground():Void
	{
		elapsedTimeForStars += FlxG.elapsed;
		
		if (elapsedTimeForStars >= STAR_DELAY)
		{
			this.createBackground();
			
			var star:Star = cast(_background.getFirstDead(), Star);
			
			if (star == null)
				return;
			
			star.revive();
			
			star.velocity.y = STAR_SPEED;
			star.velocity.x = 0;
			
			elapsedTimeForStars = 0;
			
			if (_background.countDead() == 0)
			{
				this.createBackground();
			}
		}
	}
}