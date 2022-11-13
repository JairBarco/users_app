import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restart_app/restart_app.dart';
import 'package:users_app/users/en/widgets/history_design_ui.dart';

import '../../../users/en/infoHandler/app_info.dart';

class TripsHistoryScreen extends StatefulWidget {
  const TripsHistoryScreen({Key? key}) : super(key: key);

  @override
  State<TripsHistoryScreen> createState() => _TripsHistoryScreenState();
}

class _TripsHistoryScreenState extends State<TripsHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          "Historial de Viajes",
        ),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: (){
            Restart.restartApp();
          },
        ),
      ),

      body: ListView.separated(
        separatorBuilder: (context, i) => Divider(
          color: Colors.white,
          thickness: 2,
          height: 2,
        ),
          itemBuilder: (context, i){
            return Card(
              color: Colors.white54,
              child: HistoryDesignUIWidget(
                tripsHistoryModel: Provider.of<AppInfo>(context, listen: false).allTripsHistoryInformationList[i],
              ),
            );
          },
        itemCount: Provider.of<AppInfo>(context, listen: false).countTotalTrips,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
      ),
    );
  }
}
