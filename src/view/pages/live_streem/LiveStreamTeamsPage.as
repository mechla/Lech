package view.pages.live_streem
{
	import data.Data;
	
	import flash.display.DisplayObjectContainer;
	
	import view.App;
	import view.pages.ScrollPage;
	
	public class LiveStreamTeamsPage extends ScrollPage
	{
		private var _button:live_relation_button  = new live_relation_button();
		public function LiveStreamTeamsPage(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			super(pClip, canShow);
			addLiveStreemButton();
		}
		public function  update(o:Object):void{
			var guest:Array =  o.guest_players;
			var host:Array = o.host_players;
			
			var team_host:TeamView  = new TeamView(_content,true);
			team_host.update(host,o.host_img,o.host_team);
			
			var team_guest:TeamView  = new TeamView(_content,true);
			team_guest.x = team_host.height +20;
			team_guest.update(guest,o.guest_img,o.guest_team);
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
	}
}