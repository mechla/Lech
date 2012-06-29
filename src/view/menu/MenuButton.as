package view.menu
{
	import data.Data;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	
	import view.App;
	import view.assets.ShowObject;
	import view.assets.TextFieldLech;
	
	public class MenuButton extends ShowObject
	{
		private var _name:TextFieldLech =  new TextFieldLech(13,0x00A7F8);
		private var _page_id:int;
		private var _menu_picture:Sprite;
		private var _width:Number = Data.instance().stage_width/Data.instance().menu.length;;
		public function MenuButton(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			super(pClip, canShow);
		}
		public function init(id:int):void{
			_page_id = id;
			
			_name.text = Data.instance().menu[id][0];
			_name.y = 70;
			_name.x = _width/2 - _name.textWidth/2;
			addChild(_name);
			
			_menu_picture =  Data.instance().menu[id][2];
			_menu_picture.x = _width/2 - _menu_picture.width/2;
			_menu_picture.y = 35 - _menu_picture.height/2;
			addChild(_menu_picture);
				
			this.addEventListener(TouchEvent.TOUCH_END,goToPage);
			this.addEventListener(MouseEvent.CLICK,goToPage);
		}
		private function goToPage(...args):void{
			App.instance().page_container.showBlock();
			App.instance().page_container.menu.setMenuButtonsInactive();
			App.instance().page_container.goToPage(_page_id);
			setActive();
		}
		public function resize():void{
			
		}
		public function setActive():void{
			this.alpha = .6;
		}
		public function setInactive():void{
			this.alpha = 1;
		}
	}
}