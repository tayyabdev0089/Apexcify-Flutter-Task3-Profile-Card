import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var name = 'John Doe'.obs;
  var profession = 'Flutter Developer'.obs;
  var description = 'Passionate about building beautiful and functional mobile applications.'.obs;
  var phone = '+1 234 567 890'.obs;
  var email = 'john.doe@example.com'.obs;
  var profileImagePath = 'assets/profile.png'.obs; // Default asset image

  void updateProfile({
    String? newName,
    String? newProfession,
    String? newDescription,
    String? newPhone,
    String? newEmail,
  }) {
    if (newName != null) name.value = newName;
    if (newProfession != null) profession.value = newProfession;
    if (newDescription != null) description.value = newDescription;
    if (newPhone != null) phone.value = newPhone;
    if (newEmail != null) email.value = newEmail;
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      profileImagePath.value = image.path;
    }
  }
}
