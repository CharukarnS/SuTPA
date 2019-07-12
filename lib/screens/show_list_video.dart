import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:su_tpa/models/su_video_model.dart';

import 'play_video.dart';

class ShowListVideo extends StatefulWidget {
  @override
  _ShowListVideoState createState() => _ShowListVideoState();
}

class _ShowListVideoState extends State<ShowListVideo> {
  //Explicit
  Firestore fireStore = Firestore.instance;
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshots;
  List<SuVideoModel> suVideoModels = [];

  // Method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readFireStore();
  }

  Future<void> readFireStore() async {
    CollectionReference collectionReference = fireStore.collection('SuVideo');
    subscription = await collectionReference.snapshots().listen((response) {
      snapshots = response.documents;
      for (var snapshot in snapshots) {
        String nameVideo = snapshot.data['Name'];
        String detailVideo = snapshot.data['Detail'];
        String pathImage = snapshot.data['PathImage'];
        String pathVideo = snapshot.data['PathVideo'];

        SuVideoModel suVideoModel =
            SuVideoModel(nameVideo, detailVideo, pathImage, pathVideo);
        setState(() {
          suVideoModels.add(suVideoModel);
        });

        // print('$pathVideo');
      }
    });
  }

  Widget showImage(int index) {
    return Container(
      margin: EdgeInsets.all(6.0),
      width: 180.0,
      height: 120.0,
      child: Image.network(
        suVideoModels[index].pathImage,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget showText(int index) {
    return Container(
      margin: EdgeInsets.all(6.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              suVideoModels[index].name,
              style: TextStyle(fontSize: 24.0, color: Colors.teal[700]),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(suVideoModels[index].detail),
          )
        ],
      ),
    );
  }

  Widget myDivider() {
    return Divider(
      height: 6.0,
      color: Colors.grey[700],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: ListView.builder(
        itemCount: suVideoModels.length,
        itemBuilder: (context, int index) {
          return GestureDetector(
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      showImage(index),
                      showText(index),
                    ],
                  ),
                  myDivider(),
                ],
              ),
            ),
            onTap: () {

              print('index = $index'); 

              var playRoute = MaterialPageRoute(
                  builder: (BuildContext context) => PlayVideo(suVideoModel: suVideoModels[index],));
                  Navigator.of(context).push(playRoute);
            },
          );
        },
      ),
    );
  }
}
