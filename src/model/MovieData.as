package model {
public class MovieData {

    public var imdbID:String;
    public var tvdbID:String;
    public var rottenID:String;
    public var searchQuery:String;
    public var type:String;
    [Bindable]
    public var posterURL:String;
    [Bindable]
    public var seriezData:SeriezData = new SeriezData();
    [Bindable]
    public var rating:Number;
    [Bindable]
    public var fanArt:String;
    [Bindable]
    public var name:String;

}
}
