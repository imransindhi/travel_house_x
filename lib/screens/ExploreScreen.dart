import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
{
  PageController pageController;
  // image list
  List<String> images =
      [
        'https://images.unsplash.com/photo-1505678261036-a3fcc5e884ee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
        'https://images.unsplash.com/photo-1507120410856-1f35574c3b45?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
        'https://images.unsplash.com/photo-1502818364365-08cda033fee1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
      ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 1, viewportFraction: 0.6);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: pageController,
          itemCount: images.length,
          itemBuilder: (context, position){
            return imageSlider(position);
          }
          ),
    );
  }

  imageSlider(int index)
  {
      return AnimatedBuilder(
        animation: pageController,
        builder: (context, widget){
          double value = 1;
          if (pageController.position.haveDimensions)
            {
              value = pageController.page - 1;
              value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
            }
          return Container(
            child : Align(
              alignment: Alignment.topCenter,
            child: SizedBox(
              height: Curves.easeInOutExpo.transform(value) * 200,
              width: Curves.easeInOutExpo.transform(value) *300,
              child: widget,
            ),
            ),
          );

        },
        child: Container(
          child: Card(
            elevation: 18.0,
            margin: EdgeInsets.all(10),
            child:
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
            child : Image.network(
              images[index], fit: BoxFit.cover,
            ),
            ),
        )
        ),
      );
  }
}