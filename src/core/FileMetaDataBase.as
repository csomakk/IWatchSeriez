package core {
import flash.filesystem.File;
import flash.utils.Dictionary;

import utils.CsUtils;

public class FileMetaDataBase {

    public var fileMetaDict:Dictionary = new Dictionary();

    public function setMeta(nativePath:String, meta:FileMeta):void {
        fileMetaDict[ nativePath ] = meta;
    }

    public function getMeta(nativePath:String):FileMeta {
        var meta:FileMeta = fileMetaDict [nativePath] as FileMeta;
        if (!meta) {
            meta = new FileMeta();
            setMeta(nativePath, meta);
        }
        return meta;
    }

    public function save():void {
        var file:File = File.applicationStorageDirectory;
        file = file.resolvePath("dictionary.xml");
        var xml:XML = new XML("<dictionary><items/></dictionary>");
        for (var key:Object in fileMetaDict) {
            var node:XML = new XML("<item><path/><iconString/><lastModified/></item>");
            node.path = key;
            var fileMeta:FileMeta = (fileMetaDict[key] as FileMeta);
            node.iconString = fileMeta.icon;
            node.lastModified = fileMeta.lastModified;
            (xml.items as XMLList).appendChild(node);
        }
        CsUtils.saveAsXML(xml, file.url);
    }

    public function load():void {
        var file:File = File.applicationStorageDirectory;
        file = file.resolvePath("dictionary.xml");
        if (file.exists) {
            var xml:XML = CsUtils.loadXML(file.url);
            if (xml != null) {
                for each (var node:XML in xml.items.item) {
                    fileMetaDict[String(node.path)] = new FileMeta(String(node.iconString), String(node.lastModified));
                }
            }
        }
    }
}
}
