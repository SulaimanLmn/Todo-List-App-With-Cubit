import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/cubit/nav_cubit.dart';

class NavPage extends StatelessWidget {
  const NavPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navCubit = BlocProvider.of<NavCubit>(context);

    return BlocBuilder<NavCubit, int>(
      bloc: navCubit,
      builder: (context, state) {
        return Scaffold(
          body: navCubit.getCurrentPage(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state,
            onTap: (index) => navCubit.updateIndex(index),
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
