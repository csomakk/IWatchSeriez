package {
	public class CsUtils{
		import flash.filesystem.*;
		import flash.net.*;
		
		public function collectGarbage():void{
			/*According to Grant Skinner’s third installment of this 
			AS Resource Management Series 
			(http://www.gskinner.com/blog/archives/2006/08/as3_resource_ma_2.html),
			you can force garbage collection 
			by calling two local connections in a row:*/
			
			try {
				new LocalConnection().connect('foo');
				new LocalConnection().connect('foo');
			} catch (e:Error) {
				
			}
		}
		
		public function loadXML(url:String):XML{
			var stream:FileStream = new FileStream();
			stream.open(new File(url), FileMode.READ);
			try{
				var ret:XML = new XML(stream.readUTFBytes(stream.bytesAvailable));
			} catch(e:Error) {
				trace("CsUtiles: error in xml")
			}
			stream.close();
			return ret;
		}
		
		public function saveAsXML(xml:XML, url:String):void{
			var stream:FileStream = new FileStream(); // The FileStream object used to read and write prefsFile data.
			var outputString:String = '<?xml version="1.0" encoding="utf-8"?>\n';
			var file:File=new File(url);
			outputString += xml.toXMLString();
			outputString = outputString.replace(/\n/g, File.lineEnding);
			stream = new FileStream();
			stream.open(file, FileMode.WRITE);
			stream.writeUTFBytes(outputString);
			stream.close();
		}
	}
}