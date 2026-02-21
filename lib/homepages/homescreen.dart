

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  LatLng? MyCurrentlocation;
  //LatLng? _currentPosition;
List<LatLng> latLngList = [];
Set<Marker> markers = {};

  
 
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Welcome to motorsbike',
          style: TextStyle(fontSize: 27, color: Colors.black, fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Column(
              children: [
                Container(
                    height: 250,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Column(
                        children: [
                          Expanded(
                            child: GoogleMap(
                              initialCameraPosition: CameraPosition(
                                target: MyCurrentlocation??LatLng(23.344, 23.448),
                                zoom: 15,
                              ),
                              markers: markers,
                              
                              
                            ),
                          ),
                          SizedBox(height: screenheight*0.01,),
                              GestureDetector(
                                onTap: () {
                                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen()));
                                },
                                child: Container(
                                          height: 40,
                                          width: 150,
                                            decoration: BoxDecoration(
                                               color: Colors.green,
                                            borderRadius: BorderRadius.circular(10),
                                                  ),
                                            alignment: Alignment.center,
                                                child: Text(
                                           'Tap to see nearby vehicle?',
                                            style: TextStyle(color: Colors.white),
                                             textAlign: TextAlign.center,
                                              ),
                                             )

                              )
                            
                        ],
                      ),
                    ),
                  ),
                
                SizedBox(height: screenheight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>BrawseRideScreen()));
                                },
                      child: Containvalue(
                        name: 'Browse Ride Plans',
                        subname: 'View availble pricing options',
                        icon: Icon(Icons.computer, size: 50, color: Colors.green),
                      ),
                    ),
                    GestureDetector(
                       onTap: () {
                                //  Navigator.push(context, MaterialPageRoute(builder: (context)=>StartGuildScreen()));
                                },
                      child: Containvalue(
                        name: 'Getting Started Guide',
                        subname: 'How to use Easy Motorbike',
                        icon: Icon(Icons.pages, size: 50, color: Colors.green),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenheight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>ZoneParkingRules()));
                                },
                      child: Containvalue(
                        name: 'Zones & park Rules',
                        subname: 'Avoid extra changes',
                        icon: Icon(Icons.stop, size: 50, color: Colors.green),
                      ),
                    ),
                    GestureDetector(
                       onTap: () {
                                //  Navigator.push(context, MaterialPageRoute(builder: (context)=>HowtoRide()));
                                },
                      child: Containvalue(
                        name: 'How to ride',
                        subname: 'Step-by-step on starting your trip',
                        icon: Icon(Icons.directions_bike, size: 50, color: Colors.green),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenheight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                       onTap: () {
                                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>HowtoPark()));
                                },
                      child: Containvalue(
                        name: 'How to Park',
                        subname: 'Park corrently to end your ride',
                        icon: Icon(Icons.local_parking, size: 50, color: Colors.green),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>NeedHelp()));
                      },
                      child: Containvalue(
                        name: 'Need help',
                        subname: 'Contact Us',
                        icon: Icon(Icons.help, size: 50, color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Containvalue extends StatelessWidget {
  String name;
  String subname;
  Icon icon;

  Containvalue({
    super.key,
    required this.name,
    required this.subname,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 160,
      decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(name, style: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.normal)),
              SizedBox(height: 10),
              Text(subname, style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.normal)),
              SizedBox(height: 13),
              icon
            ],
          ),
        ),
      ),
    );
  }
}