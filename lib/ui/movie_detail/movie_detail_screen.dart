import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'movie_detail_view_model.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MovieDetailViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("상세 페이지"),
      ),
      body: viewModel.movie.title == null
          ? const CircularProgressIndicator()
          : Column(
        children: [
          Hero(
            tag: viewModel.movie.id.toString(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                viewModel.movie.posterPath!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(viewModel.movie.title),
        ],
      ),
    );
  }
}