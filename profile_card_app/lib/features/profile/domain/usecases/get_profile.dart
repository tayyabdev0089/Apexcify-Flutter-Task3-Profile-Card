import 'package:profile_card_app/features/profile/domain/entities/profile.dart';
import 'package:profile_card_app/features/profile/domain/repositories/profile_repository.dart';

class GetProfile {
  final ProfileRepository repository;

  GetProfile(this.repository);

  Future<Profile> call() {
    return repository.getProfile();
  }
}
