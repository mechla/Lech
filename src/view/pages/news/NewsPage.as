package view.pages.news
{
	import data.Data;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	
	import view.App;
	import view.pages.ScrollPage;
	import view.pages.PaginationPage;
	
	public class NewsPage extends PaginationPage
	{
		private var _button:live_relation_button  = new live_relation_button();
		public function NewsPage(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			_limit = Data.instance().news_limit;
			_list_height = 100;
			super(pClip, canShow);
			//			addLiveStreemButton();
		}
		public function addLiveStreemButton():void{
			_button.x = Data.instance().stage_width/2 - _button.width/2;
			_button.y  = Data.instance().stage_height - _button.height -Data.instance().menu_height;
			addEvent(_button,goToExtraklasa);
			addChild(_button);
			_page_height = _page_height-_button.height;
			super.onResize();
		}
		private function goToExtraklasa(e:*):void{
			App.instance().page_container.showLiveStream();
		}
		override protected function addNewItem(i:int):void{
			var news_view:NewsListView =  new NewsListView(_content,true);
			news_view.y = i * _list_height;//+200;
			news_view.render(App.instance().model.news.news[i]);
			_list_array.push(news_view);
		}
		override protected function getNewPost():void{
			App.instance().communication.listNews(_added_pages+1);
		}
	}
}