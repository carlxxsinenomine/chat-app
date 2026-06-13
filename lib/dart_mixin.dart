mixin CanSwim {
  void swim() {
    print("Changing position by flying");
  }
}

mixin CanFly {
  void fly() {
    print("Changing position by swimming");
  }
}

class Animal {
  void move() {
    print("moving");
  }
}

class Duck extends Animal with CanFly, CanSwim {
}

void main() {
  Duck().fly();
}