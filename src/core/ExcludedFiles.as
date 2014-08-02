package core {
public class ExcludedFiles {

    private static const excludedFileTypes:Array = [ ".nfo" , ".srt" , ".sfv" ];
    private static const excludedNames:Array = [ "Sample", "sample" ];

    public static function isExcludedType(fileType:String):Boolean {
        return excludedFileTypes.indexOf(fileType) != -1;
    }

    public static function isExcludedName(fileType:String):Boolean {
        return excludedNames.indexOf(fileType) != -1;
    }
}
}
