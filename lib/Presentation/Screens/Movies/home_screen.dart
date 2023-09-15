import 'package:flutter/material.dart';

import 'package:cinema_app/Presentation/Widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Providers/providers.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottonNavigationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShow = ref.watch(moviesSlideShowProvider);

    if (slideShow.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Column(
      children: [
        const CustomAppBar(),
        MovieSlideShow(movies: slideShow),
        MovieHorizontalListView(
          movie: nowPlayingMovies,
          title: 'En cines',
          subtitle: 'Lunes 20 ',
          loadNextPage: () {
            ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
          },
        )
      ],
    );
  }
}
