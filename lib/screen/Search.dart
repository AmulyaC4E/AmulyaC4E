import 'package:BNB_New_UI/Models/StoreDetailsModel.dart';
import 'package:BNB_New_UI/Services/FetchAllStoreService.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:BNB_New_UI/constants.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String selectedSearchType = 'Category';
  List<String> searchTypes = ['Store Name', 'Category'];
  String selectedCategory = 'All Categories';
  List<StoreDetailsModel> selectedCategoryStores = [];
  List<StoreDetailsModel> allStores = [];
  List<StoreDetailsModel> stores = [];

  Future<void> _fetchAllStores() async {
    try {
      final response = await fetchAllStores();
      setState(() {
        allStores = response;
        selectedCategoryStores = allStores;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching all stores: $e');
      }
      setState(() {
        stores = [];
        allStores = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kscaffoldcolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                title: const Text(
                  'Search',
                  style: TextStyle(fontSize: 16),
                ),
                backgroundColor: kscaffoldcolor,
                elevation: 0,
              ),
              const Searchbar(),
              const SizedBox(height: 2),
            ],
          ),
        ),
      ),
    );
  }
}

class Searchbar extends StatelessWidget {
  const Searchbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kcontentColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade400, width: 1.5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.store,
                color: Colors.grey,
              ),
              SizedBox(width: 10),
              Text(
                'Search store or Category',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
