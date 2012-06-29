package model.news
{
	public class NewsCollection extends Array
	{
		private var _news:Array =  new Array();
		private var _page:int = 0;
		public function NewsCollection()
		{
			super();
		}

		public function pushNews(o:Object):void{
			var news:NewsModel =  new NewsModel();
			news.author = o.author;
			news.date = o.date;
			news.full =  o.full;
			news.short =  o.short;
			news.thumb = o.thumb;
			news.title = o.title;
			news.photo = o.photo;
			_news.push(news);
		}
		public function get news():Array
		{
			return _news;
		}

		public function set news(value:Array):void
		{
			_news = value;
		}

		public function get page():int
		{
			return _page;
		}

		public function set page(value:int):void
		{
			_page = value;
		}

	}
}