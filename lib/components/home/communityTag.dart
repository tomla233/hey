import 'package:flutter/material.dart';

class CommunityTag extends StatelessWidget {
  final String communityName;
  final String communityLogo;
  static const logoSize = 12.0;
  
  const CommunityTag({
    super.key,
    required this.communityName,
    required this.communityLogo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          decoration: BoxDecoration(
            color: const Color(0xFFF3F4F6),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                communityLogo,
                width: logoSize,
                height: logoSize,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.image,
                    size: logoSize,
                    color: Color(0xFFC8CDD1),
                  );
                },
              ),
              const SizedBox(width: 6),
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  communityName,
                  style: const TextStyle(color: Color(0xFF676B70), fontSize: 10),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}