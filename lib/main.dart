import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MusicApp(),
    );
  }
}

class MusicApp extends StatefulWidget {
  @override
  _MusicAppState createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  // 再生しているかの状態
  bool playing = false;
  // メインの状態の再生ボタンの状態
  IconData playBtn = Icons.play_arrow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // メインUI
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          // グラデーション
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue[800],
                Colors.blue[200],
              ]),
        ),
        // 余白を含む親要素を定義
        child: Padding(
          // 上下と左右の余白を指定
          padding: EdgeInsets.only(
            top: 48.0,
          ),
          // 小要素を定義
          child: Container(
            // 小要素を縦に並べる定義
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 左に余白を持った要素
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  // テキストを追加
                  child: Text(
                    "Music Beats",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 38.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // 左に余白を持った要素
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Listen to your favorite Music",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                // 上の要素(テキスト)と下の要素(画像)の隙間を作るための要素
                SizedBox(
                  height: 24.0,
                ),
                // ジャケット画像
                Center(
                  child: Container(
                    width: 280.0,
                    height: 280.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.0),
                      image: DecorationImage(
                        image: AssetImage("assets/image.jpg"),
                      ),
                    ),
                  ),
                ),
                // 上の要素(画像)と下の要素(テキスト)の隙間を作るための要素
                SizedBox(
                  height: 18.0,
                ),
                // 曲名
                Center(
                  child: Text(
                    "Blue Music",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                // 上の要素と下の要素の隙間を作るための要素
                SizedBox(
                  height: 30.0,
                ),
                // 操作パネル
                Expanded(
                  child: Container(
                    // 上の角を丸くするためのデコレーション
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    // 操作パネルのパーツ群
                    child: Column(
                      // 中央に揃える
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // 操作パネルのパーツ群
                      children: [
                        // スキップ、再生ボタン
                        Row(
                          // 中央に揃える
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // 一つ前に戻るボタン
                            IconButton(
                              iconSize: 45.0,
                              color: Colors.blue,
                              onPressed: () {},
                              icon: Icon(
                                Icons.skip_previous,
                              ),
                            ),
                            // 再生・一時停止ボタン
                            IconButton(
                              iconSize: 62.0,
                              color: Colors.blue[800],
                              onPressed: () {
                                // 再生されているとき
                                if (!playing) {
                                  setState(() {
                                    // 再生しているときは、一時停止ボタンを表示
                                    playBtn = Icons.pause;
                                    playing = true;
                                  });
                                }
                                // 一時停止されたとき
                                else {
                                  setState(() {
                                    // 一時停止しているときは、再生ボタンを表示
                                    playBtn = Icons.play_arrow;
                                    playing = false;
                                  });
                                }
                              },
                              // 再生ボタンの状態をウォッチして更新
                              icon: Icon(playBtn),
                            ),
                            // 一つ先に進むボタン
                            IconButton(
                              iconSize: 45.0,
                              color: Colors.blue,
                              onPressed: () {},
                              icon: Icon(
                                Icons.skip_next,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
