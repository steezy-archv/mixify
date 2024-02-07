import 'package:flutter/material.dart';
import '../../details/Songs.dart';
import '../music_main.dart';
import 'package:flutter/services.dart';

class YourListing extends StatefulWidget {
  const YourListing({super.key});

  @override
  State<YourListing> createState() => _YourListingState();
}

class _YourListingState extends State<YourListing> {
  _YourListingState() {
    for (int i = 0; i < Songs.songs.length; i++) {
      rows.add(
        TextButton(
          onPressed: (){
            Songs.songNumber=i;
            play();
          },
          child: Row(
            children: <Widget>[

              Image.asset(
                Songs.songs[i][1],
                width: 60,
                height: 60,
              ),
              const SizedBox(
                width: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Songs.songs[i][2],
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    Songs.songs[i][3],
                    style: const TextStyle(fontSize: 13, color: Colors.white60),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
      rows.add(
        Divider(height: 10,color: Colors.grey[800],)
      );
      likedSongs.add(Songs.songs[i][0]);
    }
    rows.add(SizedBox(height: 100,));
    songCard = Column(
      children: rows,
    );

  }
  List<Widget> rows = <Widget>[];
  List<String> likedSongs=[];
  late Column songCard;

  //MusicPlayer musicPlayer=MusicPlayer();

  late Widget body;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    body=SingleChildScrollView(child: songCard);
    return Scaffold(
        //floatingActionButton: FloatingButton.floatingButton(context),
        body: Container(
          color: Colors.black,
          /*decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurple,
                Colors.black,
              ],
            ),
          ),*/
          child: body,
        ),
      );
  }
}

