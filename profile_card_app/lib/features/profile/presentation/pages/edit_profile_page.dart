import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_card_app/features/profile/presentation/controllers/profile_controller.dart';

class EditProfilePage extends StatelessWidget {
  final ProfileController profileController = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController facebookController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController linkedinController = TextEditingController();
  final TextEditingController githubController = TextEditingController();

  EditProfilePage({super.key}) {
    nameController.text = profileController.profile.value.name;
    professionController.text = profileController.profile.value.profession;
    descriptionController.text = profileController.profile.value.description;
    phoneController.text = profileController.profile.value.phone;
    emailController.text = profileController.profile.value.email;
    facebookController.text = profileController.profile.value.facebookUrl;
    instagramController.text = profileController.profile.value.instagramUrl;
    linkedinController.text = profileController.profile.value.linkedinUrl;
    githubController.text = profileController.profile.value.githubUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Obx(
              () => GestureDetector(
                onTap: () => profileController.pickImage(),
                child: CircleAvatar(
                  radius: 70.0,
                  backgroundImage: profileController.profile.value.profileImagePath.startsWith('assets/')
                      ? AssetImage(profileController.profile.value.profileImagePath) as ImageProvider
                      : FileImage(File(profileController.profile.value.profileImagePath)),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: professionController,
              decoration: const InputDecoration(
                labelText: 'Profession',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: facebookController,
              decoration: const InputDecoration(
                labelText: 'Facebook URL',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: instagramController,
              decoration: const InputDecoration(
                labelText: 'Instagram URL',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: linkedinController,
              decoration: const InputDecoration(
                labelText: 'LinkedIn URL',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: githubController,
              decoration: const InputDecoration(
                labelText: 'GitHub URL',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                profileController.updateProfile(
                  newName: nameController.text,
                  newProfession: professionController.text,
                  newDescription: descriptionController.text,
                  newPhone: phoneController.text,
                  newEmail: emailController.text,
                  newFacebookUrl: facebookController.text,
                  newInstagramUrl: instagramController.text,
                  newLinkedinUrl: linkedinController.text,
                  newGithubUrl: githubController.text,
                );
                Get.back();
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
