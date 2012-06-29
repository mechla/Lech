package view.pages.gallery
{
	import data.Data;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.text.AntiAliasType;
	
	import model.gallery.GalleryModel;
	
	import view.assets.TextFieldLech;
	import view.pages.ScrollPage;
	
	public class GalleryView extends ScrollPage
	{
		protected var _title:TextFieldLech =  new TextFieldLech();
		protected var _date:TextFieldLech =  new TextFieldLech();
		protected var _gallery_model:GalleryModel;
		protected var _gallery_thumbs:Sprite =  new Sprite();
		
		
		public function GalleryView(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			super(pClip, canShow);
			addObjects();
		}
		private function addObjects():void{
			_title.x = 5
			_title.y = 0;
			_title.wordWrap =  true;
			_title.width = Data.instance().stage_width - 10;
			_title.height = 100;
			_title.antiAliasType = AntiAliasType.ADVANCED;
			add(_title);
			
			_date.x = 5;
			_date.wordWrap =  true;
			_date.width = Data.instance().stage_width - 10;
			_date.antiAliasType = AntiAliasType.ADVANCED;
			//			addChild(_date);
			add(_gallery_thumbs);
			
		}
		public function update(gallery:GalleryModel):void{
			while (_gallery_thumbs.numChildren >0)
				_gallery_thumbs.removeChildAt(0);
			_gallery_model =  gallery;
			_title.htmlText = gallery.title;
			_date.htmlText = gallery.date;
			var pictures:int;
				pictures = gallery.photos.length
		
			var row:int = 0;
			for(var i:int = 0; i<pictures;i++){
				if(gallery.photos[i]){
						row = Math.floor(i/4);
						var gallery_thumb:GalleryThumb  = new GalleryThumb(gallery,i,true);
						gallery_thumb.x = 10 + (i%4) * 110;
						gallery_thumb.y  = row * 110 +25;
						_gallery_thumbs.addChild(gallery_thumb);
				}
			}
			super.setScroller();
		}
	}
}