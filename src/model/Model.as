package model
{
	import model.gallery.GalleryCollection;
	import model.news.NewsCollection;
	import model.scores.ScoresCollection;

	public class Model
	{
		private var _news:NewsCollection =  new NewsCollection();
		private var _galleries:GalleryCollection =  new GalleryCollection();
		private var _scores_collection:ScoresCollection =  new ScoresCollection();
		
		public function Model()
		{
		}

		public function get galleries():GalleryCollection
		{
			return _galleries;
		}

		public function set galleries(value:GalleryCollection):void
		{
			_galleries = value;
		}

		public function get news():NewsCollection
		{
			return _news;
		}
		public function set news(value:NewsCollection):void
		{
			_news = value;
		}

		public function get scores_collection():ScoresCollection
		{
			return _scores_collection;
		}

		public function set scores_collection(value:ScoresCollection):void
		{
			_scores_collection = value;
		}


	}
}