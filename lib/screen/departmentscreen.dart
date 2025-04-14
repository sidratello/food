import 'package:flutter/material.dart';
import 'package:flutter_application_7/data/model/offermodel.dart';
import 'package:flutter_application_7/services/offerserveses.dart';
import 'package:flutter_application_7/wedjet/department/offercart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Sweet Delight"),
        leading: const Icon(Icons.cake_rounded),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_active),
          )
        ],
      ),
       body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hello, what would you like today? 😋",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                hintText: "Search for type of sweet, name, or ingredients",
                hintStyle: TextStyle(fontSize: 12),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
    
                          ),
                              const SizedBox(height: 24),
            const Text("🔥 Today's Offers", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

            const SizedBox(height: 12),
            SizedBox(
  height: 50, 
           child: FutureBuilder<List<OfferModel>>(
                future: OfferServices().getOffers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Text("Something went wrong");
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text("No offers available");
                  } else {
                   List<OfferModel> offers = snapshot.data!;
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: offers.length,
                      separatorBuilder: (context, index) => const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        return OfferCard( offer:offers[index],);
                      },
                    );
                  }
                },
              ),
            ),
            
          ],
    ),

       ),
    );
  }
}
