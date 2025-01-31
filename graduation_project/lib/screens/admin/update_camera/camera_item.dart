import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


import '../../../models/CamModel.dart';

import '../../../models/RoadModel.dart';
import '../../../shared/remote/api_manager.dart';
import '../admin_home.dart';
import 'bottom_sheet.dart';

class CameraItem extends StatelessWidget {

  Camera camera ;
  //RoadModel road;
  CameraItem (this.camera,{super.key});


  @override
  Widget build(BuildContext context) {
    return Card (
      color: Color.fromRGBO(14,46,92,1),
      elevation: 12,
      margin: EdgeInsets.symmetric(horizontal: 25,vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.transparent)),
      child: Slidable(
        startActionPane: ActionPane(motion: DrawerMotion(),
          children: [
            SlidableAction(onPressed: (BuildContext cotext) async {
              await ApiManager.deleteCamera(camera.id!);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminHome()),
              );

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Camera Deleted Successfully')),

              );
            },
              spacing: 15,
              backgroundColor: Color.fromRGBO(255,110,93,1),
             // label: "Delete",
              icon: Icons.delete_outline,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),
                  topLeft:Radius.circular(12) ),
            ),
            SlidableAction(onPressed: (BuildContext cotext){

              Navigator.push(context, MaterialPageRoute(builder: (context) => EditBottomSheet(camera)));
            //  BottomSheet
              // FirebaseManager.editTask(task);
            },
              spacing: 15,
              backgroundColor: Color.fromRGBO(151,213,201,1),
              // label: "Edit",
              icon:  Icons.edit_outlined,

            )
          ],),

        // child: Column(
        //   children: [
        //     Text(camera.id),
        //     Text(camera.location),
        //   ],
        //
        // )
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  height: 60,
                  width: 3,
                  decoration:BoxDecoration(

                      color:Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color:Colors.white),
                )),
                SizedBox(width:20),
                Expanded(
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(
                      //   height: 31,
                      // ),
                      Text("Camera ID : ${camera.id}",style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color:Colors.white,)),
                      SizedBox(height: 5,),
                      Text("Road ID : ${camera.road_id}",style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color:Colors.white,)),
                      SizedBox(height: 5,),

                     // SizedBox(width: 5,),
                      Text("Location : ${camera.model}",style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color:Colors.white,)),
                      // Text(camera.location,style: TextStyle(fontSize:25,
                      //   fontWeight: FontWeight.w500,
                      //   color:Colors.white,
                      //
                      // ),)
                    ],
                  ),
                ),
               // Spacer(),
                // InkWell(
                //   onTap: (){
                //   //  FirebaseManager.updateTask(task.id, true);
                //   },
                //   child: Container(
                //     width: 69,
                //     height: 34,
                //     decoration: BoxDecoration(
                //     //    color:task.isDone?Colors.transparent:  primary,
                //         borderRadius: BorderRadius.circular(12)
                //     ),
                //     // child:task.isDone?Text("Done!",style: TextStyle(
                //     //     color: Color(0xFF61E757),fontWeight:FontWeight.w600,fontSize: 22 ),
                //      // textAlign: TextAlign.center,) :
                //   //  Icon(Icons.done,color: Colors.white,size: 28),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
