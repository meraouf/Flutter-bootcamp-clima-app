import 'location.dart';
import 'networking.dart';

const param = '/2022-10-06T00:00:00Z/t_2m:C/52.520551,13.461804/json';
const openWeatherMapURL = 'api.meteomatics.com';
const accessToken = {'access_token' : 'eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiJ9.eyJ2IjoxLCJ1c2VyIjoiZnJlZV9tZWciLCJpc3MiOiJsb2dpbi5tZXRlb21hdGljcy5jb20iLCJleHAiOjE2NjUwNjA0NzcsInN1YiI6ImFjY2VzcyJ9.xzP8ccw6A1fpeN137fa_Ka1EdUUSUbywe-c5w_rklWELBoZbMP0iArLzau1JFjsdN_KA91t8yYLUR_PJ4EKLHQ'};
class WeatherModel {


  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);

    NetworkHelper networkHelper = NetworkHelper(
        openWeatherMapURL, param,accessToken);
    var weatherData = await networkHelper.getDate();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
