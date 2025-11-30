import 'package:flutter/material.dart';
import 'package:store_app/views/screens/nav_screens/widgets/smal_icon_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width,
      //ini pengaturan untuk tinggi background header
      height: height * 0.15,
      child: Stack(
        children: [
          // Background banner
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset(
                'assets/icons/searchBanner.jpeg',
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 38),
            child: Row(
              children: [
                // Search box
                Expanded(
                  child: Container(
                    height: 40, // 🔥 Lebih kecil & konsisten
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 6,
                          color: Colors.black26,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      style: const TextStyle(fontSize: 13),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),

                        // 🔥 Ikon diperkecil
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Image.asset(
                            'assets/icons/searc1.png',
                            width: 14,
                            height: 14,
                            color: Colors.black,
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Image.asset(
                            'assets/icons/cam.png',
                            width: 14,
                            height: 14,
                            color: Colors.black,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(top: 6),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                // Bell Icon
                SmallIconWidget(asset: 'assets/icons/bell.png', onTap: () {}),

                const SizedBox(width: 8),

                // Message Icon
                SmallIconWidget(
                  asset: 'assets/icons/message.png',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
