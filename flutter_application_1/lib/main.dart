// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:html' as html;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Post> posts = []; // Maintain a list of posts
  final TextEditingController _textFieldController = TextEditingController();

  ImagePicker newMethod(ImagePicker picker) => picker;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('FaceBook',
              style: TextStyle(color: Colors.blueAccent)),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: Colors.blueAccent,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
              color: Colors.blueAccent,
            ),
          ],
        ),
        body: ListView(
          children: [
            const SizedBox(height: 20.0),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleImageWithText(
                    imageUrl:
                        'https://live.staticflickr.com/1862/43919049004_310c96b8d3.jpg',
                    text: 'You',
                    textColor: Colors.black,
                  ),
                  CircleImageWithText(
                    imageUrl:
                        'https://render.fineartamerica.com/images/rendered/square-dynamic/small/images-medium-large-5/bunting-in-the-barberries-john-absher.jpg',
                    text: 'Moshe',
                    textColor: Colors.black,
                  ),
                  CircleImageWithText(
                    imageUrl:
                        'https://live.staticflickr.com/7001/13578531493_f11b09592b.jpg',
                    text: 'Farhan',
                    textColor: Colors.black,
                  ),
                  CircleImageWithText(
                    imageUrl:
                        'https://thumbs.dreamstime.com/b/funny-shocked-man-covering-mouth-hand-laughs-making-big-eyes-oops-absurd-accident-frightened-guy-red-sweater-opened-mouth-287432688.jpg',
                    text: 'Steve',
                    textColor: Colors.black,
                  ),
                  CircleImageWithText(
                    imageUrl:
                        'https://pbs.twimg.com/profile_images/1182161392326959104/TYoFx7to_400x400.jpg',
                    text: 'Cormac',
                    textColor: Colors.black,
                  ),
                  CircleImageWithText(
                    imageUrl:
                        'https://64.media.tumblr.com/af05078ab76cae4c80251e6e77792cbf/34d4761f4d19e52f-27/s640x960/e61ad04e07da1a1bc84e8ed7a59f78b7ef64c672.jpg',
                    text: 'Jenny',
                    textColor: Colors.black,
                  ),
                  CircleImageWithText(
                    imageUrl:
                        'https://5.imimg.com/data5/XA/QK/GLADMIN-24263536/executive-masters-program-in-business-administration-1000x1000.png',
                    text: 'Anderson',
                    textColor: Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 25.0,
                          backgroundImage: NetworkImage(
                              'https://live.staticflickr.com/1862/43919049004_310c96b8d3.jpg'),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _textFieldController,
                            onSubmitted: (text) {
                              String enteredText = _textFieldController.text;
                              posts.insert(0, Post(text: enteredText));
                              setState(() {});
                              _clearTextField();
                            },
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 25.0),
                              hintText: "Post something...",
                              filled: true,
                              fillColor: Colors.grey,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                html.FileUploadInputElement uploadInput =
                                    html.FileUploadInputElement();
                                uploadInput.click();

                                uploadInput.onChange.listen((e) {
                                  final file = uploadInput.files!.first;
                                  // Process the selected file as needed
                                });
                              },
                              child: const Text('Image'),
                            ),
                            const SizedBox(
                              width: 50.0,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1.5,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            _buildFacebookPosts(),
            const SizedBox(height: 20.0),
            logoutbutton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFacebookPosts() {
    return SizedBox(
      height: 800.0,
      width: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (var post in posts)
            _buildnewPost(
              post,
              caption: post.caption,
              name: 'You',
              profileImageUrl:
                  'https://live.staticflickr.com/1862/43919049004_310c96b8d3.jpg',
            ),
          LikeablePost(
            post: Post(
              text: 'First day at work!',
              likeCount: 11,
            ),
            profileImageUrl:
                'https://render.fineartamerica.com/images/rendered/square-dynamic/small/images-medium-large-5/bunting-in-the-barberries-john-absher.jpg',
            name: 'Moshe Edwards',
            caption: 'First day at work',
            postImageUrl:
                'https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=1xw:0.74975xh;center,top&resize=1200:*',
            onDelete: (Post) {},
          ),
          LikeablePost(
            post: Post(
              text: 'Good to meet some old friends',
              likeCount: 34,
            ),
            profileImageUrl:
                'https://live.staticflickr.com/7001/13578531493_f11b09592b.jpg',
            name: 'Farhan Salinas',
            caption: 'Good to meet some old friends',
            postImageUrl:
                'https://as1.ftcdn.net/v2/jpg/04/84/24/18/1000_F_484241865_f9nzGpSnVmqmy8IV5BdwjJxdHNU7C8bx.jpg',
            onDelete: (Post) {},
          ),
          LikeablePost(
            post: Post(
              text: 'Working out is very healthy',
              likeCount: 23,
            ),
            profileImageUrl:
                'https://thumbs.dreamstime.com/b/funny-shocked-man-covering-mouth-hand-laughs-making-big-eyes-oops-absurd-accident-frightened-guy-red-sweater-opened-mouth-287432688.jpg',
            name: 'Steve Hess',
            caption: 'Working out is very healthy',
            postImageUrl:
                'https://www.mensjournal.com/.image/t_share/MTk3MjUwNzQ2Njg3Njk0ODQz/gettyimages-867359800.jpg',
            onDelete: (Post) {},
          ),
          LikeablePost(
            post: Post(
              text: 'First day at work!',
              likeCount: 57,
            ),
            profileImageUrl: 'https://f4.bcbits.com/img/0009982982_25.jpg',
            name: 'Cormac Suarez',
            caption: 'First day at work!',
            postImageUrl:
                'https://www.shutterstock.com/image-photo/portrait-successful-businessman-man-laptop-260nw-2204792263.jpg',
            onDelete: (Post) {},
          ),
        ],
      ),
    );
  }

  Widget _buildnewPost(
    Post post, {
    required String profileImageUrl,
    required String name,
    required String caption,
  }) {
    TextEditingController commentController2 = TextEditingController();
    String commentText2 = ''; // Add this line to store comments

    return Container(
      width: 300.0,
      height: 800.0,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage(profileImageUrl),
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Right now',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    _deletePost(post);
                    setState(() {});
                  },
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Text(
              caption,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 10.0),
            // Comment Section
            TextField(
                controller: commentController2,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'Write a comment...',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
                onSubmitted: (text) {
                  setState(() {
                    commentText2 = commentController2.text;
                  });
                  commentController2.clear();
                }),

            // Display Comments
            Row(children: [
              Text(
                "You: $commentText2", // Display the updated comment text
                style: const TextStyle(color: Colors.black),
              ),
              IconButton(
                onPressed: () {
                  commentText2 = "";
                  setState(() {});
                },
                icon: const Icon(Icons.delete),
                color: Colors.red,
              ),
            ]),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          post.likeCount++;
                        });
                      },
                      icon: const Icon(Icons.thumb_up),
                      color: Colors.black,
                    ),
                    Text(
                      'Like ${post.likeCount}',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          commentText2 = commentController2.text;
                        });
                        commentController2.clear();
                      },
                      icon: const Icon(Icons.comment),
                      color: Colors.black,
                    ),
                    const Text(
                      'Comment',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.share),
                      color: Colors.black,
                    ),
                    const Text(
                      'Share',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _deletePost(Post post) {
    setState(() {
      posts.remove(post);
    });
  }

  Widget logoutbutton(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Log out of Facebook',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AnotherPage()),
                );
              },
              child: const Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }

  void _clearTextField() {
    // Access the state of the NewPostTextField and clear its text
    _textFieldController.clear();
  }
}

class LikeablePost extends StatefulWidget {
  final Post post;
  final String profileImageUrl;
  final String name;
  final String caption;
  final String postImageUrl;

  const LikeablePost({
    Key? key,
    required this.profileImageUrl,
    required this.name,
    required this.caption,
    required this.postImageUrl,
    required this.onDelete,
    required this.post,
  }) : super(key: key);

  final Function(Post) onDelete;

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _LikeablePostState createState() => _LikeablePostState(post: post);
}

class _LikeablePostState extends State<LikeablePost> {
  int likeCount = 18;
  final Post post; // Receive the Post object in the state
  TextEditingController commentController = TextEditingController();
  String commentText = ''; // Add this line to store comments

  _LikeablePostState({required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 500.0,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage(widget.profileImageUrl),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      '2 hours ago',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(width: 80.0),
              ],
            ),
            const SizedBox(height: 10.0),
            Text(
              widget.caption,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 10.0),
            Image.network(
              widget.postImageUrl,
              height: 100.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            // Comment Section
            TextField(
                controller: commentController,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'Write a comment...',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
                onSubmitted: (text) {
                  setState(() {
                    commentText = text;
                  });
                  commentController.clear();
                }),

            const SizedBox(height: 10.0),
            // Display Comments
            Row(children: [
              Text(
                "You: $commentText", // Display the updated comment text
                style: const TextStyle(color: Colors.black),
              ),
              IconButton(
                onPressed: () {
                  commentText = "";
                  setState(() {});
                },
                icon: const Icon(Icons.delete),
                color: Colors.red,
              ),
            ]),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          post.likeCount++;
                        });
                      },
                      icon: const Icon(Icons.thumb_up),
                      color: Colors.black,
                    ),
                    Text(
                      'Like ${post.likeCount}',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          commentText = commentController.text;
                        });
                        commentController.clear();
                      },
                      icon: const Icon(Icons.comment),
                      color: Colors.black,
                    ),
                    const Text(
                      'Comment',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.share),
                      color: Colors.black,
                    ),
                    const Text(
                      'Share',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AnotherPage extends StatelessWidget {
  const AnotherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Another Page'),
      ),
      body: const Center(
        child: Text('This is another page!'),
      ),
    );
  }
}

class CircleImageWithText extends StatelessWidget {
  final String imageUrl;
  final String text;
  final Color textColor;

  const CircleImageWithText({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blueAccent, width: 2.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(text, style: TextStyle(color: textColor)),
      ],
    );
  }
}

class NewPostTextField extends StatefulWidget {
  final ValueChanged<String> onSubmitted;

  // Add a key to the constructor
  const NewPostTextField({Key? key, required this.onSubmitted})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NewPostTextFieldState createState() => _NewPostTextFieldState();
}

class _NewPostTextFieldState extends State<NewPostTextField> {
  final TextEditingController _textEditingController = TextEditingController();
// Add a GlobalKey to the state
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 25.0),
        hintText: 'Post something...',
        filled: true,
        fillColor: Colors.grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
      onSubmitted: (text) {
        // Pass the submitted text to the callback
        widget.onSubmitted(text);
      },
    );
  }

  void clear() {
    // Clear the text in the text field
    _textEditingController.clear();
  }
}

class Post {
  final String text;
  int likeCount;

  Post({required this.text, this.likeCount = 0});

  String get profileImageUrl =>
      'https://live.staticflickr.com/1862/43919049004_310c96b8d3.jpg';

  String get name => 'You';

  String get caption => text;

  String get commentText2 => "";

  void onDelete() {}
}
