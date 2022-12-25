import 'package:flutter/material.dart';
import 'package:rwcourses/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterStateContainer extends StatefulWidget {
  final Widget child;

  const FilterStateContainer({Key? key, required this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FilterState();

  static FilterState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_FilterInheritedWidget>()!
        .state;
  }
}

class FilterState extends State<FilterStateContainer> {
  int filterValue = Constants.allFilter;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadValue();
  }

  void _loadValue() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      filterValue = _prefs.getInt(Constants.filterKey) ?? 0;
    });
  }

  void updateFilterValue(int value) {
    setState(() {
      _prefs.setInt(Constants.filterKey, value);
      filterValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _FilterInheritedWidget(state: this, child: widget.child);
  }
}

class _FilterInheritedWidget extends InheritedWidget {
  final FilterState state;

  const _FilterInheritedWidget(
      {Key? key, required this.state, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
