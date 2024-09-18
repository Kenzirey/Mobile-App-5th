# If you have less than 2 correct answers, you get a surprise

App Architecture:

The Quiz app follows a nested widget-based architecture.
The app is organized in different components which focuses on different functionality:
The various «Screens» handles displaying user-interface for the user. Such as the start, question, results- and game over screens. Each screen is dedicated to one widget (file), to make it easier to maintain and add on to the code. These are in their own folder as well, to make it clear that they belong together.
Quiz handles the «stateful» management of the quiz logic, such as user selecting an answer (via a button), and navigating to the results screen or game over screen. Quiz handles the states between the various screens.
Made widgets for buttons to make it easier to reuse and alter the look of them, so that there is a cohesive design.
File & Folder structure:

Worked primarily within the lib folder, as well as made small edits to the pubspec.yaml to allow for the use of .jpg and .png images. The images are inside a folder that I created (following guidance from Udemy course) named assets/images/. . .This is where all my images are saved.
All the screens are within their own folder named “screens”, and buttons are inside “buttons” folder and so on.
I primarily followed the structure of the lecturer in the Udemy course, so the quiz question model is inside “models” folder.
The structure of the setup looks very similar to the MVCS pattern that I became familiar with last semester. Though this has a Model (quiz_questions), a view via the screens, and then “widgets” as controllers, with stateful and the like.

 

In regard to the group part, I worked alone as during the assignment of groups and most of the work, I was ill, so I chose to catch up on my own. I did get some help from a fellow classmate for miscellaneous questions.

Most of the code will be obvious is from the lecturer in the Udemy course, but I did follow along (I did not copy from his repository) and I tried to make it my own by adding on things, and I plan to experiment more, but as due date for assignment is close, I do not have time before this needs to be handed in.


There is a Class Diagram generated via PlantUML, which needs to be heavily zoomed in. I wasn't quite sure how the best way to make it / upload it. But it's in the repository, I will also upload it to blackboard.
