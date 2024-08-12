import "dart:async";

import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:my_first_app/title_page.dart";



// class HomePage extends StatelessWidget {
  
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           child: Text(  
//             "Button",
//           ),
//           onPressed: () {},
//         ),
        
//      ),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});
   
  
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final lastNameController = TextEditingController();
   
  final keyForm  = GlobalKey<FormState>(); 
  
  GenderEnum gender = GenderEnum.Male;
  bool isChecket = false;


  void onSubmit(){
    if(keyForm.currentState!.validate()){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(lastNameController.text),
        ),
      );
    };

  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Home page",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
       body: Center(
        child: Form(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                TextFormField(
                  key: keyForm,
                  controller: lastNameController,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Хоосон байж болохгүй";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Овог"),
                    hintText: "Овогоо бичнэ үү",
                  ),
                ),
                 
                 DropdownButtonFormField(
                  validator: (value){
                    if(value == "1"){
                      return "Dropdown 1iig songoh bolomjgvi";
                    }
                    return null;
                  },
                  items: [
                    DropdownMenuItem(
                      value:1,
                      child:  Text("Dropdown1"),
                    ),
                    DropdownMenuItem(
                      value: 2, 
                      child: Text("Dropdown1")
                    ),
                    DropdownMenuItem(
                      value: 3, 
                      child: Text("Dropdown1")
                    ),
                  ], 
                  onChanged: (value) {}
                  ),
                  
                Row(
                  children: [
                    Radio(
                        value: GenderEnum.Male, 
                        groupValue: gender, 
                        onChanged: (value){
                          if(value != null)
                          setState(() {
                            gender = value;
                          });
                        }
                    ),
                    Text("Male")
                  ],
                ),
                  Row(
                  children: [
                    Radio(
                        value: GenderEnum.Female, 
                        groupValue: gender, 
                        onChanged: (value){
                           if(value != null)
                          setState(() {
                            gender = value;
                          });
                        }
                    ),
                    Text("Female")
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                    value: isChecket, 
                    onChanged: (val){
                      setState(() {
                        isChecket = !isChecket;
                      });
                    },
                    ),
                    Text(
                      "vilchilgeenii nuhtsul zuwshuurch baih"
                    )
                  ],
                ),
                     
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: onSubmit, 
                  child: Text("Sumbit"),
                ),
              ],
            ),
          ),
                   
        ), 
      ),
    );
  }
}

enum GenderEnum {Male, Female}