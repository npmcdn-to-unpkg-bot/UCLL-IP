package be.krivi.ucll.ip.web.converter;

import be.krivi.ucll.ip.web.validation.NetworkForm;
import com.google.maps.GeoApiContext;
import com.google.maps.GeocodingApi;
import com.google.maps.model.GeocodingResult;
import com.sun.tools.javac.util.Pair;

/**
 * Created by Krivi on 02/04/16.
 */
public class Converter{

    private static final String API_KEY = "AIzaSyCE41BGnnoE6BvD8NNAKJ-OhrOhyb2rSnw";

    public static Pair<Double, Double> getLatLon( NetworkForm networkForm ){
        GeoApiContext context = new GeoApiContext().setApiKey( API_KEY );
        GeocodingResult[] results;

        try{
            results = GeocodingApi.geocode(
                    context,
                    networkForm.getLocationAddress() + ", " +
                            networkForm.getLocationZip() +
                            networkForm.getLocationCity() + ", " +
                            networkForm.getLocationCountry()
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

}
