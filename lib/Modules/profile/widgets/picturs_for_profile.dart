import 'package:flutter/material.dart';
import '../../../Utilities/theme_helper.dart';
import '../../../Widgets/custom_service_text.dart';
import '../../../generated/assets.dart';

class BuildStackOfUserPictures extends StatefulWidget {
  const BuildStackOfUserPictures({super.key});

  @override
  State<BuildStackOfUserPictures> createState() =>
      BuildStackOfUserPicturesState();
}

class BuildStackOfUserPicturesState extends State<BuildStackOfUserPictures> {
  String userName = 'Fatma Ahmed';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: Card(
                      shape: const RoundedRectangleBorder(),
                      color: Colors.red,
                      shadowColor: ThemeClass.of(context).primaryColor,
                      elevation: 50.0,
                      child: const Image(
                        width: double.infinity,
                        image:
                          AssetImage(
                                Assets.imagesSoftwieLogo)
                                as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 1.0, top: 20, bottom: 10, right: 15),
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor:
                          ThemeClass.of(context).secondaryBlackColor,
                      child: IconButton(
                        onPressed: () async {
                        },
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white.withOpacity(.5),
                          size: 17,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0, bottom: 3),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        const CircleAvatar(
                            radius: 49,
                            backgroundImage:  AssetImage(
                                Assets.imagesCircle),
                            child: CircleAvatar(
                                radius:47,
                                backgroundImage: AssetImage(Assets.imagesSoftwie)
                                as ImageProvider)
                                     ),
                        Padding(
                          padding: const EdgeInsets.only(left: 1.0, top: 20),
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor:
                                ThemeClass.of(context).secondaryBlackColor,
                            child: IconButton(
                              onPressed: () async {
                              },
                              icon: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white.withOpacity(.5),
                                size: 17,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0,left: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          CustomServicesTextWidget(
                                text:"Fatma Ahmed",
                              ),

                        SizedBox(
                          height: 3,
                        ),
                        CustomServicesTextWidget(
                          text: "Flutter Developer",
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      );
  }
}
