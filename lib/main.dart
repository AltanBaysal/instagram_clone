import 'package:flutter/material.dart';

void main() {
  runApp(const InstagramClone());
}

class InstagramClone extends StatelessWidget {
  const InstagramClone({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

//HomePage ✅
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Header(),
            Stories(),
            Posts(),
            NavBar(),
          ],
        ),
      ),
    );
  }
}

//Header✅
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/icons/logo.png"),
          Row(
            children: [
              Image.asset("assets/icons/empty_like.png"),
              const SizedBox(width: 20),
              Image.asset("assets/icons/message.png"),
              const SizedBox(width: 20),
              Image.asset("assets/icons/add.png"),
            ],
          ),
        ],
      ),
    );
  }
}

//Stories✅
class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 15,
        itemBuilder: (context, index) {
          return Story(index: index);
        },
      ),
    );
  }
}

//✅
class Story extends StatelessWidget {
  const Story({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final String image = "assets/images/${index % 7}.jpg";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 30,
        child: Column(
          children: [
            PP(image: image, radius: 30),
            const SizedBox(height: 10),
            const Text("GDSC"),
          ],
        ),
      ),
    );
  }
}

//Posts✅
class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Post(index: index);
        },
      ),
    );
  }
}

//Post✅
class Post extends StatelessWidget {
  const Post({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostHeader(index: index),
        PostImage(index: index),
        const PostBottom(),
        const Divider(color: Colors.grey, thickness: 1.5),
      ],
    );
  }
}

//PostHeader ✅
class PostHeader extends StatelessWidget {
  const PostHeader({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final String image = "assets/images/${index % 7}.jpg";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              PP(radius: 20, image: image),
              const SizedBox(width: 10),
              const Text(
                "GDSC",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Image.asset("assets/icons/dots.png"),
        ],
      ),
    );
  }
}

//PostImage✅
class PostImage extends StatelessWidget {
  const PostImage({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final String image = "assets/images/${(index * 3) % 7}.jpg";
    return Image.asset(image);
  }
}

//PostBottom ✅
class PostBottom extends StatelessWidget {
  const PostBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset("assets/icons/like.png"),
              const SizedBox(width: 12),
              Image.asset("assets/icons/comment.png"),
              const SizedBox(width: 12),
              Image.asset("assets/icons/send.png"),
            ],
          ),
          Image.asset("assets/icons/save.png"),
        ],
      ),
    );
  }
}

//NavBar✅
class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/icons/home.png"),
            Image.asset("assets/icons/search.png"),
            Image.asset("assets/icons/reel.png"),
            Image.asset("assets/icons/shop.png"),
            const PP(radius: 12, image: "assets/images/0.jpg"),
          ],
        ),
      ),
    );
  }
}

//PP✅
class PP extends StatelessWidget {
  const PP({super.key, required this.radius, required this.image});
  final double radius;
  final String image;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage(image),
    );
  }
}
