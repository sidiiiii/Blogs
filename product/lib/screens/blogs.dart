import 'package:flutter/material.dart';
import 'package:product/widgets/ListTile.dart';

class Blogs extends StatefulWidget {
  const Blogs({super.key});

  @override
  State<Blogs> createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/culture');
            },
            child: customListTile(
                title: 'Culture',
                subtitle: 'Mohamed',
                imagePath: 'images/culture.jpg'),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/cea');
            },
            child: customListTile(
                title: 'North Land',
                subtitle: 'Ali',
                imagePath: 'images/icesea.jpg'),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/city');
            },
            child: customListTile(
                title: 'NewYork',
                subtitle: 'Adama',
                imagePath: 'images/city.jpg'),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/mountant');
            },
            child: customListTile(
                title: 'Mountant',
                subtitle: 'Esma',
                imagePath: 'images/mountant.jpg'),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/nature');
            },
            child: customListTile(
                title: 'Nature',
                subtitle: 'Sara',
                imagePath: 'images/nature.jpg'),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/picture');
            },
            child: customListTile(
                title: 'Photo Graphe',
                subtitle: 'Yacine',
                imagePath: 'images/picture.jpg'),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/tiger');
            },
            child: customListTile(
                title: 'Tiger', subtitle: 'Ali', imagePath: 'images/Tiger.jpg'),
          ),
          SizedBox(height: 40),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/my_blog');
              },
              child: Text(
                "Create your blog",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
