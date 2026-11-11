import 'package:flutter/material.dart';

enum ButtonType {
  primary(color:Colors.blue, contentColor: Colors.white),
  secondary(color: Colors.green, contentColor: Colors.white),
  disabled(color: Colors.grey, contentColor: Colors.white);

  final Color color;
  final Color contentColor;

  ButtonType({required this.color, required this.contentColor});
}

enum IconPosition { left, right}


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
     this.iconPosition = IconPosition.left,
     this.type = ButtonType.primary  
  });

  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType type;
  
  @override
  Widget build(BuildContext context) {
    final content = [
      Icon(icon, color: type.contentColor, size: 20),
      const SizedBox(width: 8),
      Text(label, style: TextStyle(color: type.contentColor, fontSize: 20))
    ];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: type.color,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: iconPosition == IconPosition.left ? content : content.reversed.toList()
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom buttons')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              CustomButton(label: 'Submit', icon: Icons.check),
              SizedBox(height: 12),
              CustomButton(
                label: 'Time',
                icon: Icons.access_time,
                iconPosition: IconPosition.right,
                type: ButtonType.secondary,
              ),
              SizedBox(height: 12),
              CustomButton(
                label: 'Account',
                icon: Icons.account_tree,
                iconPosition: IconPosition.right,
                type: ButtonType.disabled,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}