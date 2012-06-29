package view.pages.live_streem
{
	import data.Data;
	
	import flash.display.DisplayObjectContainer;
	
	import view.App;
	import view.assets.Button;
	import view.pages.ScrollPage;
	
	public class LiveStreamPage extends ScrollPage
	{
		private var _index:int = 0;
		private var _button:go_to_teams_button = new go_to_teams_button();
		public function LiveStreamPage(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			super(pClip, canShow);
			addButton();
		}
		public function addStream(o:Object):void{
			var live_element:LiveStreamElement =  new LiveStreamElement(_content,true);
			live_element.update(o);
			live_element.y = _content.height+10;
		}
		private function addButton():void{
			_button.x = Data.instance().stage_width/2 - _button.width/2;
			_button.y  = Data.instance().stage_height - _button.height -Data.instance().menu_height;
			addEvent(_button,goToTeams);
			addChild(_button);
			_page_height = _page_height-_button.height;
			super.onResize();
		}
		private function goToTeams(e:*):void{
			App.instance().page_container.goToPageLiveTeams()
			
		}
	}
}