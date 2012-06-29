package view.pages.team
{
	import com.greensock.plugins.Positions2DPlugin;
	
	import flash.display.DisplayObjectContainer;
	
	import view.App;
	import view.assets.ShowObject;
	import view.assets.TextFieldLech;
	
	public class TeamPlayerList extends ShowObject
	{
		private var _name:TextFieldLech =  new TextFieldLech();
		private var _position:TextFieldLech =  new TextFieldLech();
		private var _goal_season:TextFieldLech =  new TextFieldLech();
		private var _red_card:TextFieldLech =  new TextFieldLech();
		private var _yellow_card:TextFieldLech =  new TextFieldLech();
		
		private var _id:String;
		public function TeamPlayerList(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			super(pClip, canShow);
			init();
		}
		public function init():void{
			addChild(_name);
			_name.x = 10;
			
			addChild(_position);
			_position.x = 190;
			addChild(_goal_season);
			_goal_season.x = 270;
			addChild(_red_card);
			_red_card.x = 305;
			addChild(_yellow_card);
			_yellow_card.x = 340;
		}
		public function update(o:Object):void{
			_name.text = o.firstname+" "+o.lastname;
			_id = o.id;
			_position.text =  o.position;
			_goal_season.text = o.goal_season;
			_red_card.text = o.red_card;
			_yellow_card.text = o.yellow_card;
			if(_id !=null)
				addEvent(this,goToPlayer);
		}
		private function goToPlayer(e:*):void{
			App.instance().communication.player(_id);
			App.instance().page_container.showPlayerView();
			
		}
	}
}