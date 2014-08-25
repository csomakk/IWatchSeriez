package utils {
import flash.desktop.NativeProcess;
import flash.desktop.NativeProcessStartupInfo;
import flash.filesystem.File;

public class VLCManager {

    public static const VLC_PATH:String = "C:\\Program Files\\VideoLAN\\VLC\\vlc.exe";
    public static const ARG_ENQUEUE:String = "--playlist-enqueue";
    public static const ARG_FULL_SCREEN:String = "--fullscreen";

    protected var mediaPlayer:File;
    protected var nativeProcessStartupInfo:NativeProcessStartupInfo;

	[Bindable]
	public function get vlcAvailable():Boolean {
		return mediaPlayer && NativeProcess.isSupported;
	}

    public function VLCManager() {
        mediaPlayer = new File();
	    try {
            mediaPlayer = mediaPlayer.resolvePath(VLC_PATH); //TODO settings
	    } catch (e:Error) {
		    return;
	    }
        if (NativeProcess.isSupported) {
            nativeProcessStartupInfo = new NativeProcessStartupInfo();
            nativeProcessStartupInfo.executable = mediaPlayer;
        }
    }

    public static function showCantFindMediaPlayer():void {
	    IWatchSeriez.CONTEXT.mainView.alert("Couldn't open console, or resolve VLC path. Should be at " + VLC_PATH, "Error opening VLC");
    }

    public function addToPlaylist(files:Array):void {
        if (mediaPlayer.exists && nativeProcessStartupInfo) {
            var args:Vector.<String> = new Vector.<String>();
            for each (var file:File in files) {
                args.push(file.nativePath);
                IWatchSeriez.CONTEXT.fileMetaDB.getMeta(file.nativePath).icon = IconClasses.vlcPlaylistIconName;
            }
            IWatchSeriez.CONTEXT.fileMetaDB.save();
            args.push(ARG_ENQUEUE);
            //args.push(ARG_FULL_SCREEN); //TODO if there will be a settings page
            nativeProcessStartupInfo.arguments = args;
            var process:NativeProcess = new NativeProcess();
            process.start(nativeProcessStartupInfo);
            IWatchSeriez.CONTEXT.mainView.refreshFileList();
        } else {
            showCantFindMediaPlayer();
        }
    }
}
}
