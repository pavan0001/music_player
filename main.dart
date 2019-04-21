import 'package:flutter/material.dart';
import 'package:flute_music_player/flute_music_player.dart';
void main()=>runApp(new MaterialApp(
                  debugShowCheckedModeBanner: false,
                    title: "tab",
                    home: new MyApp()));

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  MusicFinder audioPlayer;
  var _songs;
  @override
  void initState()  {
    super.initState();
    initPlayer();
  }
  void initPlayer() async{
    audioPlayer=new MusicFinder();
    var songs=await MusicFinder.allSongs();
    songs=new List.from(songs);
    setState(() {
      _songs=songs;
    });
  }

  Future _playlocal(String url) async{
    final result=await audioPlayer.play(url,isLocal: true);
  }

  @override
  Widget build(BuildContext context) {

    Widget home(){
      return new Scaffold(
      appBar: new AppBar(centerTitle: true,title:new Text("MUSICS"),backgroundColor:Colors.green,
      ),
      body: new ListView.builder(itemCount: _songs.length,itemBuilder: (context,int index){
      return new ListTile(
      leading: new CircleAvatar(
      child: new Text(_songs[index].title[0]),backgroundColor: Colors.green,
      ),
      title: new Text(_songs[index].title),
      onTap: ()=>_playlocal(_songs[index].uri),);
      }),
      );
    }

    return new  MaterialApp(
      home: home(),
    );
  }
}
