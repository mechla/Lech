package view.pages.news
{
	import data.Data;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	
	import model.news.NewsModel;
	
	import view.App;
	import view.assets.PictureLoader;
	import view.assets.ShowObject;
	import view.assets.TextFieldLech;
	
	public class NewsListView extends ShowObject
	{
		private var _title_font_size:int = 17;
		private var _description_font_size:int = 13;
		
		private var _title:TextFieldLech =  new TextFieldLech(_title_font_size,0x0,true);
		private var _description:TextFieldLech =  new TextFieldLech(_description_font_size);
		
		private var _description_container:Sprite =  new Sprite();
		private var _thumb:PictureLoader =  new PictureLoader();
		private var _mask:Sprite =  new Sprite();
		
		private var _news_model:NewsModel  =  new NewsModel();
		public function NewsListView(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			super(pClip, canShow);
			createView();
		}
		private function createView():void{
			
			_thumb.x = 5;
			addChild(_thumb);
			
			_title.x = 180;
			_title.width = Data.instance().stage_width - 195;
			addChild(_title);
			
			_description.position(180,50);
			_description.width = Data.instance().stage_width - 195;
			//			_description.maxChars =  20;
			_description_container.addChild(_description);
			addChild(_description_container);
			
			
		}
		private function createMask(height:Number):void{
			_mask.graphics.beginFill(0x888888);
			_mask.graphics.drawRect(_description.x,_description.y,_description.width,height-_description_font_size/4);
			_mask.graphics.endFill();
			_description_container.addChild(_mask);
			_description_container.mask = _mask;
			
		}
		public function render(news:NewsModel):void{
			_news_model = news;
			_title.htmlText = news.title;
			_title.numLines
			_thumb.setUrl(news.thumb);
			_description.y = _title.textHeight;
			
			_description.htmlText = news.short;
			if(_title.numLines == 1)
				createMask(_description_font_size *6);
			if(_title.numLines == 2)
				createMask(_description_font_size *5);
			if(_title.numLines == 3)
				createMask(_description_font_size *3);
			
			this.addEventListener(TouchEvent.TOUCH_TAP, newsTapped);
			this.addEventListener(MouseEvent.CLICK, newsTapped)
		}
		private function newsTapped(e:*):void{
			App.instance().page_container.showBlock();
			App.instance().page_container.news_view.update(_news_model);
		}
	}
}