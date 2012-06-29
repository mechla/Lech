package view.assets{
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	
	import flash.display.Sprite;
	import flash.events.TouchEvent;
	
	public class PictureLoader extends Sprite
	{
		protected var _loader:LoaderMax =  new LoaderMax({name:"loader",onComplete:completeHandler});
		public function PictureLoader()
		{
			super();
		}
		public  function setUrl(url:String):void{
			var pict_loader:ImageLoader =  new ImageLoader(url,{name:"picture"});
			_loader.append(pict_loader);
			_loader.load();
		}
		protected function completeHandler(e:LoaderEvent):void{
			var picture:Sprite = _loader.getContent("picture");
			addChild(picture);
//			if(_big_url !=null){
//				this.addEventListener(TouchEvent.TOUCH_TAP,showBigPicture);
//				
//			}
			
		}

	}
}