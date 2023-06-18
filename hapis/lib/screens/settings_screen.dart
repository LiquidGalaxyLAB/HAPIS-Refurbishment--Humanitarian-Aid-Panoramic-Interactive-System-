import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hapis/constants.dart';
import 'package:hapis/services/LG_functionalities.dart';
import 'package:provider/provider.dart';
import '../models/kml/look_at_model.dart';
import '../providers/ssh_provider.dart';
import '../reusable_widgets/app_bar.dart';
import '../utils/drawer.dart';
import '../reusable_widgets/hapis_elevated_button.dart';
import '../reusable_widgets/sub_text.dart';
import '../utils/pop_up_connection.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const HAPISAppBar(
          appBarText: 'Settings',
        ),
        drawer: Drawer(
            // Drawer content goes here
            child: buildDrawer(context)),
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SubText(subTextContent: 'LG Settings'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HapisElevatedButton(
                      elevatedButtonContent: 'Clear KML',
                      buttonColor: HapisColors.lgColor1,
                      height: MediaQuery.of(context).size.height * 0.2,
                      onpressed: () async {
                        final sshData = Provider.of<SSHprovider>(
                          context,
                          listen: false,
                        );
                        print("inside clear kml ");
                        //print(sshData.client.username);

                        print(sshData.client != null);
                        if (sshData.client != null) {
                          if (await sshData.client!.isConnected()) {
                            print("here");
                            LgService(sshData).clearKml(keepLogos: false);
                          }
                        } else {
                          showDialogConnection(context);
                        }
                      }),
                  HapisElevatedButton(
                      elevatedButtonContent: 'Relaunch LG',
                      buttonColor: HapisColors.lgColor2,
                      height: MediaQuery.of(context).size.height * 0.2,
                      onpressed: () async {
                        final sshData =
                            Provider.of<SSHprovider>(context, listen: false);
                        print("inside relaunch ");
                        // print(sshData.client.username);
                        if (sshData.client != null) {
                          print(sshData.client!.username);
                          if (await sshData.client!.isConnected()) {
                            print("here");
                            LgService(sshData).relaunch();
                          }
                        } else {
                          showDialogConnection(context);
                        }
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HapisElevatedButton(
                      elevatedButtonContent: 'Reboot LG',
                      buttonColor: HapisColors.lgColor3,
                      height: MediaQuery.of(context).size.height * 0.2,
                      onpressed: () async {
                        final sshData =
                            Provider.of<SSHprovider>(context, listen: false);
                        print("inside rebootr ");
                        // print(sshData.client!.username);
                        if (sshData.client != null) {
                          print(sshData.client!.username);
                          if (await sshData.client!.isConnected()) {
                            print("here");
                            LgService(sshData).reboot();
                          }
                        } else {
                          print("else");
                          showDialogConnection(context);
                        }
                      }),
                  HapisElevatedButton(
                      elevatedButtonContent: 'Shut Down LG',
                      buttonColor: HapisColors.lgColor1,
                      height: MediaQuery.of(context).size.height * 0.2,
                      onpressed: () async {
                        final sshData =
                            Provider.of<SSHprovider>(context, listen: false);
                        print("inside shut down ");
                        // print(sshData.client!.username);
                        if (sshData.client != null) {
                          if (await sshData.client!.isConnected()) {
                            print("here");
                            LgService(sshData).shutdown();
                          }
                        } else {
                          showDialogConnection(context);
                        }
                      }),
                ],
              ),
            ],
          ),
        ));
  }
}
