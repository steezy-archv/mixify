import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../details/Songs.dart';
import '../music_main.dart';


class ListeningHistory extends StatefulWidget {
  const ListeningHistory({super.key});

  @override
  State<ListeningHistory> createState() => _ListeningHistoryState();
}

class _ListeningHistoryState extends State<ListeningHistory> {

  _ListeningHistoryState(){
    for (int i = Songs.listeningHistory.length-1; i >=0; i--) {
      rows.add(
        TextButton(
          onPressed: (){
            setState(() {
              for(int j=0;j<Songs.listeningHistory.length;j++){
                if(DeepCollectionEquality().equals(Songs.listeningHistory[i], Songs.songs[j])==true){
                  Songs.songNumber=j;
                }
              }
              play();
            });

          },
          child: Row(
            children: <Widget>[

              Image.asset(
                Songs.listeningHistory[i][1],
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
                    Songs.listeningHistory[i][2],
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    Songs.listeningHistory[i][3],
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
      listeningHistory.add(Songs.listeningHistory[i][0]);
    }
    rows.add(SizedBox(height: 100,));
    songCard = Column(
      children: rows,
    );

  }

  List<Widget> rows = <Widget>[];
  List<String> listeningHistory=[];
  late Column songCard;


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return Scaffold(
      backgroundColor: Colors.grey[900],
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
        child: songCard,
      ),

    );
  }
}
