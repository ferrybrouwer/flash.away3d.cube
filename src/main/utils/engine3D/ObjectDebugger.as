package main.utils.engine3D {
	import away3d.core.base.Object3D;

	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	
	public class ObjectDebugger {
		private var object:Object3D;
		private var engine:Engine3D;
		
		public function ObjectDebugger(stage:Stage, engine:Engine3D, object:Object3D) {
			this.object = object;
			this.engine = engine;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		}
		
		private function keyDown(e:KeyboardEvent):void {
			switch (e.keyCode) {
				case 65:	object.x -= 10;			break;
				case 83:	object.y -= 10;			break;
				case 68:	object.x += 10;			break;
				case 87:	object.y += 10;			break;
				case 81:	object.z -= 10;			break;
				case 69:	object.z += 10;			break;
				case 90: 	object.rotationX += 10; break;
				case 88: 	object.rotationY += 10;	break;
				case 67:	object.rotationZ += 10; break;
			}
			
			if (e.keyCode == 65 || e.keyCode == 83 || e.keyCode == 68 || e.keyCode == 87 || e.keyCode == 81 || e.keyCode == 69 || e.keyCode == 90 || e.keyCode == 88 || e.keyCode == 67) {
				engine.renderOnce();
				trace("Object position => x:" + object.x + ", y:" + object.y + ", z:" + object.z + ", rotX: " + object.rotationX + ", rotY: " + object.rotationY + ", rotZ: " + object.rotationZ);
			}
		}
		
	}

}