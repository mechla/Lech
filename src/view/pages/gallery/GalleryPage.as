package view.pages.gallery
{
	import data.Data;
	
	import flash.display.DisplayObjectContainer;
	
	import model.gallery.GalleryCollection;
	
	import view.App;
	import view.pages.ScrollPage;
	import view.pages.PaginationPage;
	
	
	public class GalleryPage extends PaginationPage
	{
		public function GalleryPage(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			_limit = Data.instance().gallery_limit;
			_list_height = 130;
			super(pClip, canShow);
		}
		override public function setContent():void{
			
		}
		override protected function addNewItem(i:int):void{
			var small_gallery:GalleryListview =  new GalleryListview(_content,true);
			small_gallery.update(App.instance().model.galleries.galleries[i]);
			small_gallery.y = 130 *i;
			_list_array.push(small_gallery);
		}
		override protected function getNewPost():void{
			App.instance().communication.listGallery(_added_pages+1);
		}
	}
}