import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:security_app/ui/style/app_colors.dart';
import 'package:security_app/utils/constants_utils.dart';
import 'package:security_app/ui/style/text_tyle_constants.dart';
import 'package:security_app/utils/shared_preferance_utils.dart';
import 'package:security_app/repositories/model/satker_model.dart';
import 'package:http/http.dart' as http;
import 'package:security_app/repositories/model/login_model.dart';

class CaptureScreen extends StatefulWidget {
  const CaptureScreen({super.key});

  @override
  State<CaptureScreen> createState() => _CaptureScreenState();
}

class _CaptureScreenState extends State<CaptureScreen> {
  String address = "";
  String addressInput = "";
  late Position position;
  bool servicestatus = false;
  bool haspermission = false;
  double totalDirection = 0.0;
  double lat = 0, long = 0;
  double latSatker = 0, longSatker = 0;
  late LocationPermission permission;
  late StreamSubscription<Position> positionStream;

  File? _image;
  dynamic _pickImageError;
  late final TextEditingController descriptionController =
      TextEditingController();

  @override
  void initState() {
    getkerLocation();
    super.initState();
  }

  Future<void> openCamera() async {
    final pickedImage = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);
    try {
      print(File(pickedImage!.path));
      setState(() {
        _image = File(pickedImage.path);
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  getkerLocation() async {
    String token = await Dataprefs.getSinggleData(Keys.token);
    List<String> data = await Dataprefs.getListData(Keys.satker);
    List<Satker> satker =
        data.map<Satker>((e) => Satker.fromJson(json.decode(e))).toList();
    checkGps(satker[0].latitude, satker[0].longitude);
  }

  checkGps(latitude, longitude) async {
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
        getLocation(latitude, longitude);
      }
    } else {
      print("GPS Service is not enabled, turn on GPS location");
    }
  }

  Future getLocation(latSatker, longSatker) async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      lat = position.latitude;
      long = position.longitude;
    });
    getDistance(position.latitude, position.longitude);

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
    });

    double distanceInMeters = Geolocator.distanceBetween(
        latSatker, longSatker, position.latitude, position.longitude);
    double distanceInKiloMeters = distanceInMeters / 1000;
    double roundDistanceInKM =
        double.parse((distanceInKiloMeters).toStringAsFixed(2));

    setState(() {
      totalDirection = distanceInKiloMeters;
    });
  }

  getDistance(lat, long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    // print(distanceInKiloMeters);
    Placemark placemark = placemarks[0];
    String street = placemark.street.toString();
    String locality = placemark.locality.toString();
    String sublocality = placemark.subLocality.toString();
    String city = placemark.subAdministrativeArea.toString();
    String postalCode = placemark.postalCode.toString();

    setState(() {
      address = street;
      addressInput = "$street $locality $sublocality $city $postalCode";
    });
  }

  Future<http.StreamedResponse> onPressButtom() async {
    String token = await Dataprefs.getSinggleData(Keys.token);

    List<String> data = await Dataprefs.getListData(Keys.satker);
    List<DataLogin> user =
        data.map<DataLogin>((e) => DataLogin.fromJson(json.decode(e))).toList();
    var stream = http.ByteStream(_image!.openRead());
    stream.cast();

    var length = await _image!.length();

    var request = http.MultipartRequest('POST',
        Uri.parse(ConstantsUtils.baseUrl + ConstantsUtils.activityStore));
    request.headers.addAll({
      'content-type': "multipart/form-data",
      'Authorization': 'Bearer $token'
    });
    request.fields['user_id'] = user[0].id.toString();
    request.fields['title'] = user[0].name;
    request.fields['location'] = addressInput;
    request.fields['Description'] = descriptionController.text;
    request.fields['latitude'] = lat.toString();
    request.fields['longitude'] = long.toString();
    request.fields['is_published'] = user[0].id.toString();
    request.fields['created_by'] = user[0].name;

    request.files.add(
        http.MultipartFile("image", stream, length, filename: "activity.jpg"));
    var response = await request.send();

    if (response.statusCode == 200) {
      setState(() {
        _image = null;
        const descriptionController = null;
      });
    } else {
      print("no bro");
    }

    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });

    return response;
    
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
              _alertWarning(address),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: _image == null
                    ? const Text("No Image")
                    : Image.file(_image!),
              ),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () async {
                    openCamera();
                  },
                  icon: const Icon(
                      Icons.camera_alt), //icon data for elevated button
                  label: const Text("Photo"),
                ),
              ),
              Text(
                "Keterangan",
                style: TextStyleConstants.kHeading5,
              ),
              Container(
                color: AppColors.softGrey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: descriptionController,
                    maxLines: 5, //or null
                    decoration: const InputDecoration.collapsed(
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
                  onPressed: _image != null
                      ? () async {
                          var response = await onPressButtom();
                          if (response.statusCode == 200) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Berhasil membuat aktivitas"),
                                backgroundColor: Colors.green,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Keterangan tidak boleh kosong!"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      : null,
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

Widget _alertWarning(address) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 6, 235, 113).withOpacity(0.1),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: const Color.fromARGB(204, 6, 235, 25),
        width: 1,
      ),
    ),
    child: Row(
      children: [
        const Icon(
          Icons.maps_home_work,
          color: AppColors.duneGrey,
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          "$address",
          style: TextStyleConstants.kBody3,
        ),
      ],
    ),
  );
}
