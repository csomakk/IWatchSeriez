package {
import core.FileMetaDataBase;
import core.LocationDataBase;

public class Context {
    public var fileMetaDB:FileMetaDataBase = new FileMetaDataBase();
    [Bindable]
    public var locationsDB:LocationDataBase = new LocationDataBase();
}
}
