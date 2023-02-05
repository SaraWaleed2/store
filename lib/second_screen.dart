import 'package:flutter/material.dart';
import 'package:store/main.dart';

class SecondScreen extends StatelessWidget {
  GlobalKey<FormState> form =GlobalKey <FormState>();
  var userName = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body:
        Form(
          key:form,
          child:
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 45),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                        child: Text(
                          'SignUp',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color(0xFF5C6BC0),
                          ),
                        ),
                      ),
                  Image(
                        image: NetworkImage(
                          "https://media.istockphoto.com/vectors/big-sale-hurrying-promo-black-friday-online-banner-vector-id1144690411?b=1&k=20&m=1144690411&s=170667a&w=0&h=FTMEQTOPYA-1-0RwbU-jOFGMlWXtYFgR6FkQQ7R8N74=",
                        ),
                        height:230,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'User name is required';
                      }
                      return null;
                    },
                    controller: userName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: ('UserName'),
                      prefixIcon: Icon(
                        Icons.account_circle_rounded,
                        color:  Color(0xFF5C6BC0),
                      ),
                    ),

                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'Email is required';
                      }
                      return null;
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular(20)),
                      labelText: ('Email'),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xFF5C6BC0),
                      ),
                    ),

                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    validator: (String? value){
                      if(value!.length <6){
                        return 'Password is required';
                      }
                      return null;
                    },
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular(20)),
                      labelText: ('Password'),
                      prefixIcon: Icon(
                        Icons.password,
                        color:  Color(0xFF5C6BC0),
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    height: 15,
                    thickness: 3,
                    color: Color(0xFF5C6BC0),
                    indent: 50.0,
                    endIndent: 50.0,
                  ),
                  SizedBox(
                    height: 17.0,
                  ),
                  Container(
                    width: 250.0,
                    height: 50.0,
                    child: MaterialButton(
                      onPressed: () {
                        if(form.currentState!.validate()){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()),);
                        }
                        print(userName.text);
                        print(emailController.text);
                        print(passwordController.text);
                      },
                      color: Color(0xFF5C6BC0),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

    );
  }
}

