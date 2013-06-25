package main.utils.engine3D {
	import away3d.containers.View3D;

	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * Renders the viewport (timer)
	 * @author Ferry Brouwer
	 */
	public class RenderViewport extends Sprite {
		private var _viewports:Array;
		
		public function RenderViewport() {
			_viewports = new Array();
		}
		
		/**
		 * Update viewport timer
		 */
		private function onTimer(e:Event):void {
			for (var i:int = 0; i < _viewports.length; i++) 
				_viewports[i].render();
		}
		
		/**
		 * Render single time
		 */
		public function renderOnce():void {
			for (var i:int = 0; i < _viewports.length; i++) 
				_viewports[i].render();
		}
		
		/**
		 * Start rendering viewport
		 */
		public function start():void {
			this.addEventListener(Event.ENTER_FRAME, onTimer);
		}
		
		/**
		 * Stop rendering viewport
		 */
		public function stop():void {
			this.removeEventListener(Event.ENTER_FRAME, onTimer);
		}
		
		/**
		 * Add view for updating
		 * @param	view
		 */
		public function addView(view:View3D):void {
			_viewports.push(view);
		}
	}

}