package view.pages.scores
{
	import data.Data;
	
	import flash.display.DisplayObjectContainer;
	
	import model.scores.ScoreModel;
	
	import view.App;
	import view.pages.PaginationPage;
	import view.pages.ScrollPage;
	
	
	public class ScoresPage extends PaginationPage
	{
		private var _button:butto_table_extraklasa =  new butto_table_extraklasa();
		
		public function ScoresPage(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			super(pClip, canShow);
			_limit = 10
			_list_height = 20;
			//			addButton();
		}
		public function addButton():void{
			
			_button.x = Data.instance().stage_width/2 - _button.width/2;
			_button.y  = Data.instance().stage_height - _button.height -Data.instance().menu_height;
			addEvent(_button,goToExtraklasa);
			addChild(_button);
			_page_height = _page_height-_button.height;
			super.onResize();
		}
//		override public function onResize(e:*=null):void 
//		{
//			super.onResize();
//			setScrollHeight(Data.instance().stage_height - Data.instance().menu_height-_button.height);
//		}
		private function goToExtraklasa(e:*):void{
			//			App.instance().page_container.goToLiveRelation();
		}
		override protected function addNewItem(i:int):void{
			var list:ScoreTableElement = new ScoreTableElement(this,true);
			var s_model:ScoreModel = App.instance().model.scores_collection.scores_array[i];
			list.update(s_model);
			list.y = i * _list_height;//+200;
		}
	}
}