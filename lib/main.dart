import 'dart:math';
void main(){
  sp1 spaceship1 = sp1(1000, 100);
  sp2 spaceship2 = sp2(200, 1000);
  print("<Str bttleshp>");
  BattleField().startBattle(spaceship1, spaceship2);
}
abstract class SpaceShip{
  double health;
  double firePower;
  SpaceShip(this.health,this.firePower);
  void hit(double firePower);
  void isDestroyed();
}
class sp1 extends SpaceShip{
  sp1(super.health, super.firepower);

  @override
  void hit(double fp){

    AmoredSpaceShip absorb= AmoredSpaceShip();
    double hit = absorb.absordHit();
    double damage =fp- (fp*(hit/100));
    double actualHitAbsorbed = (fp*(hit/100));
    health = health - damage;
    print('\nDeathStar attacked Spaceship 1 \n'
        'damage:${double.parse(damage.toStringAsFixed(2))} \t'
        'absorbed hit:${double.parse(actualHitAbsorbed.toStringAsFixed(3))}');
    isDestroyed();
  }
  void isDestroyed(){
    if(health<=0){
      print('\n<---------------- Game Over lmao ----------------->\n'
          'Deathstar wins ');
    }else{
      print('Spaceship 1 health:${double.parse(health.toStringAsFixed(3))}');
    }
  }
}
class sp2 extends SpaceShip{
  sp2(super.health, super.firepower);


  @override
  void hit(double fp){
    HighSpeedSpaceShip d = HighSpeedSpaceShip();
    bool dodge = d.dodges();
    double damage=fp;
    if (dodge==true){
      damage = 0;
    }else{
      damage= fp;
    }
    health = health - damage;

    print('\n Spaceship 1 attacked Deathstar \n'
        'damage:${double.parse(damage.toStringAsFixed(2))} \t'
        'dodge:$dodge');
    isDestroyed();
  }

  void isDestroyed(){
    if(health<=0){
      print('\n Game Over rip\n'
          'Spaceship 1 Win ');
    }else{
      print('Spaceship 2  health:${double.parse(health.toStringAsFixed(2))}');
    }
  }
}

class BattleField{
  void startBattle(SpaceShip sp1,SpaceShip sp2 ) async{
    while(sp1.health>0  && sp2.health>0){
      await Future.delayed(Duration(seconds: 5),()
      {
        final random = Random();
        //to be fair
        //spaceship randomly take turns to hit each other
        int rng = random.nextInt(2)+1;
        if (rng ==1) {
          sp1.hit(sp2.firePower);
        } else {
          sp2.hit(sp1.firePower);
        }


      });
    }
  }
}
//special power for spaceship 2
class AmoredSpaceShip{
  //Randomly absorbs hit
  double absordHit(){
    double maxArmorPower;
    return
      maxArmorPower = Random().nextDouble() * 40;
  }

}
//special power for spaceship 2
class HighSpeedSpaceShip{
  //whether dodges hit or not
  bool dodges() {
    bool dodging;
    return
      dodging = Random().nextBool();

  }
}