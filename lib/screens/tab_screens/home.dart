import 'dart:ui';

import 'package:facebook_clone/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLike = false;
  @override
  Widget build(BuildContext context) {
    // bool isLike = false;
    return Column(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 100,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(
                              'assets/166725329_285551419806852_7085544346633904116_n.jpg',
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "What's on your mind?",
                              labelStyle: const TextStyle(
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              AntDesign.camera,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Live",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 24,
                          width: 2,
                          color: Colors.grey.withOpacity(0.4),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.photo_size_select_actual_sharp,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Photos",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 24,
                          width: 2,
                          color: Colors.grey.withOpacity(0.4),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.location_on,
                              color: Colors.pink,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Chick In",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15),
              height: 100,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Data.dataList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return personCard(index: index);
                  }),
            ),
            Container(
              height: 230,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: Data.dataList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return storyCard(index: index);
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: Data.dataList.length,
                itemBuilder: (context, index) {
                  return post(index: index);
                },
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget post({required int index}) {
    return Data.dataList[index].isCreate
        ? Container()
        : Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage(Data.dataList[index].imgPath),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Data.dataList[index].userName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      Data.dataList[index].hour,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.public,
                                      color: Colors.grey,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const Icon(Icons.more_horiz),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  child: Image.asset(Data.dataList[index].postImage),
                ),
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            FontAwesomeIcons.solidThumbsUp,
                            color: Colors.blue[700],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            '100',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            '10 Comment',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isLike = !isLike;
                              });
                            },
                            child: Icon(
                              FontAwesomeIcons.thumbsUp,
                              color: isLike ? Colors.blue : Colors.grey,
                            ),
                          ),
                          Text(
                            'Like',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isLike ? Colors.blue : Colors.grey,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              Scaffold.of(context).showBottomSheet<void>(
                                  (BuildContext context) {
                                return Container(
                                  height: 500,
                                  color: Colors.white,
                                  child: Center(
                                    child: Column(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceEvenly,
                                      // mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(1),
                                                child: Icon(Icons.close),
                                              ),
                                              // const Text("Close BottomSheet"),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                            },
                            child: const Icon(FontAwesomeIcons.comment,
                                color: Colors.grey),
                          ),
                          const Text(
                            "Comment",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Icon(FontAwesomeIcons.share,
                                color: Colors.grey),
                          ),
                          const Text(
                            "Share",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                ),
              ],
            ),
          );
  }

  Widget storyCard({required int index}) {
    return Data.dataList[index].isCreate
        ? Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.withOpacity(0.2),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.7),
                  )),
              child: Stack(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 145,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                            image: AssetImage(Data.dataList[index].imgPath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      const Text(
                        'Create a\nStory',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                  Positioned(
                    top: 120,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              width: 130,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(Data.dataList[index].postImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(children: [
                Container(
                  height: 230,
                  width: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.10),
                        Colors.transparent,
                      ],
                      begin: FractionalOffset.bottomCenter,
                      end: FractionalOffset.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: CircleAvatar(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          Data.dataList[index].imgPath,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 8,
                    left: 8,
                    child: Text(
                      Data.dataList[index].userName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ]),
            ),
          );
  }

  Widget personCard({required int index}) {
    return Data.dataList[index].isCreate
        ? Center(
            child: Container(
              width: 120,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Colors.lightBlue,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    AntDesign.camera,
                    color: Colors.purple[900],
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Create\nRoom',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue[700],
                    ),
                  )
                ],
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(Data.dataList[index].imgPath),
            ),
          );
  }
}
