import 'package:flutter/material.dart';
import 'package:store/home_screen.dart';
import 'package:store/second_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  var emailController =TextEditingController();
  var passwordController =TextEditingController();
  GlobalKey<FormState> form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset:true,
      body:Form (
        key: form,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 35.0),
          child: ListView(
            // color: Color(0xFF9575CD),
            children: [
              Center(
                child: Container(
                  height: 40,
                  child: Text(
                    'LogIn',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color:  Color(0xFF5C6BC0),
                    ),
                  ),
                ),
              ),
              Image(
                      image: NetworkImage(
                        "https://media.istockphoto.com/vectors/online-shopping-service-concept-young-woman-and-man-customers-sitting-vector-id1220423068?k=20&m=1220423068&s=612x612&w=0&h=D34gjfS71MLuOfwunc8HyzF78GjagUQlf73MjPkYR8Q=",
                      ),
                      height: 280,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
              TextFormField(
                validator: (String? value){
                  if(value!.isEmpty){
                    return 'User name is required';
                  }
                  return null;
                },
                    controller: emailController,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: ' Your Email Address',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color(0xFF5C6BC0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),),
                ),
              SizedBox(
                height: 20,
              ),
               TextFormField(
                 validator: (String ? value){
                   if(value!.length<6){
                     return('Minimum Is 6 Characters');
                   }

                 },
                 controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: ' Your Password',
                    prefixIcon: Icon(
                      Icons.password,
                      color: Color(0xFF5C6BC0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              TextButton(
                onPressed: () {},
                child: Text('Forget Password!',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Color(0xFF5C6BC0),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                width: 180,
                child: MaterialButton(
                  onPressed: () {
                    if (form.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }
                    print(emailController.text);
                    print(passwordController.text);
                  },
                  color: Color(0xFF5C6BC0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    'SignIn',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have account ?",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondScreen()),
                        );
                      },
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5C6BC0),
                        ),
                      )),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
