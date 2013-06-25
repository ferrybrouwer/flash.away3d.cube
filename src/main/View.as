package main {
	import away3d.cameras.Camera3D;

	import main.utils.engine3D.Engine3D;

	import flash.display.Sprite;
	import flash.display.Stage;
	
	/**
	 * General view class
	 * @author Ferry Brouwer
	 */
	public class View extends Sprite {
		public var model:Model;
		
		public function View(model:Model) {
			this.model = model;
		}
		
		/**
		 * Get stage instance
		 */
		public override function get stage():Stage {
			return model.stage;
		}
		
		/**
		 * Get engine
		 */
		 public function get engine():Engine3D {
		 	return model.engine;
		 }
		 
		 public function get camera():Camera3D {
		 	return model.getCamView().camera;
		 }
		
	}

}