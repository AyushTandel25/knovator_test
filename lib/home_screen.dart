import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:knovator_test/components/shape_buttons.dart';
import 'package:knovator_test/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> shapes = [squareShape, circleShape, triangleShape];

  Map<String, Widget> shapeMap = {};

  int count = 0;

  @override
  Widget build(BuildContext context) {
    // this will return the screen size of the device
    Size size = MediaQuery.of(context).size;

    // returns the orientation of the device
    Orientation orientation = MediaQuery.of(context).orientation;

    // height of bottom shape-buttons container
    var bottomContainerHeight = orientation == Orientation.portrait
        ? size.height * 0.07
        : size.height * 0.1;

    // height of upper shape container
    var upperContainerHeight =
        size.height - (kToolbarHeight + bottomContainerHeight) - 30.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shape Task"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: upperContainerHeight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Wrap(
                      children: shapeMap.entries
                          .map(
                            (e) => InkWell(
                              onTap: () {
                                var index = e.key; // return the key of particular shape
                                if (index != "0") {
                                  setState(() {
                                    var newShape = shapeMap["${int.parse(index) - 1}"]; // replace with the shape which is added before the selected shape
                                    shapeMap[index] = newShape!;
                                  });
                                }
                              },
                              child: e.value,
                            ),
                          )
                          .toList(),
                      crossAxisAlignment: WrapCrossAlignment.start,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: bottomContainerHeight,
              width: double.infinity,
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: shapes
                    .map(
                      (e) => ShapeButton(
                        shape: e,
                        onClick: () {
                          setState(() {
                            shapeMap['$count'] = Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SvgPicture.asset(
                                e,
                                color: Colors.black,
                                height: 50.0,
                                width: 50.0,
                              ),
                            );
                            count++;
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
