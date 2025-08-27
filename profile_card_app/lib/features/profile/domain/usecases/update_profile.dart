import 'package:profile_card_app/features/profile/domain/entities/profile.dart';
import 'package:profile_card_app/features/profile/domain/repositories/profile_repository.dart';

class UpdateProfile {
  final ProfileRepository repository;

  UpdateProfile(this.repository);

  Future<void> call(Profile profile) {
    return repository.updateProfile(profile);
  }
}
