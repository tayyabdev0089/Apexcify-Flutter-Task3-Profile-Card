import 'package:profile_card_app/features/profile/domain/entities/profile.dart';

class ProfileModel extends Profile {
  const ProfileModel({
    required super.name,
    required super.profession,
    required super.description,
    required super.phone,
    required super.email,
    required super.profileImagePath,
    super.facebookUrl,
    super.instagramUrl,
    super.linkedinUrl,
    super.githubUrl,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      profession: json['profession'],
      description: json['description'],
      phone: json['phone'],
      email: json['email'],
      profileImagePath: json['profileImagePath'],
      facebookUrl: json['facebookUrl'] ?? '',
      instagramUrl: json['instagramUrl'] ?? '',
      linkedinUrl: json['linkedinUrl'] ?? '',
      githubUrl: json['githubUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'profession': profession,
      'description': description,
      'phone': phone,
      'email': email,
      'profileImagePath': profileImagePath,
      'facebookUrl': facebookUrl,
      'instagramUrl': instagramUrl,
      'linkedinUrl': linkedinUrl,
      'githubUrl': githubUrl,
    };
  }

  factory ProfileModel.fromEntity(Profile profile) {
    return ProfileModel(
      name: profile.name,
      profession: profile.profession,
      description: profile.description,
      phone: profile.phone,
      email: profile.email,
      profileImagePath: profile.profileImagePath,
      facebookUrl: profile.facebookUrl,
      instagramUrl: profile.instagramUrl,
      linkedinUrl: profile.linkedinUrl,
      githubUrl: profile.githubUrl,
    );
  }
}
