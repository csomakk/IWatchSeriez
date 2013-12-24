package movieServices {
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.net.URLRequest;

import model.MovieData;

public class RottenTomatoesApi {

    public static var API_KEY:String = "jkggca4vkqb6prwj2verpf9x";

    public static function getInfo(query:String, result:MovieData):void {

        var request:URLRequest = new URLRequest("http://api.rottentomatoes.com/api/public/v1.0/movies.json?q=" + query + "&page_limit=10&page=1&apikey=" + API_KEY);

        var loader:MovieServiceURLLoader = new MovieServiceURLLoader(result);

        loader.load(request);

        loader.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
        loader.addEventListener(Event.COMPLETE, loaderCompleteHandler);
    }

    private static function loaderCompleteHandler(event:Event):void {
        var msURLLoader:MovieServiceURLLoader = (event.target as MovieServiceURLLoader);
        var jsonResult:Object = JSON.parse(msURLLoader.data);
        var movieData:MovieData = msURLLoader.movieData;
        resultToMovieData(jsonResult, movieData);
    }

    private static function resultToMovieData(jsonResult:Object, movieData:MovieData):void {
        movieData.posterURL = jsonResult.movies[0].posters.original;
        movieData.name = jsonResult.movies[0].title;
        movieData.imdbID = jsonResult.movies[0].alternate_ids.imdb;
        movieData.rottenID = jsonResult.movies[0].id;
    }

    private static function errorHandler(event:IOErrorEvent):void {
        trace("Error at OmdbAPI", event);
    }

}
}
