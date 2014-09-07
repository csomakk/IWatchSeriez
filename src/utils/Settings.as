package utils {
import flash.filesystem.File;

public class Settings {

    private static const filePath:String = "settings.xml";

    public var vlcPath:String;
    public var settingsUrl:String;

    public function Settings() {
        var file:File = File.applicationStorageDirectory.resolvePath(filePath);
        settingsUrl = file.url;
        if (!file.exists) {
            CsUtils.saveAsXML(new XML("<settings><vlcpath>C:\\Program Files\\VideoLAN\\VLC\\vlc.exe</vlcpath></settings>"), settingsUrl);
        }
        var xml:XML = CsUtils.loadXML(settingsUrl);
        vlcPath = xml.vlcpath;
    }

}
}
