package {
public class StringUtils {
    public static function getLastPart(str:String):String {
        var arr:Array = str.split("\\");
        if(arr[arr.length-1] == "") arr.pop();
        return arr[arr.length-1];
    }

    public static function trim(str:String, ifLongerThan:int = 10):String {
        if(str.length < ifLongerThan) return str;
        return str.slice(0,ifLongerThan)+"..";
    }
}
}
