// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// class MeetupCard extends StatelessWidget {
//   final List<String>? imageUrls; // Multiple images
//   final String? title;
//   final String? dateTime;
//   final String? location;
//   final String? profileImage;
//   final Function()? onTap;
//
//   MeetupCard({
//     super.key,
//     this.onTap,
//     this.imageUrls,
//     this.title, //ksjdkhdnsjdh
//     this.dateTime,
//     this.location,
//     this.profileImage,
//   });
//
//   //final controller = Get.put(MeetupCardController(),tag:UniqueKey().toString());
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height * Dimens.d1;
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(
//           Dimens.d20, Dimens.d0, Dimens.d20, Dimens.d16),
//       child: Column(
//         children: [
//           InkWell(
//             onTap:onTap,
//             child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(Dimens.d10),
//                   border:Border.all(color:CustomColors.white),
//                   boxShadow: [
//                     BoxShadow(
//                       color:CustomColors.shadowColor,
//                       spreadRadius: Dimens.d2,
//                       blurRadius: Dimens.d5,
//                       offset: const Offset(Dimens.d0, Dimens.d3),
//                     ),
//                   ],
//                 ),
//                 child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                   Stack(
//                     children: [
//                       SizedBox(
//                         height: height * 0.237,
//                         child: PageView.builder(
//                             scrollDirection:Axis.horizontal,
//                             controller:controller.pageController,
//                             itemCount: imageUrls!.length,
//                             onPageChanged:(index){
//                               controller.updateIndex(index);
//                             },
//                             itemBuilder: (context, index) {
//                               return ClipRRect(
//                                 borderRadius: const BorderRadius.vertical(
//                                     top: Radius.circular(Dimens.d10)), // For rounded edges
//                                 child: Image.network(
//                                   imageUrls![index],
//                                   fit: BoxFit.cover,
//                                 ),
//                               );
//                             }),
//                       ),
//                       // Positioned(
//                       //   top: Dimens.d10,
//                       //   left:Dimens.d0, // Center the indicators
//                       //   right:Dimens.d10, // Center the indicators
//                       //   child: Center(
//                       //     child: Obx(
//                       //           () => Row(
//                       //         mainAxisAlignment: MainAxisAlignment.end, // Ensures proper alignment
//                       //         children:[InkWell(
//                       //             onTap:(){
//                       //               Get.back();
//                       //             },
//                       //             child: SvgPicture.asset(StringPath.crossIcon)),]
//                       //       )
//                       //     ),
//                       //   ),
//                       // ),
//                       Positioned(
//                         bottom: Dimens.d10,
//                         left:Dimens.d0, // Center the indicators
//                         right:Dimens.d0, // Center the indicators
//                         child: Center(
//                           child: Obx(
//                                 () => Row(
//                               mainAxisAlignment: MainAxisAlignment.center, // Ensures proper alignment
//                               children: List.generate(
//                                 imageUrls!.length,
//                                     (index) => Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal:Dimens.d4),
//                                   child: CircleAvatar(
//                                     radius:Dimens.d4,
//                                     backgroundColor: controller.currentPage==index
//                                         ?CustomColors.white
//                                         :CustomColors.grey,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(Dimens.d12),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               title!,
//                               style: const TextStyle(
//                                 fontSize: Dimens.d16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             const SizedBox(height: Dimens.d16),
//                             Row(
//                               children: [
//                                 Container(
//                                     height: Dimens.d22,
//                                     width: Dimens.d22,
//                                     decoration: BoxDecoration(
//                                         color: Colors.grey.shade300,
//                                         borderRadius:
//                                         BorderRadius.circular(Dimens.d5)),
//                                     child: Center(
//                                         child: SvgPicture.asset(
//                                             height: Dimens.d15,
//                                             StringPath.upcomingActive))),
//                                 const SizedBox(width: Dimens.d8),
//                                 Text(
//                                   dateTime!,
//                                   style: const TextStyle(color: Colors.grey),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: Dimens.d8),
//                             Row(
//                               children: [
//                                 Container(
//                                     height: Dimens.d22,
//                                     width: Dimens.d22,
//                                     decoration: BoxDecoration(
//                                         color: Colors.grey.shade300,
//                                         borderRadius:
//                                         BorderRadius.circular(Dimens.d5)),
//                                     child: Center(
//                                         child: SvgPicture.asset(
//                                             height: Dimens.d15,
//                                             StringPath.location))),
//                                 const SizedBox(width: Dimens.d8),
//                                 Text(
//                                   location!,
//                                   style: const TextStyle(color: CustomColors.grey),
//                                 ),
//                                 const Spacer(),
//                                 Container(
//                                   height: Dimens.d40,
//                                   width: Dimens.d40,
//                                   decoration: BoxDecoration(
//                                       color: CustomColors.white,
//                                       shape: BoxShape.circle,
//                                       image: DecorationImage(
//                                           fit: BoxFit.cover,
//                                           image: NetworkImage(profileImage!)),
//                                       border: Border.all(color: CustomColors.grey)),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   )
//                 ])),
//           ),
//         ],
//       ),
//     );
//   }}
//
