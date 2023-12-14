import 'package:calculadora/widgets/common/app_colors.dart';
import 'package:flutter/material.dart';

sealed class ButtonClick {
  final String value;

  ButtonClick(this.value);
}

class CommonButtonClick extends ButtonClick {
  CommonButtonClick(super.value);
}

class EqualsButtonClick extends ButtonClick {
  EqualsButtonClick(super.value);
}

class ClearButtonClick extends ButtonClick {
  ClearButtonClick(super.value);
}

class ClearEntryButtonClick extends ButtonClick {
  ClearEntryButtonClick(super.value);
}

class ButtonHub extends StatelessWidget {
  final void Function(ButtonClick click)? onButtonClick;

  const ButtonHub({super.key, required this.onButtonClick});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        verticalDirection: VerticalDirection.down,
        children: [
          ButtonColum([
            Button(value: 'C', color: AppColors.operator, onTap: (value) => onButtonClick!(ClearButtonClick(value)),),
            Button(value: '9', onTap: (value) => onButtonClick!(CommonButtonClick(value)),),
            Button(value: '6', onTap: (value) => onButtonClick!(CommonButtonClick(value)),),
            Button(value: '3', onTap: (value) => onButtonClick!(CommonButtonClick(value)),),
            Button(value: '0', onTap: (value) => onButtonClick!(CommonButtonClick(value)),),
          ]),
          ButtonColum([
            Button(value: '/', color: AppColors.operator, onTap: (value) => onButtonClick!(CommonButtonClick(value)),),
            Button(value: '8', onTap: (value) => onButtonClick!(CommonButtonClick(value)),),
            Button(value: '5', onTap: (value) => onButtonClick!(CommonButtonClick(value)),),
            Button(value: '2', onTap: (value) => onButtonClick!(CommonButtonClick(value)),),
            Button(value: '%', onTap: (value) => onButtonClick!(CommonButtonClick(value)),),
          ]),
          ButtonColum([
            Button(value: '*', color: AppColors.operator, icon: Icons.clear, onTap: (value) => onButtonClick!(CommonButtonClick(value)),),
            Button(value: '7', onTap: (value) => onButtonClick!(CommonButtonClick(value)),),
            Button(value: '4', onTap: (value) => onButtonClick!(CommonButtonClick(value)),),
            Button(value: '1', onTap: (value) => onButtonClick!(CommonButtonClick(value)),),
            Button(value: '.', onTap: (value) => onButtonClick!(CommonButtonClick(value)),),
          ]),
          ButtonColum([
            Button(value: 'CE', color: AppColors.operator, icon: Icons.backspace_outlined, onTap: (value) => onButtonClick!(ClearEntryButtonClick(value)),),
            Button(value: '+',color: AppColors.operator, icon: Icons.add_outlined, onTap: (value) => onButtonClick!(CommonButtonClick(value)),),
            Button(value: '-', color: AppColors.operator, icon: Icons.remove_outlined, onTap: (value) => onButtonClick!(CommonButtonClick(value)),),
            Button(value: '=', big: true, color: AppColors.result, icon: Icons.drag_handle_sharp, onTap: (value) => onButtonClick!(EqualsButtonClick(value))),
          ]),
        ],
      ),
    );    
  }
}

class Button extends StatelessWidget {
  final String value;
  final Color? color;
  final bool big;
  final IconData? icon;
  final void Function(String value)? onTap;
  const Button(
      {super.key,
      required this.value,
      this.color,
      this.onTap,
      this.big = false,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: big ? 2 : 1,
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(3),
            backgroundColor: MaterialStatePropertyAll(color ?? AppColors.keybordColor),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
          ),
          onPressed: () {
            if (onTap != null) {
              onTap!(value);
            }
          },
          child: icon != null 
            ? Icon(
                icon,
                color: Colors.white,
                size: 32,
              )
            : Text(value, style: const TextStyle(
            color: Colors.white,
            fontSize: 28
          ),),
          
        )
    );
  }
}

class ButtonColum extends StatelessWidget {
  final List<Button> buttons;

  const ButtonColum(this.buttons, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons,
      ),
    );
  }
}
