import 'package:flutter/material.dart';

class UserTitle extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const UserTitle({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 1,
            )
          ]
        ),
        margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const Icon(Icons.person),
            const SizedBox(width: 20,),
            Text(text,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
          ],
        ),
      ),
    );
  }
}