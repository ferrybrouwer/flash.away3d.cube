package main.utils.engine3D {
	import away3d.cameras.Camera3D;
	import away3d.core.math.Number3D;
	import flash.display.Stage;
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;
	
	public class CamDebugger extends EventDispatcher{
		private var camera:Camera3D;
		private var engine:Engine3D;
		private var rotation:Object;
		
		public function CamDebugger(stage:Stage, engine:Engine3D, camera:Camera3D) {
			this.camera = camera;
			this.engine = engine;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			rotation = {
				z: new Number3D(1, 0, 0),
				x: new Number3D(1, 1, 1),
				y: new Number3D(0, 0, 1)
			};
		}
		
		private function keyDown(e:KeyboardEvent):void {
			switch (e.keyCode) {
				case 49:	camera.moveUp(50);				trace(camera.viewMatrix);	engine.renderOnce();	break;
				case 50:	camera.moveDown(50);			trace(camera.viewMatrix);	engine.renderOnce();	break;
				case 51:	camera.moveLeft(50);			trace(camera.viewMatrix);	engine.renderOnce();	break;
				case 52:	camera.moveRight(50);			trace(camera.viewMatrix);	engine.renderOnce();	break;
				case 53:	camera.moveForward(50);			trace(camera.viewMatrix);	engine.renderOnce();	break;
				case 54:	camera.moveBackward(50);		trace(camera.viewMatrix);	engine.renderOnce();	break;
				case 55:	camera.rotate(rotation.z, 10);	trace(camera.viewMatrix);	engine.renderOnce();	break;
				case 56:	camera.rotate(rotation.x, 10);	trace(camera.viewMatrix);	engine.renderOnce();	break;
				case 57:	camera.rotate(rotation.y, 10);	trace(camera.viewMatrix);	engine.renderOnce();	break;
			}
		}
		
	}

}