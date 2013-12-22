package core {
import flash.filesystem.File;

import mx.collections.ArrayCollection;

import utils.CsUtils;

public class LocationDataBase {

    public static var HOME_FOLDER_PATH:String = "root$:\\Computer";

    [Bindable]
    public var tabs:ArrayCollection = new ArrayCollection();

    public function LocationDataBase() {
    }

    public function load():void {
        var file:File = File.applicationStorageDirectory;
        file = file.resolvePath("location.xml");
        if (file.exists) {
            var xml:XML = CsUtils.loadXML(file.url);
            if (xml != null) {
                for each (var node:XML in xml.paths.path) {
                    var path:String = node.path;
                    if (path != HOME_FOLDER_PATH) {
                        tabs.addItem(path);
                    }
                }
            }
        }
        if (tabs.length == 0) {
            tabs.addItem(HOME_FOLDER_PATH);
        }
    }

    public function save():void {
        var file:File = File.applicationStorageDirectory;
        file = file.resolvePath("location.xml");
        var xml:XML = new XML("<location><paths/></location>");
        for each (var tab:Object in tabs) {
            var node:XML = new XML("<path/>");
            node.path = tab;
            (xml.paths as XMLList).appendChild(node);
        }
        CsUtils.saveAsXML(xml, file.url);
    }

}
}
