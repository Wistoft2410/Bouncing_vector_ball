PVector wind = new PVector(0.01, 0); 
PVector gravity = new PVector(0, 0.1); 

Mover m = new Mover(1);

PVector location;
PVector velocity;
PVector acceleration;

float mass;

class Mover {

  Mover(float tempMass) {
    mass = tempMass;
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    fill(255);
    ellipse(location.x, location.y, mass*16, mass*16);
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
  }
}

void setup() {
  size(500, 500);
  location = new PVector(30, 30);
  velocity = new PVector(0, 0);
  acceleration = new PVector(0, 0);
}

void draw() {
  clear();
  m.applyForce(wind); 
  m.applyForce(gravity);
  m.checkEdges();
  m.display();
  m.update();
}
