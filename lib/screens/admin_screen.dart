import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/theme_controller.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hey 👋'),
        actions: [
          IconButton(
            icon: Icon(themeController.isDarkMode.value
                ? Icons.light_mode
                : Icons.dark_mode),
            onPressed: () {
              themeController.toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildSellerInformationSection(),
              const SizedBox(height: 20),
              _buildBuyerInformationSection(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Seller Information Section
  Widget _buildSellerInformationSection() {
    final ThemeController themeController = Get.find<ThemeController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            // Navigate to the Sellers list screen
            // Get.to(() => SellersListScreen());
          },
          child: const Text(
            'Seller Information',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(10),
          color: themeController.isDarkMode.value ? Colors.grey[800] : Colors.grey[200],
          height: 250,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigate to the Sellers list screen
                      // Get.to(() => SellersListScreen());
                    },
                    child: Text(
                      'Sellers',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: themeController.isDarkMode.value ? Colors.white : Colors.black, // Updated
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to another page or perform an action
                      // Get.to(() => SellersListScreen());
                    },
                    child: Row(
                      children: const [
                        Text('View All', style: TextStyle(color: Colors.brown)),
                        Icon(Icons.arrow_forward_ios, color: Colors.brown),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return _buildSellerCard(
                      sellerName: 'Seller $index',
                      province: 'Province $index',
                      state: 'State $index',
                      isDarkMode: themeController.isDarkMode.value,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Buyer Information Section
  Widget _buildBuyerInformationSection() {
    final ThemeController themeController = Get.find<ThemeController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            // Navigate to the Buyers list screen
            // Get.to(() => BuyersListScreen());
          },
          child: const Text(
            'Buyer Information',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(10),
          color: themeController.isDarkMode.value ? Colors.grey[800] : Colors.grey[200],
          height: 250,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigate to the Buyers list screen
                      // Get.to(() => BuyersListScreen());
                    },
                    child: Text(
                      'Buyers',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: themeController.isDarkMode.value ? Colors.white : Colors.black, // Updated
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to another page or perform an action
                      // Get.to(() => BuyersListScreen());
                    },
                    child: Row(
                      children: const [
                        Text('View All', style: TextStyle(color: Colors.brown)),
                        Icon(Icons.arrow_forward_ios, color: Colors.brown),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return _buildBuyerCard(
                      buyerName: 'Buyer $index',
                      province: 'Province $index',
                      state: 'State $index',
                      isDarkMode: themeController.isDarkMode.value,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Method to build seller card
  Widget _buildSellerCard({
    required String sellerName,
    required String province,
    required String state,
    required bool isDarkMode,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              sellerName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.brown,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Province: $province',
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.brown),
            ),
            Text(
              'State: $state',
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.brown),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build buyer card
  Widget _buildBuyerCard({
    required String buyerName,
    required String province,
    required String state,
    required bool isDarkMode,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buyerName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.brown,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Province: $province',
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.brown),
            ),
            Text(
              'State: $state',
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.brown),
            ),
          ],
        ),
      ),
    );
  }
}
