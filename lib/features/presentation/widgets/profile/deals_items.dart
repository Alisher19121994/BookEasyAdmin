import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget dealsItemList(BuildContext context, DocumentSnapshot documentSnapshot) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return Container(
    //height: height * 0.6,
    margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 2.0),
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /******/
          // Column(
          //   children: [
          //     //#Book between 5 Sep 2023 and Jan 2024
          //     Row(
          //       children: [
          //         const Icon(
          //           Icons.check,
          //           size: 18,
          //         ),
          //         SizedBox(width: 10.0),
          //         Expanded(
          //             child: Text(documentSnapshot['bookInfo'],
          //                 style: const TextStyle(color: Colors.black, fontSize: 13.0),
          //                 overflow: TextOverflow.ellipsis)),
          //       ],
          //     ),
          //     const SizedBox(height: 13.0),
          //     //#Stay any time between 5 Sep 2023 and Jan 2024
          //     Row(
          //       children: [
          //         const Icon(
          //           Icons.calendar_today_outlined,
          //           size: 18,
          //           color: Colors.redAccent,
          //         ),
          //         const SizedBox(width: 10.0),
          //         Expanded(
          //             child: Text(documentSnapshot['scheduleData'],
          //           style: const TextStyle(color: Colors.black, fontSize: 13.0),
          //           overflow: TextOverflow.ellipsis,
          //         )),
          //       ],
          //     ),
          //     const SizedBox(height: 13.0),
          //     //#Save at least 15%
          //     Row(
          //       children: [
          //         const Icon(
          //           Icons.price_change_outlined,
          //           size: 18,
          //           color: Colors.redAccent,
          //         ),
          //         SizedBox(width: 10.0),
          //         Expanded(
          //             child: Text(documentSnapshot['discountInfo'],
          //                 style: TextStyle(color: Colors.black, fontSize: 13.0),
          //                 overflow: TextOverflow.ellipsis)),
          //       ],
          //     ),
          //   ],
          // ),
          /******/
          //Deals page details
          Container(
            height: height * 0.5,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://media.timeout.com/images/105892648/1536/864/image.webp'),
                    fit: BoxFit.cover)),
            child: Container(
              padding: const EdgeInsets.all(14.0),
              height: height * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0.1)
              ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /**
                   *
                   *
                   * **/
                  Text(documentSnapshot['hotel_place_name'],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4.0),
                  Text(documentSnapshot['hotel_name'],
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    '64 Late Escape Deals',//3
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4.0),
          /******/
          //Deals page details with bottom click
          InkWell(
            onTap: () {
              // Navigator.pushNamed(context, DealsItemListPage.id);
            },
            child: Container(
              height: height * 0.080,
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(color: Colors.white),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Average price: ',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            '\$ 45',//6
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 6.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Deals started at: ',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            '\$ 9',//11
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          /******/
          //DealsItemListPage
          Column(
            children: [
              InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, ItemOfCityPage.id);
                },
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(2.0),
                  height: height * 0.35,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Container(
                        height: height,
                        width: width * 0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://media.timeout.com/images/105892648/1536/864/image.webp'),
                                fit: BoxFit.cover)),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  colors: [
                                    Colors.black54.withOpacity(0.4),
                                    Colors.black54.withOpacity(0.4),
                                    Colors.black54.withOpacity(0.4),
                                    Colors.black54.withOpacity(0.4),
                                  ])),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 24,
                                width: double.infinity,
                                padding: const EdgeInsets.only(
                                    left: 3.0, right: 3.0),
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(6.0),
                                      topRight: Radius.circular(6.0)),
                                ),
                                child: const Center(
                                    child: Text(
                                  'Breakfast included',//0
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.0),
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Retro Amir Hotel',//1
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Text(
                                  '1.4 miles from centre',//2
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14.0),
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Text(
                                  'Late Escape',//3
                                  style: TextStyle(
                                      color: Colors.greenAccent,
                                      fontSize: 14.0),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Hotel room: 1 bed',//4`
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Text(
                                  'Price for 1 night, 2 adults',//5
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.5,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Text(
                                  'US \$ 45',//6
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.5,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Text(
                                  'Includes taxes and changes',//7
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.5,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.check,
                                      color: Colors.green,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 6.0,
                                    ),
                                    Text(
                                      'Free cancellation',//8
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.check,
                                      color: Colors.green,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 6.0,
                                    ),
                                    Text(
                                      'No payment needed',//9
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 6.0,
                                    ),
                                    Text(
                                      '4.5 stars',//10
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              const Divider(thickness: 1.0)
            ],
          ),
          /******/
          //ItemOfCityPage
          Container(
            margin: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24.0),
                  const Text(
                    'Retro Amir Hotel',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24.0),
                  //#Image
                  Container(
                    height: height * .3,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://media.timeout.com/images/105892648/1536/864/image.webp'),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(height: 24.0),
                  //#Free cancellation
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 18,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        'Free cancellation',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  //#No payment needed
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 18,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        'No payment needed',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  //#Breakfast included
                  Row(
                    children: [
                      Icon(Icons.coffee_outlined),
                      SizedBox(
                        width: 6.0,
                      ),
                      const Text(
                        'Breakfast included',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  //# Free wifi
                  SizedBox(
                    height: height * .08,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.wifi,
                              color: Colors.black54,
                            ),
                            SizedBox(
                              width: 6.0,
                            ),
                            const Text(
                              'Free WiFi',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.sunny_snowing,
                              color: Colors.black54,
                            ),
                            SizedBox(
                              width: 6.0,
                            ),
                            const Text(
                              'Air condition',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.tv,
                              color: Colors.black54,
                            ),
                            SizedBox(
                              width: 6.0,
                            ),
                            const Text(
                              'TV',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14.0),
                  //#Hotel details
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hotel room: 1 bed',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        'Price for 1 night, 2 adults',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.5,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        'US \$ 45',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.5,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        'Additional charges may apply',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.5,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14.0),
                  //#No credit card needed
                  Container(
                    padding: const EdgeInsets.all(6.0),
                    height: height * .1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                        border: Border.all(width: 0.5),
                        color: const Color(0xffffffff)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.credit_card_off_outlined),
                            SizedBox(
                              width: 20.0,
                            ),
                            const Text(
                              'No credit card needed',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14.0),
                        const Text(
                          'Some options are bookable without a credit card',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14.0),
                  //#Google Map
                  Container(
                      padding: const EdgeInsets.all(6.0),
                      height: height * .4,
                      width: width * 1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          border: Border.all(width: 0.5),
                          color: const Color(0xffffffff)),
                      child: Center(
                        child: const Text(
                          'Google map Location',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.0,
                              fontWeight: FontWeight.normal),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )),

                  const SizedBox(height: 30.0),
                ],
              ),
            ),
          ),
          /******/
        ],
      ),
    ),
  );
}
