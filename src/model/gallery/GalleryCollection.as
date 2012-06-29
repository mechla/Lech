package model.gallery
{
	public class GalleryCollection
	{
		private var _galleries:Array =  new Array();
		private var _page:int = 0;
		public function GalleryCollection()
		{
			super();
		}
		public function pushGallery(o:Object):void{
			var gallery:GalleryModel =  new GalleryModel();
			gallery.update(o);
			_galleries.push(gallery);
		}
		public function get galleries():Array
		{
			return _galleries;
		}
		public function set galleries(value:Array):void
		{
			_galleries = value;
		}
		public function get page():int
		{
			return _page;
		}
		public function set page(value:int):void
		{
			_page = value;
		}
	}
}