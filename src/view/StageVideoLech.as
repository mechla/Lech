package view
{
	import data.Data;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageOrientation;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.NetStatusEvent;
	import flash.events.StageVideoAvailabilityEvent;
	import flash.events.StageVideoEvent;
	import flash.events.VideoEvent;
	import flash.geom.Rectangle;
	import flash.media.StageVideo;
	import flash.media.StageVideoAvailability;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	
	/**
	 * 
	 * @author Thibault Imbert
	 * 
	 */	
	[SWF(frameRate="1", backgroundColor="#000000")]
	public class StageVideoLech extends Sprite
	{
		private static const FILE_NAME:String = "http://lechtv.hti.pl/vod/video/01939395-195d-4aea-a5a2-26b35e85b653/lechtv-SilverlightH264ProgressiveDownload.mp4";
		private static const INTERVAL:Number = 500;
		private static const BORDER:Number = 20;
		
		private var legend:TextField = new TextField();
		private var sv:StageVideo;
		private var nc:NetConnection;
		private var ns:NetStream;
		private var rc:Rectangle;
		private var video:Video;
		private var thumb:Shape;
		private var interactiveThumb:Sprite;
		private var totalTime:Number;
		
		private var videoWidth:int;
		private var videoHeight:int;
		private var outputBuffer:String = new String();
		private var rect:Rectangle = new Rectangle(0, 0, 0, BORDER);
		private var videoRect:Rectangle = new Rectangle(0, 0, 0, 0);
		private var gotStage:Boolean;
		private var stageVideoInUse:Boolean;
		private var classicVideoInUse:Boolean;
		private var accelerationType:String;
		private var infos:String = new String();
		private var available:Boolean;
		private var inited:Boolean;
		private var played:Boolean;
		private var container:Sprite;
		
		private var _bg:Sprite =  new Sprite();
		
		private var _is_on:Boolean = false;
		
		/**
		 * 
		 * 
		 */		
		public function StageVideoLech()
		{
			// Make sure the app is visible and stage available
//			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createBg();
		}
		private function onPlayStatus(...args):void{
		}
		private function createBg():void{
			_bg.graphics.beginFill(0x000000,1);
			_bg.graphics.drawRect(0,0,Data.instance().stage_height,Data.instance().stage_height);
			_bg.graphics.endFill();
			
		}
		public function get is_on():Boolean
		{
			return _is_on;
		}

		/**
		 * 
		 * @param event
		 * 
		 */	
		public function stopPlayVideo():void{
			stage.setOrientation(StageOrientation.DEFAULT);
		}
		public function playVideo(url:String = FILE_NAME):void
		{   addChild(_bg);
			_is_on =  true;
			// Scaling
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			// Debug infos
			legend.multiline = true;
			legend.background = true;
			legend.backgroundColor = 0xFFFFFFFF;
//			addChild(legend);                ///
			
			// Thumb seek Bar
			thumb = new Shape();
			
			interactiveThumb = new Sprite();
			interactiveThumb.addChild(thumb);
			addChild(interactiveThumb);
			
			// Connections
			nc = new NetConnection();
			nc.connect(null);
			ns = new NetStream(nc);
			ns.addEventListener(NetStatusEvent.NET_STATUS, onNetStatus);
			ns.client = this;
			
			// Screen
			video = new Video();
			video.smoothing = true;
			
			// Video Events
			// the StageVideoEvent.STAGE_VIDEO_STATE informs you if StageVideo is available or not
			stage.addEventListener(StageVideoAvailabilityEvent.STAGE_VIDEO_AVAILABILITY, onStageVideoState);
			// in case of fallback to Video, we listen to the VideoEvent.RENDER_STATE event to handle resize properly and know about the acceleration mode running
			video.addEventListener(VideoEvent.RENDER_STATE, videoStateChange);
			
			// Input Events
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(Event.RESIZE,  onResize);
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		/**
		 * 
		 * @param event
		 * 
		 */		
		private function onNetStatus(event:NetStatusEvent):void
		{
			if ( event.info == "NetStream.Play.StreamNotFound" )
				legend.text = "Video file passed, not available!";
		}
		
		/**
		 * 
		 * @param event
		 * 
		 */		
		private function onFrame(event:Event):void 
		{
			var ratio:Number = (ns.time / totalTime) * (stage.stageWidth - (BORDER << 1));
			rect.width = ratio;
			thumb.graphics.clear();
			thumb.graphics.beginFill(0xFFFFFF);
			thumb.graphics.drawRect(rect.x, rect.y, rect.width, rect.height);	
		}
		
		/**
		 * 
		 * @param event
		 * 
		 */		
		private function onClick(event:MouseEvent):void
		{
			if ( event.stageY >= interactiveThumb.y - BORDER && event.stageX <= stage.stageWidth - BORDER )
			{
				var seekTime:Number = (stage.mouseX - BORDER) * ( totalTime / (stage.stageWidth - (BORDER << 1) ) );
				ns.seek( seekTime );	
			}
		}
		
		/**
		 * 
		 * @param event
		 * 
		 */		
		private function onKeyDown(event:KeyboardEvent):void
		{	
			if ( event.keyCode == Keyboard.O )
			{
				if ( available )
					// We toggle the StageVideo on and off (fallback to Video and back to StageVideo)
					toggleStageVideo(inited=!inited);
				
			} else if ( event.keyCode == Keyboard.F )
			{
				stage.displayState = StageDisplayState.FULL_SCREEN;
			} else if ( event.keyCode == Keyboard.SPACE )
			{
				ns.togglePause();
			}
		}
		
		/**
		 * 
		 * @param width
		 * @param height
		 * @return 
		 * 
		 */		
		private function getVideoRect(width:uint, height:uint):Rectangle
		{	
			var videoWidth:uint = width;
			var videoHeight:uint = height;
			var scaling:Number = Math.min ( stage.stageWidth / videoWidth, stage.stageHeight / videoHeight );
			
			videoWidth *= scaling, videoHeight *= scaling;
			
			var posX:uint = stage.stageWidth - videoWidth >> 1;
			var posY:uint = stage.stageHeight - videoHeight >> 1;
			
			videoRect.x = posX;
			videoRect.y = posY;
			videoRect.width = videoWidth;
			videoRect.height = videoHeight;
			
			return videoRect;
		}
		
		/**
		 * 
		 * 
		 */		
		private function resize ():void
		{	
			if ( stageVideoInUse )
			{
				// Get the Viewport viewable rectangle
				rc = getVideoRect(sv.videoWidth, sv.videoHeight);
				// set the StageVideo size using the viewPort property
				sv.viewPort = rc;
			} else 
			{
				// Get the Viewport viewable rectangle
				rc = getVideoRect(video.videoWidth, video.videoHeight);
				// Set the Video object size
				video.width = rc.width;
				video.height = rc.height;
				video.x = rc.x, video.y = rc.y;
			}
			
			interactiveThumb.x = BORDER, interactiveThumb.y = stage.stageHeight - (BORDER << 1);
			legend.text = infos;
		}
		
		/**
		 * 
		 * @param evt
		 * 
		 */		
		public function onMetaData ( evt:Object ):void
		{
			totalTime = evt.duration;
			stage.addEventListener(Event.ENTER_FRAME, onFrame);
		}
		
		/**
		 * 
		 * @param event
		 * 
		 */		
		private function onStageVideoState(event:StageVideoAvailabilityEvent):void
		{	
			// Detect if StageVideo is available and decide what to do in toggleStageVideo
			toggleStageVideo(available = inited = (event.availability == StageVideoAvailability.AVAILABLE));
		}
		
		/**
		 * 
		 * @param on
		 * 
		 */		
		private function toggleStageVideo(on:Boolean):void
		{	
			infos = "StageVideo Running (Direct path) : " + on + "\n";
			
			// If we choose StageVideo we attach the NetStream to StageVideo
			if (on) 
			{
				stageVideoInUse = true;
				if ( sv == null )
				{
					sv = stage.stageVideos[0];
					sv.addEventListener(StageVideoEvent.RENDER_STATE, stageVideoStateChange);
				}
				sv.attachNetStream(ns);
				if (classicVideoInUse)
				{
					// If we use StageVideo, we just remove from the display list the Video object to avoid covering the StageVideo object (always in the background)
					stage.removeChild ( video );
					classicVideoInUse = false;
				}
			} else 
			{
				// Otherwise we attach it to a Video object
				if (stageVideoInUse)
					stageVideoInUse = false;
				classicVideoInUse = true;
				video.attachNetStream(ns);
//				stage.addChildAt(video, 0);
				stage.addChild(video);
			}
			
			if ( !played ) 
			{
				played = true;
				ns.play(FILE_NAME);
			}
		} 
		
		/**
		 * 
		 * @param event
		 * 
		 */		
		private function onResize(event:Event):void
		{
			resize();		
		}
		
		/**
		 * 
		 * @param event
		 * 
		 */		
		private function stageVideoStateChange(event:StageVideoEvent):void
		{	
//			trace(event.status);
			infos += "StageVideoEvent received\n";
			infos += "Render State : " + event.status + "\n";
			resize();
		}
		
		/**
		 * 
		 * @param event
		 * 
		 */		
		private function videoStateChange(event:VideoEvent):void
		{	
//			trace(event.status);
			infos += "VideoEvent received\n";
			infos += "Render State : " + event.status + "\n";
			resize();
		}
	}
}