import 'package:flutter/material.dart';
import 'package:flutter_appointment/core/colors/colors.dart';
class DoctorInfo extends StatelessWidget {
  final IconData icons;
  final String info;
  final String subInfo;
  const DoctorInfo({super.key, required this.icons, required this.info, required this.subInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
  children: [
        Container(
                        width: 60,
                        height: 60,
                        decoration:  const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(231,240,254,1)),
                        child:  Icon(icons, size: 24,color: primaryColor,),
                      ),
                      const SizedBox(height: 8,),
                       // ignore: prefer_const_constructors
                       Text(info,style:  TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 16),),
                       Text(subInfo,style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 12))
  ],
);
  }
}