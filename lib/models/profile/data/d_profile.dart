import 'package:flutter/material.dart';

class Profile {
	int age;
	String name;
	int likeCount;
	String location;
	String description;
	List<String>? tags;
	List<NetworkImage> images;


	Profile({
		required this.age,
		required this.name,
		required this.images,
		required this.location,
		required this.likeCount,
		required this.description,
		this.tags
	});

	static NetworkImage image (String url) => NetworkImage(url); 

	static fromMap(Map<String, dynamic> data){
		var images = data['images'].map<NetworkImage>((Object? url) => Profile.image(url as String)).toList();
		return Profile(
			images: images,
			age: data['age'],
			name: data['name'],
			location: data['location'],
			likeCount: data['likeCount'],
			description: data['description'],
			tags: data['tags'].map<String>((Object? t) => t as String).toList()
		);
	}
}