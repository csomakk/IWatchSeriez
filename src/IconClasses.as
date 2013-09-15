package {
public class IconClasses {


    [Embed(source="/new.png")]
    [Bindable]
    public static var newIcon:Class;
    public static var newIconName:String = "IconClasses.newIcon";

    [Embed(source="/qestion.png")]
    [Bindable]
    public static var questionIcon:Class;
    public static var questionIconName:String = "IconClasses.questionIcon";

    [Embed(source="/warning.png")]
    [Bindable]
    public static var warningIcon:Class;
    public static var warningIconName:String = "IconClasses.warningIcon";

    [Embed(source="/watched.png")]
    [Bindable]
    public static var watchedIcon:Class;
    public static var watchedIconName:String = "IconClasses.watchedIcon";

    [Embed(source="/wont.png")]
    [Bindable]
    public static var wontIcon:Class;
    public static var wontIconName:String = "IconClasses.wontIcon";

    [Embed(source="/half.png")]
    [Bindable]
    public static var halfIcon:Class;
    public static var halfIconName:String = "IconClasses.halfIcon";

    [Embed(source="/white.png")]
    [Bindable]
    public static var clearIcon:Class;
    public static var clearIconName:String = "IconClasses.clearIcon";

    [Embed(source="/closeTab.png")]
    [Bindable]
    public static var closeTabIcon:Class;

    [Embed(source="/add.png")]
    [Bindable]
    public static var addTabIcon:Class;

    [Embed(source="/github.png")]
    [Bindable]
    public static var githubIcon:Class;

    public static function stringToIcon(name:String):Class {
        if (!name) return null;
        if (name.search(newIconName) == 0) return newIcon;
        if (name.search(questionIconName) == 0) return questionIcon;
        if (name.search(warningIconName) == 0) return warningIcon;
        if (name.search(watchedIconName) == 0) return watchedIcon;
        if (name.search(wontIconName) == 0) return wontIcon;
        if (name.search(halfIconName) == 0) return halfIcon;
        return null;
    }

}
}
