import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.brown[600],
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Seller Information',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(10), // Added padding to the container
          color: Colors.grey[200], // Greyish background for differentiation
          height: 250, // Increased height of the container
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sellers',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to another page or perform an action
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
                  itemCount: 10, // Number of seller cards
                  itemBuilder: (context, index) {
                    return _buildSellerCard(
                      sellerName: 'Seller $index',
                      province: 'Province $index',
                      state: 'State $index',
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Buyer Information',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(10), // Added padding to the container
          color: Colors.grey[200], // Greyish background for differentiation
          height: 250, // Increased height of the container
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Buyers',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to another page or perform an action
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
                  itemCount: 10, // Number of buyer cards
                  itemBuilder: (context, index) {
                    return _buildBuyerCard(
                      buyerName: 'Buyer $index',
                      province: 'Province $index',
                      state: 'State $index',
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
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10), // Increased vertical margin
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
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Province: $province',
              style: const TextStyle(color: Colors.brown),
            ),
            Text(
              'State: $state',
              style: const TextStyle(color: Colors.brown),
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
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10), // Increased vertical margin
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
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Province: $province',
              style: const TextStyle(color: Colors.brown),
            ),
            Text(
              'State: $state',
              style: const TextStyle(color: Colors.brown),
            ),
          ],
        ),
      ),
    );
  }
}
