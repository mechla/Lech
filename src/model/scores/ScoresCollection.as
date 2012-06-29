package model.scores
{
	public class ScoresCollection 
	{
		private var _scores_array:Array =  new Array();
		public function ScoresCollection()
		{
			super();
		}
		public function pushScore(o:Object):void{
			var score:ScoreModel =  new ScoreModel();
			score.team = o.team;
			score.points = o.points;
			score.goals_scored = o.goals_scored;
			score.golas_diff = o.golas_diff;
			score.golas_lost = o.golas_lost;
			score.id = o.id;
			score.img = o.img;
			score.matches = o.matches;
			score.matches_draw = o.matches_draw;
			score.matches_lost = o.matches_lost;
			score.matches_won = o.matches_won;
			_scores_array.push(score);
		}

		public function get scores_array():Array
		{
			return _scores_array;
		}


	}
}