import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:security_app/ui/style/app_colors.dart';
import 'package:security_app/ui/style/text_tyle_constants.dart';
import 'package:security_app/repositories/service/satker_service.dart';

class CaptureScreen extends StatefulWidget {
  const CaptureScreen({super.key});

  @override
  State<CaptureScreen> createState() => _CaptureScreenState();
}

class _CaptureScreenState extends State<CaptureScreen> {
  double lat = 0, long = 0;
  double latSatker = -6.220356491711469, longSatker = 106.77335832668201;
  double totalDirection = 0.0;
  String address = "";
  bool servicestatus = false;
  bool haspermission = false;
  late Position position;
  late LocationPermission permission;
  late StreamSubscription<Position> positionStream;

  @override
  void initState() {
    checkGps();
    satkerLocation();
    super.initState();
  }

  satkerLocation() async {
    // final List<String> item = getListData(Keys.user);
    // print(item);

    final result = await getSatker(3);
    // setState(() {
    //   latSatker = result.latitude;
    //   longSatker = result.longitude;
    // });
  }

  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        setState(() {
          //refresh the UI
        });
        getLocation();
      }
    } else {
      print("GPS Service is not enabled, turn on GPS location");
    }
  }

  Future getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    getDistance(position);
    setState(() {
      lat = position.latitude;
      long = position.longitude;
    });

    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high, //accuracy of the location data
      distanceFilter: 100, //minimum distance (measured in meters) a
    );

    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      setState(() {
        lat = position.latitude;
        long = position.longitude;
      });

      double distanceInMeters = Geolocator.distanceBetween(
          latSatker, longSatker, position.latitude, position.longitude);
      double distanceInKiloMeters = distanceInMeters / 1000;
      double roundDistanceInKM =
          double.parse((distanceInKiloMeters).toStringAsFixed(2));

      print(distanceInKiloMeters);
    });

    // var address = await Geolocator.local.findAd
  }

  getDistance(pos) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(pos.latitude, pos.longitude);
    print(placemarks);
    double distanceInMeters =
        Geolocator.distanceBetween(latSatker, longSatker, lat, long);
    double distanceInKiloMeters = distanceInMeters / 1000;
    double roundDistanceInKM =
        double.parse((distanceInKiloMeters).toStringAsFixed(2));
    // print(distanceInKiloMeters);
    Placemark placemark = placemarks[0];
    String street = placemark.street.toString();
    String locality = placemark.locality.toString();
    String sublocality = placemark.subLocality.toString();
    String city = placemark.subAdministrativeArea.toString();
    String postalCode = placemark.postalCode.toString();

    setState(() {
      address = "$street $locality $sublocality $city $postalCode";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _alertWarning(),
              const SizedBox(
                height: 24,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("latitude $lat"),
                  Text("longitude $long"),
                  Text("lokasi di tentukan latitude $latSatker"),
                  Text("lokasi di tentukan longitude $longSatker"),
                  Text(address)
                ],
              ),
              Center(
                child: Image.asset(
                  "assets/f.png",
                  width: 250,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Keterangan",
                style: TextStyleConstants.kHeading5,
              ),
              const Card(
                color: AppColors.softGrey,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    maxLines: 5, //or null
                    decoration: InputDecoration.collapsed(
                      hintText: "Enter your text here",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Submit",
                    style: TextStyleConstants.kHeading6.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _alertWarning() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
    decoration: BoxDecoration(
      color: AppColors.yellow.withOpacity(0.1),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: AppColors.yellow,
        width: 1,
      ),
    ),
    child: Row(
      children: [
        const Icon(
          Icons.info_outline,
          color: AppColors.duneGrey,
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          "Lokasi anda sudah direkam",
          style: TextStyleConstants.kBody3,
        ),
      ],
    ),
  );
}
