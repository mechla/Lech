package view.menu
{
	import data.Data;
	
	import flash.display.DisplayObjectContainer;
	import flash.text.TextFieldAutoSize;
	
	import view.assets.Button;
	import view.assets.ShowObject;
	import view.assets.TextFieldLech;
	
	public class Menu extends ShowObject
	{
		private var _page_title:TextFieldLech = new TextFieldLech(15);
		private var _menu_height:Number = 80;
		private var _menu_buttons:Array =  new Array();
		public function Menu(pClip:DisplayObjectContainer, canShow:Boolean=false)
		{
			super(pClip, canShow);
		}
		public function init():void{
			for(var i:int = 0 ; i<Data.instance().menu.length;i++){
				var button:MenuButton =  new MenuButton(this,true);
				_menu_buttons.push(button);
				button.init(i);
				button.x = i * Data.instance().stage_width/Data.instance().menu.length;
				
			}
			_page_title.y = _menu_height;
			addChild(_page_title);
			updatePagetitle(Data.instance().menu[0][0]);
			
		}
		public function setMenuButtonsInactive():void{
			for each(var b:MenuButton in _menu_buttons){
				b.setInactive();
			}
			
		}
		public function updatePagetitle(title:String = ""):void{
			_page_title.text = title;
		}
	}
}