package main.utils.engine3D {
	import away3d.cameras.Camera3D;
	import away3d.containers.Scene3D;
	import away3d.containers.View3D;
	import away3d.core.clip.RectangleClipping;
	import flash.display.Sprite;

	public class Viewport extends Sprite {
		public static const VIEW_TOP:String = "viewTop";
		public static const VIEW_FRONT:String = "viewFront";
		public static const VIEW_BOTTOM:String = "viewBottom";
		public static const VIEW_LEFT:String = "viewLeft";
		public static const VIEW_RIGHT:String = "viewRight";
		
		private var _cam:Camera3D;
		private var _view:View3D;
		private var _scene:Scene3D;
		private var borderColor:uint;
		private var borderThickness:int;
		
		public function Viewport(w:Number, h:Number, x:Number, y:Number, viewScene:Scene3D, viewCam:Camera3D = null, setBorder:Boolean = false, borderColor:uint = 0xcccccc, borderThickness:int = 1) {
			_scene = viewScene;
			_view = new View3D( { scene:_scene, x:w/2, y:h/2, stats:false  } );
			
			var viewClip:RectangleClipping = new RectangleClipping( { minX: -w / 2, minY: -h / 2, maxX:w / 2, maxY:h / 2 } );
			_view.clipping = viewClip;
			
			if (viewCam) {
				_cam = viewCam;
				_view.camera = _cam;
			}		
			if (setBorder) {
				this.borderColor = borderColor;
				this.borderThickness = borderThickness;
				addChild(makeBorder(w, h));
			}
			addChild(_view);
			
			this.x = x;
			this.y = y;
		}
		
		/**
		 * @return border Sprite
		 */
		private function makeBorder(w:Number,h:Number):Sprite {
			var border:Sprite = new Sprite();
			border.graphics.lineStyle(borderThickness, borderColor);
			border.graphics.beginFill(0xffffff);
			border.graphics.drawRect(0, 0, w, h);
			border.graphics.endFill();
			return border;
		}
		
		/**
		 * @return view object
		 */
		public function get view():View3D {
			return _view;
		}
		
		/**
		 * @return scene object
		 */
		public function get scene():Scene3D {
			return _scene;
		}
		
		/**
		 * @return camera object
		 */
		public function get camera():Camera3D {
			return _cam;
		}
		
	}

}