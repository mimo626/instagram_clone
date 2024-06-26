import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [const StoryArea(), FeedList()],
      ),
    );
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            List.generate(10, (index) => UserStory(userName: "user $index")),
      ),
    );
  }
}

class UserStory extends StatelessWidget {
  final String userName;

  const UserStory({required this.userName, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8.0),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('lib/assets/images/profile.PNG')),
                borderRadius: BorderRadius.circular(40)),
          ),
          Text(userName)
        ],
      ),
    );
  }
}

class FeedData {
  final String userName;
  final int likeCount;
  final String content;

  FeedData(
      {required this.userName, required this.likeCount, required this.content});
}

final feedDataList = [
  FeedData(userName: "User1", likeCount: 50, content: "오늘 점심 맛있다."),
  FeedData(userName: "User2", likeCount: 22, content: "오늘 아침 맛있다."),
  FeedData(userName: "User3", likeCount: 33, content: "저녁 뭐 먹지."),
  FeedData(userName: "User4", likeCount: 43, content: "고양이 귀엽다."),
  FeedData(userName: "User5", likeCount: 12, content: "다들 뭐해?"),
  FeedData(userName: "User6", likeCount: 56, content: "오늘 저녁 맛있다."),
  FeedData(userName: "User7", likeCount: 60, content: "어제 점심 맛있다."),
  FeedData(userName: "User8", likeCount: 75, content: "어제 아침 맛있다."),
  FeedData(userName: "User9", likeCount: 34, content: "어제 저녁 맛있다."),
  FeedData(userName: "User10", likeCount: 39, content: "오늘 점심 맛없다."),
];

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // storyArea, feedList 내부에 스크롤 2개
      // 어디까지 스크롤인지 알 수 없음
      // 하나는 스크롤 불가능하게 만듦(스토리는 좌우로만 하면 되므로 막음)
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: feedDataList.length,
      itemBuilder: (context, index) => FeedItem(feedData: feedDataList[index]),
    );
  }
}

class FeedItem extends StatelessWidget {
  final FeedData feedData;

  const FeedItem({required this.feedData, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage('lib/assets/images/pure.PNG'))),
                    ),
                    const SizedBox(width: 8),
                    Text(feedData.userName),
                  ],
                ),
                const Icon(Icons.more_vert)
              ],
            )),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 300,
          color: Colors.indigo.shade200,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.favorite_outline)),
                  IconButton(
                      onPressed: () {}, icon: Icon(CupertinoIcons.chat_bubble)),
                  IconButton(
                      onPressed: () {}, icon: Icon(CupertinoIcons.paperplane)),
                ],
              ),
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bookmark))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            '좋아요 ${feedData.likeCount}개',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            child: RichText(
                text:
                TextSpan(
                    children: [
                      TextSpan(
                          text: feedData.userName,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: feedData.content),
                    ]
                    , style: const TextStyle(color: Colors.black)
                )
            )
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
