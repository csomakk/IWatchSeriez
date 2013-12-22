package movieServices {
import flash.net.URLLoader;

import model.MovieData;

public class MovieServiceURLLoader extends URLLoader {
    public var movieData:MovieData;

    public function MovieServiceURLLoader(resultHolder:MovieData = null) {
        if (resultHolder == null) resultHolder = new MovieData();
        this.movieData = resultHolder;
        super();
    }
}
}
