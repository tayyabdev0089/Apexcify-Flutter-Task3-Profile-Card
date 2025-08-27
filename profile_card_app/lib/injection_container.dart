import 'package:get/get.dart';
import 'package:profile_card_app/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:profile_card_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:profile_card_app/features/profile/domain/usecases/get_profile.dart';
import 'package:profile_card_app/features/profile/domain/usecases/update_profile.dart';
import 'package:profile_card_app/features/profile/presentation/controllers/profile_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  // Features - Profile
  Get.lazyPut(() => ProfileController(
        getProfileUseCase: Get.find(),
        updateProfileUseCase: Get.find(),
      ));


  // Profile Use cases
  Get.lazyPut(() => GetProfile(Get.find()));
  Get.lazyPut(() => UpdateProfile(Get.find()));


  // Profile Repository
  Get.lazyPut<ProfileRepository>(() => ProfileRepositoryImpl());


  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
}
