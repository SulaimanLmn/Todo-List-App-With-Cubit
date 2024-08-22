import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/bloc/nav_bloc.dart';

class NavPage extends StatelessWidget {
  const NavPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navBloc = BlocProvider.of<NavBloc>(context);

    return BlocBuilder<NavBloc, int>(
      builder: (context, state) {
        return Scaffold(
          body: navBloc.getCurrentPage(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state,
            onTap: (index) => navBloc.add(NavUpdated(index: index)),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: "All"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.check), label: "Complete")
            ],
          ),
        );
      },
    );
  }
}
