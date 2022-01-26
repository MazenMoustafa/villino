import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vallino/http/notifications_services.dart';
import 'package:vallino/models/notification.dart';
import 'package:vallino/util/color_resources.dart';
import 'package:vallino/util/size_config.dart';
import 'package:vallino/view/shared/appBars.dart';
import 'package:vallino/view/shared/images/custom_assets_image.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late Future notifications ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifications = NotificationServices.getNotifications(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Padding(
          padding:  EdgeInsets.only(bottom: responsiveHeight(15)),
          child: Text("الإشعارات", style: TextStyle(color: ColorResources.WHITE,fontSize: 20,fontWeight: FontWeight.normal),),
        ),
        centerTitle: true,
        backgroundColor: ColorResources.PRIMARY_COLOR,
        elevation: 0,) ,
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: responsiveHeight(20),horizontal:responsiveWidth(10)),
        child:Column(
          children: [
            Expanded(
              child: FutureBuilder(
            future: notifications,
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              // if (snapshot.connectionState == ConnectionState.none &&
              //     snapshot.hasData == null) {
              //   //print('project snapshot data is: ${projectSnap.data}');
              //   return Text("NONE");
              // }
              // else
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container();
              } else if (snapshot.hasError){
                  return Text("Error");

              }
               else if(snapshot.connectionState == ConnectionState.done) {
                return ListView.separated(
                    itemBuilder: (context,index)=> notification(snapshot.data[index]),
                    separatorBuilder:(context,index)=> SizedBox(
                      height: responsiveHeight(15),
                    ) ,
                    itemCount: snapshot.data.length);
              }
               else
                 return Container();
            }),
            )

          ],
        ),
      ),
    );
  }
}

Widget notification(NotificationModel notification){
  return
    Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border:Border.all(
          color: ColorResources.PRIMARY_COLOR,
        ),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children:[
          SizedBox(
             width: responsiveWidth(60)
          ),
          Text("${notification.name}",style: TextStyle(fontSize: responsiveSize(20)),)
           ]
      ),

        Row(
          children: [
            CustomBorderedAssetsImage(btnWidth: 60, btnHeight: 60, dir: "assets/image/splash_logo.png"),
            SizedBox(
              width: responsiveWidth(15),
            ),
            Expanded(
                child: Text(notification.details,style: TextStyle(color: ColorResources.NOTIFICATION_GREY),)
            ),
          ],


        ),
        Center(child: Text("2022-01-24",style: TextStyle(color: ColorResources.HINT_TEXT_COLOR),))

      ],
  ),
    );

}