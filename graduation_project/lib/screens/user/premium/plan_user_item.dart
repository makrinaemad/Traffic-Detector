import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:graduation_project/models/PlanModel.dart';


import '../../../models/CamModel.dart';

import '../../../models/RoadModel.dart';
import '../../../shared/remote/api_manager.dart';


class PlanUserItem extends StatelessWidget {

  Plans plan ;
  //RoadModel road;
  PlanUserItem (this.plan,{super.key});


  @override
  Widget build(BuildContext context) {
    return          Card(

      elevation:0,
      color: Colors.white,
      child: Container(
        height: 50,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2)
          ,
          borderRadius: BorderRadius.circular(18),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${plan.periodInDays} Days",style: TextStyle(fontWeight: FontWeight.w500)),
            Text('${plan.price} EGP',style: TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
