import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mixify/presentation/movie_home_page.dart';
import 'package:mixify/presentation/music_home_page.dart';
import 'package:mixify/presentation/music_main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double musicImageWidth = 100;
  double movieImageWidth = 100;

  String musicImageLink =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Spotify_icon.svg/1982px-Spotify_icon.svg.png";
  String movieImageLink =
      "https://static.vecteezy.com/system/resources/previews/017/396/804/original/netflix-mobile-application-logo-free-png.png";

  String musicLabel = "";
  String movieLabel = "";

  double musicButtonOpacity = 1.0;
  double moviesButtonOpacity = 1.0;

  String musicButtonTitle = "Music";
  String moviesButtonTitle = "Movies";

  void init() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    musicImageWidth = 100;
    movieImageWidth = 100;

    musicLabel = "";
    movieLabel = "";

    musicButtonOpacity = 1.0;
    moviesButtonOpacity = 1.0;

    musicButtonTitle = "Music";
    moviesButtonTitle = "Movies";
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '             Mixify',
                style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, )
                ),
              TextSpan(text: "\n"),
              TextSpan(
                text: "Music, Movies & Magic",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white60,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(60),
            top: Radius.circular(60),
          ),
        ),
        toolbarHeight: 70,
      ),*/
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: '             Mixify',
                    style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, )
                ),
                TextSpan(text: "\n"),
                TextSpan(
                  text: "Music, Movies & Magic",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white60,
                  ),
                ),
              ],
            ),
          ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF6100FF), Color(0xFF8921C9)],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: TextButton(
        onPressed: () {
          setState(() {
            init();
          });
        },
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: Center(
          /*child: Column(
            children: [
              Container(
                height: 200,
                width: 500,
                color: Colors.deepPurpleAccent,

              ),
            ],
          ),*/
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    musicLabel,
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.deepPurple,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(
                        () {
                          //Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const MusicMain()));
                        }
                      );
                    },
                    onLongPress: () {
                      setState(() {
                        musicImageWidth = 150;
                        movieImageWidth = 50;
                        musicLabel = "Listen to music";
                        movieLabel = "";
                        musicButtonOpacity = 1;
                        moviesButtonOpacity = 0.4;
                        musicButtonTitle = "Music";
                        moviesButtonTitle = "";
                      });
                    },
                    child: SizedBox(
                      width: musicImageWidth,
                      height: musicImageWidth,
                      child: Opacity(
                        opacity: musicButtonOpacity,
                        child: Icon(
                          Icons.music_note_sharp,
                          size: musicImageWidth,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    musicButtonTitle,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 150.0),
                child: VerticalDivider(
                  color: Colors.grey[700],
                  width: 40,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    movieLabel,
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.deepPurple,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MovieHomeScreen())
                      );
                    },
                    onLongPress: () {
                      setState(() {
                        movieImageWidth = 150;
                        musicImageWidth = 50;
                        movieLabel = "Watch movies";
                        musicLabel = "";
                        musicButtonOpacity = 0.4;
                        moviesButtonOpacity = 1;
                        musicButtonTitle = "";
                        moviesButtonTitle = "Movies";
                      });
                    },
                    child: SizedBox(
                      width: movieImageWidth,
                      height: movieImageWidth,
                      child: Opacity(
                        opacity: moviesButtonOpacity,
                        child: Icon(
                          Icons.local_movies_rounded,
                          size: movieImageWidth,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    moviesButtonTitle,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
            ],
          ),


        ),
      ),
    );
  }
}
