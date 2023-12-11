import 'package:fashion_ui/screens/details_page.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/fashion_filter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/model16.jpg'),
                        radius: 20,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Hey Alex !',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontStyle: FontStyle.italic,
                        ),
                        softWrap: true,
                      ),
                    ],
                  ),
                  Icon(
                    Icons.notification_add_outlined,
                    color: kSecondaryColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Discover the most',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Amazing events',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                  color: kSecondaryColor,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  hintText: 'Search your favorite event',
                  hintStyle: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Explore',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                    ),
                  ),
                  Icon(
                    Icons.toc,
                    color: kSecondaryColor,
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Wrap(
                alignment: WrapAlignment.start,
                direction: Axis.horizontal,
                spacing: 10,
                runSpacing: 10,
                children: [
                  FashionFilters(
                    filterName: 'Trending',
                    borderColor: kSecondaryColor,
                  ),
                  const FashionFilters(
                    filterName: 'Near You',
                    borderColor: Colors.grey,
                  ),
                  const FashionFilters(
                    filterName: 'Near You',
                    borderColor: Colors.grey,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: shows.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ShowDetailsPage.routeName,
                          arguments: shows[index],
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: GridTile(
                          footer: GridTileBar(
                            backgroundColor: Colors.black54,
                            title: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    shows[index].name!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Montserrat',
                                      fontStyle: FontStyle.italic,
                                    ),
                                    softWrap: true,
                                  ),
                                  Text(
                                    shows[index].city!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 9,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          child: Image.asset(
                            shows[index].image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
