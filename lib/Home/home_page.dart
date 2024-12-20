import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_equitation_manager/Database/Models/show.dart';
import 'package:working_equitation_manager/Database/objectbox.dart';
import 'package:working_equitation_manager/Home/Dialogs/delete_show_dialog.dart';
import 'package:working_equitation_manager/Home/show_list_cubit.dart';
import 'package:working_equitation_manager/New%20Show/new_show_page.dart';
import 'package:working_equitation_manager/Show/show_page.dart';
import 'package:working_equitation_manager/Utils/common_widgets.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  final ObjectBox objectBox;
  const HomePage({super.key, required this.objectBox});

  get label => null;

  get showId => null;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowListCubit(objectBox),
      child: Scaffold(
        body: BlocBuilder<ShowListCubit, List<Show>>(
          builder: (context, shows) {
            if (shows.isEmpty) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20),
                    header(),
                    Divider(),
                    Center(
                      child: Text('No shows yet',
                          style: TextStyle(fontSize: 20, color: Colors.grey)),
                    ),
                  ],
                ),
              );
            }
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  header(),
                  Divider(),
                  ListView.builder(
                    padding: EdgeInsets.only(bottom: 50),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: shows.length,
                    itemBuilder: (context, index) {
                      final show = shows[index];
                      return ListTile(
                        isThreeLine: true,
                        onLongPress: () {
                          debugPrint('Show ${show.id} long pressed');
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return NewShowPage(
                              draftShow: show,
                              objectBox: objectBox,
                            );
                          }));
                        },
                        onTap: () {
                          debugPrint('Show ${show.id} tapped\n'
                              ' showtype: ${show.showType}');

                          // if the show is a draft, open the new show page with the draft show
                          if (show.isDraft) {
                            debugPrint(
                                'Pushing new show page with draft showname ${show.competitionName}');
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return NewShowPage(
                                draftShow: show,
                                objectBox: objectBox,
                              );
                            }));
                          } else {
                            debugPrint('Show ${show.id} is a final show');
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ShowPage(
                                show: show,
                                objectBox: objectBox,
                              );
                            }));

                            // if the show is final, open the show details page
                          }
                        },
                        title: Text('${show.id}\n${show.competitionName}'),
                        subtitle: Text(show.isDraft ? 'Draft' : 'Final'),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // show a confirmation dialog before deleting
                            showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return deleteShowDialog(
                                    context: context,
                                    deleteShow: () {
                                      context
                                          .read<ShowListCubit>()
                                          .deleteShow(show.id!);
                                    },
                                    showId: show.id!);
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushNamed(context, NewShowPage.routeName);
            },
            label: Text('New Show')),
      ),
    );
  }
}

Widget header() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      gap(),
      gap(),
      Image.asset(
        'assets/USAWE_Logo-R_CMYK_72.png',
        height: 200,
      ),
      const SizedBox(width: 20),
      const Text('Show Manager',
          textAlign: TextAlign.center, style: TextStyle(fontSize: 30)),
    ],
  );
}
