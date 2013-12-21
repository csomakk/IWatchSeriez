package components.fileList {
import flash.filesystem.File;

public class UpFolder extends File {
    public function UpFolder() {
        super();
    }

    public override function get name():String {
        return "..";
    }
}
}
