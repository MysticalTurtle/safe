import 'package:flutter/material.dart';
import 'package:safe/domain/entities/reward.dart';
import 'package:safe/presentation/providers/reward_provider.dart';
import 'package:provider/provider.dart';

class RewardsPage extends StatefulWidget {
  const RewardsPage({super.key});

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  late Future<List<Reward>> _listReward;

  @override
  void initState() {
    _listReward = RewardProvider.getRewards(idUser: 2);
    // sort for id desc
    _listReward.then((value) {
      value.sort((a, b) => a.id.compareTo(b.id));
    });
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Poner el tabBar aqui, chamba de Manuel
      // PD: se puede usar el tabbar fuera del appbar, es como un widget cualquiera
      body: Container(
        padding: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        color: Colors.transparent,
        child: FutureBuilder(
          future: _listReward,
          builder: (context, AsyncSnapshot<List<Reward>> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (context, index) {
                    return RewardCard(reward: snapshot.data![index]);
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class RewardCard extends StatelessWidget {
  final dynamic reward;
  final bool isPopup;
  const RewardCard({super.key, required this.reward, this.isPopup = false});

  @override
  Widget build(BuildContext context) {
    RewardProvider rewardProvider =
        (Provider.of<RewardProvider>(context, listen: false));
    return InkWell(
      onTap: () {
        if (isPopup) {
          Navigator.pop(context);
        } else {
          if (rewardProvider.nivel - 1 < reward.level) {
          } else {
            _showMyDialog(context, reward, isPopup);
          }
        }
      },
      child: Card(
        // Set color hexadecimal
        color: rewardProvider.nivel - 1 < reward.level
            ? Colors.black.withOpacity(0.5)
            : Colors.black,
        elevation: 5,
        child: Container(
          margin: const EdgeInsets.all(10),
          color: Colors.transparent,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          image: Image.asset(
                            'assets/reward/BackgroundRewards.png',
                          ).image,
                          colorFilter: ColorFilter.mode(
                            rewardProvider.nivel - 1 < reward.level
                                ? Colors.black.withOpacity(0)
                                : Colors.white,
                            BlendMode.modulate,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          reward.name,
                          style: const TextStyle(
                            fontFamily: 'JockeyOne',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(
    BuildContext context, dynamic reward, bool isPopup) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SimpleDialog(
            contentPadding: EdgeInsets.zero,
            title: const Center(child: Text('Logro obtenido')),
            children: [
              (Container(
                margin: const EdgeInsets.all(10),
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Center(
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: Image.asset(
                                      'assets/reward/BackgroundRewards.png')
                                  .image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              reward.name,
                              style: const TextStyle(
                                fontFamily: 'JockeyOne',
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      color: Colors.white,
                      child: Text(
                        reward.description,
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              )),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                height: 60,
                color: const Color(0xFF007DBC),
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Center(
                  child: Text(
                    "ENTENDIDO",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'JockeyOne',
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
