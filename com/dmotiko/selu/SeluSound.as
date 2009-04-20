﻿package com.dmotiko.selu {
	
	import com.general.*
	import flash.events.*
		
	public class SeluSound
	extends BaseClip {
			
		override protected function initClip():void {
			super.initClip();
			this.buttonMode = true;
			this.addEventListener( MouseEvent.CLICK, toggle_sound );
			SeluSite.getApp().addEventListener( WebSite.SOUND_CHANGED, sound_changed);
			SeluSite.getApp().addEventListener( WebSite.SECTION_CHANGED, section_changed);
		}
		
		private function section_changed(e:Event):void {
			if ( SeluSite.getApp().getSection() == SeluSite.BACKSTAGE && !SeluSite.getApp().getSound()) {
				SeluSite.getApp().setSound(true);
			}
		}
		
		private function sound_changed(e:Event):void {
			if ( SeluSite.getApp().getSound() ) {
				this.gotoAndStop(1);
			} else {
				this.gotoAndStop(2);
			}
		}
		
		private function toggle_sound(e:MouseEvent):void 
		{
			SeluSite.getApp().setSound( !SeluSite.getApp().getSound());
		}
		
	}
	
}