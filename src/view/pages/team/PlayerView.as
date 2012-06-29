package view.pages.team
{
	import flash.display.DisplayObjectContainer;
	
	import view.assets.TextFieldLech;
	import view.pages.ScrollPage;
	
	public class PlayerView extends ScrollPage
	{
		private var _o:Number = 20;
		private var _name:TextFieldLech =  new TextFieldLech();
		private var _years:TextFieldLech =  new TextFieldLech();
		private var _nationality:TextFieldLech =  new TextFieldLech();
		private var _height:TextFieldLech =  new TextFieldLech();
		private var _weight:TextFieldLech =  new TextFieldLech();
		private var _date_club:TextFieldLech =  new TextFieldLech();
		private var _career:TextFieldLech =  new TextFieldLech();
		public function PlayerView(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			super(pClip, canShow);
			init();
		}
		private function init():void{
			_name.position(5,0);
			add(_name);
			_years.position(5,_o);
			add(_years);
			_nationality.position(5,_o*2);
			add(_nationality);
			_height.position(5,_o*3);
			add(_height);
			_weight.position(5,_o*4);
			add(_weight);
			_date_club.position(5,_o*5);
			add(_date_club);
			_career.position(5,_o*6);
			add(_career);
		}
		public function update(o:Object):void{
			_name.text = o.firstname+" "+o.lastname;
			_years.text = "Wiek: "+o.years;
			_nationality.text = "Narodowość: "+o.nationality;
			_height.text = "Wzrost: "+o.height;
			_weight.text = "Waga: "+o.weight;
			_date_club.text = "Data przyłaczenia do klubu: "+o.date_club;
			_career.text = o.career;
			
		}
	}
}
//{
//	"resultCode":1,
//	"message":"OK",
//	"result":{
//		"id":"2325",
//		"firstname":"Gergo",
//		"lastname":"Lovrencsics",
//		"years":24,
//		"nationality":"W\u0119gier",
//		"0":"civil_status",
//		"1":"",
//		"height":"177",
//		"weight":"77",
//		"nick":"",
//		"date_club":"2012-06-20",
//		"hobby":"",
//		"matches_league":"0",
//		"goals_league":"0",
//		"matches_season":"0",
//		"minutes_season":null,
//		"yellow_cards":"0",
//		"red_cards":"0",
//		"career":"<p>Szent Istvan, Budafok, MFC Pecs, Lombard Papa<\/p>"
//	}
//}