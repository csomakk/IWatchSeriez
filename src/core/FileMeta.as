package core {
public class FileMeta {
    private var _icon:String;
    public var lastModified:String;

    public function FileMeta(icon:String = "", aLastModified:String = "") {
        _icon = icon;
        lastModified = aLastModified;
    }


    public function get icon():String {
        return _icon;
    }

    public function set icon(value:String):void {
        _icon = value;
        lastModified = "Changed on - " + new Date().toString();
    }
}
}
