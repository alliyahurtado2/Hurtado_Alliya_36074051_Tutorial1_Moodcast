// Variables to store user input
char weather = ' '; 
char mood = ' '; 
// Char self note: single-key input!!

// Controls for program stages
boolean isPlaying = true; 
boolean askingMood = true;
boolean askingWeather = false;
boolean ready = false;
// askingMood & askingWeather: show which UI is being shown


// Controls number and properties of shapes
int numShapes = 3;
float[] x = new float[numShapes];
float[] y = new float[numShapes];
float[] dx = new float[numShapes];
float[] dy = new float[numShapes];
float[] s = new float[numShapes];
// Arrays (x,y,dx,dy,s): simple and keep the code easy to follow
// Index (i): Each 'i' show one shape with position (x,y), velocity (dx,dy) and size (s)=given

void setup(){
  size(400, 400); // window size
  textAlign(CENTER);
  textSize(16);
  // runs once! textAlign/Size = make it centered & easy to read
  
  // Random starting positions and speeds for each shape
  for (int i = 0; i < numShapes; i++){
    x[i] = random(width);
    y[i] = random(height);
    dx[i] = random(-1, 1); // horizontal speed
    dy[i] = random(-1, 1);
    s[i] = random(80, 120);
  }
}

void draw(){
  // Step 1: Ask user how they feel
  // Draw is split into 3 *note this* 
  
  if (askingMood){
    background(206,185,144);
    fill(0);
    text("How are you feeling today?", width/2, height/2 - 20);
    text("(H = happy, U = unhappy, F = fearful, A = angry)", width/2, height/2 + 10);
    return; // stops draw() here until a key is pressed
  }
  
  // Step 2: Ask about the weather
  if (askingWeather){
    background(206,185,144);
    fill(0);
    text("What is the weather like?", width/2, height/2 - 20);
    text("(S = sunny, R = rain, C = cloudy, N = night)", width/2, height/2 + 10);
    return;
  }
  
  // If not ready (no inputs yet), skip visuals
  if (!ready) return;


  // VISUAL OUTPUT SECTION 

  // Background color depends on weather input
  if (weather == 'S') background(255, 230, 120);   // sunny = yellow
  else if (weather == 'R') background(100, 150, 255); // rain = blue
  else if (weather == 'C') background(180);          // cloudy = grey
  else if (weather == 'N') background(0);            // night = black
  else background(206,185,144);                      // default beige

  // Mood color (affects shape fill)
  color moodColor = color(200);
  if (mood == 'H') moodColor = color(255, 140, 0);   // happy = orange
  if (mood == 'U') moodColor = color(0, 0, 150);     // unhappy = dark blue
  if (mood == 'F') moodColor = color(0, 180, 80);    // fearful = green
  if (mood == 'A') moodColor = color(220, 0, 0);     // angry = red

  fill(moodColor);
  noStroke();

  // Draw & move shapes
  for (int i = 0; i < numShapes; i++){
    // Shape style changes based on mood
    if (mood == 'H') ellipse(x[i], y[i], s[i], s[i]); // happy = circle
    if (mood == 'U') rect(x[i], y[i], s[i]*0.7, s[i]); // unhappy = rectangle
    if (mood == 'F') triangle(x[i], y[i]-s[i]/2, x[i]-s[i]/2, y[i]+s[i]/2, x[i]+s[i]/2, y[i]+s[i]/2); // fearful = triangle
    if (mood == 'A') rect(x[i], y[i], s[i], s[i]); // angry = square

// num shapes breakdown: 

    // Move shapes if not paused
    if (isPlaying){
      x[i] += dx[i];
      y[i] += dy[i];
    }
// motion 


    // Bounce shapes off edges
    if (x[i] < 0 || x[i] > width) dx[i] *= -1;
    if (y[i] < 0 || y[i] > height) dy[i] *= -1;
  }

  // Instruction text
  fill(255);
  textSize(12);
  text("Press SPACE to pause/play", width/2, height - 20);
}

void keyPressed(){
  // PAUSE CONTROL 
  if (ready && key == ' ') isPlaying = !isPlaying; // toggle play

  // MOOD SELECTION
  if (askingMood){
    if (key == 'H' || key == 'h' || key == 'U' || key == 'u' ||
        key == 'F' || key == 'f' || key == 'A' || key == 'a'){
      mood = Character.toUpperCase(key);
      askingMood = false;
      askingWeather = true;
    }
  }
  // WEATHER SELECTION
  else if (askingWeather){
    if (key == 'S' || key == 's' || key == 'R' || key == 'r' ||
        key == 'C' || key == 'c' || key == 'N' || key == 'n'){
      weather = Character.toUpperCase(key);
      askingWeather = false;
      ready = true; // start the animation
    }
  }
}
