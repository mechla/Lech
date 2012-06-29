package view.pages.gallery
{
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.ImageLoader;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	
	import model.gallery.GalleryModel;
	import model.gallery.GalleryPhotoModel;
	
	import view.App;
	import view.assets.PictureLoader;
	
	public class GalleryThumb extends Sprite
	{
		private var _gallery_model:GalleryModel;
		private var _photo_model:GalleryPhotoModel;
		private var _photo_index:int;
		private var _full:Boolean;
		public function GalleryThumb(gallery_model:GalleryModel,photo_index:int,full:Boolean)
		{
			super();
			_full = full;
			_gallery_model =  gallery_model;
			_photo_index =  photo_index;
			_photo_model = _gallery_model.photos[photo_index]
			if(full)
				_photo_model.getThumb(addThumb);
			else
				_photo_model.getThumbFull(addThumb);
		}
		private function addThumb(thumb:Sprite):void{
			addChild(thumb);
			if(_full){
				this.addEventListener(MouseEvent.CLICK, showPhoto);
				this.addEventListener(TouchEvent.TOUCH_TAP, showPhoto);
			}
		}
		private function showPhoto(e:*):void{
			App.instance().page_container.showBlock();
			App.instance().page_container.showGalleryPhoto(_gallery_model,_photo_index);
			
		}
	}
}
