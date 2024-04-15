import 'package:chatapp/auth/login.dart';
import 'package:chatapp/auth/sinup.dart';
import 'package:flutter/material.dart';

class SelectLR extends StatelessWidget {
  const SelectLR({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.person_outline,size: 100,color: Colors.deepPurpleAccent,),
            const Text("Welcome",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.deepPurple),),
            const SizedBox(height: 20,),
            const Text("WORLD'S MOST PRIVATE CHATTING APP",style: TextStyle(color: Colors.deepPurple),),
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: Container(
                width: 230,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black,width: 1.3),
                ),
                child: const Center(
                  child: Text("LOGIN",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 26,color: Colors.deepPurple),),
                ),
              ),
            ),
            const SizedBox(height: 7,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegisterScreen()));
              },
              child: Container(
                width: 230,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(20),
                  // border: Border.all(color: Colors.black,width: 1.3),
                ),
                child: const Center(
                  child: Text("SIGNUP",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 26,color: Colors.white),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}