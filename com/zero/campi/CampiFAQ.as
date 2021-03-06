﻿package com.zero.campi 
{
	import com.greensock.easing.Strong;
	import com.greensock.TweenLite;
	import com.util.DisplayUtil;
	import com.zero.campi.faq.FAQList;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author sminutoli
	 */
	public class CampiFAQ extends CampiTramaContent
	{
		public var mcTitle:Sprite;
		public var mcTexto:Sprite;
		public var mcTexto2:Sprite;
		public var mcSubTitle:Sprite;
		public var mcComment:Sprite;
		public var mcComment2:Sprite;
				
		private var t:TweenLite;
		private var t2:TweenLite;
		private var t3:TweenLite;
		private var t4:TweenLite;
		private var t5:TweenLite;
		private var children:Array;
		
		public function CampiFAQ() 
		{
			animationClass = TramaTransition;
			
			super();
						
			mcTexto = new FAQList();
			mcTexto.x = mcTitle.x;
			mcTexto.y = 120;
			
			children = [ mcTitle, mcTexto, mcTexto2, mcSubTitle, mcComment, mcComment2 ];
			DisplayUtil.massiveRemove( children );
			
			mcTexto2.buttonMode = true;
			mcTexto2.addEventListener(MouseEvent.CLICK, go_contact );
		}
		
		private function go_contact(e:MouseEvent):void 
		{
			if ( CampiSite.getApp() ) {
				CampiSite.getApp().setSection( CampiSite.CONTACTO );
			}
		}
		override public function hide():void {
			t2.reverse();
		}
		
		private function hide_title():void
		{
			t.reverse();
		}
		private function hide_trama():void
		{
			super.hide();
		}
		override protected function animation_show_end(e:Event):void 
		{
			super.animation_show_end(e);
						
			DisplayUtil.addChildren( this, children );
			
			t = TweenLite.from( mcTitle, 1, { alpha: 0, y: mcTitle.y + 30, ease: Strong.easeInOut} );
			t2 = TweenLite.from( mcTexto, 1, { alpha: 0, x: mcTexto.x - 10, ease: Strong.easeInOut, delay: 0.5 } );
			t3 = TweenLite.from( mcTexto2, 1, { alpha: 0, x: mcTexto2.x - 10, ease: Strong.easeInOut, delay: 0.5 } );
			//t3 = TweenLite.from( mcSubTitle, 1, { alpha: 0, x: mcSubTitle.x - 10, ease: Strong.easeInOut, delay: 0.8 } );
			//t4 = TweenLite.from( mcComment, 1, { alpha: 0, x: mcComment.x - 10, ease: Strong.easeInOut, delay: 1 } );
			//t5 = TweenLite.from( mcComment2, 1, { alpha: 0, x: mcComment2.x - 10, ease: Strong.easeInOut, delay: 1.3 } );
			
		}
	}

}