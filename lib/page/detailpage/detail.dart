import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/majesticons.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: w * .12, horizontal: h * .04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'images/avatar.png',
                    width: 38,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Britney Glayers',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400, fontSize: 12),
                    ),
                    Row(
                      children: [
                        Text(
                          'New York-USA',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400, fontSize: 12),
                        ),
                        const Iconify(
                            MaterialSymbols.keyboard_arrow_down_rounded)
                      ],
                    )
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Iconify(
                    Majesticons.dashboard_line,
                    size: 32,
                    color: Colors.black,
                  ),
                  onPressed: (){},
                ),
              ],
            ),
            const Spacer(),
            const Text("User Detail",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            Padding(
              padding: const EdgeInsets.only(left: 40.0,top: 20,right: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network("${FirebaseAuth.instance.currentUser?.photoURL}",fit: BoxFit.cover,),
                  const SizedBox(height: 20,),
                  Row(                    
                    children: [
                      const Text("Display Name: "),
                      Text(FirebaseAuth.instance.currentUser?.displayName ?? "",style: const TextStyle(fontSize: 16),),
                    ],
                  ),
                  Row(                    
                    children: [
                      const Text("Email: "),
                      Text(FirebaseAuth.instance.currentUser?.email ?? "",style: const TextStyle(fontSize: 16),),
                    ],
                  ),
                  Row(                    
                    children: [
                      const Text("Phone: "),
                      Text(FirebaseAuth.instance.currentUser?.phoneNumber ?? "",style: const TextStyle(fontSize: 16),),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2,),
          ],
        ),
      ),
    );
  }
}
