import 'package:fello_hackathon/presentation/home/components/home_brands_list.dart';
import 'package:fello_hackathon/presentation/home/home_view_model.dart';
import 'package:fello_hackathon/presentation/resources/colors_manager.dart';
import 'package:fello_hackathon/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeViewModel _homeViewModel = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppSize.s200),
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.black,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          // child: Text,
        ),
      ),
      body: HomeBrandsList(
        brandsList: _homeViewModel.brandsList,
      ),
    );
  }
}
