package view.pages.live_streem
{
	import flash.display.DisplayObjectContainer;
	
	import view.assets.PictureLoader;
	import view.assets.ShowObject;
	import view.assets.TextFieldLech;
	
	public class TeamView extends ShowObject
	{
		private var _team_name:TextFieldLech  = new TextFieldLech(15);
		private var _img:PictureLoader =  new PictureLoader();
		private var _index:int = 1;
		public function TeamView(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			super(pClip, canShow);
			addChild(_team_name);
			addChild(_img);
		}
		public function update(players:Array,img:String,team:String):void{
			_team_name.text  = team;
			//			_img.setUrl(img);
			createPlayers(players);
		}
		private function createPlayers(players:Array):void{
			for each(var player:Object in players){
				createPlayer(player);
			}
		}
		private function createPlayer(player:Object):void{
			var name:TextFieldLech  = new TextFieldLech();
			name.text = player.name;
			addChild(name)
			name.y = _index*40;
			var number:TextFieldLech  = new TextFieldLech();
			number.text = player.number;
			addChild(number);
			number.x =  100;
			number.y = _index*40;
			var first_team:TextFieldLech  = new TextFieldLech();
			addChild(first_team);
			first_team.x =  200;
			first_team.y = _index*40;
			_index++;
			
			
		}
	}
}