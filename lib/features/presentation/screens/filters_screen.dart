import 'package:flutter/material.dart';
import 'package:meals_app/features/presentation/widgets/main_drawer.dart';
import 'package:meals_app/viewmodel.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});
  // static const routeName = '/filter_screen';
  // final currentFilters;
  // final Function(Map<String, bool>) setFilters;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _glutenFree = false;

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function(bool) updatedValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updatedValue,
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final currentFilters = context.read<MealsViewModel>().filters;
      setState(() {
        _glutenFree = currentFilters['gluten'] ?? false;
        _lactoseFree = currentFilters['lactose'] ?? false;
        _vegetarian = currentFilters['vegetarian'] ?? false;
        _vegan = currentFilters['vegan'] ?? false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    void _saveFilters() {
      final selectedFilters = {
        'gluten': _glutenFree,
        'lactose': _lactoseFree,
        'vegan': _vegan,
        'vegetarian': _vegetarian,
      };
      context.read<MealsViewModel>().setFilters(selectedFilters);
    }

    ;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () => _saveFilters(),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Adjust your meal selection.',
              // style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
