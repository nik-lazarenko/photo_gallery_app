
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:photo_gallery_app/services/network_helper.dart';

import '../keys.dart';
part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {

  GalleryCubit() : super(GalleryInitial());

  Future<void> getPhotos() async{

    emit(GalleryLoading());

      List<String> images = [];

      String url =
          "https://pixabay.com/api/?key=$pixabayApiKey&image_type=photo&per_page=20";

      NetworkHelper networkHelper = NetworkHelper(url: url);

      dynamic data = await networkHelper.getData();

      List<dynamic> hitsList = data["hits"] as List;

      for (int i = 0; i < hitsList.length; i++) {
        images.add(hitsList[i]["previewURL"]);
      }
      emit(ImagesLoaded(images: images));


  }

}