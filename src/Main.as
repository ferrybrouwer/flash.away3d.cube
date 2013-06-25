package {
	import main.views.ViewRectangle;
	import away3d.cameras.TargetCamera3D;
	import away3d.core.math.Number3D;

	import main.Model;
	import main.View;
	import main.utils.engine3D.Engine3D;
	import main.utils.engine3D.Viewport;

	import flash.display.Sprite;
	
 
 
	public class Main extends Sprite {
		private var view:View;
		private var model:Model;
		
		public function Main() {
			init3dSetting();			
			
			// show debug grid
			model.engine.showGrid(100, 10, true);
			
			// show axis
			model.engine.showAxis(50, true);

			// now we add a second view, for instance a top view for debugging
			model.engine.addView("topView", model.stage.stageWidth/2, model.stage.stageHeight/2, 0, 0, null, Viewport.VIEW_TOP, true);	
			
			// render all views once (now we've only added two view; 'camView' + 'topView')
			model.engine.renderOnce();
			
			
			// create view (in this example we will create a cube, and give it some materials)
			view = new ViewRectangle(model);
			addChild(view);
		}
		
		private function init3dSetting():void {
			/**
			 * NOTE: 	this engine3D creates a single scene, where multiple views can 
			 * 			be added with the 'addView' method.
			 */
			 
			// create model
			this.model = new Model();
			model.stage = stage;
			
			// create engine and add to stage
			model.engine = new Engine3D();
			addChild(model.engine);
			
			// add light
			model.engine.addLight(.3, .3, .3, new Number3D(90109, -100099, 99999), 1.4);
			
			// add standard view of the 3d scene
			model.camView = "camera1";
			
			// set (target) camera
			model.getCamView().camera = new TargetCamera3D( { focus:100, zoom:7.5} );
			
			// zoom the camera out
			var cam:TargetCamera3D = model.getCamView().camera as TargetCamera3D;
			cam.z = -200;
		}
	}
}
