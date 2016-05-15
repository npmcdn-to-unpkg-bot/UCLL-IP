package be.krivi.ucll.ip.web.rest.converter;

import be.krivi.ucll.ip.web.rest.model.Geocode;
import be.krivi.ucll.ip.web.rest.model.Geometry;
import be.krivi.ucll.ip.web.validation.NetworkTO;
import com.google.maps.GeoApiContext;
import com.google.maps.GeocodingApi;
import com.google.maps.model.GeocodingResult;
import com.sun.tools.javac.util.Pair;
import org.springframework.web.client.RestTemplate;

/**
 * Created by Krivi on 02/04/16.
 */

// Simple converter class that gets latitude and longitude for a given address.
public class Converter{

    private static final String API_KEY = "AIzaSyCE41BGnnoE6BvD8NNAKJ-OhrOhyb2rSnw";

    //****************************************************************
    // region Using Google Geocode Java API
    //****************************************************************

    public static Pair<Double, Double> getLatLon( NetworkTO networkTO ){
        GeoApiContext context = new GeoApiContext().setApiKey( API_KEY );
        GeocodingResult[] results;

        try{
            results = GeocodingApi.geocode(
                    context,
                    networkTO.getLocationAddress() + ", " +
                            networkTO.getLocationZip() +
                            networkTO.getLocationCity() + ", " +
                            networkTO.getLocationCountry()
            ).await();

            return new Pair<>( results[0].geometry.location.lat, results[0].geometry.location.lng );
        }catch( Exception e ){
            return new Pair<>( 0.0, 0.0 );
        }
    }

    public static Pair<Double, Double> getLatLon( String address ){
        GeoApiContext context = new GeoApiContext().setApiKey( API_KEY );
        GeocodingResult[] results;

        try{
            results = GeocodingApi.geocode(
                    context,
                    address
            ).await();

            return new Pair<>( results[0].geometry.location.lat, results[0].geometry.location.lng );
        }catch( Exception e ){
            return new Pair<>( 0.0, 0.0 );
        }
    }

    //****************************************************************
    // endregion
    //****************************************************************

    //****************************************************************
    // region Using Google Geocode JSON API
    //****************************************************************

    public static Pair<Double, Double> getLatLonJson( NetworkTO networkTO ){
        RestTemplate restTemplate = new RestTemplate();

        try{
            // https://maps.googleapis.com/maps/api/geocode/json?address=Herestraat+49,+3000+Leuven,+Belgium&key=AIzaSyCE41BGnnoE6BvD8NNAKJ-OhrOhyb2rSnw
            Geocode geocode = restTemplate.getForObject(
                    "https://maps.googleapis.com/maps/api/geocode/json?address=" +
                            networkTO.getLocationAddress() + ", " +
                            networkTO.getLocationZip() +
                            networkTO.getLocationCity() + ", " +
                            networkTO.getLocationCountry() +
                            "&key=" + API_KEY,
                    Geocode.class
            );
            Geometry geometry = geocode.getFirstResults().getGeometry();

            return new Pair<>( geometry.getLocation().getLat(), geometry.getLocation().getLng() );
        }catch( Exception e ){
            return new Pair<>( 0.0, 0.0 );
        }
    }

    public static Pair<Double, Double> getLatLonJson( String address ){
        RestTemplate restTemplate = new RestTemplate();

        try{
            Geocode geocode = restTemplate.getForObject(
                    "https://maps.googleapis.com/maps/api/geocode/json?address=" +
                            address +
                            "&key=" + API_KEY,
                    Geocode.class
            );
            Geometry geometry = geocode.getFirstResults().getGeometry();

            return new Pair<>( geometry.getLocation().getLat(), geometry.getLocation().getLng() );
        }catch( Exception e ){
            return new Pair<>( 0.0, 0.0 );
        }
    }

    //****************************************************************
    // endregion
    //****************************************************************

    public static String test( NetworkTO networkTO ){
        RestTemplate restTemplate = new RestTemplate();

        Geocode results = restTemplate.getForObject(
                "https://maps.googleapis.com/maps/api/geocode/json?address=" +
                        networkTO.getLocationAddress() + ", " +
                        networkTO.getLocationZip() +
                        networkTO.getLocationCity() + ", " +
                        networkTO.getLocationCountry() +
                        "&key=" + API_KEY,
                Geocode.class
        );

        return "https://maps.googleapis.com/maps/api/geocode/json?address=" +
                networkTO.getLocationAddress() + ", " +
                networkTO.getLocationZip() +
                networkTO.getLocationCity() + ", " +
                networkTO.getLocationCountry() +
                "&key=" + API_KEY;
    }
}
