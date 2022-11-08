import 'package:geolocator/geolocator.dart';


const String accessToken="eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiJ9.eyJ2IjoxLCJ1c2VyIjoiZnJlZV9tZWciLCJpc3MiOiJsb2dpbi5tZXRlb21hdGljcy5jb20iLCJleHAiOjE2NjUwMDIzMjMsInN1YiI6ImFjY2VzcyJ9.SRLC7lPRT0X3OvZYSAVE5Z27AeSQ8GQHJI81uaha8o9sJQC_FpCcVN7vNYKgcg9Kie4T9y2dw9vbDosni5RqJQ";
class Location {
  late double latitude;
  late double longitud;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitud = position.longitude;
    } catch(e) {
      print(e);
    }
  }
}