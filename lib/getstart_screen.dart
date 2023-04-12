import 'package:flutter/material.dart';
import 'home_screen.dart';

// ignore: camel_case_types
class GetStart_Screen extends StatelessWidget {
  const GetStart_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Center(child: Image.asset("images/Notes-Logo.jpg")
          ),
          const SizedBox(height: 30),

          ElevatedButton(
          child: Text('get start'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>const Home_Screen()),
            );
          },
          style: ButtonStyle(

            backgroundColor: MaterialStateProperty.all<Color>(Colors.pink), 
            
            minimumSize: MaterialStateProperty.all<Size>(
            const Size(230, 50),
        ),     
        ),
        )
        ],
      ),
    );
  }
}
