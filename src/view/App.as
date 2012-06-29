package view
{
	import communication.Comunication;
	
	import flash.display.Sprite;
	
	import model.Model;
	
	import view.menu.Menu;
	import view.pages.PagesView;
	import view.pages.gallery.PhotoView;
	
	public class App extends Sprite
	{
		private static var _instance:App  = new App();
		private var _model:Model =  new Model();
		private var _page_container:PagesView;


		private var _communication:Comunication  = new Comunication();
		public function App() 
		{
		}
		public function init():void{

			_page_container =  new PagesView(this,true);
			_page_container.init();

//			_communication.getNews();
//			_communication.getGallery();
//
		}
		public static function instance():App
		{
			return _instance;
		}


		public function get model():Model
		{
			return _model;
		}

		public function set model(value:Model):void
		{
			_model = value;
		}

		public function get communication():Comunication
		{
			return _communication;
		}

		public function set communication(value:Comunication):void
		{
			_communication = value;
		}

		public function get page_container():PagesView
		{
			return _page_container;
		}

	
	}
}