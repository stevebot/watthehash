package com.stevebot.watthehash;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import twitter4j.GeoLocation;
import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Tweet;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.LatLng;

@Controller
public class IndexController
{

  @RequestMapping(value="index.html", method=RequestMethod.GET)
  public ModelAndView handleDefault(){
     return new ModelAndView("welcome");
  }

  @RequestMapping(value="getTweets.html", method=RequestMethod.POST)
  public @ResponseBody String getTweets(@RequestParam(value="address") String address, @RequestParam(value="hashtag") String hashtag) throws TwitterException, UnsupportedEncodingException{
    String tweeties = "";
    final Geocoder geocoder = new Geocoder();
    GeocoderRequest geocoderRequest = new GeocoderRequestBuilder().setAddress(address).setLanguage("en").getGeocoderRequest();
    GeocodeResponse geocoderResponse = geocoder.geocode(geocoderRequest);
    if(!geocoderResponse.getResults().isEmpty()){
      GeocoderResult geocoderResult = geocoderResponse.getResults().get(0);
      LatLng location = geocoderResult.getGeometry().getLocation();
      Twitter twitter = new TwitterFactory().getInstance();
      Query query = new Query(hashtag);
      GeoLocation geoCodeLocation = new GeoLocation(location.getLat().doubleValue(), location.getLng().doubleValue());
      query.setGeoCode(geoCodeLocation, 25.0, "mi");
      QueryResult result = twitter.search(query);
      List<Tweet> tweets = result.getTweets();
      if(!tweets.isEmpty()){
        for(Tweet tweet : tweets){
          tweeties += tweet.getText() + "\n";
        }
      } else {
         tweeties = String.format("Sorry no tweets found for %s", hashtag);
      }
    } else {
      tweeties = String.format("Sorry no address found for %s", address);
    }
    return tweeties;
  }
  
}
