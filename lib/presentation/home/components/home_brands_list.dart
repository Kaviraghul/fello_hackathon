import 'package:fello_hackathon/data/models/brand_plan_details_model.dart';
import 'package:fello_hackathon/presentation/home/components/brands_list_item.dart';
import 'package:fello_hackathon/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class HomeBrandsList extends StatefulWidget {
  final List<Brand> brandsList;
  const HomeBrandsList({
    required this.brandsList,
    super.key,
  });

  @override
  State<HomeBrandsList> createState() => _HomeBrandsListState();
}

class _HomeBrandsListState extends State<HomeBrandsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p14),
      child: ListView.separated(
        itemCount: widget.brandsList.length,
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: AppSize.s12,
          );
        },
        itemBuilder: (context, index) {
          return HomeBrandListItem(
            logoUrl: widget.brandsList[index].brandLogo,
            brandName: widget.brandsList[index].brandName,
            brandSubtitle: widget.brandsList[index].brandSubtitle,
            discountStatement: widget.brandsList[index].discountStatement,
            dicountPercentage: widget.brandsList[index].discountPercentage,
          );
        },
      ),
    );
  }
}
