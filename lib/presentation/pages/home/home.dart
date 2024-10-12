import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:medics/core/constants/image_strings.dart';
import 'package:medics/core/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: 15,
            options: CarouselOptions(
              height: 260,
              aspectRatio: 16 / 9,
              viewportFraction: 0.9,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (index, onPageChanged) {},
              scrollDirection: Axis.horizontal,
            ),
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                CustomImages.carousel1,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: CustomSizes.spaceBtwItems,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Events"),
              TextButton(
                onPressed: null,
                child: Text("Lihat Semua"),
              ),
            ],
          ),
          SizedBox(
            height: CustomSizes.spaceBtwItems,
          ),
          // SizedBox(
          //   width: double.infinity,
          //   height: 120,
          //   child: ListView(
          //     scrollDirection: Axis.horizontal,
          //     physics: BouncingScrollPhysics(),
          //     children: [
          //       Container(
          //         height: 120,
          //         width: 100,
          //         padding: const EdgeInsets.all(15),
          //         decoration: BoxDecoration(
          //           color: CustomColors.white,
          //           borderRadius: const BorderRadius.all(
          //             Radius.circular(20),
          //           ),
          //         ),
          //         child: Column(
          //           children: [
          //             SizedBox(
          //               height: 50,
          //               width: double.infinity,
          //               child: ClipRRect(
          //                 borderRadius: BorderRadius.circular(20),
          //                 child: Image(
          //                   image: AssetImage(
          //                     CustomImages.carousel1,
          //                   ),
          //                   fit: BoxFit.cover,
          //                 ),
          //               ),
          //             ),
          //             Expanded(
          //               child: GestureDetector(
          //                 onTap: () {},
          //                 child: Column(
          //                   children: [
          //                     Padding(
          //                       padding: const EdgeInsets.only(top: 15),
          //                       child: Text(
          //                         "Events 1",
          //                       ),
          //                     ),
          //                     const SizedBox(
          //                       height: 10,
          //                     ),
          //                     SizedBox(
          //                       height: 40,
          //                       width: double.infinity,
          //                       child: Row(
          //                         children: [
          //                           CircleAvatar(
          //                             child: Image.asset(
          //                               postingAuthorImage,
          //                               fit: BoxFit.cover,
          //                             ),
          //                           ),
          //                           const SizedBox(
          //                             width: 6,
          //                           ),
          //                           Column(
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.center,
          //                             crossAxisAlignment:
          //                                 CrossAxisAlignment.start,
          //                             children: [
          //                               Text(
          //                                 postingAuthorName,
          //                                 style: CustomTextStyle.text5.copyWith(
          //                                     color: CustomColor.black,
          //                                     fontWeight: FontWeight.w600),
          //                               ),
          //                               Text(
          //                                 postingDate,
          //                                 style: CustomTextStyle.text5.copyWith(
          //                                     color: CustomColor.grey,
          //                                     fontWeight: FontWeight.w400),
          //                               ),
          //                             ],
          //                           ),
          //                           const Spacer(),
          //                           Container(
          //                             height: 37,
          //                             width: 37,
          //                             decoration: BoxDecoration(
          //                                 borderRadius:
          //                                     BorderRadius.circular(15),
          //                                 color: CustomColor.lightBlue),
          //                             child: Center(
          //                               child: SvgPicture.asset(
          //                                   "assets/icons/send.svg"),
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
