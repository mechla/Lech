package view.pages.live_streem
{
	import data.Data;
	
	import flash.display.DisplayObjectContainer;
	
	import view.assets.ShowObject;
	import view.assets.TextFieldLech;
	
	public class LiveStreamElement extends ShowObject
	{
		private var _minute:TextFieldLech =  new TextFieldLech(15);
		private var _text:TextFieldLech  = new TextFieldLech(15);
		private var _score:TextFieldLech =  new TextFieldLech(15);
		public function LiveStreamElement(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			super(pClip, canShow);
			_text.y = 25;
			_text.wordWrap =  true;
			_text.width = Data.instance().stage_width;
			
			addChild(_minute);
			addChild(_text);
			addChild(_score);
				
			
			
		}
		public function update(o:Object):void{
			_minute.text = "minuta: "+o.minute;
			_text.text = o.text;
			_score.text = ",wynik: "+o.score_host+":"+o.score_guest;
			_score.x = _minute.width + 10;//Data.instance().stage_width -_score.width;
		}
	}
}