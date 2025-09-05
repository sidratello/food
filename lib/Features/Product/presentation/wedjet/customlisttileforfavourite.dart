import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? imageUrl;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const CustomListTile({
    Key? key,
    required this.title,
    this.subtitle,
    this.imageUrl,
    this.onTap,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    
            leading: Container(
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.pink.shade200, width: 2),
              //   shape: BoxShape.circle,
              // ),
                  child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: imageUrl != null
                ? Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                  )
                : const Icon(Icons.image_not_supported,
                    size: 28, color: Colors.grey),
          ),
        
            ),
          
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: subtitle != null
              ? Text(
                  subtitle!,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 14,
                  ),
                )
              : null,
          trailing: onDelete != null
              ? IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: onDelete,
                )
              : const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
        ),
      ),
    );
  }
}
