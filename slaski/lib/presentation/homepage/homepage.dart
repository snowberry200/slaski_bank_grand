import 'package:flutter/material.dart';
import '../widget/backgroundimage.dart';
import '../../layout/layout.dart';
import '../widget/list_of_images.dart' show data;

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url = '';
  List<String> ink = [];
  List<Map<String, dynamic>> images = [];
  @override
  void initState() {
    images = List.of(data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BackgroundImageWidget(
      image: Layout.isMobile(context)
          ? const AssetImage('images/hy.jpeg')
          : returnAssetImage(),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: Layout.isMobile(context)
              ? AppBar(
                  backgroundColor: Colors.white,
                  title: const Padding(
                    padding: EdgeInsets.only(top: 0.0, left: 20, right: 30),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Image(
                          width: 100,
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.contain,
                          height: 30,
                          image: AssetImage('images/ing.png')),
                    ),
                  ),
                  elevation: 0,
                )
              : null,
          body: const Layout()));

  String returnImage() {
    for (int i = 0; i < images.length; i++) {
      for (String key in images[i].keys) {
        url = images[i][key];
      }
      ink.add(url);
      ink.sort();
      if (ink.isNotEmpty) {
        url = ink[i];
      }

      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          url;
        });
      });
    }
    return url;
  }

  AssetImage returnAssetImage() => AssetImage(returnImage());
}

OutlineInputBorder myfocusborder() => const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(
      style: BorderStyle.solid,
      color: Colors.deepOrangeAccent,
      width: 3,
    ));
