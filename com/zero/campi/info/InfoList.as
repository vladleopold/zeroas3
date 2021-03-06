package com.zero.campi.info
{
	import com.gui.ScrollerMovie;
	import com.util.HTMLColors;
	import com.util.LayoutUtil;
	import com.zero.snap.ScrollBar;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author sminutoli
	 */
	public class InfoList extends ScrollerMovie 
	{
		private var xml:XML;
		private var loader:URLLoader;
		private var container:InfoItemContainer;
				
		public function InfoList() 
		{
			var pedido:URLRequest = new URLRequest("info.xml");
			loader = new URLLoader(pedido);
			loader.addEventListener(Event.COMPLETE, xml_loaded );
			addEventListener( Event.CHANGE, layout_zonas );
			
			container = new InfoItemContainer();
			addChild(container);
			
			mcBar = new CampiScrollBar();
			addChild(mcBar);
			mcDrag = new CampiScrollDrag();
			addChild(mcDrag);
			mcMask = new Sprite();
			mcMask.graphics.beginFill( HTMLColors.magenta, 1 );
			mcMask.graphics.drawRect( 0, 0, 310, mcBar.height );
			addChild(mcMask);
			
			mcBar.x = 310;
			mcDrag.x = 310 - mcDrag.width/2;
			
			mcContent = container;
			
			super();
		}

		function layout_zonas(e:Event){
			e.stopImmediatePropagation();
			LayoutUtil.layoutY(container);	
		}
		
		function xml_loaded(e){
			xml = new XML(loader.data);
			draw_list();
		}

		function draw_list(){
			var categorias:XMLList = xml.categoria;
			for each( var categoria:XML in categorias ){
				container.addChild( new Info( categoria ) );
			}
			LayoutUtil.layoutY(container);
			(container.getChildAt(0) as Info).open();
		}		
		
	}

}