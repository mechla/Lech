package view.assets 
{
	
	import com.greensock.TweenMax;
	import com.greensock.easing.Back;
	
	import data.Data;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	
	public class ShowObject extends MovieClip
	{
		protected var _parentClip:DisplayObjectContainer;
		public function ShowObject(pClip:DisplayObjectContainer, canShow:Boolean = true)
		{
			super();
			_parentClip = pClip;
			if(canShow)
				show();
		}
		public function blink(v:uint=0xffffff):void
		{
			TweenMax.to(this, 0.25, {glowFilter:{color:v, alpha:1, blurX:20, blurY:20, strength:1, remove:true}});
		}
		public function show(...args):void
		{
			if (!this.stage)
			{
				_parentClip.addChild(this);
				this.alpha=0;
			}
			TweenMax.to(this,0.1,{alpha:1,ease:Back.easeOut});
		}
		public function addMe():void{
			if (!this.stage)
			{
				_parentClip.addChild(this);
			}
			
		}
		
		public function hide(...params):void
		{ 
			if (this.stage)
			{
				TweenMax.to(this,0.1,{alpha:0,ease:Back.easeIn,onComplete:removeMe});
			}
		}
		public function removeMe():void
		{
			if(this.stage != null)
				this.parent.removeChild(this);
		}
		public function get parentClip():DisplayObjectContainer
		{
			return _parentClip;
		}
		public function addEvent(obj:DisplayObject,callback:Function):void{
			if(Data.instance().mobile)
				obj.addEventListener(TouchEvent.TOUCH_TAP,callback);
			else
				obj.addEventListener(MouseEvent.CLICK, callback);
			
		}
		
	}
}