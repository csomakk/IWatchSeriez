package movieServices {
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.net.URLRequest;

import model.MovieData;

public class OmdbApi {

    public static function getInfo(query:String, result:MovieData):void {
        result.searchQuery = query;

        var request:URLRequest = new URLRequest("http://www.omdbapi.com/?t=" + query);

        var loader:MovieServiceURLLoader = new MovieServiceURLLoader(result);

        try {
            loader.load(request);
        } catch (error:SecurityError) {
            trace("A SecurityError has occurred.");
        }

        loader.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
        loader.addEventListener(Event.COMPLETE, loaderCompleteHandler);
    }

    private static function errorHandler(event:IOErrorEvent):void {
        trace("Error at OmdbAPI", event);
    }

    private static function loaderCompleteHandler(event:Event):void {
        var msURLLoader:MovieServiceURLLoader = (event.target as MovieServiceURLLoader);
        var jsonResult:Object = JSON.parse(msURLLoader.data);
        var movieData:MovieData = msURLLoader.movieData;
        resultToMovieData(jsonResult, movieData);
        if (movieData.type == OmdbTypes.SERIEZ) {
            getSeriezData(movieData);
        }
    }

    private static function getSeriezData(movieData:MovieData):void {
        TvdbApi.getDataByIMDB(movieData);
    }

    private static function resultToMovieData(result:Object, movieData:MovieData):void {
        movieData.imdbID = result.imdbID;
        movieData.posterURL = result.Poster;
        movieData.type = result.Type;
    }

}
}
