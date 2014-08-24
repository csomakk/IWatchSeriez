package movieServices {
import flash.utils.Dictionary;

import model.MovieData;

public class InfoQueryCache {

    public var cache:Dictionary;

    public function InfoQueryCache() {
        cache = new Dictionary();
    }

    public function getInfo(folderName:String):void {
        var query:String = getQuery(folderName);
        var movieData:MovieData;

        if (!cache[query]) {
            movieData = new MovieData();
            cache[query] = movieData;
            OmdbApi.getInfo(query, movieData);
        }

        IWatchSeriez.CONTEXT.mainView.currentInfo = cache[query];
    }

    public static function getQuery(folderName:String):String {
        var parts:Array = folderName.split(/\\/);
        var query:String = parts.pop();
        var find:int;

        query = query.replace(/\.|\(|\)|\-/gi, " "); //replace (.) to spaces
        //query = query.replace(/\-/gi, " "); //replace (-) to spaces

        find = query.search(/S[0-9][0-9]/gi); //Ex. S03, S10
        query = find > 10 ? query.slice(0, find) : query; //slice after season

        find = query.search(/(19|20)\d{2}/gi); //Ex. 1921, 2013
        query = find > 4 ? query.slice(0, find) : query; //slice after year 1900-2099

        query = query.slice(0, 30);      //length check
        return query;
    }

}
}
