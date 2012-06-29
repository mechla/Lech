package model.gallery
{
	import model.BaseModel;

	public class GalleryModel extends BaseModel
	{
		private var _title:String;
		private var _date:String;
		private var _photos:Array =  new Array();
		public function GalleryModel()
		{
		}
		public function update(o:Object):void{
			this._title = o.title;
			this._date = o.date;
			for( var i:int = 0;i<o.photos.length;i++){
				var photo:GalleryPhotoModel =  new GalleryPhotoModel();
				photo.photo = o.photos[i];
				photo.thumb = o.thumbs[i];
				_photos.push(photo);
			}
		}
		public function get photos():Array
		{
			return _photos;
		}
		
		public function set photos(value:Array):void
		{
			_photos = value;
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