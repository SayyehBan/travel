import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:travel/components/cartItem.dart';
import 'package:travel/model/travelModel.dart';

class HomeScreem extends StatefulWidget {
  const HomeScreem({super.key});

  @override
  State<HomeScreem> createState() => _HomeScreemState();
}

class _HomeScreemState extends State<HomeScreem> {
  int _selectedIndex = 0;
  double imageSize = 55;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              height: size.height / 1.8,
              child: Stack(children: [
                //big image
                Container(
                  width: double.infinity,
                  height: size.height / 2.1,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(55),
                          bottomLeft: Radius.circular(55)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(travelList[_selectedIndex].image))),
                ),
                // Head Icons
                Positioned(
                  right: 0,
                  top: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(101, 255, 255, 255)),
                          child: const Icon(CupertinoIcons.arrow_right),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(101, 255, 255, 255)),
                          child: const Icon(CupertinoIcons.heart),
                        ),
                      ],
                    ),
                  ),
                ),
                //List small Image
                Positioned(
                  left: 0,
                  top: 100,
                  child: SizedBox(
                    width: 90,
                    height: double.maxFinite,
                    child: ListView.builder(
                      itemCount: travelList.length,
                      itemBuilder: (context, index) {
                        return _imageItem(index);
                      },
                    ),
                  ),
                ),
                //Name and Place
                Positioned(
                  bottom: 80,
                  right: size.width / 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        travelList[_selectedIndex].name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            CupertinoIcons.placemark_fill,
                            color: Colors.white,
                          ),
                          Text(
                            travelList[_selectedIndex].location,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 16),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ]),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CartItem(
                      title1: "رتبه بندی",
                      title2: travelList[_selectedIndex].raing,
                    ),
                    CartItem(
                      title1: "دما",
                      title2: "${travelList[_selectedIndex].temp}° درجه",
                    ),
                    CartItem(
                      title1: "فاصله",
                      title2: "${travelList[_selectedIndex].distance} کیلومتر",
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('توضیحات'),
                      ExpandableText(
                        travelList[_selectedIndex].discription,
                        expandText: 'خواندن بیشتر',
                        collapseText: 'جمع کردن متن',
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('جمع هزینه'),
                              Text(
                                "${travelList[_selectedIndex].price.seRagham().toPersianDigit()} تومان",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30),
                              )
                            ],
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            child: const Icon(
                              CupertinoIcons.arrow_left,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    ));
  }

  Column _imageItem(int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: AnimatedContainer(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        travelList[index].image,
                      )),
                  borderRadius: _selectedIndex == index
                      ? BorderRadius.circular(1000)
                      : BorderRadius.circular(10),
                  border: Border.all(
                      color:
                          _selectedIndex == index ? Colors.blue : Colors.white,
                      width: 3)),
              width: _selectedIndex == index ? imageSize + 15 : imageSize,
              height: _selectedIndex == index ? imageSize + 15 : imageSize,
              duration: const Duration(milliseconds: 500),
            ),
          ),
        ),
      ],
    );
  }
}
