import flash.display.MovieClip;
import flash.events.Event;

var backGround:Background=new Background();

backGround.x=-10;
backGround.scaleX = 3;
backGround.scaleY = 3;
addChild(backGround);

var middleGround:Middleground=new Middleground();

middleGround.x=-10;
middleGround.scaleX = 3;
middleGround.scaleY = 3;
addChild(middleGround);

var myBunny:Bunny=new Bunny();
myBunny.x=1220;
myBunny.y=470;
myBunny.scaleX= 0.5;
myBunny.scaleY= 0.5;
myBunny.gotoAndStop(1);
addChild(myBunny);

var mainCharacter:Character=new Character();
mainCharacter.x=500;
mainCharacter.y=400;
addChild(mainCharacter);
mainCharacter.gotoAndStop(1)

var foreGround:Foreground=new Foreground();

foreGround.x=-10;
foreGround.scaleX = 3;
foreGround.scaleY = 3;
addChild(foreGround);

stage.addEventListener(KeyboardEvent.KEY_DOWN, characterWalk_handlerDown)
function characterWalk_handlerDown(event:KeyboardEvent):void
{
	if(event.keyCode==39)
	{
		mainCharacter.play()
		mainCharacter.scaleX = 1;
		
			if(mainCharacter.x <= 768)
			{
			mainCharacter.x += 5;
			}
			if(mainCharacter.currentFrame >=23)
			{
				mainCharacter.gotoAndStop(1);
			}		
	}
	if(event.keyCode==37)
	{
		mainCharacter.scaleX = -1;
		mainCharacter.play()
			if(mainCharacter.x >= 256)
			{
			mainCharacter.x -= 5 ;
			}
			if(mainCharacter.currentFrame >=23)
			{
				mainCharacter.gotoAndStop(1);
			}
	}

	if(mainCharacter.x >= 768)
	{
		foreGround.x -= 8
		middleGround.x -=6
		backGround.x -=4
		myBunny.x -=6
	}
	if(mainCharacter.x <= 256)
	{
		foreGround.x += 8
		middleGround.x +=6
		backGround.x +=4
		myBunny.x +=6
	}
}

stage.addEventListener(KeyboardEvent.KEY_UP, characterWalk_handlerUp);
function characterWalk_handlerUp(event:KeyboardEvent):void
{
	mainCharacter.gotoAndStop(1)
}
stage.addEventListener(Event.ENTER_FRAME, collisionDetection_bunny);
function collisionDetection_bunny(event:Event):void
{
	if(myBunny.hitTestObject(mainCharacter) == true)
	{
		myBunny.play();
		
		if(myBunny.currentFrame == 10)
		{
			myBunny.stop();
		}		
	}
	else
	{
		myBunny.nextFrame()
	}
}