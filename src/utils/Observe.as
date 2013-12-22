package utils {
public class Observe {
    public var handler:Function;

    public function set source(source:*):void {
        handler.call();
    }
}
}