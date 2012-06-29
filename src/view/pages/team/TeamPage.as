package view.pages.team
{
	import flash.display.DisplayObjectContainer;
	
	import view.pages.ScrollPage;
	
	public class TeamPage extends ScrollPage
	{
		private var _index:int = 0;
		private var _hight:Number = 30;
		
		private var _bramkarz:Array =  new Array();
		private var _pomocnik:Array =  new Array();
		private var _obronca:Array =  new Array();
		public function TeamPage(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			super(pClip, canShow);
		}
//		public function addPlayer(e:Object):void{
//			if(e.position == "Bramkarz") _bramkarz.push(e);
//			
//		}
		public function addPlayer(o:Object):void{
//		public function renderPlayer(o:Object):void{
			var player_list:TeamPlayerList =  new TeamPlayerList(_content,true);
			player_list.update(o);
			player_list.y = _hight*_index;
			_index++;
		}
	}
}