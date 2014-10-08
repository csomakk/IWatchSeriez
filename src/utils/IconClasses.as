package utils {
public class IconClasses {


    [Embed(source="/new.png")]
    [Bindable]
    public static var newIcon:Class;
    public static var newIconName:String = "utils.IconClasses.newIcon";

    [Embed(source="/qestion.png")]
    [Bindable]
    public static var questionIcon:Class;
    public static var questionIconName:String = "utils.IconClasses.questionIcon";

    [Embed(source="/warning.png")]
    [Bindable]
    public static var warningIcon:Class;
    public static var warningIconName:String = "utils.IconClasses.warningIcon";

    [Embed(source="/watched.png")]
    [Bindable]
    public static var watchedIcon:Class;
    public static var watchedIconName:String = "utils.IconClasses.watchedIcon";

    [Embed(source="/wont.png")]
    [Bindable]
    public static var wontIcon:Class;
    public static var wontIconName:String = "utils.IconClasses.wontIcon";

    [Embed(source="/half.png")]
    [Bindable]
    public static var halfIcon:Class;
    public static var halfIconName:String = "utils.IconClasses.halfIcon";

    [Embed(source="/white.png")]
    [Bindable]
    public static var clearIcon:Class;

    [Embed(source="/heart.png")]
    [Bindable]
    public static var heartIcon:Class;
    public static var heartIconName:String = "utils.IconClasses.heartIcon";

    [Embed(source="/star.png")]
    [Bindable]
    public static var starIcon:Class;
    public static var starIconName:String = "utils.IconClasses.starIcon";

    [Embed(source="/vlcplaylist.png")]
    [Bindable]
    public static var vlcPlaylistIcon:Class;
    public static var vlcPlaylistIconName:String = "utils.IconClasses.vlcPlaylistIcon";

    [Embed(source="/closeTab.png")]
    [Bindable]
    public static var closeTabIcon:Class;

    [Embed(source="/add.png")]
    [Bindable]
    public static var addTabIcon:Class;

    [Embed(source="/github.png")]
    [Bindable]
    public static var githubIcon:Class;

    [Embed(source="/settings.png")]
    [Bindable]
    public static var settingsIcon:Class;

    public static function stringToIcon(name:String):Class {
        if (!name) return null;
        if (name.search(newIconName) == 0) return newIcon;
        if (name.search(questionIconName) == 0) return questionIcon;
        if (name.search(warningIconName) == 0) return warningIcon;
        if (name.search(watchedIconName) == 0) return watchedIcon;
        if (name.search(wontIconName) == 0) return wontIcon;
        if (name.search(halfIconName) == 0) return halfIcon;
        if (name.search(starIconName) == 0) return starIcon;
        if (name.search(heartIconName) == 0) return heartIcon;
        if (name.search(vlcPlaylistIconName) == 0) return vlcPlaylistIcon;
        return null;
    }

}
}
