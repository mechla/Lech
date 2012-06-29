package view.assets 
{
	import com.greensock.TweenMax;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Button extends MovieClip
	{
		private var _image:DisplayObject;
		private var _minWidth:int = 33;
		public function Button(image:DisplayObject)
		{
			super();
			this.x = image.x;
			this.y = image.y;
			_image = image;
			_image.x = 0;
			_image.y = 0;
			this.addChild(_image);
			this.buttonMode = true;
			this.useHandCursor = true;
		}
		
		public function addEventListeners(onClick:Function=null):void
		{
			this.addEventListener(MouseEvent.MOUSE_OVER,mouseOverHandler);
			this.addEventListener(MouseEvent.MOUSE_OUT,mouseOutHandler);
			if(onClick!=null)
				this.addEventListener(MouseEvent.CLICK,onClick);
		}
		
		public function removeEventListeners(onClick:Function=null):void
		{
			this.removeEventListener(MouseEvent.MOUSE_OVER,mouseOverHandler);
			this.removeEventListener(MouseEvent.MOUSE_OUT,mouseOutHandler);
			if(onClick!=null)
				this.removeEventListener(MouseEvent.CLICK,onClick);
		}

		private function mouseOverHandler(evt:MouseEvent):void
		{
			TweenMax.to(this,0,{colorMatrixFilter:{brightness:1.2}});
		}
		
		private function mouseOutHandler(evt:MouseEvent):void
		{
			TweenMax.to(this,0,{colorMatrixFilter:{brightness:1.0}});
		}
		
		public function get image():DisplayObject
		{
			return _image;
		}
		
	}
}