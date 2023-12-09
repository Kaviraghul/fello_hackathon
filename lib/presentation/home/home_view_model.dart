import 'dart:convert';

import 'package:fello_hackathon/app/base_view_model.dart';
import 'package:fello_hackathon/data/dummy_data/brands_list.dart';
import 'package:fello_hackathon/data/models/brand_plan_details_model.dart';

class HomeViewModel extends BaseViewModel {
  List<Brand> brandsList = (json.decode(dummyBrandsData) as List)
      .map((data) => Brand.fromMap(data))
      .toList();

  @override
  void viewModelDispose() {
    // TODO: implement viewModelDispose
  }

  @override
  void viewModelInitiate() {
    // TODO: implement viewModelInitiate
  }
}
