import 'package:create_account/models/get_genres_model.dart';
import 'package:create_account/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class GetDataFromApi extends StatefulWidget {
  @override
  State<GetDataFromApi> createState() => _GetDataFromApiState();
}

class _GetDataFromApiState extends State<GetDataFromApi> {

  Color gridBoxColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getGenresNames(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data as GetGenresName;
          return SizedBox(
            height: 400,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 11, maxCrossAxisExtent: 150, childAspectRatio: 3/1),
              itemCount: data.data.genres.length,
              itemBuilder: (context, index) {
                return Wrap(children: [
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: gridBoxColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(data.data.genres[index].name,
                          style: TextStyle(color: Colors.black)),
                    ),
                    onTap: (){
                      setState(() {
                        gridBoxColor = Colors.orange;
                      });
                    },
                  )
                ]);
              },
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
