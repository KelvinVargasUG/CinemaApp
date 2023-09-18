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
    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppBar(),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            MovieSlideShow(movies: slideShow),
            MovieHorizontalListView(
              movie: nowPlayingMovies,
              title: 'En cines',
              subtitle: 'Lunes 20',
              loadNextPage: () {
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
              },
            ),
            MovieHorizontalListView(
              movie: nowPlayingMovies,
              title: 'Proximamente',
              subtitle: 'En este mes',
              loadNextPage: () {
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
              },
            ),
            MovieHorizontalListView(
              movie: nowPlayingMovies,
              title: 'Populares',
              //subtitle: 'En este mes',
              loadNextPage: () {
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
              },
            ),
            MovieHorizontalListView(
              movie: nowPlayingMovies,
              title: 'Mejor Calificadas',
              subtitle: 'De todos los tiempos',
              loadNextPage: () {
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
              },
            ),
            const SizedBox(height: 10),
          ],
        );
      }, childCount: 1)),
    ]);
  }
}
