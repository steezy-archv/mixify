import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mixify/presentation/widget/setFonts.dart';
import '../../details/MovieDetails.dart';
import '../../details/TvSeriesDetail.dart';

Widget sliderlist(
    List firstlistname, String categorytitle, String type, itemlength) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 15, bottom: 40),
        child: titletext(categorytitle)),
    Container(
        height: 250,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: itemlength,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    if (type == 'movie') {
                      // print(firstlistname[index]['id']);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetails(
                                    id: firstlistname[index]['id'],
                                  )));
                    } else if (type == 'tv') {
                      // print(firstlistname[index]['id']);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TvSeriesDetails(
                                  id: firstlistname[index]['id'])));
                    }
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.3),
                                  BlendMode.darken),
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${firstlistname[index]['poster_path']}'),
                              fit: BoxFit.cover)),
                      margin: EdgeInsets.only(left: 13),
                      width: 170,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(top: 7, left: 8),
                                child: datetext(firstlistname[index]['Date'])),
                            Padding(
                                padding:
                                    const EdgeInsets.only(top: 7, right: 8),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            bottom: 2,
                                            left: 5,
                                            right: 5),
                                        child: Row(
                                            //row for rating
                                            children: [
                                              Icon(Icons.star,
                                                  color: Colors.deepPurpleAccent,
                                                  size: 15),
                                              SizedBox(width: 2),
                                              ratingtext(firstlistname[index]
                                                      ['vote_average']
                                                  .toString())
                                            ]))))
                          ])));
            })),
    SizedBox(height: 20)
  ]);
}

////////////////////////////////////////////////////////////////////////////
/////////////////////////// Drawer ///////////////////////////
////////////////////////////////////////////////////////////////////////////
