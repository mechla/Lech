package view.pages
{
	import data.Data;
	
	import flash.display.DisplayObjectContainer;
	
	import view.assets.ShowObject;
	
	public class SeedLoaderPage extends ShowObject
	{
		private var _bg:seed_background =  new seed_background();
		private var _logo:seed_lech_logo =  new seed_lech_logo();
		private var _loader:seed_loader_movie  = new seed_loader_movie();
		private var _text:seed_loader_text  = new seed_loader_text();
			
		public function SeedLoaderPage(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			super(pClip, canShow);
			init();
		}
		private function init():void{
			_bg.x = Data.instance().stage_width/2;
			_bg.y = Data.instance().stage_height/2;
			addChild(_bg);
			
			_logo.x = Data.instance().stage_width/2 - _logo.width/2;
			_logo.y = Data.instance().stage_height/2 - _logo.height;
			addChild(_logo);
			
			_loader.x = Data.instance().stage_width/2  + 80;
			_loader.y = Data.instance().stage_height/2 + 50;
			addChild(_loader);
			
			_text.x  = Data.instance().stage_width/2 - 120;
			_text.y =  Data.instance().stage_height/2 + 50;
			addChild(_text);
		}
	}
}