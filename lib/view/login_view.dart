import 'package:flutter/material.dart';
import 'package:gharsah_flutter/view/pages/info_page.dart';
import 'package:gharsah_flutter/view/sign_in_view.dart';

import '../components/text_form_global.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(


        child: Container(
          color: Colors.green,
          height: double.infinity,

          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //   alignment: Alignment.center,
              //   child: const Text(
              //     "Logo",
              //     style: TextStyle(
              //         color: Colors.cyan,
              //         fontSize: 35,
              //         fontWeight: FontWeight.bold),
              //   ),
              // ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.all(5),
                // color: AppColors.gWhite,
                height: 55,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.lightGreenAccent,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage("assets/img/laila1.jpeg"),
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormGlobal(
                controller: emailController,
                icon: Icon(Icons.alternate_email_outlined,color: Colors.lightGreenAccent,),
                text: 'E-MAIL',),
              TextFormGlobal(
                controller: emailController,
                icon: Icon(Icons.key,color: Colors.lightGreenAccent),
                text: 'PASSWORD',
              ),
              SizedBox(width: 300,
                height: 40,
                child: ElevatedButton(

                  onPressed: () {},
                  style: ButtonStyle(
                    // maximumSize: MaterialStateProperty.all(hi),
                      backgroundColor:MaterialStateProperty.all(Colors.red) ,
                      shape: MaterialStateProperty.all(

                        RoundedRectangleBorder(



                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.black12)
                        ),
                      )),
                  child: Text('Login With Email'),
                ),),
              Container(
                margin: EdgeInsets.only(left: 60,top: 20),
                child: Row(

                  children:[

                    Text("Didn't have an a account? "),
                    InkWell(onTap: (){
                      var router =
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>sign_in_view());
                      Navigator.of(context).push(router);
                    },
                        child: Text("Sign Up" ,style: TextStyle(fontWeight:FontWeight.bold ),)),
                  ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}

