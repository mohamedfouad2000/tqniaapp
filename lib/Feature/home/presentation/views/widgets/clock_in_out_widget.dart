import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:location/location.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/widgets/custom_loading_widget.dart';
import 'package:tqniaapp/Core/widgets/loading/clock_in_out_loading.dart';
import 'package:tqniaapp/Feature/home/data/repo/attendance_repo/attendance_repo_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/Attendance/attendance_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/Attendance/attendance_states.dart';

class ClockInOut extends StatefulWidget {
  const ClockInOut({super.key});

  @override
  State<ClockInOut> createState() => _ClockInOutState();
}

class _ClockInOutState extends State<ClockInOut> {
  String clockText = 'in';
  String time = '00:01:00';
  String date = '2024-03-16';
  LocationData? location;
  String currentLocation = '';
  bool servicePermision = false;
  LocationPermission? permission;
  // Future<void> getloction() async {
  //   Location location = Location();
  //   bool? servesenable;
  //   PermissionStatus? permison;
  //   LocationData? locationdata;
  //   servesenable = await location.serviceEnabled();
  //   if (!servesenable) {
  //     servesenable = await location.requestService();
  //     if (!servesenable) {
  //       return;
  //     }
  //   }
  //   permison = await location.hasPermission();
  //   if (permison == PermissionStatus.denied) {
  //     permison = await location.requestPermission();
  //     if (permison != PermissionStatus.granted) {
  //       return;
  //     }
  //   }

  //   locationdata = await location.getLocation();

  //   print('locationdata.latitude is${locationdata.latitude}');
  //   print('locationdata.long is${locationdata.longitude}');
  //   print('locationdata.long is$locationdata');
  // }

  // Future<Position> _determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   print(serviceEnabled);
  //   if (serviceEnabled == false) {
  //     return Future.error('Location services are disabled.');
  //   }
  //   permission = await Geolocator.checkPermission();
  //   print(permission);
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }

  //   // When we reach here, permissions are granted and we can
  //   // continue accessing the position of the device.

  //   return await Geolocator.getCurrentPosition();
  // }

  Future<void> changeState() async {
    location = await getloction();
    setState(() {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(now);
      String formattedTime = DateFormat('kk:mm:ss').format(now);
      time = formattedTime;
      date = formattedDate;
      print("$time $date  ${location?.latitude} ${location?.longitude}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
          padding: const EdgeInsetsDirectional.only(
                    start: 32, end: 32, top: 20, bottom: 20),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 0.49, color: Color(0xFFF4F4F4)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x11EA5A5A),
                      blurRadius: 62.86,
                      offset: Offset(14.61, 18.65),
                      spreadRadius: 0,
                    ),
                  ],
                ),
              
      
      child: BlocProvider(
        create: (context) =>
            AttendanceCubit(AttendanceRepoImp())..getAttendance(),
        child: BlocConsumer<AttendanceCubit, AttendanceState>(
          builder: (context, state) {
            if (state is GetAttendanceSucc) {
              
                if (state.model.clockOut != null) {
                  //clockOut = 0;
                 
                  return Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 7,
                                    backgroundColor: Colors.red,
                                  ),
                                  CircleAvatar(
                                    radius: 6,
                                    backgroundColor: Colors.white,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: Text(
                                "Start at ${state.model.data?.inTime?.split(' ').last}",
                                style: StylesData.font12
                                    .copyWith(color: Colors.grey[500]),
                              )),
                            ],
                          ),
                        ],
                      )),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () async {
                          await changeState();
                          await BlocProvider.of<AttendanceCubit>(context)
                              .setAttendance(
                                
                                  date: date,
                                  time: time,
                                  longitude: location!.longitude!,
                                  latitude: location!.latitude!,
                                  isIn: false);
                        },
                        child: Column(
                          children: [
                            const Stack(
                              alignment: Alignment.center,
                              children: [
                                Image(
                                  image: AssetImage(AssetsData.recbalc),
                                  height: 60,
                                ),
                                Positioned(
                                  top: 15,
                                  child: Image(
                                    image: AssetImage(AssetsData.power),
                                    height: 20,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Clock Out",
                              style: StylesData.font14
                                  .copyWith(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
               
               
                } else {
                  //clockOut = 1;
                  return Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 7,
                                    backgroundColor: Colors.black,
                                  ),
                                  CircleAvatar(
                                    radius: 6,
                                    backgroundColor: Colors.white,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: Text(
                                "You are clocked out",
                                style: StylesData.font12
                                    .copyWith(color: Colors.grey[500]),
                              )),
                            ],
                          ),
                        ],
                      )),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () async {
                          await changeState();
                          BlocProvider.of<AttendanceCubit>(context)
                              .setAttendance(
                                  date: date,
                                  time: time,
                                  longitude: location!.longitude!,
                                  latitude: location!.latitude!,
                                  isIn: false);
                        },
                        child: Column(
                          children: [
                            const Stack(
                              alignment: Alignment.center,
                              children: [
                                Image(
                                  image: AssetImage(AssetsData.recred),
                                  height: 60,
                                ),
                                Positioned(
                                  top: 15,
                                  child: Image(
                                    image: AssetImage(AssetsData.power),
                                    height: 20,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Clock In",
                              style:
                                  StylesData.font14.copyWith(color: Colors.red),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }
            
            } else if (state is GetAttendanceError) {
              return Center(child: Text(state.error));
            } else {
             return  const CustomLoadingWidget(child: ClockInOutLoading(),) ;
            }
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
