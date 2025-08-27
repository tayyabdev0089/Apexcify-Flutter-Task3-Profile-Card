import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_card_app/features/profile/domain/entities/profile.dart';
import 'package:profile_card_app/features/profile/presentation/controllers/profile_controller.dart';

class SocialMediaLinks extends StatelessWidget {
  final Profile profile;
  final ProfileController profileController = Get.find();

  SocialMediaLinks({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (profile.facebookUrl.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.facebook, color: Colors.blue, size: 30),
              onPressed: () => profileController.launchURL(profile.facebookUrl),
            ),
          if (profile.instagramUrl.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.camera_alt, color: Colors.pink, size: 30), // Instagram icon
              onPressed: () => profileController.launchURL(profile.instagramUrl),
            ),
          if (profile.linkedinUrl.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.link, color: Colors.blueAccent, size: 30), // LinkedIn icon (using generic link icon)
              onPressed: () => profileController.launchURL(profile.linkedinUrl),
            ),
          if (profile.githubUrl.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.code, color: Colors.black, size: 30), // GitHub icon
              onPressed: () => profileController.launchURL(profile.githubUrl),
            ),
        ],
      ),
    );
  }
}
