import 'package:profile_card_app/features/profile/data/models/profile_model.dart';
import 'package:profile_card_app/features/profile/domain/entities/profile.dart';
import 'package:profile_card_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ProfileRepositoryImpl implements ProfileRepository {
  static const _profileKey = 'profile';

  @override
  Future<Profile> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final String? profileString = prefs.getString(_profileKey);

    if (profileString != null) {
      return ProfileModel.fromJson(json.decode(profileString));
    }
    return const ProfileModel(
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
    );
  }

  @override
  Future<void> updateProfile(Profile profile) async {
    final prefs = await SharedPreferences.getInstance();
    final profileModel = ProfileModel.fromEntity(profile);
    await prefs.setString(_profileKey, json.encode(profileModel.toJson()));
  }
}
