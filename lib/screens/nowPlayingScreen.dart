import 'package:flutter/material.dart';
import 'package:muze/constants.dart';
import 'package:muze/controllers/songPlayerController.dart';
import 'package:muze/modules/song.dart';
import 'package:muze/widgets/customButton.dart';

class NowPlaying extends StatelessWidget {
  final songPlayerController = SongPlayerController.to;
  Song song;
  NowPlaying(this.song);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.navigate_before_outlined,
                  color: Colors.white70,
                ),
                Text('Now Playing'),
                Row(
                  children: [
                    Icon(
                      Icons.playlist_play_outlined,
                      color: Colors.white70,
                    ),
                    Icon(
                      Icons.more_vert_outlined,
                      color: Colors.white70,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              width: width / 1.5,
              height: width / 1.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('res/album.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(width / 0.75),
                color: Colors.deepPurpleAccent,
              ),
            ),
            LinearProgressIndicator(),
            SizedBox(
              height: height / 15,
            ),
            Text(
              'Bana',
              style: kSongnameTextStyle.copyWith(
                fontSize: 27,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Text(
              'Sapashini',
              style: kArtistnameTextStyle.copyWith(
                fontSize: 20,
                color: Colors.white60,
              ),
            ),
            SizedBox(
              height: height / 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.fast_rewind_rounded,
                  size: 35,
                ),
                CustomButton(
                  width: width,
                  size: 5,
                  iconData: Icons.pause_outlined,
                  isToggled: songPlayerController.isPlaying,
                ),
                Icon(
                  Icons.fast_forward_rounded,
                  size: 35,
                ),
              ],
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    width: width,
                    iconData: Icons.favorite,
                    size: 6,
                    isToggled: songPlayerController.isFavorite,
                  ),
                  CustomButton(
                    width: width,
                    iconData: Icons.shuffle,
                    size: 6,
                    isToggled: songPlayerController.isShuffle,
                  ),
                  CustomButton(
                    width: width,
                    iconData: Icons.repeat,
                    size: 6,
                    isToggled: songPlayerController.isPlaying,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}