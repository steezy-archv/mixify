import 'package:flutter/material.dart';
import 'music_history.dart';
import 'your_music_listing.dart';



class AppNavigator{


  static appDrawer(BuildContext context){
    String username="faruk_shihab";
    return Drawer(
      backgroundColor: Colors.grey[800],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(

            accountEmail: Text(""),
            accountName: Text(
              username,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
              ),

            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://cdn.vox-cdn.com/thumbor/PzidjXAPw5kMOXygTMEuhb634MM=/11x17:1898x1056/1200x800/filters:focal(807x387:1113x693)/cdn.vox-cdn.com/uploads/chorus_image/image/72921759/vlcsnap_2023_12_01_10h37m31s394.0.jpg",

              ),
            ),
            decoration: BoxDecoration(

              color: Colors.purple[700],
            ),
          ),

          TextButton(
            onPressed: (){
              Navigator.pop(context);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>YourListing()));
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>LikedSongs()));
            },
            child: ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.grey[400],
              ),
              title: Text(
                "Liked Songs",
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 18,
                ),
              ),
            ),
          ),

          TextButton(
            onPressed: (){
              Navigator.pop(context);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ListeningHistory()));
            },
            child: ListTile(
              leading: Icon(
                Icons.history,
                color: Colors.grey[400],
              ),
              title: Text(
                "Listening History",
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],

      ),

    );
  }
}