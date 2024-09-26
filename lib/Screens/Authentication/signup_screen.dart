import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset('assets/logo1.png'),
              ),            const SizedBox(height: 10,),
          
              const Text('Register as a Driver',style: 
              TextStyle(color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 24),),
                          const SizedBox(height: 10,),
          TextField(
            controller:nameController,
            style: const TextStyle(color: Colors.grey),
            decoration: const InputDecoration(
              labelText: 'Name',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
          color: Colors.grey
                )
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
          color: Colors.grey
                )
              ),
              hintStyle: TextStyle(color: Colors.grey,
              fontSize: 10),
              labelStyle: TextStyle(
                color: Colors.grey,
                fontSize: 10
              )
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            controller:emailController,   
                     keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: Colors.grey),
            decoration: const InputDecoration(
              labelText: 'Email',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
          color: Colors.grey
                )
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
          color: Colors.grey
                )
              ),
              hintStyle: TextStyle(color: Colors.grey,
              fontSize: 10),
              labelStyle: TextStyle(
                color: Colors.grey,
                fontSize: 10
              )
            ),
          ),const SizedBox(height: 10,),
          TextField(
            controller:phoneController,
            keyboardType: TextInputType.phone,
            style: const TextStyle(color: Colors.grey),
            decoration: const InputDecoration(
              labelText: 'Phone',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
          color: Colors.grey
                )
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
          color: Colors.grey
                )
              ),
              hintStyle: TextStyle(color: Colors.grey,
              fontSize: 10),
              labelStyle: TextStyle(
                color: Colors.grey,
                fontSize: 10
              )
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            controller:passwordController,
            obscureText: true,
            keyboardType: TextInputType.text,
            style: const TextStyle(color: Colors.grey),
            decoration: const InputDecoration(
              labelText: 'Password',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
          color: Colors.grey
                )
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
          color: Colors.grey
                )
              ),
              hintStyle: TextStyle(color: Colors.grey,
              fontSize: 10),
              labelStyle: TextStyle(
                color: Colors.grey,
                fontSize: 10
              )
            ),
          ),
          const SizedBox(height: 30,),
          ElevatedButton(onPressed: (){},
           style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightGreenAccent
           ),
           child:Text('Create Accoun',
           style: TextStyle(color: Colors.black54,
           fontSize: 18,
           ),))
            ],
          ),
        ),
      ),
    );
  }
}