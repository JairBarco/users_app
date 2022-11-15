import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_app/drivers/en/infoHandler/app_info.dart';
import 'package:users_app/drivers/en/widgets/history_design_ui.dart';


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
            Navigator.pop(context);
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
        itemCount: Provider.of<AppInfo>(context, listen: false).allTripsHistoryInformationList.length,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
      ),
    );
  }
}
