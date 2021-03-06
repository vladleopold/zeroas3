﻿package com.dmotiko.seluteens {
	import com.general.*;
	import flash.display.*;
	import flash.text.*;
	import flash.geom.*;
	import flash.events.*;
	
	public class STButton
	extends BaseMenuBtn {
		
		private var _overAnimation:MovieClip;
		public var txtLabel:TextField;
		public var mcTrigger:Sprite;
				
		override protected function initClip():void {
			super.initClip();
			txtLabel.mouseEnabled = false;
			
			txtLabel.autoSize = TextFieldAutoSize.LEFT;
			
		}
		
		override public function rollOver( evnt:MouseEvent ):void {
			if ( _overAnimation ) {
				_overAnimation.gotoAndPlay("show");
			}
		}
		
		override public function rollOut( evnt:MouseEvent ):void {
			if ( _overAnimation && evnt ) _overAnimation.gotoAndPlay("hide");
			if ( this.bActive )	return;
		}
		
		override protected function refreshData():void {
			txtLabel.text = data.label;
			if (data.over) this.setOverAnimation( data.over );
			if (mcTrigger) mcTrigger.width = txtLabel.width;
		}
		
		public function getOverAnimation():MovieClip { 
			return _overAnimation; 
		}
		
		public function setOverAnimation(value:MovieClip):void {
			_overAnimation = value;
		}
	}
	
}