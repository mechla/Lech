package view.pages.gallery
{
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	
	import model.gallery.GalleryModel;
	
	import view.App;
	
	public class GalleryListview extends GalleryView
	{
		public function GalleryListview(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			super(pClip, canShow);
		}
		override public function update(gallery:GalleryModel):void{
			_gallery_model =  gallery;
			_title.htmlText = gallery.title;
			_date.htmlText = gallery.date;
			var pictures:int;
			pictures  = 4;
			var row:int = 0;
			for(var i:int = 0; i<pictures;i++){
				if(gallery.photos[i]){
					var gallery_thumb:GalleryThumb  = new GalleryThumb(gallery,i,false);
					gallery_thumb.x = 10 + i * 110;
					gallery_thumb.y  = 25;
					_gallery_thumbs.addChild(gallery_thumb);
				}
			}
			this.addEventListener(TouchEvent.TOUCH_TAP, onGalleryTap);
			this.addEventListener(MouseEvent.CLICK, onGalleryTap);
			super.setScroller();
		}
		private function onGalleryTap(e:*):void{
			App.instance().page_container.showBlock();
			App.instance().page_container.gallery_view.update(_gallery_model);
			App.instance().page_container.showGalleryView(_gallery_model);
		}
	}
}