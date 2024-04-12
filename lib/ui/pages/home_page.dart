import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';

import 'package:my_blocs/config/blocs/blocs.dart';
import 'package:my_blocs/config/design/designs.dart';
import 'package:my_blocs/ui/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);

  @override
  void initState() {
    super.initState();
    _pageController;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavBarPageBloc, NavBarPageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: MyColors.brandSecondaryColor,
          appBar: AppBar(
            title: Text(
              'My Blocs',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          body: SafeArea(
              child: PageView(
            controller: _pageController,
            children: Mocks.views,
            onPageChanged: (index) {
              context
                  .read<NavBarPageBloc>()
                  .add(NavBarPageChange(tabIndex: index));
            },
          )),
          bottomNavigationBar: SafeArea(
            child: ScrollToHide(
              scrollController: _scrollController,
              hideDirection: Axis.horizontal,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                      List.generate(Mocks.listButtonNavBar.length, (index) {
                    final buttonNavBar = Mocks.listButtonNavBar[index];
                    return InkWell(
                      onTap: () {
                        _pageController.animateToPage(index,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.ease);
                        context
                            .read<NavBarPageBloc>()
                            .add(NavBarPageChange(tabIndex: index));
                      },
                      child: ButtonNavBarWidget(
                        label: buttonNavBar.label,
                        icon: buttonNavBar.icon,
                        index: index,
                      ),
                    );
                  })),
            ),
          ),
        );
      },
    );
  }
}
