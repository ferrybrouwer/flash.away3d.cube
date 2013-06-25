package main.utils {
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	
	/**
	 * @author ferrybrouwer
	 */
	public class DisplayObjectDebugger {
		
		private var obj:DisplayObject;
		private var shiftState:Boolean;
	
		public function DisplayObjectDebugger(stage:Stage, obj:DisplayObject){
			this.obj = obj;		
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}

		private function onKeyUp(event : KeyboardEvent) : void {
			if (event.keyCode == 16) shiftState = false;			
		}

		private function onKeyDown(event : KeyboardEvent) : void {
			switch (event.keyCode){
				case 37: //left
					obj.x -= (shiftState) ? 10 : 1; 
				break;
				case 39: //right
					obj.x += (shiftState) ? 10 : 1;
				break;
				case 38: //up
					obj.y -= (shiftState) ? 10 : 1;
				break;
				case 40: //down
					obj.y += (shiftState) ? 10 : 1;
				break;
				case 16: //shift
					shiftState = true;
				break;
			}
			trace("x:" + obj.x + ", y:" + obj.y);
		}
	}
}
