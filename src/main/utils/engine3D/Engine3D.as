package main.utils.engine3D {
	import away3d.cameras.Camera3D;
	import away3d.containers.Scene3D;
	import away3d.core.base.Object3D;
	import away3d.core.math.Number3D;
	import away3d.lights.AbstractLight;
	import away3d.lights.DirectionalLight3D;
	import away3d.primitives.GridPlane;
	import away3d.primitives.Trident;

	import com.greensock.TweenLite;

	import flash.display.Sprite;
	
	/**
	 * Initializing the away 3d engine
	 * @author Ferry Brouwer
	 */
	public class Engine3D extends Sprite {
		private var viewports:Array;
		private var _scene:Scene3D;
		private var _axis:Trident;
		private var _light:AbstractLight;
		private var _tweenCount:int;
		private var _render:RenderViewport;
		
		public function Engine3D() {
			render = new RenderViewport();
			scene = new Scene3D();
			scene.autoUpdate = false;
			viewports = new Array();
		}
		
		/**
		 * Add a directional light to the scene
		 */
		public function addLight(ambient:Number, diffuse:Number, specular:Number, direction:Number3D, brightness:Number):void {
			if (!light) {
				light = new DirectionalLight3D( { ambient:ambient, diffuse:diffuse, specular:specular, direction:direction, brightness:brightness } );
				scene.addLight(light);
			}else {
				throw new Error("allready created light");
			}
		}
		
		/**
		 * Add view
		 */
		public function addView(name:String, w:Number, h:Number, x:Number, y:Number, camera:Camera3D = null, perspective:String = null, border:Boolean = false, borderColor:uint = 0xcccccc, borderThickness:int = 1):void {
			var viewport:Viewport;
			if (!perspective) {
				viewport = new Viewport(w, h, x, y, scene, camera, border, borderColor, borderThickness);
			}else {
				var cam:Camera3D = new Camera3D();
				switch (perspective) {
					case Viewport.VIEW_TOP:
						cam.lookAt( new Number3D(0, 0, 0));
						cam.z = 0;
						cam.y = 1000;
						cam.rotationX = -90;
					break;
					case Viewport.VIEW_FRONT	:break;
					case Viewport.VIEW_BOTTOM	:break;
					case Viewport.VIEW_LEFT		:break;
					case Viewport.VIEW_RIGHT	:break;
				}
				viewport = new Viewport(w, h, x, y, scene, cam, border, borderColor, borderThickness);
			}
			viewport.name = name;			
			viewports.push(viewport);
			render.addView(viewport.view);
			addChild(viewport);
		}
		
		/**
		 * Add view At index
		 */
		public function addViewAt(index:int, name:String, w:Number, h:Number, x:Number, y:Number, camera:Camera3D = null, perspective:String = null, border:Boolean = false, borderColor:uint = 0xcccccc, borderThickness:int = 1):void {
			var viewport:Viewport;
			if (!perspective) {
				viewport = new Viewport(w, h, x, y, scene, camera, border, borderColor, borderThickness);
			}else {
				var cam:Camera3D = new Camera3D();
				switch (perspective) {
					case Viewport.VIEW_TOP:
						cam.lookAt( new Number3D(0, 0, 0));
						cam.z = 0;
						cam.y = 20000;
						cam.rotationX = -90;
					break;
					case Viewport.VIEW_FRONT	:break;
					case Viewport.VIEW_BOTTOM	:break;
					case Viewport.VIEW_LEFT		:break;
					case Viewport.VIEW_RIGHT	:break;
				}
				viewport = new Viewport(w, h, x, y, scene, cam, border, borderColor, borderThickness);
			}
			viewport.name = name;			
			viewports.push(viewport);
			render.addView(viewport.view);
			addChildAt(viewport, index);
		}
		
		/**
		 * Get view by name
		 */
		public function getViewByName(name:String):Viewport {
			var viewport:Viewport;
			for (var i:int = 0; i < viewports.length; i++) {
				if (viewports[i].name == name) {
					viewport = viewports[i];
					break;
				}
			}
			return viewport;
		}
		
		/**
		 * add Tween of an target object
		 */
		public function addTween(target:*, duration:Number, vars:Object, autoEnterFrame:Boolean=false):void {
			_tweenCount++;
			if (autoEnterFrame) render.start();
			
			var func:Function = vars.onComplete;
			var hasFunc:Boolean = (typeof(func) == "function") ? true : false;
			vars.onComplete = function():void {
				_tweenCount--;
				if (_tweenCount == 0 && autoEnterFrame) render.stop();
				if (hasFunc) func();
			};
			 
			TweenLite.to(target, duration, vars);
		}
		
		/**
		 * Add object
		 */
		public function addObject(object:Object3D):void {
			scene.addChild(object);
			render.renderOnce();
		}
		
		/**
		 * Show axis for reference
		 */
		public function showAxis(size:int, boolean:Boolean):void {
			scene.addChild(new Trident(size, boolean));
		}
		
		/**
		 * Show grid planes for debugging
		 */
		public function showGrid(size:int, segments:int, inBoolean:Boolean):void {
			if (inBoolean) {
				var grids:Object = {
					planeX:	new GridPlane({width:size,height:size,segmentsW:segments,segmentsH:segments,material:"#red"}),
					planeY: new GridPlane({width:size,height:size,segmentsW:segments,segmentsH:segments,rotationX:90,material:"#lightgreen"}),
					planeZ: new GridPlane( { width:size, height:size, segmentsW:segments, segmentsH:segments, rotationX:90, rotationY:90, material:"#blue" } )
				};
				this.addObject(grids.planeX);
				this.addObject(grids.planeY);
				this.addObject(grids.planeZ);
			}
		}
		
		/**
		 * Render all the viewports once
		 */
		public function renderOnce():void {
			render.renderOnce();
		}
		
		/**
		 * Set scene
		 */
		public function set scene(inScene:Scene3D):void {
			_scene = inScene;
		}
		
		/**
		 * @return Get the Scene Object
		 */
		public function get scene():Scene3D {
			return _scene;
		}
		
		/**
		 * Set light object
		 */
		public function set light(inLight:AbstractLight):void {
			_light = inLight;
		}
		
		/**
		 * @return light object
		 */
		public function get light():AbstractLight {
			return _light;
		}
		
		/**
		 * Set render viewport
		 */
		public function set render(inRender:RenderViewport):void {
			_render = inRender;
		}
		
		/**
		 * @return RenderViewport object
		 */
		public function get render():RenderViewport {
			return _render;
		}
		
	}

}