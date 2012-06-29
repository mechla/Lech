package model.gallery
{
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	
	import flash.display.Sprite;
	import flash.system.ImageDecodingPolicy;
	
	
	public class GalleryPhotoModel
	{
		private var _photo:String;
		private var _thumb:String;
		private var _thumb_full:String;
		
		private var _photo_sprite:Sprite;
		private var _thumb_sprite:Sprite;
		private var _thumb_sprite_full:Sprite;
		
		private var _thumb_callback:Function;
		private var _thumb_full_callback:Function;
		private var _photo_callback:Function;
		
		protected var _loader_thumb:LoaderMax =  new LoaderMax({name:"thumb",onComplete:completeThumb});
		protected var _loader_thumb_full:LoaderMax =  new LoaderMax({name:"thumb_full",onComplete:completeThumbFull});
		protected var _loader_photo:LoaderMax =  new LoaderMax({name:"photo",onComplete:completePhoto});
		
		public function GalleryPhotoModel()
		{
		}
		public function getThumb(thumb_callback:Function):void{
			if(!_thumb_sprite){
				_thumb_callback =  thumb_callback;
				_loader_thumb.load();
			}
			else{
				thumb_callback(_thumb_sprite);
			}
		}
		public function getThumbFull(thumb_callback:Function):void{
			if(!_thumb_sprite_full){
				_thumb_full_callback =  thumb_callback;
				_loader_thumb_full.load();
			}
			else{
				thumb_callback(_thumb_sprite_full);
			}
		}
		
		public function getPhoto(photo_callback:Function):void{
			if(!_photo_sprite){
				_photo_callback = photo_callback;
				_loader_photo.load();
			}
			else{
				photo_callback(_photo_sprite);
			}
		}
		public function pauseIhumb():void{
			_loader_thumb.pause();
		}
		public function pausePhoto():void{
			_loader_photo.pause();
		}
		
		protected function completeThumb(e:LoaderEvent):void{
			_thumb_sprite =  _loader_thumb.getContent("thumb")
			_thumb_callback(_thumb_sprite);
		}
		
		protected function completeThumbFull(e:LoaderEvent):void{
			_thumb_sprite_full =  _loader_thumb_full.getContent("thumb_full")
			_thumb_full_callback(_thumb_sprite_full);
		}
		
		protected function completePhoto(e:LoaderEvent):void{
			_photo_sprite = _loader_photo.getContent("photo");
			_photo_callback(_photo_sprite);
		}
		
		public function get thumb():String
		{
			return _thumb;
		}
		
		public function set thumb(value:String):void
		{
			_thumb = value;
			var thumb:ImageLoader =  new ImageLoader(_thumb,{name:"thumb"});
			_loader_thumb.append(thumb);
			var thumb_full:ImageLoader =  new ImageLoader(_thumb,{name:"thumb_full"});
			_loader_thumb_full.append(thumb_full);
		}
		public function get photo():String
		{
			return _photo;
		}
		
		public function set photo(value:String):void
		{
			_photo = value;
			var photo:ImageLoader =  new ImageLoader(_photo,{name:"photo"});
			_loader_photo.append(photo);
		}
		
	}
}