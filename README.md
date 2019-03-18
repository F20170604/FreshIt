# FreshIt

### Team
Member 1 : Ayush Agrawal, 2017A8PS0604G, f20170604@goa.bits-pilani.ac.in, Backend Development\
Member 2 : Mayank Harsani, 2015A7PS0010G, f20150010@goa.bits-pilani.ac.in, Frontend Development

### Motivation
Every day seeing the mess food wastage amount rise up made us think, if a small community of \
people produces 100 kgs of food wastage per day, How much total amount of food waste is \
produced globally? A 2012 report from the National Resources Defense Council (NRDC) revealed \
a list of statistics that show just how big the food waste problem is in America:- \
● Americans throw away $165 billion of food each year. \
● 40% of food is wasted in the United States every year. \
● 20% of food that the average American buys is never eaten. \
All of this wasted food is a huge contributor to climate change. It takes a ton of resource to \
produce food. On top of that, you have all of the energy it takes to keep it cold and transport it \
around the country. And when food decomposes, it isn’t just stinky. It releases potent \
greenhouse gases. Basically, we’re trashing our planet to grow more food that no one eats. But \
here’s the thing : No one actually likes wasting food. It just something we haven’t been paying \
much attention to. Of all the challenges in the world, reducing the amount of food is relatively one \
of the easiest.

Consumers collectively make up the largest portion of food waste. And you don’t have to be an \
expert too understand why food is going to waste in our homes. We’re all busy on the go and we \
buy food without thinking if we really need it. There’s even been a little bit of research to show \
that once something goes in the refrigerator, it’s actually worthless to us than before. A lot of the \
waste in our society happens when we come down to the choice and wanting to have the option \
to eat something at any time whether or not we use. We store a lot of food inside our refrigerator \
but that’s the problem : we store our food and then forget about it. Unfortunately, many of us do it \
even when we don’t intend to. If you are not keeping track of the expiration date of your foods, \
you are going to end up wasting food.

### Objective
● Problem Statement :- \
“I find it difficult to keep track of the food that I have and hate to throw away expired food.” \
To prevent food wastage due to expiration, develop an application that tells you when \
your food is going to expire so that you can use it before it does. It should intelligently \
send you an alert when your food is close to expiring. \
● Deliverables :-  \
Android based application to prevent food wastage that lets you scan the item or the \
barcode and automatically figures out the name of the item, classifies it into the type of \
food, lets you record the shelf life of your goods and reminds you to use them before they \
expire. It will estimate an expiration date and to make things a lot easier and will also \
keep a track of the previous items you’ve scanned so that you don’t have to scan again. 

### Related Work
There has been significant work done on the Image Classification Subsystem of this application \
and some applications based on basic implementation of this idea have already been developed. \
Here, we are listing some of the work we found that matches our project : \
● [Keeping Track of Expiry Dates & Reducing Food Wastage](https://medium.com/@uxlime/project-1-retrospective-realfresh-82300977502f) \
● [Fridgely - Food Expiration Date Tracker](https://fridgelyapp.com) & [FreshFridge](http://www.freshfridgeapp.com) \
Every project/work that we found depends on addition of food item manually or through barcode \
scanning but none among them scans the food item.

### Hardware and Software Requirements
Development : Desktop/Laptop \
  ● NVIDIA® GPU card with CUDA® Compute Capability 3.5 or higher enabled for Tensorflow. \
  NVIDIA® GTX 1070 or above preferred. \
  ● Quad core Intel Core i7 Skylake or higher \
  ● 8Gb RAM recommended \
  ● 16Gb of disk space \
  ● 1280 x 800 minimum screen resolution \
Tools:- \
  ● Android Studio IDE 3.3.1 \
  ● Anaconda/Jupyter Notebook \
  ● Git \
  ● Flutter v1.0 \
  ● Firebase SDK v16.x.x \
  Android Application Requirements : \
  ● Android 5.0 ( API 21) or higher is required.
  
### Milestones
Design GUI of the application \
● Finalize a simple user friendly design for the complete application. \
Allow adding products through barcode scanning \
● In the first iteration, allow user to add and categorize food through barcode. \
Data Cleaning \
● Study and familiarize ourselves with CNN, Keras, Tensorflow and TensorFlow Lite . \
● Clean, Refine and Optimize the datasets for food classification training: Fruits , Vegetables , \
Other Groceries . \
Design a neural network for automatic identification \
● Finally, training a convolutional Neural Network for classifying food images using \
appropriate framework. \
Converting the TensorFlow model \
● Freezing the graph and optimizing the model file for mobile apps. \
● Export the project to TensorFlow Lite in order to achieve low latency and hardware \
acceleration. \
Integration of Model in the mobile application \
● Integration of converted .tflite model with the mobile application, which will now support \
adding items both through image identification as well as barcode scanning. Scanning the \
item will display its name, classification and estimated expiration date. \
Refactoring and Testing \
● Refactoring the code by following good development practices. \
● Developing test suite which involves everything from Unit, Integration and End to End \
testing. \
Documentation \
● Well organized documentation for Developers as well as for the Users. \
A buffer of two weeks has been kept for any unpredictable delay.

### Challenge and Research needed
● How to export Tensorflow and Keras Model to ML Kit. \
● [How to export Tensorflow Models to Tensorflow Lite for portable devices.](https://www.tensorflow.org/lite/guide/get_started) \
● Research Papers : \
○ [http://vim.ustc.edu.cn/?product=vegfru](http://vim.ustc.edu.cn/?product=vegfru) \
○ [https://www.researchgate.net/publication/321475443_Fruit_recognition_from_images_using_deep_learning](https://www.researchgate.net/publication/321475443_Fruit_recognition_from_images_using_deep_learning) \
○ [http://cs231n.stanford.edu/reports/2017/pdfs/607.pdf](http://cs231n.stanford.edu/reports/2017/pdfs/607.pdf) \
○ [http://ijabe.org/index.php/ijabe/article/view/2690/pdf](http://ijabe.org/index.php/ijabe/article/view/2690/pdf) \
