package view.pages.gallery
{
	import data.Data;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	
	import model.gallery.GalleryModel;
	
	import view.assets.ShowObject;
	
	public class PhotoView extends ShowObject
	{
		private var _black_bg:Sprite =  new Sprite();
		private var _photo:Sprite =  new Sprite();
		private var _exit:Sprite  = new Sprite();
		public function PhotoView(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			super(pClip, canShow);
			addBlackBg();
		}
		private function addBlackBg():void{
			_black_bg.graphics.beginFill(0x000000,1);
			_black_bg.graphics.drawRect(0,0,Data.instance().stage_width,Data.instance().stage_height);
			_black_bg.graphics.endFill();
			addChild(_black_bg);
			addChild(_photo);
			_exit.graphics.beginFill(0xff0000,1);
			_exit.graphics.drawRect(0,0,50,50);
			_exit.graphics.endFill();
			_exit.x = Data.instance().stage_width-50;
			_exit.y = 0;
			addChild(_exit);
			_exit.addEventListener(MouseEvent.CLICK,hide);
			_exit.addEventListener(TouchEvent.TOUCH_TAP,hide);
		}
		public function update(gallery:GalleryModel,picture_index:int):void{
			while (_photo.numChildren>0)
				_photo.removeChildAt(0);
			gallery.photos[picture_index].getPhoto(addPhoto);
		}
		private function addPhoto(photo:Sprite):void{
			_photo.addChild(photo);
		}
	}
}