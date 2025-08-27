import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile_card_app/features/profile/domain/entities/profile.dart';
import 'package:profile_card_app/features/profile/domain/usecases/get_profile.dart';
import 'package:profile_card_app/features/profile/domain/usecases/update_profile.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileController extends GetxController {
  final GetProfile getProfileUseCase;
  final UpdateProfile updateProfileUseCase;

  ProfileController({
    required this.getProfileUseCase,
    required this.updateProfileUseCase,
  });

  var profile = const Profile(
    name: 'John Doe',
    profession: 'Flutter Developer',
    description: 'Passionate about building beautiful and functional mobile applications.',
    phone: '+1 234 567 890',
    email: 'john.doe@example.com',
    profileImagePath: 'assets/profile.png',
    facebookUrl: 'https://www.facebook.com/johndoe',
    instagramUrl: 'https://www.instagram.com/johndoe',
    linkedinUrl: 'https://www.linkedin.com/in/johndoe',
    githubUrl: 'https://github.com/johndoe',
  ).obs;

  @override
  void onInit() {
    super.onInit();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    profile.value = await getProfileUseCase.call();
  }

  Future<void> updateProfile({
    String? newName,
    String? newProfession,
    String? newDescription,
    String? newPhone,
    String? newEmail,
    String? newProfileImagePath,
    String? newFacebookUrl,
    String? newInstagramUrl,
    String? newLinkedinUrl,
    String? newGithubUrl,
  }) async {
    final updatedProfile = profile.value.copyWith(
      name: newName,
      profession: newProfession,
      description: newDescription,
      phone: newPhone,
      email: newEmail,
      profileImagePath: newProfileImagePath,
      facebookUrl: newFacebookUrl,
      instagramUrl: newInstagramUrl,
      linkedinUrl: newLinkedinUrl,
      githubUrl: newGithubUrl,
    );
    await updateProfileUseCase.call(updatedProfile);
    profile.value = updatedProfile;
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      await updateProfile(newProfileImagePath: image.path);
    }
  }

  Future<void> launchURL(String url) async {
    if (url.isNotEmpty) {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        Get.snackbar('Error', 'Could not launch $url');
      }
    }
  }
}
