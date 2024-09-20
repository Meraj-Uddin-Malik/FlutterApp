import 'package:flutter/material.dart';

class MiCard extends StatelessWidget {
  const MiCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/Profile2.jpg'),
            ),
            const SizedBox(
              height: 10.0,
            ),

            // Container(
            //   width: 100.0,
            //   height: 100.0,
            //   decoration: const BoxDecoration(
            //     shape: BoxShape.circle,
            //     image: DecorationImage(
            //       image: AssetImage('images/Profile.jpg'),
            //       fit: BoxFit
            //           .fill, // Use BoxFit to adjust the image inside the circle
            //       alignment: Alignment.center, // Adjust image alignment
            //       // You can also use BoxFit.contain or BoxFit.fill depending on your needs
            //     ),
            //   ),
            // ),

            const Text(
              'Meraj Uddin Malik',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              'Software Developer',
              style: TextStyle(
                fontFamily: 'Source Code Pro',
                fontSize: 12.0,
                color: Colors.teal.shade100,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),

            SizedBox(
              width: 150.0,
              height: 20.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),

            Card(
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(Icons.phone, color: Colors.teal.shade100),
                title: const Text(
                  '+92 300 289 7237',
                  style: TextStyle(
                    fontFamily: 'Source Code Pro',
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(Icons.email, color: Colors.teal.shade100),
                  title: const Text(
                    'merajuddin618@gmail.com',
                    style: TextStyle(
                      fontFamily: 'Source Code Pro',
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))
          ],
        )),
      ),
    );
  }
}
