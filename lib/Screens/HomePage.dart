import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_flutter/Model/MovieResume.dart';
import 'package:movies_flutter/Service/bloc/movies_bloc.dart';
import 'package:movies_flutter/Service/bloc/movies_event.dart';
import 'package:movies_flutter/Service/bloc/movies_state.dart';
import 'package:movies_flutter/WidgetComponents/ResumeMovieComponent.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ResumeMovieComponent> moviesComponents = [];
  int page = 1;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        this.page++;
        print(page);
        searchMovies(context, page);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MoviesBloc, MoviesState>(listener: (context, state) {
      if (state is MoviesStateError) {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text(state.message)));
      }
    }, child: BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is InitialMoviesState) {
          return searchMovies(context, page);
        } else if (state is MoviesStateLoading) {
          return showLoadingIndicator(context);
        } else if (state is MoviesStateLoaded) {
          return showMovies(context, state.movies);
        } else {
          return Center(
            child: Text(''),
          );
        }
      },
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  searchMovies(BuildContext context, int page) {
    final moviesBloc = BlocProvider.of<MoviesBloc>(context);
    moviesBloc.add(GetMoviesResume(page));
  }

  showLoadingIndicator(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  showMovies(BuildContext contex, List<MovieResume> movies) {
    for (var item in movies) {
      moviesComponents
          .add(ResumeMovieComponent(item.movieName, item.movieImageUrl));
    }
    return GridView.count(
      padding: const EdgeInsets.all(20),
      controller: _scrollController,
      mainAxisSpacing: 18,
      crossAxisSpacing: 18,
      crossAxisCount: 2,
      childAspectRatio: 0.62,
      children: moviesComponents,
    );
  }
}
