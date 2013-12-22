package movieServices {
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.net.URLLoader;
import flash.net.URLRequest;

import model.EpisodeData;
import model.MovieData;
import model.SeriezData;

public class TvdbApi {

    public static const API_KEY:String = "F0D98A3CE6AEF203";
    private static var mirrorPath:String = "http://thetvdb.com";

    public function TvdbApi() {
        getMirrors();
    }

    private static function errorHandler(event:IOErrorEvent):void {
        trace("TvdbApi ERROR: ", event);
    }

    private static function getMirrors():void {
        var request:URLRequest = new URLRequest("http://thetvdb.com/api/" + API_KEY + "/mirrors.xml");
        var mirrorsLoader:URLLoader = new URLLoader();
        mirrorsLoader.load(request);
        mirrorsLoader.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
        mirrorsLoader.addEventListener(Event.COMPLETE, mirrorsLoaderComplete);
    }

    private static function mirrorsLoaderComplete(event:Event):void {
        var xml:XML = XML(event.target.data);
        var mirrorPaths:XMLList = xml.Mirror.mirrorpath;
        var selectedMirror:int = Math.random() * mirrorPaths.length();
        mirrorPath = mirrorPaths[ selectedMirror ];
    }


    public static function getDataByIMDB(movieData:MovieData):void {
        var request:URLRequest = new URLRequest(mirrorPath + "/api/GetSeriesByRemoteID.php?imdbid=" + movieData.imdbID);
        var getDataByIMDBLoader:MovieServiceURLLoader = new MovieServiceURLLoader(movieData);
        getDataByIMDBLoader.load(request);
        getDataByIMDBLoader.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
        getDataByIMDBLoader.addEventListener(Event.COMPLETE, getDataByIMDBComplete);
    }

    private static function getDataByIMDBComplete(event:Event):void {
        var msURLLoader:MovieServiceURLLoader = (event.target as MovieServiceURLLoader);
        var xml:XML = XML(msURLLoader.data);
        resultToMovieData(xml, msURLLoader.movieData);
        getDataByTVDB(msURLLoader.movieData);
    }

    private static function resultToMovieData(result:XML, movieData:MovieData):void {
        movieData.tvdbID = result.Series.seriesid;
    }

    public static function getDataByTVDB(movieData:MovieData):void {
        var request:URLRequest = new URLRequest(mirrorPath + "/api/" + API_KEY + "/series/" + movieData.tvdbID + "/all/en.xml");
        var getDataByTvdbLoader:MovieServiceURLLoader = new MovieServiceURLLoader(movieData);
        getDataByTvdbLoader.load(request);
        getDataByTvdbLoader.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
        getDataByTvdbLoader.addEventListener(Event.COMPLETE, getDataByTvbdComplete);
    }

    private static function resultToSeriezData(result:XML, movieData:MovieData):void {
        movieData.rating = result.Series.Rating.toString();
        movieData.imdbID = result.Series.IMDB_ID.toString();
        movieData.tvdbID = result.Series.id.toString();
        movieData.fanArt = result.Series.fanart.toString();
        movieData.name = result.Series.SeriesName.toString();

        movieData.seriezData.Airs_DayOfWeek = result.Series.Airs_DayOfWeek.toString();
        movieData.seriezData.Airs_Time = result.Series.Airs_Time.toString();

        movieData.seriezData.episodes = [];
        var episodes:XMLList = result.Episode;
        for each (var episode:XML in episodes) {
            movieData.seriezData.episodes.push(resultToEpisode(episode))
        }
    }

    private static function resultToEpisode(result:XML):EpisodeData {
        var episode:EpisodeData = new EpisodeData();
        episode.season = result.Combined_season.toString();
        episode.episode = result.Combined_episodenumber.toString();
        episode.firstAired = result.FirstAired.toString();
        episode.name = result.EpisodeName.toString();
        return episode;
    }

    private static function getDataByTvbdComplete(event:Event):void {
        var msURLLoader:MovieServiceURLLoader = (event.target as MovieServiceURLLoader);
        var xml:XML = XML(msURLLoader.data);
        resultToSeriezData(xml, msURLLoader.movieData);

        getNextEpisode(msURLLoader.movieData.seriezData);
    }

    public static function twoDigitize(i:Number):String {
        if (i < 10) return "0" + i;
        return "" + i;
    }

    public static function getNextEpisode(seriezData:SeriezData):void {
        var today:Date = new Date();
        var todayString:String = today.fullYear + "-" + twoDigitize(today.month + 1) + "-" + twoDigitize(today.date + 1);
        var latest:EpisodeData;
        var next:EpisodeData;

        for each (var episode:* in seriezData.episodes) {
            if (todayString.localeCompare(episode.firstAired) > 0) {
                latest = episode;
            } else {
                next = episode;
                break;
            }
        }

        seriezData.nextEpisode = next;
        seriezData.latestEpisode = latest;
    }

}
}
