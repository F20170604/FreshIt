import 'package:flutter/material.dart';

class BottomNavItem {
  final IconData icon;
  final String text;
  BottomNavItem(this.icon, this.text);
}
class BottomNav extends StatefulWidget {
  BottomNav({
    this.items,
    this.height: 60,
    this.iconSize: 40.0,
    this.color,
    this.backgroundColor,
    this.selectedColor,
    this.onTabSelected
  }) {

  }

  final List<BottomNavItem> items;
  final Color color;
  final Color backgroundColor;
  final selectedColor;
  final double height;
  final double iconSize;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() {
    return new BottomNavState();
  }
}

class BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    items.insert(items.length >> 1, _buildMiddleTabItem());
    return Container(
      height: widget.height,
      child: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items,
        ),
        color: Colors.white,
        shape: CircularNotchedRectangle(),
      ),
    );
  }

  Widget _buildTabItem({
    BottomNavItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    return new Expanded(
      child: SizedBox(
        height:widget.height,
        child: InkWell(
          onTap: ()=>onPressed(index),
          splashColor: Colors.blueAccent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                item.icon,
                size: widget.iconSize,
                color: _selectedIndex == index ? Colors.blueAccent:Colors.black54,
              ),
              Text(
                item.text,
                style: TextStyle(
                  color: _selectedIndex == index ? Colors.blueAccent:Colors.black54
                ),)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return new Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.height),
            //Text('Add')
          ],
        ),
      ),
    );
  }
}