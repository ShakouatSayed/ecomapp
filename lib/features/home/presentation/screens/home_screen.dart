import 'package:flutter/material.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_caousel_slide.dart';
import '../widgets/home_catagory_section.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/home_section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Padding(
        padding: .symmetric(horizontal: 8.0),
        child: Column(
          spacing: 8,
          children: [
            const SizedBox(height: 8),
            HomeSearchBar(),
            const SizedBox(height: 8),
            HomeCarouselSlide(),
            const SizedBox(height: 12),
            HomeSectionHeader(title: 'Category', onTapSeeAll: () {}),
            HomeCatagorySection(),
          ],
        ),
      ),
    );
  }
}
