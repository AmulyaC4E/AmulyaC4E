import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:my_app/Classic%20Screen/Shopcard.dart';
import 'package:my_app/Model/store_category.dart';
import 'package:my_app/Utils/global_var.dart';
import 'package:my_app/getStoreRange.dart';
import 'package:my_app/screens/store_com_details.dart';
import 'package:my_app/services/category_fumctions.dart';
import 'package:my_app/services/fetch_categoris.dart';
import 'package:my_app/services/search_stores_service.dart';

class SearchAndCategoryPage extends StatefulWidget {
  const SearchAndCategoryPage({super.key});

  @override
  State<SearchAndCategoryPage> createState() => _SearchAndCategoryPageState();
}

class _SearchAndCategoryPageState extends State<SearchAndCategoryPage> {
  Position? _currentPosition;
  String selectedSearchType = 'Category';
  List<String> searchTypes = ['Store Name', 'Category'];
  List<dynamic> categories = [];
  List<StoresCategory> stores = [];
  List<StoresCategory> selectedCategoryStores = [];
  List<StoresCategory> allStores = [];
  bool isLoading = true;
  bool fetchingLocation = true;
  String searchQuery = '';
  String selectedCategory = 'All Categories';
  bool showCategories = true;
  bool isNearToFar = true;
  bool showVerifiedStoresOnly = false;

  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
    fetchAllCategories();
    _fetchAllStores();
  }

  Future<void> _fetchAllStores() async {
    try {
      final response = await fetchAllStores();
      setState(() {
        allStores = response;
        selectedCategoryStores = allStores;
      });
    } catch (e) {
      print('Error fetching all stores: $e');
      setState(() {
        stores = [];
        allStores = [];
      });
    }
  }

  Future<void> fetchAllCategories() async {
    try {
      final allCategories = await fetchCategories();
      setState(() {
        categories = allCategories;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  Future<void> fetchStoresByCategory(String category) async {
    try {
      final response = await fetchCategoryList(category);
      setState(() {
        selectedCategoryStores = response;
      });
    } catch (e) {
      print('Error fetching stores by category: $e');
      setState(() {
        stores = [];
      });
    }
  }

  void handleSearch(String value) {
    setState(() {
      searchQuery = value.toLowerCase();
      if (selectedCategory != 'All Categories') {
        stores = allStores.where((store) {
          return store.storeName.toLowerCase().contains(searchQuery);
        }).toList();
      } else {
        stores = selectedCategoryStores.where((store) {
          return store.storeName.toLowerCase().contains(searchQuery);
        }).toList();
      }
    });
  }

  Future<void> _getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        fetchingLocation = false;
      });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          fetchingLocation = false;
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        fetchingLocation = false;
      });
      return;
    }

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        fetchingLocation = false;
      });
    }).catchError((e) {
      setState(() {
        fetchingLocation = false;
      });
    });
  }

  List<StoresCategory> _filteredStores() {
    final filteredStores = searchQuery.isEmpty
        ? selectedCategoryStores
        : selectedCategoryStores.where((store) {
            final name = store.storeName?.toLowerCase() ?? '';
            return name.contains(searchQuery);
          }).toList();

    final storesToDisplay = showVerifiedStoresOnly
        ? filteredStores.where((store) => store.distance == "VERIFIED").toList()
        : filteredStores;

    return _sortedStoresByDistance(storesToDisplay);
  }

  List<StoresCategory> _sortedStoresByDistance(List<StoresCategory> stores) {
    stores.sort((a, b) {
      final distanceA = (a.latitude != null && a.longitude != null)
          ? getStoreRange(a.latitude, a.longitude, _currentPosition!.latitude,
              _currentPosition!.longitude)
          : double.infinity;
      final distanceB = (b.latitude != null && b.longitude != null)
          ? getStoreRange(b.latitude, b.longitude, _currentPosition!.latitude,
              _currentPosition!.longitude)
          : double.infinity;

      return isNearToFar
          ? distanceA.compareTo(distanceB)
          : distanceB.compareTo(distanceA);
    });
    return stores;
  }

  Widget _buildNoStoresMessage() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.store_mall_directory_outlined,
              size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No stores found in this category',
            textAlign: TextAlign.center, // Aligns text to the center
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w100,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              selectedCategory,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            IconButton(
              icon: Icon(
                  showCategories ? Icons.arrow_drop_up : Icons.arrow_drop_down),
              onPressed: () {
                setState(() {
                  showCategories = !showCategories;
                });
              },
            ),
          ],
        ),
        if (showCategories)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.map((category) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category['categoryName'];
                    });
                    fetchStoresByCategory(selectedCategory);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: selectedCategory == category['categoryName']
                            ? Colors.purple
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        category['categoryName'],
                        style: TextStyle(
                          color: selectedCategory == category['categoryName']
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }

  Widget _buildHeaderRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  selectedCategory,
                  style: const TextStyle(
                      fontWeight: FontWeight.w200, fontSize: 14),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openEndDrawer();
            },
            child: Row(
              children: [
                const Text(
                  'Search By: ',
                  style: TextStyle(fontSize: 14),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: selectedSearchType,
                    items: searchTypes.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedSearchType = newValue!;
                        if (newValue == 'Store Name') {
                          selectedCategory = 'All Categories';
                          _fetchAllStores();
                        }
                      });
                    },
                    style: const TextStyle(color: Colors.black),
                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    underline: Container(
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search',
          style: TextStyle(fontSize: 15),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: isLoading || fetchingLocation
          ? Center(
              child: Lottie.network(
                "https://lottie.host/7adc6a07-c76f-4aea-a1c5-58602a49e7f0/hEeTKUMeaS.json",
                errorBuilder: (context, error, stackTrace) {
                  return CircularProgressIndicator();
                },
              ),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    onChanged: handleSearch,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.store_rounded),
                      labelText: 'Search Stores or Categories',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                _buildHeaderRow(),
                if (selectedSearchType == 'Category')
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = 'All Categories';
                              });
                              _fetchAllStores();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: selectedCategory == 'All Categories'
                                      ? Colors.purple
                                      : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'All Categories',
                                  style: TextStyle(
                                    color: selectedCategory == 'All Categories'
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ...categories.map((category) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCategory = category['categoryName'];
                                });
                                fetchStoresByCategory(selectedCategory);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: selectedCategory ==
                                            category['categoryName']
                                        ? Colors.purple
                                        : Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    category['categoryName'],
                                    style: TextStyle(
                                      color: selectedCategory ==
                                              category['categoryName']
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 10),
                Expanded(
                  child: _filteredStores().isEmpty
                      ? _buildNoStoresMessage()
                      : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: _getCrossAxisCount(context),
                              crossAxisSpacing: _getCrossAxisSpacing(context),
                              mainAxisSpacing: _getMainAxisSpacing(context),
                              childAspectRatio: _getChildAspectRatio(context),
                            ),
                            itemCount: _filteredStores().length,
                            itemBuilder: (context, index) {
                              final store = _filteredStores()[index];
                              final distance = (store.latitude != null &&
                                      store.longitude != null)
                                  ? getStoreRange(
                                      store.latitude,
                                      store.longitude,
                                      _currentPosition!.latitude,
                                      _currentPosition!.longitude)
                                  : 0.0;

                              return GestureDetector(
                                onTap: () {
                                  GlobalVar.selectedStorePhone =
                                      store.storePhone;
                                  GlobalVar.selectedStore = store.storeName;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          StoreCompleteDetails(
                                        title: store.storeName.toString(),
                                        storePhone: store.storePhone.toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: ShopCard(
                                  name: store.storeName,
                                  imagePath: store.imageUrl,
                                  distance: distance,
                                  rating: store.rating ?? 0.0,
                                ),
                              );
                            },
                          ),
                        ),
                ),
              ],
            ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width > 1200) return 5;
    if (width > 600) return 3;
    return 3;
  }

  double _getCrossAxisSpacing(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return width > 1200 ? 12.0 : (width > 600 ? 10.0 : 8.0);
  }

  double _getMainAxisSpacing(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return width > 1200 ? 25.0 : (width > 800 ? 15.0 : 10.0);
  }

  double _getChildAspectRatio(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return width > 1200 ? 1.2 : (width > 600 ? 0.9 : 0.6);
  }
}
