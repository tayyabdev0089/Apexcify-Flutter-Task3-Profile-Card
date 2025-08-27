import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String name;
  final String profession;
  final String description;
  final String phone;
  final String email;
  final String profileImagePath;
  final String facebookUrl;
  final String instagramUrl;
  final String linkedinUrl;
  final String githubUrl;

  const Profile({
    required this.name,
    required this.profession,
    required this.description,
    required this.phone,
    required this.email,
    required this.profileImagePath,
    this.facebookUrl = '',
    this.instagramUrl = '',
    this.linkedinUrl = '',
    this.githubUrl = '',
  });

  Profile copyWith({
    String? name,
    String? profession,
    String? description,
    String? phone,
    String? email,
    String? profileImagePath,
    String? facebookUrl,
    String? instagramUrl,
    String? linkedinUrl,
    String? githubUrl,
  }) {
    return Profile(
      name: name ?? this.name,
      profession: profession ?? this.profession,
      description: description ?? this.description,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      profileImagePath: profileImagePath ?? this.profileImagePath,
      facebookUrl: facebookUrl ?? this.facebookUrl,
      instagramUrl: instagramUrl ?? this.instagramUrl,
      linkedinUrl: linkedinUrl ?? this.linkedinUrl,
      githubUrl: githubUrl ?? this.githubUrl,
    );
  }

  @override
  List<Object?> get props => [
        name,
        profession,
        description,
        phone,
        email,
        profileImagePath,
        facebookUrl,
        instagramUrl,
        linkedinUrl,
        githubUrl,
      ];
}
