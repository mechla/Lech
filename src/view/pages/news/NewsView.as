package view.pages.news
{
	import data.Data;
	
	import flash.display.DisplayObjectContainer;
	
	import model.news.NewsModel;
	
	import view.App;
	import view.assets.PictureLoader;
	import view.assets.TextFieldLech;
	import view.pages.ScrollPage;
	
	public class NewsView extends ScrollPage
	{
		private var _title:TextFieldLech =  new TextFieldLech(20);
		private var _description:TextFieldLech =  new TextFieldLech();
		private var _date:TextFieldLech =  new TextFieldLech();
		private var _author:TextFieldLech =  new TextFieldLech();
		private var _photo_url:String;
		private var _picture:PictureLoader = new PictureLoader();
		
		private var _news_model:NewsModel;
		
		public function NewsView(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			super(pClip, canShow);
			setContent();
		}
		override public function setContent():void{
			addElements();
			
		}
		private function addElements():void{
			_title.position(5,220);
			_title.width = Data.instance().stage_width - 10;
			add(_title);
			
			_description.position(5,260);
			_description.width = Data.instance().stage_width - 10;
			add(_description);
			
			_date.x = 5;
			_date.width = Data.instance().stage_width - 10;
			add(_date);
			
			
			_author.width = Data.instance().stage_width - 10;
			add(_author);
			
		}
		public function update(news:NewsModel):void{
			_news_model = news;
			
			_picture = new PictureLoader();
			_picture.x = 5;
			_picture.setUrl(news.photo);
			add(_picture)
			
			_title.text = news.title;
			_description.y = _title.y + _title.height;
			_description.htmlText = news.full;
			
			_author.htmlText =  news.author;
			_date.htmlText = news.date;
			_date.y =  _description.y + _description.height;
			_author.y = _description.y + _description.height;
			_author.x = Data.instance().stage_width - _author.textWidth - 10;
			
			super.setContent();
			App.instance().page_container.showNewsView();
			
			
		}
	}
}
