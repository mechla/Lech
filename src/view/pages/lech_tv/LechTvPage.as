package view.pages.lech_tv
{
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	
	import view.App;
	import view.StageVideoLech;
	import view.pages.ScrollPage;
	
	
	public class LechTvPage extends ScrollPage
	{
		private var _play_button:play_video =  new play_video();
		
		public function LechTvPage(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			super(pClip, canShow);
			setContent();
		}
		override public function setContent():void{
			_play_button.x = 100;
			_play_button.y = 200;
			super.add(_play_button)
			_play_button.addEventListener(TouchEvent.TOUCH_TAP, playVideo);
			_play_button.addEventListener(MouseEvent.CLICK,playVideo);
			super.setContent();
		}
		private function playVideo(...args):void{
			App.instance().page_container.video.playVideo();
		}
	}
}