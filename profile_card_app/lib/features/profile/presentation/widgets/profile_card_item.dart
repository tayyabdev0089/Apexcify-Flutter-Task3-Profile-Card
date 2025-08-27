import 'package:flutter/material.dart';

class ProfileCardItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  const ProfileCardItem({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.blueGrey,
        ),
        title: Text(
          text,
          style: TextStyle(
            color: Colors.blueGrey.shade900,
            fontSize: 18.0,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
