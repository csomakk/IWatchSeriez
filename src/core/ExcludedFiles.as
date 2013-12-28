package core {
public class ExcludedFiles {

    private static const excludedFileTypes:Array = [ ".nfo" , ".srt" , ".sfv" ];

    public static function isExcluded(fileType:String):Boolean {
        return excludedFileTypes.indexOf(fileType) != -1;
    }
}
}
