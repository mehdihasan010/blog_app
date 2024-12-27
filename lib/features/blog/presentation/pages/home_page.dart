import 'package:blog_app/core/constants/app_assets.dart';
import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/features/blog/presentation/pages/articale_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String name = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Column(
          children: [
            Image.asset(
              AppAssets.imagesLogo,
              width: 250,
            ),
            const SizedBox(height: 10),
            _buildSearchField(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: pages[_currentIndex],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: 'Latest',
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: 'Featured',
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: 'Premium',
          ),
        ],
      ),
    );
  }

  TextFormField _buildSearchField() {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Iconsax.search_normal_1),
        hintText: 'Search Blogs',
        hintStyle: const TextStyle(
          color: AppPallete.borderColor,
        ),
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppPallete.borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(
            color: AppPallete.borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(
            color: AppPallete.gradient1,
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppPallete.backgroundColor,
      title: Image.asset(
        AppAssets.iconsMenu,
        width: 32,
        height: 32,
        color: Colors.white,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: const Image(
              image: AssetImage(AppAssets.imagesProfile),
            ),
          ),
        )
      ],
    );
  }
}
