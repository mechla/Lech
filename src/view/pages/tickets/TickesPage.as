package view.pages.tickets
{
	import data.Data;
	
	import flash.display.DisplayObjectContainer;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import view.pages.ScrollPage;
	
	
	public class TickesPage extends ScrollPage
	{
		private var _club_card:karta_kibica = new karta_kibica();
		private var _buy_carnet:kup_karnet =  new kup_karnet();
		private var _buy_ticket:kup_bilet =  new kup_bilet();
		public function TickesPage(pClip:DisplayObjectContainer, canShow:Boolean=true)
		{
			super(pClip, canShow);
			addButtons();
		}
		private function addButtons():void{
			_club_card.x = Data.instance().stage_width/2 - _club_card.width/2;
			_buy_carnet.x = Data.instance().stage_width/2 - _club_card.width/2;
			_buy_ticket.x = Data.instance().stage_width/2 - _club_card.width/2;
			
			_club_card.y = 100;
			_buy_carnet.y = 200;
			_buy_ticket.y = 300;
			
			add(_club_card);
			add(_buy_carnet);
			add(_buy_ticket);
			
			addEvent(_club_card,goToClubCard);
			addEvent(_buy_carnet,goToBuyCarnet);
			addEvent(_buy_ticket,goToBuyTickets);
		}
		private function goToClubCard(e:*):void{
			navigateToURL(new URLRequest("http://www.lechpoznan.pl/"));
		}
		private function goToBuyTickets(e:*):void{
			navigateToURL(new URLRequest("http://www.lechpoznan.pl/"));
			
		}
		private function goToBuyCarnet(e:*):void{
			navigateToURL(new URLRequest("http://www.lechpoznan.pl/"));
			
		}
	}
}