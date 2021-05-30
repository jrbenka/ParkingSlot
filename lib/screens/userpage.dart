import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kparking/Extras/Bottomsheet.dart';
import 'package:kparking/Extras/recents.dart';
import 'package:kparking/paint/dart/paint.dart';
// import 'package:quick_park/Paint/CustomPaintHome.dart';
// import 'package:quick_park/Transitions/FadeTransition.dart';
// import 'package:quick_park/Pages/map.dart';

class UserPage extends StatefulWidget {
  UserPage({Key key}) : super(key:key);
  static const String id = 'userpage';
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'K Parking',
            style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
                fontFamily: 'Quickstand'
            ),
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Stack(
        children: <Widget>[
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Users')
                  .doc(FirebaseAuth.instance.currentUser.uid)
                  .collection('Coins')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView(
                  children: snapshot.data.docs.map((document) {
                    return Container(
                        child: Row(
                          children: [
                            Text("Coin: ${document.id}"),
                            Text(
                                "Price: ${getValue(document.id, document.data()['Amount'])}"
                            ),
                          ],
                        ));
                  }).toList(),
                );
              }
          ),
          paint_home(),
          Column(
            children: <Widget>[
              Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                  ),
              Padding(
                padding: const EdgeInsets.only(left: 28,top: 40,right: 28,bottom: 10),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    side: BorderSide.none,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListTile(
                      title: TextField(
                        enabled: false,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Available Locations',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[700],
                                letterSpacing: 0.2
                            )
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Recents(),
              Visibility(
                visible: _visibility,
                child: DraggableSheet(),
              ),
            ],
          ),

        ],
      ),
      drawer: new Drawer(

        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Name",style: TextStyle(fontSize: 20),),
              accountEmail:Text ("email"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("N",
                  style: TextStyle(color: Colors.black,fontSize: 20),
                ),
              ),
            ),
             ListTile(
              title: Text('About'),
            ),
            ListTile(
              title: Text('Contact:'),
            ),
            ListTile(
              title: Text('Close'),
              trailing: Icon(Icons.exit_to_app),
              onTap: ()=> Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }
  bool _visibility = false;

  getValue(String id, data) {}
}