import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // automaticallyImplyLeading: false,
        backgroundColor: theme.scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "News",
          style: textTheme.headline5,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_rounded,
              color: theme.indicatorColor,
            ),
          )
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              width: size.width,
              padding: const EdgeInsets.only(top: 30),
              height: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, bottom: 8, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "International",
                          style: textTheme.headline6,
                        ),
                        Text(
                          "See All",
                          style:
                              textTheme.subtitle2?.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: ListView.separated(
                          separatorBuilder: (context, index) => const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                              ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          scrollDirection: Axis.horizontal,
                          itemCount: 30,
                          itemBuilder: (ct, id) => Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: SizedBox(
                                        width: 150,
                                        height: double.infinity,
                                        child: Image.network(
                                          "https://a57.foxnews.com/static.foxbusiness.com/foxbusiness.com/content/uploads/2022/04/0/0/1stock-4-12-22.jpg?ve=1&tl=1",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(16),
                                                    bottomRight:
                                                        Radius.circular(16))),
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "US stocks whipsawing, investors anxious over new China COVID-19 outbreak, Fed rate hikes - Fox Business",
                                              style: textTheme.subtitle1
                                                  ?.copyWith(
                                                      color: Colors.white),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              "data2",
                                              style: textTheme.overline
                                                  ?.copyWith(
                                                      color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ))),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 16),
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, bottom: 8, right: 16),
                    child: Text(
                      "Business",
                      style: textTheme.headline6,
                    ),
                  ),
                  Expanded(
                      child: ListView.separated(
                          separatorBuilder: (context, index) => const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                              ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          scrollDirection: Axis.horizontal,
                          itemCount: 30,
                          itemBuilder: (ct, id) => Card(
                                child: Container(
                                  width: 100,
                                  color: Colors.red,
                                  child: const Text("O"),
                                ),
                              ))),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Text(
                      "Top In Indonesia",
                      style: textTheme.headline6,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (ct, id) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  child: Container(
                    height: 50,
                  ),
                ),
              );
            },
            childCount: 20,
          ))
        ],
      ),
    );
  }
}
