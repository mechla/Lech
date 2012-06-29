package model.news
{
	import model.BaseModel;

	public class NewsModel extends BaseModel
	{
		
		private var _title:String;
		private var _date:String;
		private var _author:String;
		private var _short:String;
		private var _full:String;
		private var _thumb:String;
		private var _photo:String;
		
		public function NewsModel()
		{
			super();
		}

		public function get photo():String
		{
			return _photo;
		}

		public function set photo(value:String):void
		{
			_photo = value;
		}

		public function get thumb():String
		{
			return _thumb;
		}

		public function set thumb(value:String):void
		{
			_thumb = value;
		}

		public function get full():String
		{
			return _full;
		}

		public function set full(value:String):void
		{
			_full = value;
		}

		public function get short():String
		{
			return _short;
		}

		public function set short(value:String):void
		{
			_short = value;
		}

		public function get author():String
		{
			return _author;
		}

		public function set author(value:String):void
		{
			_author = value;
		}

		public function get date():String
		{
			return _date;
		}

		public function set date(value:String):void
		{
			_date = value;
		}

		public function get title():String
		{
			return _title;
		}

		public function set title(value:String):void
		{
			_title = value;
		}

	}
}