import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mixify/presentation/widget/music_history.dart';
import 'package:mixify/presentation/widget/your_music_listing.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../details/Songs.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

Widget body = YourListing();
String appBarTitle = "Your Listing";

bool shuffle = false;
bool isPlaying = false;
late String currentSong = Songs.songs[Songs.songNumber][0];
Duration duration = Duration.zero;
Duration position = Duration.zero;
late List<List<String>> randomSongs = [];
bool loop = false;
final AudioPlayer audioPlayer = AudioPlayer();

late Function play;

class MusicMain extends StatefulWidget {
  const MusicMain({super.key});

  @override
  State<MusicMain> createState() => _MusicMainState();
}

class _MusicMainState extends State<MusicMain> {
  _MusicMainState() {
    for (int i = 0; i < Songs.songs.length; i++) {
      randomSongs.add(Songs.songs[i]);
    }
  }

  void randomize() {
    Random random = Random();
    for (int i = 0; i < Songs.songs.length; i++) {
      int a = random.nextInt(Songs.songs.length);
      int b = random.nextInt(Songs.songs.length);
      List<String> temp = randomSongs[a];
      randomSongs[a] = randomSongs[b];
      randomSongs[b] = temp;
    }
    setState(() {
      for (int i = 0; i < Songs.songs.length; i++) {
        if (DeepCollectionEquality()
                .equals(randomSongs[i], Songs.songs[Songs.songNumber]) ==
            true) {
          print("Yes");
          Songs.songNumber = i;
          break;
        }
      }
    });
  }

  void derandomize() {
    setState(() {
      for (int i = 0; i < Songs.songs.length; i++) {
        if (listEquals(Songs.songs[i], randomSongs[Songs.songNumber])) {
          Songs.songNumber = i;
          break;
        }
      }
    });
  }

  void playSong() async {
    //await audioPlayer.pause();
    List<String> temp = Songs.songs[Songs.songNumber];
    Songs.listeningHistory.remove(Songs.songs[Songs.songNumber]);
    Songs.listeningHistory.add(temp);
    await audioPlayer.play(AssetSource(currentSong));
  }

  void dispose() {
    audioPlayer.stop();
    isPlaying = false;
    super.dispose();
  }

  void init() async {
    await audioPlayer.pause();
    setState(() {
      //duration=Duration.zero;
      //position=Duration.zero;
      if (loop)
        audioPlayer.setReleaseMode(ReleaseMode.loop);
      else
        audioPlayer.setReleaseMode(ReleaseMode.release);
      if (Songs.songNumber < 0)
        Songs.songNumber = Songs.songs.length - 1;
      else if (Songs.songNumber > Songs.songs.length - 1) Songs.songNumber = 0;
      if (!shuffle)
        currentSong = Songs.songs[Songs.songNumber][0];
      else
        currentSong = randomSongs[Songs.songNumber][0];
      if (isPlaying) playSong();
    });
  }

  void initState() {
    super.initState();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        if (newPosition.inSeconds == duration.inSeconds) {
          if (!loop) Songs.songNumber++;
          init();
        }
        position = newPosition;
        if (!shuffle)
          currentSong = Songs.songs[Songs.songNumber][0];
        else
          currentSong = randomSongs[Songs.songNumber][0];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    play = () {
      setState(() {
        isPlaying = true;
        currentSong = Songs.songs[Songs.songNumber][0];
        playSong();
      });
    };
    return SlidingUpPanel(
      body: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle,
              style:
                  GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.black,
          elevation: 10,
          toolbarHeight: 70,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 160,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          body = YourListing();
                          appBarTitle = "Your Listing";
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: EdgeInsets.all(5),
                      ),
                      child: Container(
                        child: const Text(
                          "Your Listing",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                    width: 160,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          body = ListeningHistory();
                          appBarTitle = "History";
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: EdgeInsets.all(5),
                      ),
                      child: const Text(
                        "History",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

        ),

        body: body,
      ),
      minHeight: 100,
      maxHeight: 800,
      panel: Scaffold(
        backgroundColor: Colors.grey[850],
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    shuffle
                        ? randomSongs[Songs.songNumber][1]
                        : Songs.songs[Songs.songNumber][1],
                    width: 350,
                    height: 350,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  shuffle
                      ? randomSongs[Songs.songNumber][2]
                      : Songs.songs[Songs.songNumber][2],
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  shuffle
                      ? randomSongs[Songs.songNumber][3]
                      : Songs.songs[Songs.songNumber][3],
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  activeColor: Colors.deepPurple,
                  inactiveColor: Colors.deepPurple[200],
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await audioPlayer.seek(position);
                    //await audioPlayer.resume();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        DateFormat('mm:ss').format(
                            DateTime.fromMillisecondsSinceEpoch(
                                position.inMilliseconds)),
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        DateFormat('mm:ss').format(
                            DateTime.fromMillisecondsSinceEpoch(
                                (duration).inMilliseconds)),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.shuffle_outlined,
                        color: shuffle ? Colors.purple[700] : Colors.grey,
                      ),
                      onPressed: () {
                        if (shuffle) {
                          shuffle = false;
                          derandomize();
                        } else {
                          shuffle = true;
                          randomize();
                        }
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.skip_previous,
                        color: Colors.grey,
                      ),
                      iconSize: 30,
                      onPressed: () {
                        Songs.songNumber--;
                        loop = false;
                        init();
                      },
                    ),
                    CircleAvatar(
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            setState(() async {
                              if (isPlaying) {
                                await audioPlayer.pause();
                                isPlaying = false;
                              } else {
                                playSong();
                                isPlaying = true;
                              }
                            });
                          },
                          icon: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                          ),
                          iconSize: 40,
                        ),
                      ),
                      radius: 30,
                      backgroundColor: Colors.deepPurple,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.skip_next,
                        color: Colors.grey,
                      ),
                      iconSize: 30,
                      onPressed: () {
                        Songs.songNumber++;
                        loop = false;
                        init();
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.loop_outlined,
                        color: loop ? Colors.purple[700] : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          if (loop)
                            loop = false;
                          else
                            loop = true;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
