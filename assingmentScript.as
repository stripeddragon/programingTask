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
mainCharacter.y=450;
addChild(mainCharacter);
mainCharacter.gotoAndStop(1)

var myPlatform:Platform=new Platform();
myPlatform.y=595;
myPlatform.x=500;
myPlatform.alpha=0;
addChild(myPlatform)

var foreGround:Foreground=new Foreground();
foreGround.x=-10;
foreGround.scaleX = 3;
foreGround.scaleY = 3;
addChild(foreGround);

var keyPressLeft:Boolean = false;
var keyPressRight:Boolean = false;
var keyPressUp:Boolean = false;

stage.addEventListener(KeyboardEvent.KEY_DOWN, characterWalk_handlerDown)
function characterWalk_handlerDown(event:KeyboardEvent):void
{
	if(event.keyCode==39)
	{
		keyPressRight=true;
		mainCharacter.play();
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
		keyPressLeft= true;
		mainCharacter.scaleX = -1;
		mainCharacter.play();
			if(mainCharacter.x >= 256)
			{
			mainCharacter.x -= 5 ;
			}
			if(mainCharacter.currentFrame >=23)
			{
				mainCharacter.gotoAndStop(1);
			}
	}
	if(event.keyCode==38)
	{	
		keyPressUp= true;
		mainCharacter.gotoAndPlay(26);
		mainCharacter.y-=4;
		
	}
	if(keyPressRight==true && keyPressUp == true)
	{
		mainCharacter.x+=2
	}
	if(keyPressLeft == true && keyPressUp == true)
	{
		mainCharacter.x-=2
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
	keyPressUp=false;
	keyPressRight=false;
	keyPressLeft=false;
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

var gravity:Number = 1.1;
var velocity:Number =.25;

mainCharacter.addEventListener(Event.ENTER_FRAME, gravityFunction);
function gravityFunction(event:Event):void
{  
	if(mainCharacter.hitTestObject(myPlatform) == false)
	{
		mainCharacter.y += velocity;
		velocity *= gravity;
	}
	if(mainCharacter.hitTestObject(myPlatform) == true)
	{
		velocity=1.1;
	}
}