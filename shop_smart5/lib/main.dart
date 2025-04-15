import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {                         //https://codelabs.developers.google.com/codelabs/google-maps-in-flutter/index.html?index=..%2F..index#3 - 6/2/20

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {                      //https://codelabs.developers.google.com/codelabs/google-maps-in-flutter/index.html?index=..%2F..index#3 - 6/2/20
  GoogleMapController mapController;
  LatLng _center1 = const LatLng(52.9548, -1.1581);            //The coordinates of Nottingham are used here
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {                       //https://codelabs.developers.google.com/codelabs/google-maps-in-flutter/index.html?index=..%2F..index#3  - 6/2/20
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shop Smart Shop Sustainably'),
          backgroundColor: Colors.green,
        ),
        body: Stack(                                           //https://www.youtube.com/watch?v=hBL-zpC4rQA - 17/3/20
          children: <Widget>[                                  //A stack was used so that multiple widgets could be created and placed in this class
            _buildGoogleMap1(context),
            _buildContainer1(),

          ],

        ),
      ),
    );

  }

  Widget _buildContainer1() {                                    //https://www.youtube.com/watch?v=hBL-zpC4rQA - 17/3/20
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),                 //Created information boxes for each shop and
              child: _boxes1(                                     //looked up the address and opening time information for each shop
                  "Universal Works", "5 Broad St, Nottingham, NG1 3AJ", "Open weekdays 10am-6pm, Sundays 11am-4pm"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes1(
                  "White Rose 1", "16 Goose Gate, Nottingham, NG1 3FF", "Open weekdays 10am-6pm, Sundays 11am-4pm"),
            ),

            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes1(
                  "Urban Outfitters", "Victoria Centre, 13-15 Lower Parliament St, Nottingham, NG1 3QN", "No opening times available, sorry for the inconvenience"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes1(
                  "Jigsaw", "3 Victoria St, Nottingham, NG1 2EW", "Open weekdays 9:30am-6pm, Sunday 11am-5pm"
              ),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes1(
                  "Flannels", "34-36 Bridesmith Gate, Nottingham, NG1 2GQ", "Open weekdays 10am-6pm, Sunday 11am-5pm"
              ),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes1(
                  "Levi's", "21 Clumber St, Nottingham, NG1 3ED", "Open weekdays 10am-6pm, Sunday 11am-5pm"
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _boxes1(String shopName, String address, String openTime) {          //https://www.youtube.com/watch?v=hBL-zpC4rQA - 17/3/20
    return Container(                                                         //This widget was used to create the boxes
        child: new FittedBox(
            child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        width: 180,
                        height: 200,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: myDetailsContainer2(shopName, address, openTime)     //Calls the other widget that actually displays the information
                        )

                    )

                  ]

              ),
            )
        )
    );
  }

  Widget myDetailsContainer2(String shopName, String address, String openTime) {  //https://www.youtube.com/watch?v=hBL-zpC4rQA - 17/3/20
    return Column(                                                                //This widget displays the information on the shops in the boxes
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),

            child: Container(
                child: Text(shopName,
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                )),

          ),
          SizedBox(height:5.0),
          Container(
            child: Text(
              address,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16.0,
              ),
            )
          ),
          SizedBox(height:5.0),
          Container(
            child: Text(
              openTime,
              style: TextStyle(

              color: Colors.black87,
              fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ),
        ],
    );



  }

  Widget _buildGoogleMap1(BuildContext context) {                            //https://www.youtube.com/watch?v=hBL-zpC4rQA - 17/3/20
    return Container(
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
              target: _center1,
              zoom: 11.0
          ),
          markers: {                                                         //Stored the markers in the widget, so that they will appear on the map, when the app is launched
            universalMarker, roseMarker, urbanMarker, jigsawMarker, flannelsMarker, leviMarker
          },

        )
    );
  }

}



Marker universalMarker = Marker(                                              //https://www.youtube.com/watch?v=hBL-zpC4rQA - 17/3/20
  markerId: MarkerId('universal'),
  position: LatLng(52.9539206, -1.1462087),                                  //By looking up a place via Google Maps and going to see the directions, the coordinates can
  infoWindow: InfoWindow(title: 'Universal Works'),                          //be found in the URL
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
);

Marker roseMarker = Marker(                                                   //https://www.youtube.com/watch?v=hBL-zpC4rQA  - 17/3/20
  markerId: MarkerId('whiterose'),
  position: LatLng(52.8384477, -1.2792403),
  infoWindow: InfoWindow(title: 'White Rose 1'),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
);

Marker urbanMarker = Marker(                                                  //https://www.youtube.com/watch?v=hBL-zpC4rQA - 17/3/20
  markerId: MarkerId('urban'),
  position: LatLng(52.9553495, -1.1493788),
  infoWindow: InfoWindow(title: 'Urban Outfitters'),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
);

Marker jigsawMarker = Marker(                                                 //https://www.youtube.com/watch?v=hBL-zpC4rQA - 17/3/20
  markerId: MarkerId('jigsaw'),
  position: LatLng(52.9533151, -1.1493136),
  infoWindow: InfoWindow(title: 'Jigsaw'),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
);

Marker flannelsMarker = Marker(                                               //https://www.youtube.com/watch?v=hBL-zpC4rQA - 17/3/20
  markerId: MarkerId('flannels'),
  position: LatLng(52.9523053, -1.149598),
  infoWindow: InfoWindow(title: 'Flannels'),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
);

Marker leviMarker = Marker(                                                   //https://www.youtube.com/watch?v=hBL-zpC4rQA - 17/3/20
  markerId: MarkerId('levis'),
  position: LatLng(52.9542559, -1.1496442),
  infoWindow: InfoWindow(title: "Levi's"),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
);