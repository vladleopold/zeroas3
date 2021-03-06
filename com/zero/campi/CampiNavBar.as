﻿package com.zero.campi 
{
	import com.greensock.*; 
	import com.greensock.easing.*;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiNavBar extends Sprite
	{
		
		private var last:CampiButton;
		
		public function CampiNavBar() 
		{
			var aLabels:Array = [ "home", "Nuestra Empresa", "Productos"];
			var aLinks:Array = [ CampiSite.HOME, CampiSite.NOSOTROS, CampiSite.CATALOGO ];
						
			var nY:int = 0;
			var nSpace:int = 8;
			for (var i:int = 0; i < aLabels.length; i++) 
			{
				var btn:CampiButton = new CampiButton(aLabels[i], aLinks[i]);
				btn.alpha = 0;
				btn.y = nY;
				addChild(btn);
				TweenMax.to( btn, 1, { alpha: 1, delay: i * 0.3, ease: Linear.easeNone } );
				nY += btn.height + nSpace;
			}
		}
		
	}

}