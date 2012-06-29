package model.scores
{
	import model.BaseModel;
	
	public class ScoreModel extends BaseModel
	{
		private var _team:String;
		private var _matches:String;
		private var _goals_scored:String;
		private var _golas_lost:String;
		private var _golas_diff:String;
		private var _matches_won:String;
		private var _matches_draw:String;
		private var _matches_lost:String;
		private var _points:String;
		private var _img:String;
		public function ScoreModel()
		{
			super();
		}
		public function update(o:Object):void{
			_team = o.team;
			_matches = o.matches;
			_goals_scored = o.goals_scored;
			_golas_lost = o.goals_lost;
			_golas_diff = o.goals_diff;
			_matches_won = o.matches_won;
			_matches_draw = o.matches_draw;
			_matches_lost = o.matches_lost;
			_points = o.points;
			_img = o.img;
		}
		
		public function get team():String
		{
			return _team;
		}
		
		public function set team(value:String):void
		{
			_team = value;
		}
		
		public function get matches():String
		{
			return _matches;
		}
		
		public function set matches(value:String):void
		{
			_matches = value;
		}
		
		public function get goals_scored():String
		{
			return _goals_scored;
		}
		
		public function set goals_scored(value:String):void
		{
			_goals_scored = value;
		}
		
		public function get golas_lost():String
		{
			return _golas_lost;
		}
		
		public function set golas_lost(value:String):void
		{
			_golas_lost = value;
		}
		
		public function get golas_diff():String
		{
			return _golas_diff;
		}
		
		public function set golas_diff(value:String):void
		{
			_golas_diff = value;
		}
		
		public function get matches_won():String
		{
			return _matches_won;
		}
		
		public function set matches_won(value:String):void
		{
			_matches_won = value;
		}
		
		public function get matches_draw():String
		{
			return _matches_draw;
		}
		
		public function set matches_draw(value:String):void
		{
			_matches_draw = value;
		}
		
		public function get matches_lost():String
		{
			return _matches_lost;
		}
		
		public function set matches_lost(value:String):void
		{
			_matches_lost = value;
		}
		
		public function get points():String
		{
			return _points;
		}
		
		public function set points(value:String):void
		{
			_points = value;
		}
		
		public function get img():String
		{
			return _img;
		}
		
		public function set img(value:String):void
		{
			_img = value;
		}
		
		
	}
}