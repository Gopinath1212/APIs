import 'dart:core';

class artist{
  late String wrapperType;
  late String artistType;
  late String artistName;
  late String artistLinkUrl;
  late int artistId;
  late String primaryGenreName;
  late int primaryGenreId;

  artist({
    required this.wrapperType,
    required this.artistType,
    required this.artistName,
    required this.artistLinkUrl,
    required this.artistId,
    required this.primaryGenreName,
    required this.primaryGenreId,
  });

  factory artist.fromJson(Map<String, dynamic> json) {
  return artist(
  wrapperType: json['wrapperType'],
  artistType: json['artistType'],
  artistName: json['artistName'],
  artistLinkUrl: json['artistLinkUrl'],
  artistId: json['artistId'],
      primaryGenreName:json['primaryGenreName'],
  primaryGenreId: json['primaryGenreId']


  );
  }


}
