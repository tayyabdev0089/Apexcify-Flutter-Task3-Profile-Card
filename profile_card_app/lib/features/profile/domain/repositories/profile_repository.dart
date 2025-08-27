import 'package:profile_card_app/features/profile/domain/entities/profile.dart';

abstract class ProfileRepository {
  Future<Profile> getProfile();
  Future<void> updateProfile(Profile profile);
}
