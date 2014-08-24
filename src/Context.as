package {
import components.fileList.MainView;

import core.FileMetaDataBase;
import core.LocationDataBase;

import movieServices.InfoQueryCache;

import utils.VLCManager;

public class Context {

    [Bindable]
    public var locationsDB:LocationDataBase = new LocationDataBase();

    public var fileMetaDB:FileMetaDataBase = new FileMetaDataBase();
    public var vlcManager:VLCManager = new VLCManager();
    public var infoQueryCache:InfoQueryCache = new InfoQueryCache();
    public var mainView:MainView;

}
}
