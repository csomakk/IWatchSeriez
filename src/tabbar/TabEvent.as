package tabbar {
import flash.events.Event;

public class TabEvent extends Event {
    public static var CLOSE_EVENT = "TabEvent.Close";
    public var itemIndex:int;

    public function TabEvent(itemIndx:int, type:String, cancelable:Boolean = false) {
        itemIndex = itemIndx;
        super(type,true,cancelable);
    }
}
}
