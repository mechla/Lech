package data
{
	public class Data
	{
		private static var _instance:Data =  new Data();
		
		private var _stage_width:Number = 320;
		private var _stage_height:Number  = 800;;
		
		private var _menu_height:Number = 110;
		
		private var _menu:Array = new Array();
		
		private var _mobile:Boolean = false;
		private var _iOS:Boolean;
		private var _iPhone:Boolean;
		private var _tablet:Boolean;
		
		private var _news_limit:int = 8;
		private var _gallery_limit:int = 2;
		
		private var _gallery_current_page:int =1;
		private var _news_current_page:int = 1;
		
		public function Data()
		{
			setMenu();
		}

		public function get menu_height():Number
		{
			return _menu_height;
		}

		private function setMenu():void{
			_menu.push(["NEWS","News", new News()]);
			_menu.push(["GALERIE","Gallery", new Gallery()]);
			_menu.push(["LECH TV","LechTv", new LechTv()]);
			_menu.push(["BILETY","Tickets",new Tickets()]);
			_menu.push(["WYNIKI","Scores", new Scores()]);
			_menu.push(["DRUŻYNY","Teams", new Teams()]);
		}

		public function get menu():Array
		{
			return _menu;
		}

		public function get stage_height():Number
		{
			return _stage_height;
		}

		public function set stage_height(value:Number):void
		{
			_stage_height = value;
		}

		public function get stage_width():Number
		{
			return _stage_width;
		}

		public function set stage_width(value:Number):void
		{
			_stage_width = value;
		}

		public static function instance():Data
		{
			return _instance;
		}
		public function get news_current_page():int
		{
			return _news_current_page;
		}
		
		public function set news_current_page(value:int):void
		{
			_news_current_page = value;
		}
		
		public function get news_limit():int
		{
			return _news_limit;
		}
		
		public function set news_limit(value:int):void
		{
			_news_limit = value;
		}
		
		public function get gallery_limit():int
		{
			return _gallery_limit;
		}
		
		public function set gallery_limit(value:int):void
		{
			_gallery_limit = value;
		}
		public function get gallery_current_page():int
		{
			return _gallery_current_page;
		}
		
		public function set gallery_current_page(value:int):void
		{
			_gallery_current_page = value;
		}

		public function get mobile():Boolean
		{
			return _mobile;
		}


	}
}