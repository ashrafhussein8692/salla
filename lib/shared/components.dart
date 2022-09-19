import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

formField(
  BuildContext context, {
  controller,
  required keyBoard,
  required String label,
  IconData? prefix,
  IconData? suffix,
  required validate,
  onTap,
      onChanged,
      submit,
  bool obscure = false,
}) =>
    Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Color(0xFF6200EA),
            ),
      ),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: SizedBox(
          // height: 50,
          child: TextFormField(

            // style: TextStyle(height: 1),
            controller: controller,
            keyboardType: keyBoard,
            validator: validate,
            obscureText: obscure,
            onTap: onTap,
            onChanged: onChanged,
            onFieldSubmitted: submit,
            decoration: InputDecoration(
              contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, ),
              labelText: label,
              prefixIcon: Icon(
                prefix,
              ),
              suffixIcon: Icon(
                suffix,
              ),
              labelStyle: TextStyle(fontSize: 15, ),
              focusedBorder:
              OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: Color(0xFF6200EA),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),

              floatingLabelStyle:
                  TextStyle(color: Color(0xFF6200EA), fontSize: 15,height: 1),
            ),
          ),
        ),
      ),
    );
class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color:  Color(0xFF6200EA),
      ),

      child: TextButton(

        style: TextButton.styleFrom(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          primary:  Color(0xFF6200EA),

        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),textScaleFactor: 1,
        ),
      ),
    );
  }
}
void navigatorTo(context,Widget widget)=>
    Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
void navigatorAndFinish(context,Widget widget)=>
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>widget),(route)=> false);
void toast({
  required String text,
  required Color color
})=>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 14
    );

