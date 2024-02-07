import 'package:flutter/material.dart';
import '../music_main.dart';
import 'your_music_listing.dart';
import 'music_history.dart';

class MusicAppBar {



  static appBar(String appBarTitle) {

    return AppBar(
      title: Text(appBarTitle),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
      shadowColor: Colors.transparent,
      toolbarHeight: 50,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[

              ElevatedButton(
                onPressed: () {
                  body=YourListing();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[800],
                ),
                child: Container(
                  decoration: BoxDecoration(

                  ),
                  child: const Text(
                    "Your Listing",
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  body=ListeningHistory();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[800],
                ),
                child: const Text(
                  "History",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
