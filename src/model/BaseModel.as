package model
{
	public class BaseModel extends Object
	{
		private var _id:String;
		public function BaseModel()
		{
		}

		public function get id():String
		{
			return _id;
		}

		public function set id(value:String):void
		{
			_id = value;
		}

	}
}