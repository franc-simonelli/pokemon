import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;
  late Animation<double> _sizeAnimation1;
  late Animation<double> _sizeAnimation2;
  late Animation<double> _sizeAnimation3;
  late Animation<double> _sizeAnimation4;
  late Animation<double> _sizeAnimation5;

  @override
  void initState() {
    super.initState();

    _controller1 = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _sizeAnimation1 = Tween<double>(
      begin: 0.0,
      end: 240.0,
    ).animate(
      CurvedAnimation(
        parent: _controller1,
        curve: Interval(0, 0.2),
      ),
    );

    _sizeAnimation2 = Tween<double>(
      begin: 0.0,
      end: 300.0,
    ).animate(
      CurvedAnimation(
        parent: _controller1,
        curve: Interval(0.2, 0.4),
      ),
    );

    _sizeAnimation3 = Tween<double>(
      begin: 0.0,
      end: 320.0,
    ).animate(
      CurvedAnimation(
        parent: _controller1,
        curve: Interval(0.4, 0.6),
      ),
    );

    _sizeAnimation4 = Tween<double>(
      begin: 0.0,
      end: 210.0,
    ).animate(
      CurvedAnimation(
        parent: _controller1,
        curve: Interval(0.6, 0.8),
      ),
    );

    _sizeAnimation5 = Tween<double>(
      begin: 0.0,
      end: 320.0,
    ).animate(
      CurvedAnimation(
        parent: _controller1,
        curve: Interval(0.8, 1.0),
      ),
    );

    _controller1.forward();
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: 50,
              right: 30,
              child: TextButton(
                onPressed: () {
                  _controller1.reset();
                  _controller1.forward();
                },
                child: Text('Riavvia'),
              ),
            ),

            // lapras
            Positioned(
              top: 160,
              left: -70,
              child: AnimatedBuilder(
                animation: _controller1,
                builder: (context, child) {
                  return SizedBox(
                    width: _sizeAnimation5.value,
                    height: _sizeAnimation5.value,
                    child: Image.network(
                      'https://assets.pokemon.com/assets/cms2/img/pokedex/full/131.png', // URL immagine casuale
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),

            // voltorb
            Positioned(
              bottom: -70,
              right: -30,
              child: AnimatedBuilder(
                animation: _controller1,
                builder: (context, child) {
                  return SizedBox(
                    width: _sizeAnimation4.value,
                    height: _sizeAnimation4.value,
                    child: Image.network(
                      'https://assets.pokemon.com/assets/cms2/img/pokedex/full/100.png', // URL immagine casuale
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),

            // gengar
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 390, left: 80),
                child: AnimatedBuilder(
                  animation: _controller1,
                  builder: (context, child) {
                    return SizedBox(
                      width: _sizeAnimation3.value,
                      height: _sizeAnimation3.value,
                      child: Image.network(
                        'https://assets.pokemon.com/assets/cms2/img/pokedex/full/094.png', // URL immagine casuale
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ),

            // cyndaquil
            Positioned(
              bottom: -50,
              left: -70,
              child: AnimatedBuilder(
                animation: _controller1,
                builder: (context, child) {
                  return SizedBox(
                    width: _sizeAnimation1.value,
                    height: _sizeAnimation1.value,
                    child: Image.network(
                      'https://assets.pokemon.com/assets/cms2/img/pokedex/full/155.png', // URL immagine casuale
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),

            // pikachu
            Positioned(
              bottom: 70,
              right: -150,
              child: AnimatedBuilder(
                animation: _controller1,
                builder: (context, child) {
                  return SizedBox(
                    width: _sizeAnimation2.value,
                    height: _sizeAnimation2.value,
                    child: Image.network(
                      'https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png', // URL immagine casuale
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
