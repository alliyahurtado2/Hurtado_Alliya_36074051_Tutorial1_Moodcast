# Hurtado_Alliya_36074051_Tutorial1_Moodcast

# Introduction  
Moodcast is a visual art and animation project created in Processing (Java).
It explores how mood and weather can interact visually. The user inputs letters that correspond to emotions and weather conditions, and the program generates a unique animated scene based on the user input. The project serves as a reflective tool, showing how an individual’s emotional state can be influenced or mirrored by their surrounding environment.

# System Overview  
Platform: Processing IDE
Language: Java 
Why?: Processing was used due to its large support of creative coding, making it suited for exploratory visual art projects, like Moodcast. 

# Instructions  
To run Moodcast:  
1. Open the `Moodcast_final` source file in Processing.  
2. Click the 'run' button.  
3. You will be prompted first:  
   - “How are you feeling today?” = enter one of: `H` (Happy), `U` (Unhappy), `F` (Fearful), `A` (Angry)  
4. Next, you will be prompted:  
   - “What is the weather like?” = enter one of: `S` (Sunny), `R` (Rain), `C` (Cloudy), `N` (Night)  
5. After both inputs are entered, the animation begins.  
   - Background colour changes in response to the selected weather.  
   - Shapes and colours vary according to the selected mood.  
   - Press the 'Spacebar' at any time to pause or resume the animation.

# Features  
- Interactive prompts for mood and weather selection.  
- Dynamic generation of background and shapes based on user input.  
- Simple animation of multiple moving, bouncing shapes across the screen.  
- Pause/resume control via the spacebar.

# Code Structure  
- 'Setup()' : Initialises the canvas size and first positions of visual elements
- 'Draw()' : Allows for a continuous loop of animation; being background, shapes and movement
- 'keyPressed()' : Controls the input given by the user and initiates the animation; for mood and weather

## Technologies Used  
- Processing IDE (Java)  
- Standard Java keyboard input handling  

# Source
Łyczywek, R. (2018, October 15). How to write a good README for your GitHub project? Bulldogjob.com; Bulldogjob. https://bulldogjob.com/readme/how-to-write-a-good-readme-for-your-github-project
