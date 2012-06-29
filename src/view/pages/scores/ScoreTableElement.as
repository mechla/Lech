package view.pages.scores
{
	import flash.display.DisplayObjectContainer;
	
	import model.scores.ScoreModel;
	
	import view.assets.PictureLoader;
	import view.assets.ShowObject;
	import view.assets.TextFieldLech;
	
	public class ScoreTableElement extends ShowObject
	{
		private var _team:TextFieldLech =  new TextFieldLech(15);
		private var _maches:TextFieldLech =  new TextFieldLech(15);
		private var _goals:TextFieldLech =  new TextFieldLech(15);
		private var _balance:TextFieldLech =  new TextFieldLech(15);
		private var _z:TextFieldLech =  new TextFieldLech(15);
		private var _r:TextFieldLech =  new TextFieldLech(15);
		private var _p:TextFieldLech =  new TextFieldLech(15);
		private var _points:TextFieldLech =  new TextFieldLech(15);
		private var _logo:PictureLoader =  new PictureLoader();
		public function ScoreTableElement(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			super(pClip, canShow);
			init();
		}
		private function init():void{
			addChild(_team);
			addChild(_maches);
			addChild(_goals);
			addChild(_balance);
			addChild(_z);
			addChild(_r);
			addChild(_p);
			addChild(_points);
			addChild(_logo);
			
			_team.x = 20;
			_maches.x = _team.x + 130;
			_goals.x = _maches.x + 30;
			_balance.x = _goals.x + 30;
			_z.x = _balance.x + 30;
			_r.x = _z.x + 30;
			_p.x = _r.x + 30;
			_points.x = _p.x + 30;
			
		}
		
		public function  update(t:ScoreModel):void{
			_team.text = t.team;
			_maches.text = t.matches;
			_goals.text = t.goals_scored;
			_balance.text = t.golas_diff;
			_z.text = t.matches_won;
			_r.text = t.matches_draw;
			_p.text = t.matches_lost;
			_points.text = t.points;
			_logo.setUrl(t.img);
			_logo.scaleX =  _logo.scaleY = .25;
		}
	}
}