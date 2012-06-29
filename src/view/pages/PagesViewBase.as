package view.pages
{
	import com.greensock.TweenLite;
	
	import data.Data;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	import view.assets.ShowObject;
	import view.menu.Menu;
	
	public class PagesViewBase extends ShowObject
	{
		protected var _page_swipe_container:Sprite =  new Sprite();
		protected var _page_swipe_index:int = 0;
		
		protected var _current_page:ScrollPage
		protected var _previous_page:ScrollPage;
		protected var _next_page:ScrollPage;
		protected var _current_id:Number = 0;
		
		protected var _pages_array:Array =  new Array();
		protected var _pages_history:Array =  new Array();
		
		protected var _menu:Menu;
		protected var _block:Sprite =  new Sprite();
		
		public function PagesViewBase(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			super(pClip, canShow);
		}
		public function init():void{
			addChild(_page_swipe_container);
			_current_id = 0;
			
			_menu =  new Menu(this,true);
			_menu.init();
			createBlock();
		}
		private function createBlock():void{
			_block.graphics.beginFill(0x000000,0.5);
			_block.graphics.drawRect(0,0,Data.instance().stage_width,Data.instance().stage_height);
			_block.graphics.endFill();
			addChild(_block);
		}
		public function showBlock():void{
			_block.visible =  true;
		}
		public function hideBlock():void{
			_block.visible =  false;
		}
		public function goToPage(next_id:int):void{
			if(_current_id != next_id){
				_menu.updatePagetitle(Data.instance().menu[next_id][0]);
				_next_page = _pages_array[next_id];
				changePages((next_id - _current_id)>0);
				_current_id =  next_id;
			}
			else
				hideBlock();
		}
		protected function changePages(back:Boolean):void{
			showBlock();
			if(!back){
				_page_swipe_index = _page_swipe_index - 1;
			}
			else{
				_page_swipe_index = _page_swipe_index + 1;
			}
			_next_page.x = Data.instance().stage_width * _page_swipe_index
			_next_page.show();
			_pages_history.push(_current_page);
			TweenLite.to(_page_swipe_container,1,{x: -_next_page.x,onComplete:trasitionFinish});
			_previous_page = _current_page;
			_current_page = _next_page;
		}
		private function trasitionFinish():void{
			_previous_page.hide();
			hideBlock();
		}
		public function get menu():Menu
		{
			return _menu;
		}
		public function set menu(value:Menu):void
		{
			_menu = value;
		}
	}
}