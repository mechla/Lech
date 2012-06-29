package view.pages.news
{
	import data.Data;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	import model.news.NewsModel;
	
	import view.assets.PictureLoader;
	import view.assets.ShowObject;
	import view.assets.TextFieldLech;
	
	public class MainNewsObject extends ShowObject
	{
		private var _title:TextFieldLech =  new TextFieldLech(17);
		private var _description_container:Sprite =  new Sprite();
		private var _description:TextFieldLech =  new TextFieldLech(12);
		private var _thumb:PictureLoader =  new PictureLoader();
		private var _mask:Sprite =  new Sprite();
		public function MainNewsObject(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			super(pClip, canShow);
			createView();
		}
		private function createView():void{
			_title.position(5,220);
			addChild(_title);
			
			_description.position(5,220);
			_description_container.addChild(_description);
			addChild(_description_container);
			
			_thumb.x = 5;
			addChild(_thumb);
			
			
		}
		private function createMask(height:Number):void{
			_mask.graphics.beginFill(0x888888);
			_mask.graphics.drawRect(_description.x,_description.y,_description.width,height);
			_mask.graphics.endFill();
			_description_container.addChild(_mask);
			_description_container.mask = _mask;
			
		}
		public function render(news:NewsModel):void{
			_title.htmlText = news.title;
			_thumb.setUrl(news.thumb);
			_description.y = _title.y + _title.textHeight;
			
			_description.htmlText = news.short;
			_description.height =  10;
			
			
		}
	}
}