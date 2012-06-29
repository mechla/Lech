package view.pages
{
	import data.Data;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	import view.App;
	import view.pages.news.NewsListView;
	
	public class PaginationPage extends ScrollPage
	{
		Multitouch.inputMode=MultitouchInputMode.TOUCH_POINT;
		protected var _list_array:Array =  new Array();
		protected var _show_more_button:button_more =  new button_more();
		protected var _visible_pages:int = 0;
		protected var _added_pages:int = 0;
		protected var _list_height:int
		
		protected var _limit:int;
		public function PaginationPage(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			super(pClip, canShow);
			addMoreButton();
		}
		public function showNewPage():void{
			var i:int;
			var start:int = _visible_pages*_limit;
			var end:int = start + _limit;
			for(i = start; i < end; i++){
				add(_list_array[i])
			}
			_visible_pages++;
			_show_more_button.y = i* _list_height + 20;
			super.setContent();
			addMoreButtonEvents();
		}
		protected function addNewItem(i:int):void{
			//override
		}
		public function addNewPage():void{
			//			var main_news:MainNewsObject =  new MainNewsObject(_content,true);
			//			main_news.render(App.instance().model.news.news[0]);
			//			for(var i:int = 1;i < App.instance().model.news.news.length;i++){
			var i:int;
			var start:int = _visible_pages*_limit;
			var end:int = start + _limit;
			for(i = start; i < end; i++){
				addNewItem(i);
			}
			_added_pages++;
			_visible_pages++;
			_show_more_button.y = i * _list_height + 20;
			super.setContent();
			addMoreButtonEvents();
		}
		public function addMoreButton():void{
			_show_more_button.x = Data.instance().stage_width/2 - _show_more_button.width/2;
			add(_show_more_button);
		}
		private function addMoreButtonEvents():void{
			_show_more_button.addEventListener(MouseEvent.CLICK, showMore);
			_show_more_button.addEventListener(TouchEvent.TOUCH_TAP, showMore);
			_show_more_button.visible = true;
			App.instance().page_container.hideBlock()
			_content.setChildIndex(_show_more_button,_content.numChildren-1);
		}
		private function removeMoreButtonEvents():void{
			_show_more_button.removeEventListener(MouseEvent.CLICK, showMore);
			_show_more_button.removeEventListener(TouchEvent.TOUCH_TAP, showMore);
			_show_more_button.visible = false;
			App.instance().page_container.showBlock();
		}
		public function showMore(e:*):void{
			removeMoreButtonEvents();
			if(_visible_pages < _added_pages)
				showNewPage();
			else
				getNewPost();
		}
		protected function getNewPost():void{
		}
		override public function hide(...params):void{
			_visible_pages = 1;
			for(var i:int = _limit;i<_list_array.length;i++){
				if(_list_array[i].parent)
					_list_array[i].parent.removeChild(_list_array[i])
			}
			_visible_pages = 1;
			_show_more_button.y = _limit * _list_height;
			super.setContent();
			super.hide();
		}
	}
}