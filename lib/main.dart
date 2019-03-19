import 'package:flutter/material.dart';
import 'package:flutter_adidas_shoes_exam/utils.dart';
import 'data.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
            Color(0xFF696D77),
            Color(0xFF292C36),
          ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: screenAwareSize(20.0, context),
              ),
              onPressed: () {}),
          title: Text(
            "Energy Cloud",
            style: TextStyle(
                color: Colors.white,
                fontSize: screenAwareSize(18.0, context),
                fontFamily: "Montserrat-Bold"),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite_border,
                size: screenAwareSize(20.0, context),
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: Column(
          children: <Widget>[ProductScreenTopPart(), ProductScreenBottomPart()],
        ),
      ),
    );
  }
}

class ProductScreenTopPart extends StatefulWidget {
  @override
  ProductScreenTopPartState createState() {
    return new ProductScreenTopPartState();
  }
}

class ProductScreenTopPartState extends State<ProductScreenTopPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenAwareSize(245, context),
      child: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: Image.asset(
                  "assets/adidas.png",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: screenAwareSize(50.0, context),
                  height: screenAwareSize(50.0, context),
                  decoration: BoxDecoration(
                      color: Colors.black26, shape: BoxShape.circle),
                  child: Image.asset("assets/360.png"),
                ),
              )
            ],
          ),
          Positioned(
            left: screenAwareSize(18.0, context),
            bottom: screenAwareSize(15.0, context),
            child: Column(
              children: <Widget>[
                Text(
                  "Rating",
                  style: TextStyle(
                      color: Color(0xFF949598),
                      fontSize: screenAwareSize(10.0, context),
                      fontFamily: "Montserrat-SemiBold"),
                ),
                SizedBox(
                  height: screenAwareSize(8.0, context),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 8.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xFFFFE600),
                    ),
                    SizedBox(
                      width: screenAwareSize(5.0, context),
                    ),
                    Text(
                      "4.5",
                      style: TextStyle(color: Color(0xFFFFE600)),
                    ),
                    SizedBox(
                      width: screenAwareSize(5.0, context),
                    ),
                    Text(
                      "(378 People)",
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProductScreenBottomPart extends StatefulWidget {
  @override
  ProductScreenBottomPartState createState() {
    return new ProductScreenBottomPartState();
  }
}

class ProductScreenBottomPartState extends State<ProductScreenBottomPart> {
  bool isExpanded = false;
  int currentSizeIndex = 0;
  int _counter = 0;
  int currentColorIndex = 0;

  List<Widget> colorSelector() {
    List<Widget> colorItemList = new List();
    for (var i = 0; i < colors.length; i++) {
      colorItemList
          .add(colorItem(colors[i], i == currentColorIndex, context, () {
        setState(() {
          currentColorIndex = i;
        });
      }));
    }
    return colorItemList;
  }

  void _increase() {
    setState(() {
      _counter++;
    });
  }

  void _decrease() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  }

  void _expand() {
    setState(() {
      isExpanded ? isExpanded = false : isExpanded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: screenAwareSize(18.0, context)),
              child: Text(
                'Product Description',
                style: TextStyle(
                    color: Color(0xFF949598),
                    fontSize: screenAwareSize(10.0, context),
                    fontFamily: "Montserrat-SemiBold"),
              ),
            ),
            SizedBox(
              height: screenAwareSize(8.0, context),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenAwareSize(26.0, context),
                  right: screenAwareSize(18.0, context)),
              child: AnimatedCrossFade(
                firstChild: Text(
                  desc,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenAwareSize(10.0, context),
                      fontFamily: "Montserrat-Medium"),
                ),
                secondChild: Text(
                  desc,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenAwareSize(10.0, context),
                      fontFamily: "Montserrat-Medium"),
                ),
                crossFadeState: isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: kThemeAnimationDuration,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenAwareSize(26.0, context),
                  right: screenAwareSize(18.0, context)),
              child: GestureDetector(
                onTap: _expand,
                child: Text(
                  isExpanded ? "less" : "more...",
                  style: TextStyle(
                      color: Color(0xFFFB382F), fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(
              height: screenAwareSize(12.0, context),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenAwareSize(15.0, context),
                  right: screenAwareSize(75.0, context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Size',
                    style: TextStyle(
                      color: Color(0xFF949598),
                      fontSize: screenAwareSize(10.0, context),
                      fontFamily: "Montserrat-SemiBold",
                    ),
                  ),
                  Text(
                    'Quantity',
                    style: TextStyle(
                      color: Color(0xFF949598),
                      fontSize: screenAwareSize(10.0, context),
                      fontFamily: "Montserrat-SemiBold",
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenAwareSize(20.0, context),
                  right: screenAwareSize(20.0, context)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: screenAwareSize(38.0, context),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: sizeNumlist.map((item) {
                          var index = sizeNumlist.indexOf(item);
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                currentSizeIndex = index;
                              });
                            },
                            child: sizeItem(
                                item, index == currentSizeIndex, context),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: screenAwareSize(100.0, context),
                        height: screenAwareSize(30.0, context),
                        decoration: BoxDecoration(
                          color: Color(0xFF525663),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Flexible(
                              flex: 3,
                              child: GestureDetector(
                                onTap: _decrease,
                                child: Container(
                                  height: double.infinity,
                                  child: Center(
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontFamily: "Montserrat-Bold"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            divider(),
                            Flexible(
                              flex: 3,
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: double.infinity,
                                  child: Center(
                                    child: Text(
                                      "$_counter",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontFamily: "Montserrat-Bold"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            divider(),
                            Flexible(
                              flex: 3,
                              child: GestureDetector(
                                onTap: _increase,
                                child: Container(
                                  height: double.infinity,
                                  child: Center(
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontFamily: "Montserrat-Bold"),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenAwareSize(18.0, context)),
              child: Text(
                'Select Color',
                style: TextStyle(
                    color: Color(0xFF949598),
                    fontSize: screenAwareSize(10.0, context),
                    fontFamily: "Montserrat-SemiBold"),
              ),
            ),
            SizedBox(
              height: screenAwareSize(8.0, context),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: screenAwareSize(20.0, context)),
              height: screenAwareSize(34.0, context),
              child: Row(
                children: colorSelector(),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: MaterialButton(
                color: Color(0xFFFB382F),
                padding: EdgeInsets.symmetric(
                    vertical: screenAwareSize(14.0, context),
                    horizontal: screenAwareSize(60.0, context)),
                onPressed: () {},
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: screenAwareSize(35.0, context)),
                    child: Text(
                      "Add to Card",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenAwareSize(15.0, context),
                        fontFamily: "Montserrat-Medium",
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget sizeItem(String size, bool isSelected, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0),
    child: Container(
      width: screenAwareSize(30.0, context),
      height: screenAwareSize(30.0, context),
      decoration: BoxDecoration(
          color: isSelected ? Color(0xFFFC3930) : Color(0xFF525663),
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
                color:
                    isSelected ? Colors.black.withOpacity(.5) : Colors.black12,
                offset: Offset(0.0, 10.0),
                blurRadius: 10.0)
          ]),
      child: Center(
        child: Text(
          size,
          style: TextStyle(color: Colors.white, fontFamily: "Montserrat-Bold"),
        ),
      ),
    ),
  );
}

Widget divider() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
    child: Container(
      width: 0.8,
      color: Colors.black,
    ),
  );
}

Widget colorItem(
    Color color, bool isSelected, BuildContext context, VoidCallback _ontab) {
  return GestureDetector(
    onTap: _ontab,
    child: Padding(
      padding: EdgeInsets.only(left: screenAwareSize(10.0, context)),
      child: Container(
        width: screenAwareSize(30.0, context),
        height: screenAwareSize(30.0, context),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                        color: Colors.black.withOpacity(.8),
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0))
                  ]
                : []),
        child: ClipPath(
          clipper: MClipper(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: color,
          ),
        ),
      ),
    ),
  );
}

class MClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
