import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:profile_card_app/features/profile/presentation/controllers/profile_controller.dart';
import 'package:profile_card_app/injection_container.dart' as di;
import 'package:profile_card_app/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:profile_card_app/features/profile/presentation/widgets/profile_card_item.dart';
import 'package:profile_card_app/features/profile/presentation/widgets/social_media_links.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Profile Card',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue.shade400,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: ProfileCardPage(),
    );
  }
}

class ProfileCardPage extends StatelessWidget {
  final ProfileController profileController = Get.find();

  ProfileCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: const Text('Personal Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => Get.to(() => EditProfilePage()),
          ),
        ],
      ),
      body: Obx(
        () => Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () => profileController.pickImage(),
                  child: CircleAvatar(
                    radius: 70.0,
                    backgroundImage: profileController.profile.value.profileImagePath.startsWith('assets/')
                        ? AssetImage(profileController.profile.value.profileImagePath) as ImageProvider
                        : FileImage(File(profileController.profile.value.profileImagePath)),
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  profileController.profile.value.name,
                  style: GoogleFonts.pacifico(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  profileController.profile.value.profession.toUpperCase(),
                  style: GoogleFonts.sourceSans3(
                    fontSize: 20.0,
                    color: Colors.white70,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    profileController.profile.value.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white54,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.blueGrey[200],
                  ),
                ),
                ProfileCardItem(
                  icon: Icons.phone,
                  text: profileController.profile.value.phone,
                  onTap: () => profileController.launchURL('tel:${profileController.profile.value.phone}'),
                ),
                ProfileCardItem(
                  icon: Icons.email,
                  text: profileController.profile.value.email,
                  onTap: () => profileController.launchURL('mailto:${profileController.profile.value.email}'),
                ),
                SocialMediaLinks(profile: profileController.profile.value),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
