import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> stories = [
    {"image": "lib/images/person1.jpg", "name": "Your Story"},
    {"image": "lib/images/person2.jpg", "name": "Hanadi"},
    {"image": "lib/images/person3.jpg", "name": "Aya"},
    {"image": "lib/images/person4.jpg", "name": "Lamis"},
    {"image": "lib/images/person5.jpg", "name": "Hsen"},
    {"image": "lib/images/person6.jpg", "name": "MSbeity"},
  ];
  final List<Map<String, dynamic>> posts = [
    {
      "imageUrl": "lib/images/person1.jpg",
      "posts": [
        "lib/images/food1.jpg",
        "lib/images/food2.jpg",
        "lib/images/food3.jpg",
        "lib/images/food4.jpg",
        "lib/images/food5.jpg"
      ],
      "isFavorized": false,
      "location": "Macdonalds",
      "username": "Mohammad Sbeity",
      "likes": [
        {"imageUrl": "lib/images/person1.jpg", "username": "MSbeity"},
        {"imageUrl": "lib/images/person1.jpg", "username": "MSbeity"},
        {"imageUrl": "lib/images/person1.jpg", "username": "MSbeity"}
      ],
      "caption": "We live to eat",
      "isVerified": false
    },
    {
      "imageUrl": "lib/images/person2.jpg",
      "posts": [
        "lib/images/post1.jpg",
      ],
      "location": null,
      "username": "Hanadi",
      "isFavorized": true,
      "likes": [
        {"imageUrl": "lib/images/person1.jpg", "username": "MSbeity"},
        {"imageUrl": "lib/images/person1.jpg", "username": "MSbeity"},
        {"imageUrl": "lib/images/person1.jpg", "username": "MSbeity"}
      ],
      "caption": "This is a new post to show you guys",
      "isVerified": false
    },
    {
      "imageUrl": "lib/images/person3.jpg",
      "posts": [
        "lib/images/travel1.jpg",
        "lib/images/travel2.jpg",
        "lib/images/travel3.jpg",
        "lib/images/travel4.jpg",
      ],
      "location": "Tokyo , Japan",
      "isFavorized": false,
      "username": "Aya",
      "likes": [
        {"imageUrl": "lib/images/person1.jpg", "username": "MSbeity"},
        {"imageUrl": "lib/images/person1.jpg", "username": "MSbeity"},
        {"imageUrl": "lib/images/person1.jpg", "username": "MSbeity"}
      ],
      "caption": "Travelled the world !!!",
      "isVerified": true
    },
    {
      "imageUrl": "lib/images/person4.jpg",
      "posts": [
        "lib/images/post2.jpg",
      ],
      "location": null,
      "username": "Lamis",
      "isFavorized": false,
      "likes": [
        {"imageUrl": "lib/images/person1.jpg", "username": "MSbeity"},
        {"imageUrl": "lib/images/person1.jpg", "username": "MSbeity"},
        {"imageUrl": "lib/images/person1.jpg", "username": "MSbeity"}
      ],
      "caption": "No caption needed.",
      "isVerified": true
    },
    {
      "imageUrl": "lib/images/person5.jpg",
      "posts": [
        "lib/images/post3.jpg",
      ],
      "location": "Somewhere on earth",
      "isFavorized": true,
      "username": "Hsen",
      "likes": [
        {"imageUrl": "lib/images/person1.jpg", "username": "MSbeity"},
        {"imageUrl": "lib/images/person1.jpg", "username": "MSbeity"},
        {"imageUrl": "lib/images/person1.jpg", "username": "MSbeity"}
      ],
      "caption": "God's heaven on ground",
      "isVerified": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const Icon(
          Icons.camera_alt_outlined,
          color: Colors.black,
          size: 30,
        ),
        title: Container(
          height: 50,
          width: 150,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/images/Instagram_logo.png"))),
        ),
        centerTitle: true,
        actions: [
          Row(
            children: const [
              FaIcon(
                FontAwesomeIcons.tv,
                color: Colors.black,
                size: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.navigate_next,
                color: Colors.black,
                size: 30,
              ),
              SizedBox(
                width: 10,
              )
            ],
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  return Story(
                    name: stories[index]["name"],
                    imagePath: stories[index]["image"],
                  );
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Post(
                    iconUrl: posts[index]["imageUrl"],
                    images: posts[index]["posts"],
                    name: posts[index]["username"],
                    likes: posts[index]["likes"],
                    caption: posts[index]["caption"],
                    location: posts[index]["location"],
                    isVerified: posts[index]["isVerified"],
                  );
                }),
          )
        ],
      ),
    );
  }
}

class Post extends StatefulWidget {
  const Post({
    Key? key,
    required this.iconUrl,
    required this.name,
    this.location,
    required this.isVerified,
    this.caption,
    required this.images,
    required this.likes,
  }) : super(key: key);
  final String iconUrl;
  final String name;
  final String? location;
  final bool isVerified;
  final List<Map<String, dynamic>>? likes;
  final String? caption;
  final List<String> images;

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  PageController indicatorController = PageController();
  bool isVerified = false;

  bool isSaved = false;
  int indexIndicator = 0;
  bool isFavorized = false;
  @override
  void initState() {
    super.initState();
    isVerified = widget.isVerified;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      height: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(widget.iconUrl),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            isVerified
                                ? Image.asset(
                                    "lib/images/verification_tick.png",
                                    fit: BoxFit.cover,
                                    width: 15,
                                    height: 15,
                                  )
                                : Container()
                          ],
                        ),
                        widget.location != null
                            ? Text(
                                widget.location!,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              )
                            : Container()
                      ],
                    )
                  ],
                ),
                Icon(Icons.more_horiz)
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 400,
                viewportFraction: 1,
                autoPlay: false,
                initialPage: 0,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    indexIndicator = index;
                  });
                },
              ),
              items: widget.images
                  .map((e) => Image.asset(
                        e,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: 400,
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    isFavorized
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                isFavorized = !isFavorized;
                              });
                            },
                            child: const Icon(
                              Icons.favorite,
                              size: 30,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                isFavorized = !isFavorized;
                              });
                            },
                            child: const Icon(
                              Icons.favorite_border_outlined,
                              size: 30,
                            ),
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    const FaIcon(FontAwesomeIcons.comment),
                    const SizedBox(
                      width: 10,
                    ),
                    const FaIcon(FontAwesomeIcons.arrowUpLong)
                  ],
                ),
                widget.images.length > 1
                    ? AnimatedSmoothIndicator(
                        activeIndex: indexIndicator,
                        count: widget.images.length,
                        effect: SlideEffect(
                            dotHeight: 8,
                            dotWidth: 8,
                            strokeWidth: 1,
                            dotColor: Colors.grey,
                            activeDotColor: Colors.blue),
                      )
                    : Container(),
                isSaved
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            isSaved = !isSaved;
                          });
                        },
                        child: Image.asset(
                          "lib/images/saved.png",
                          width: 30,
                          height: 30,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            isSaved != isSaved;
                          });
                        },
                        child: Image.asset(
                          "lib/images/notsaved.png",
                          width: 30,
                          height: 30,
                        ),
                      )
              ],
            ),
          ),
          widget.likes!.isNotEmpty
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(widget.likes![0]["imageUrl"]),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Liked by ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                        TextSpan(
                            text: "${widget.likes![0]["username"]}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: widget.likes!.length > 1 ? "and " : "",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                        TextSpan(
                            text: widget.likes!.length > 1
                                ? "${widget.likes!.length - 1} others"
                                : "",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold))
                      ]))
                    ],
                  ),
                )
              : Container(),
          const SizedBox(
            height: 10,
          ),
          widget.caption != null
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "${widget.name}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: widget.caption!,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500))
                  ])),
                )
              : Container()
        ],
      ),
    );
  }
}

class Story extends StatelessWidget {
  const Story({
    Key? key,
    required this.name,
    required this.imagePath,
  }) : super(key: key);
  final String name;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagePath), fit: BoxFit.cover),
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: Colors.red,
              )),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          name,
          style:
              TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
