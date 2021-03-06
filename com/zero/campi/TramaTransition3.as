package com.zero.campi 
{
	import com.greensock.easing.Strong;
	import com.greensock.TweenLite;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.geom.Vector3D;
	/**
	 * ...
	 * @author sminutoli
	 */
	public class TramaTransition3 extends TramaTransition
	{
		public function TramaTransition3( trama:CampiBitmapTrama, autoplay:Boolean=true ) 
		{
			super( trama, autoplay );
		}
		
		override public function show():void {
			for (var i:int = 0; i < trama.numChildren; i++) 
			{
				var modulo:DisplayObject = trama.getChildAt(i);
				var nY:int = modulo.y;
				var nX:int = modulo.x;
				modulo.x = ( nX > 810 /2 ) ? 810 : 0;
				modulo.y = ( nY > 600 / 2 ) ? 600 : 0;
				modulo.visible = false;
				var t = TweenLite.to( modulo, 1, { x: nX, y: nY, delay: Math.random(), ease: Strong.easeOut, onStart: init_modulo, onStartParams: [ modulo ] } );
				tweens[i] = t;
			}
			bindTweens();
		}
		
		private function init_modulo(modulo):void
		{
			modulo.visible = true;
		}
		
	}

}