class Profile {
	int age;
	String name;
	int likeCount;
	String location;
	String description;
	List<String>? tags;
	List<String> images;


	Profile({
		required this.age,
		required this.name,
		required this.images,
		required this.location,
		required this.likeCount,
		required this.description,
		this.tags
	});

	static fromMap(Map<String, dynamic> data){
		return Profile(
			age: data['age'],
			name: data['name'],
			location: data['location'],
			likeCount: data['likeCount'],
			description: data['description'],
			tags: data['tags'].map<String>((Object? t) => t as String).toList(),
			images: data['images'].map<String>((Object? url) => url as String).toList(),
		);
	}
}