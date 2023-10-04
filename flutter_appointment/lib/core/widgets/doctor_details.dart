

import 'package:flutter/material.dart';
import 'package:flutter_appointment/core/colors/colors.dart';
import 'package:flutter_appointment/features/appointment/presentation/provider/appointment_provider.dart';
import 'package:provider/provider.dart';

import '../../features/appointment/domain/entities/appointment.dart';

class DoctorDetails extends StatelessWidget {
  
  const DoctorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Consumer<AppointmentProvider>(
      builder: (context,provider,_) {
        Doctor doctor = provider.doctorDetailList.first;
        return Row(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      SizedBox(
                        child: ClipOval(
                          child: Image.network(
                            doctor.image,
                            width: 80.0,
                            height: 80.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 5.0, top: 16),
                        child: Icon(
                          Icons.verified,
                          color:primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text( doctor.doctorName,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                        const SizedBox(height: 8),
                         Text(doctor.speciality,style:const TextStyle(fontWeight: FontWeight.w400,color: Colors.grey)),
                        const SizedBox(height: 16,),
                        Row(
                          children: [
                            
                            const Icon(Icons.location_on,color:primaryColor,),
                             Text(doctor.location,style:const TextStyle(fontWeight: FontWeight.w400,color: Colors.grey)),
                            const Icon(Icons.map,color:primaryColor,),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              );
      }
    );
         
  }
}