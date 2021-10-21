// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:all_govt_jobs/constants/app_color.dart';
// import 'package:all_govt_jobs/constants/app_strings.dart';
// import 'package:all_govt_jobs/feature/dashboard/dashboard_controller.dart';
// import 'package:all_govt_jobs/feature/dashboard/dashboard_view.dart';
// import 'package:all_govt_jobs/feature/job_list/job_list_view.dart';
// import 'package:all_govt_jobs/utils/utils_main.dart';
//
// class NavbarMain extends StatefulWidget {
//   @override
//   _NavbarMainState createState() => _NavbarMainState();
// }
//
// class _NavbarMainState extends State<NavbarMain> with SingleTickerProviderStateMixin {
//   TabController? tabController;
//
//   @override
//   void initState() {
//     tabController = TabController(length: 2, vsync: this, initialIndex: 0);
//     tabController!.addListener(_handleTabChanges);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     tabController!.dispose();
//     super.dispose();
//   }
//
//   _handleTabChanges() {
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           TabBarView(
//             controller: tabController,
//             physics: NeverScrollableScrollPhysics(),
//             children: [
//               DashboardView(),
//               Container(),
//             ],
//           ),
//           Positioned(
//             bottom: 5.h,
//             left: 70.w,
//             right: 70.w,
//             child: Container(
//               margin: EdgeInsets.all(8.w),
//               padding: EdgeInsets.all(5.w),
//               decoration: BoxDecoration(
//                 boxShadow: kElevationToShadow[9],
//                 color: AppColor.white,
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: TabBar(
//                 controller: tabController,
//                 indicator: BoxDecoration(color: AppColor.transparent),
//                 tabs: [
//                   getNavComponent(label: Strings.dashboard, index: 0, icon: Icons.home_outlined),
//                   getNavComponent(label: Strings.aboutUs, index: 1, icon: Icons.info_outline),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget getNavComponent({required String label, required int index, required IconData icon}) {
//     bool isSelected = index == tabController!.index;
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Padding(
//             padding: EdgeInsets.only(right: 10.0.w, left: 10.0.w, top: 2.0.h),
//             child: Icon(
//               icon,
//               size: 28.r,
//               color: isSelected ? AppColor.jungleGreen : AppColor.black,
//             )),
//         SizedBox(
//           height: 2.h,
//         ),
//         Text(
//           label,
//           maxLines: 1,
//           style: TextStyle(
//             color: isSelected ? AppColor.jungleGreen : AppColor.black,
//             fontSize: 13.sp,
//           ),
//         )
//       ],
//     );
//   }
// }
