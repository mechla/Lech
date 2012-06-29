package view.pages
{
	import com.doitflash.consts.Easing;
	import com.doitflash.consts.Orientation;
	import com.doitflash.consts.ScrollConst;
	import com.doitflash.events.ScrollEvent;
	import com.doitflash.utils.scroll.TouchScroll;
	
	import data.Data;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	import view.assets.ShowObject;
	
	public class ScrollPage extends ShowObject
	{
		protected var _content:Sprite =  new Sprite();
		protected var _page_height:Number;
		
		private var _scroller:TouchScroll;
		
		public function ScrollPage(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			super(pClip, canShow);
			addChild(_content);
			this.y = Data.instance().menu_height;
			_page_height = Data.instance().stage_height - Data.instance().menu_height;
		}
		public function setScroller():void
		{
			_scroller =  new TouchScroll();
			_scroller.maskContent = _content;
			_scroller.enableVirtualBg = true;
			_scroller.mouseWheelSpeed = 5;
			
			_scroller.orientation = Orientation.VERTICAL; // accepted values: Orientation.AUTO, Orientation.VERTICAL, Orientation.HORIZONTAL
			_scroller.easeType = Easing.Strong_easeOut;
			_scroller.scrollSpace = 0;
			_scroller.aniInterval = 1;
			_scroller.blurEffect = false;
			_scroller.lessBlurSpeed = 25;
			_scroller.yPerc = 25; // min value is 0, max value is 100
			_scroller.xPerc = 0; // min value is 0, max value is 100
			_scroller.mouseWheelSpeed = 10;
			_scroller.isMouseScroll = false;
			_scroller.isTouchScroll = true;
			_scroller.bitmapMode = ScrollConst.NORMAL;
			_scroller.isStickTouch = false;
			_scroller.holdArea = 7;
			_scroller.maskWidth = this.width;
			_scroller.maskHeight = Data.instance().stage_height-1
			
			this.addChild(_scroller);
			onResize();
			_scroller.addEventListener(ScrollEvent.UP_REFRESH, getNewData);
		}
		private function getNewData(e:ScrollEvent):void{
		}
		public function setScrollHeight(height:Number):void{
			if (_scroller)
				_scroller.maskHeight = height;
		}
		
		public function onResize(e:*=null):void 
		{
			if (_scroller)
			{
				_scroller.maskWidth = Data.instance().stage_width;
				_scroller.maskHeight = _page_height;
				_scroller.x = 0;
				_scroller.y = 0;
			}
		}
		public function setContent():void{
			//to override
			setScroller();
		}
		public function add(obj:DisplayObject):void{
			_content.addChild(obj);
		}
		override public function show(...args):void{
			addMe();
		}
		override public function hide(...params):void{
			removeMe();
		}
	}
}