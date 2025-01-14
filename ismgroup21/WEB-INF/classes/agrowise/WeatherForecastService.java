package agrowise;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import agrowise.WeatherForecast;
import org.json.JSONArray;
import org.json.JSONObject;

public class WeatherForecastService {
    private static final Logger logger = Logger.getLogger(WeatherForecastService.class.getName());
    // Hardcoded city IDs for the Greek cities
    private static final int KALAMATA_ID = 261604;
    private static final int PTHIOTIS_ID = 262187;
    private static final int HERAKLION_ID = 8133920;
    private static final int CHANIA_ID = 260114;
    private static final int SPARTI_ID = 253394;
    private static final double KELVIN_BASE_TEMP = 273.15;
    private static final String API_KEY = System.getenv("API_KEY");

    public static List<WeatherForecast> getWeatherForecast(String location) {
        List<WeatherForecast> forecasts = new ArrayList<>();
        int cityId;
        switch (location) {
            case "Kalamata":
                cityId = KALAMATA_ID;
                break;
            case "Pthiotida":
                cityId = PTHIOTIS_ID;
                break;
            case "Heraklion":
                cityId = HERAKLION_ID;
                break;
            case "Chania":
                cityId = CHANIA_ID;
                break;
            case "Sparti":
                cityId = SPARTI_ID;
                break;
            default:
                cityId = -1;
                throw new IllegalArgumentException("Invalid location name. Heraklion, Chania, Sparti, Pthiotida, Kalamata are accepted types");
        }
        // Construct the OpenWeather API URL with the city ID
        String apiUrl = String.format(
                "https://api.openweathermap.org/data/2.5/forecast?id=%d&appid=%s",
                cityId, API_KEY);

        try {
            logger.info("API URL: " + apiUrl); // Log the API URL for debugging

            // Create a URI and convert it to a URL
            URI uri = new URI(apiUrl);
            URL url = uri.toURL();

            // Send the HTTP GET request
            logger.info("Sending GET request...");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            int responseCode = connection.getResponseCode();
            logger.info("Response Code: " + responseCode);

            if (responseCode == 200) { // Success
                logger.info("Successfully fetched weather data.");
                BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                String inputLine;
                StringBuilder response = new StringBuilder();

                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
                in.close();

                // Parse the JSON response
                JSONObject jsonResponse = new JSONObject(response.toString());
                JSONArray forecastList = jsonResponse.getJSONArray("list");

                System.out.println("Weather forecast for the next 5 days:");
                for (int i = 0; i < 5; i++) { // Loop through the next 3 days
                    JSONObject dayForecast = forecastList.getJSONObject(i);
                    double dayTemp = dayForecast.getJSONObject("main").getDouble("temp") - KELVIN_BASE_TEMP;
                    int humidity = dayForecast.getJSONObject("main").getInt("humidity"); // Extract humidity
                    JSONArray weatherArray = dayForecast.getJSONArray("weather");
                    String description = weatherArray.getJSONObject(0).getString("description");
                    boolean isRaining = description.contains("rain");

                    forecasts.add(new WeatherForecast(dayTemp, humidity, description, isRaining));

                    System.out.printf("Day %d: %s, %.1f°C, Humidity: %d%%\n", i + 1, description, dayTemp, humidity);
                    // Decision logic for work
                    if (isRaining || humidity > 75) {
                        System.out.println("⚠️ Suggestion: Do NOT go to work due to unfavorable conditions (rain/high humidity).");
                    } else {
                        System.out.println("✅ Suggestion: Conditions are favorable, you can go to work.");
                    }
                    // Display a warning if it is raining
                    if (isRaining) {
                        System.out.println("⚠️ Warning: High chance of rain. Do not proceed to any task except for soiling if needed.");
                    }
                }
            } else {
                logger.warning("Failed to fetch weather data. Response Code: " + responseCode);
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "An error occurred:", e);
        }
        return forecasts;
    }

    public static void main(String[] args) {
        List<WeatherForecast> forecasts =getWeatherForecast("Kalamata") ;
        System.out.println(forecasts.size());

    }
}
