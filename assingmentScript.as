import flash.display.MovieClip;

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

var mainCharacter:Character=new Character();
mainCharacter.x=200;
mainCharacter.y=200;
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
		mainCharacter.x += 5;
		if(mainCharacter.currentFrame >=23)
		{
			mainCharacter.gotoAndStop(1);
		}		
	}
	if(event.keyCode==37)
	{
		mainCharacter.scaleX = -1;
		mainCharacter.play()
		mainCharacter.x -= 5 ;
			if(mainCharacter.currentFrame >=23)
			{
				mainCharacter.gotoAndStop(1);
			}
	}
}

stage.addEventListener(KeyboardEvent.KEY_UP, characterWalk_handlerUp)
function characterWalk_handlerUp(event:KeyboardEvent):void
{
	mainCharacter.gotoAndStop(1)
}

