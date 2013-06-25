package main {
	import away3d.containers.View3D;

	import main.utils.engine3D.Engine3D;

	import flash.display.Stage;
	
	/**
	 * Model controller
	 * @author Ferry Brouwer
	 */
	public class Model {
		private var _stage:Stage;
		private var _engine:Engine3D;
		private var _camView:String;
		
		public function Model() {}
		
		/**
		 * Set stage
		 */
		public function set stage(stage:Stage):void {
			_stage = stage;
		}
		
		/**
		 * Get Stage
		 */
		public function get stage():Stage {
			return _stage;
		}
		
		/**
		 * Set default camView by name
		 */
		public function set camView(name:String):void {
			_camView = name;
			_engine.addView(name, _stage.stageWidth, _stage.stageHeight, 0, 0);
		}
		
		/**
		 * Get default camView
		 */
		public function getCamView():View3D {
			return _engine.getViewByName(_camView).view;
		}
		
		/**
		 * Set engine instance
		 */
		public function set engine(instance:Engine3D):void {
			_engine = instance;
		}
		
		/**
		 * Get engine instance
		 */
		public function get engine():Engine3D {
			return _engine;
		}
		
	}

}