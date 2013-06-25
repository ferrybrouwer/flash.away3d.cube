package main.views {
	import flash.events.Event;
	import away3d.materials.BitmapMaterial;
	import away3d.primitives.Cube;

	import main.Model;
	import main.View;

	import flash.display.Bitmap;
	

	public class ViewRectangle extends View {
		private var cube:Cube;
		
		[Embed(source="../assets/mapping.jpg")]
		private var MappingAsset:Class;
		
		public function ViewRectangle(model:Model) {
			super(model);
			
			// create a simple cube
			cube = new Cube({width:80, height:80, depth:80});
			
			// create the materials
			var bmp:Bitmap = new MappingAsset() as Bitmap;
			cube.material = new BitmapMaterial(bmp.bitmapData);
			
			// add cube to the views
			engine.addObject(cube);

			// render all views
			engine.renderOnce();			
			
			// well lets rotate this object forsake
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(event : Event) : void {
			cube.rotationX += 1;
			cube.rotationY += 1;
			engine.renderOnce();			
		}
	}
}
