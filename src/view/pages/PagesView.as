package view.pages
{
	import flash.display.DisplayObjectContainer;
	
	import model.gallery.GalleryModel;
	
	import view.App;
	import view.StageVideoLech;
	import view.pages.gallery.GalleryPage;
	import view.pages.gallery.GalleryView;
	import view.pages.gallery.PhotoView;
	import view.pages.lech_tv.LechTvPage;
	import view.pages.live_streem.LiveStreamPage;
	import view.pages.live_streem.LiveStreamTeamsPage;
	import view.pages.news.NewsPage;
	import view.pages.news.NewsView;
	import view.pages.scores.ScoresPage;
	import view.pages.team.PlayerView;
	import view.pages.team.TeamPage;
	import view.pages.tickets.TickesPage;
	
	public class PagesView extends PagesViewBase
	{
		private var _seed_loader:SeedLoaderPage;
		//MENU PAGES
		private var _news_menu:NewsPage;
		private var _gallery_menu:GalleryPage;
		private var _lech_tv_menu:LechTvPage;
		private var _tickets_menu:TickesPage;
		private var _scores_menu:ScoresPage;
		private var _team_menu:TeamPage;
		
		//SUB MENU PAGES
		private var _news_view:NewsView;
		private var _gallery_view:GalleryView;
		private var _player_view:PlayerView;

		//VIDEO and PHOTO
		private var _video:StageVideoLech =  new StageVideoLech();
		private var _photo:PhotoView;
		
		//LIVE STREAM PAGES
		private var _livestream_page:LiveStreamPage;
		private var _livestream_teams:LiveStreamTeamsPage;
		
		public function PagesView(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			super(pClip, canShow);
		}
		override public function init():void{
			
			_news_view =  new NewsView(_page_swipe_container,false);
			_gallery_view  = new GalleryView(_page_swipe_container,false);
			_player_view =  new PlayerView(_page_swipe_container,false);
			
			//MENU PAGES
			_news_menu =  new NewsPage(_page_swipe_container,true);
			_gallery_menu =  new GalleryPage(_page_swipe_container,false);
			_lech_tv_menu =  new LechTvPage(_page_swipe_container,false);
			_tickets_menu =  new TickesPage(_page_swipe_container,false);
			_scores_menu =  new ScoresPage(_page_swipe_container,false);
			_team_menu =  new TeamPage(_page_swipe_container,false);
			
			//LIVE STREAM
			_livestream_page =  new LiveStreamPage(_page_swipe_container,false);
			_livestream_teams =  new LiveStreamTeamsPage(_page_swipe_container,false);
			
			_pages_array.push(_news_menu)
			_pages_array.push(_gallery_menu);
			_pages_array.push(_lech_tv_menu);
			_pages_array.push(_tickets_menu);
			_pages_array.push(_scores_menu);
			_pages_array.push(_team_menu);
			
			_current_page = _news_menu;
			_pages_history.push(_news_menu);
			
			this.addChild(_video);
			_photo =  new PhotoView(this,false);
			
			super.init();
			
			 _seed_loader =  new SeedLoaderPage(this,true);
			
		}
		public function showPlayerView():void{
			_next_page = _player_view;
			_current_id = 7;
			changePages(true);
		}
		
		public function goToPageLiveTeams():void{
			_next_page = _livestream_teams;
			_current_id = 1.45;
			changePages(true);
		}
		public function showLiveStream():void{
			_next_page = _livestream_page;
			_current_id = 1.4;
			changePages(true);
		}
		public function showNewsView():void{
			_menu.updatePagetitle("NEWS VIEW");
			_next_page = _news_view;
			_current_id = 1.5;
			changePages(true);
		}
		public function showGalleryPhoto(gallery_model:GalleryModel,photo_index:int):void{
			_photo.update(gallery_model,photo_index);
			_photo.show();
			App.instance().page_container.hideBlock();
			
		}
		public function showGalleryView(gallery_model:GalleryModel):void{
			if(_current_id != 2.3){
				_menu.updatePagetitle("GALLERY VIEW");
				_next_page = _gallery_view;
				_current_id = 2.3;
				changePages(true);
			}
			else
				hideBlock()
		}
	
		public function get video():StageVideoLech
		{
			return _video;
		}
		
		public function set video(value:StageVideoLech):void
		{
			_video = value;
		}
		public function get gallery_view():GalleryView
		{
			return _gallery_view;
		}
		
		public function set gallery_view(value:GalleryView):void
		{
			_gallery_view = value;
		}
		
		public function get news_view():NewsView
		{
			return _news_view;
		}
		
		public function set news_view(value:NewsView):void
		{
			_news_view = value;
		}
		
		public function get scores():ScoresPage
		{
			return _scores_menu;
		}
		
		public function set scores(value:ScoresPage):void
		{
			_scores_menu = value;
		}
		
		public function get tickets():TickesPage
		{
			return _tickets_menu;
		}
		
		public function set tickets(value:TickesPage):void
		{
			_tickets_menu = value;
		}
		
		public function get lech_tv():LechTvPage
		{
			return _lech_tv_menu;
		}
		
		public function set lech_tv(value:LechTvPage):void
		{
			_lech_tv_menu = value;
		}
		
		public function get gallery():GalleryPage
		{
			return _gallery_menu;
		}
		
		public function set gallery(value:GalleryPage):void
		{
			_gallery_menu = value;
		}
		
		public function get news():NewsPage
		{
			return _news_menu;
		}
		
		public function set news(value:NewsPage):void
		{
			_news_menu = value;
		}

		public function get live_streem_page():LiveStreamPage
		{
			return _livestream_page;
		}

		public function set live_streem_page(value:LiveStreamPage):void
		{
			_livestream_page = value;
		}

		public function get livestream_teams():LiveStreamTeamsPage
		{
			return _livestream_teams;
		}

		public function set livestream_teams(value:LiveStreamTeamsPage):void
		{
			_livestream_teams = value;
		}

		public function get team_menu():TeamPage
		{
			return _team_menu;
		}

		public function set team_menu(value:TeamPage):void
		{
			_team_menu = value;
		}

		public function get player_view():PlayerView
		{
			return _player_view;
		}

		public function set player_view(value:PlayerView):void
		{
			_player_view = value;
		}

		public function get seed_loader():SeedLoaderPage
		{
			return _seed_loader;
		}

		public function set seed_loader(value:SeedLoaderPage):void
		{
			_seed_loader = value;
		}


	}
}