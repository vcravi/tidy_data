#Code book for tidy data from the UCI HAR data set

The following variables describe the subject and the activity associated with 
the measurements

**Subject**

      An integer in the range 1 to 30 identifying the subject of the experiment
  
**Activity**

      A textual description of the activity for which the measurements were made

The following variables describe the actual measurements themselves. The 
variables follow the naming convention

**{t,f}*measurement*.{mean,std}[...{X,Y,Z}]**

where 

{t,f}: time or frequency domain data

*measurement*: defines the particular measurement

{mean,std}: mean or standard deviation of the measurement

{X,Y,Z}: If the measurement is a vector, the axis of the measurement value

The particular measurements are

**BodyAcc**: body acceleration

**GravityAcc**: gravity acceleration

**BodyAccJerk**: derivative of body acceleration

**BodyGyro**: body rotation rate 

**BodyGyroJerk**: derivative of body rotation rate

**BodyAccMag**: Magnitude of body acceleration

**GravityAccMag**: Magnitude of gravity acceleration

**BodyAccJerkMag**: Magnitude of derivative of body acceleration

**BodyGyroMag**: Magnitude of derivative of body rotation

**BodyGyroJerkMag**: Magnitude of derivative of body rotation rate

The measurements are normalized and bounded within [-1,1]