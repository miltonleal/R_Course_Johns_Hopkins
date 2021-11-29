# Code Book

**Written by Milton Leal**

*1st of Feb 2021*

### Main Variables

Below you can find the name and a short description of each variable (column) that is included in the output table "tidy.data". 

**[1] "activity"**

The study conducted created 6 different activities participants in the study should do, namely: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. 

**[2] "subject"**

There were 30 different participants in the study. Each one is given a number from 1:30 as an index. 


###Remaining variables**

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
meanFreq(): Weighted average of the frequency components to obtain a mean frequency

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

Below you can find the name of each column in the tidy dataset. 

[3] "TimeDomain_BodyAccelerometer_Mean_X"                              
[4] "TimeDomain_BodyAccelerometer_Mean_Y"                              
[5] "TimeDomain_BodyAccelerometer_Mean_Z"                              
[6] "TimeDomain_BodyAccelerometer_StandarDeviation_X"                  
[7] "TimeDomain_BodyAccelerometer_StandarDeviation_Y"                  
[8] "TimeDomain_BodyAccelerometer_StandarDeviation_Z"                  
[9] "TimeDomain_GravityAccelerometer_Mean_X"                           
[10] "TimeDomain_GravityAccelerometer_Mean_Y"                           
[11] "TimeDomain_GravityAccelerometer_Mean_Z"                           
[12] "TimeDomain_GravityAccelerometer_StandarDeviation_X"               
[13] "TimeDomain_GravityAccelerometer_StandarDeviation_Y"               
[14] "TimeDomain_GravityAccelerometer_StandarDeviation_Z"               
[15] "TimeDomain_BodyAccelerometer_Jerk_Mean_X"                         
[16] "TimeDomain_BodyAccelerometer_Jerk_Mean_Y"                         
[17] "TimeDomain_BodyAccelerometer_Jerk_Mean_Z"                         
[18] "TimeDomain_BodyAccelerometer_Jerk_StandarDeviation_X"             
[19] "TimeDomain_BodyAccelerometer_Jerk_StandarDeviation_Y"             
[20] "TimeDomain_BodyAccelerometer_Jerk_StandarDeviation_Z"             
[21] "TimeDomain_BodyGyroscope_Mean_X"                                  
[22] "TimeDomain_BodyGyroscope_Mean_Y"                                  
[23] "TimeDomain_BodyGyroscope_Mean_Z"                                  
[24] "TimeDomain_BodyGyroscope_StandarDeviation_X"                      
[25] "TimeDomain_BodyGyroscope_StandarDeviation_Y"                      
[26] "TimeDomain_BodyGyroscope_StandarDeviation_Z"                      
[27] "TimeDomain_BodyGyroscope_Jerk_Mean_X"                             
[28] "TimeDomain_BodyGyroscope_Jerk_Mean_Y"                             
[29] "TimeDomain_BodyGyroscope_Jerk_Mean_Z"                             
[30] "TimeDomain_BodyGyroscope_Jerk_StandarDeviation_X"                 
[31] "TimeDomain_BodyGyroscope_Jerk_StandarDeviation_Y"                 
[32] "TimeDomain_BodyGyroscope_Jerk_StandarDeviation_Z"                 
[33] "TimeDomain_BodyAccelerometer_Magnitude_Mean"                      
[34] "TimeDomain_BodyAccelerometer_Magnitude_StandarDeviation"          
[35] "TimeDomain_GravityAccelerometer_Magnitude_Mean"                   
[36] "TimeDomain_GravityAccelerometer_Magnitude_StandarDeviation"       
[37] "TimeDomain_BodyAccelerometer_Jerk_Magnitude_Mean"                 
[38] "TimeDomain_BodyAccelerometer_Jerk_Magnitude_StandarDeviation"     
[39] "TimeDomain_BodyGyroscope_Magnitude_Mean"                          
[40] "TimeDomain_BodyGyroscope_Magnitude_StandarDeviation"              
[41] "TimeDomain_BodyGyroscope_Jerk_Magnitude_Mean"                     
[42] "TimeDomain_BodyGyroscope_Jerk_Magnitude_StandarDeviation"   
[43] "FrequencyDomain_BodyAccelerometer_Mean_X"                         
[44] "FrequencyDomain_BodyAccelerometer_Mean_Y"                         
[45] "FrequencyDomain_BodyAccelerometer_Mean_Z"                         
[46] "FrequencyDomain_BodyAccelerometer_StandarDeviation_X"             
[47] "FrequencyDomain_BodyAccelerometer_StandarDeviation_Y"             
[48] "FrequencyDomain_BodyAccelerometer_StandarDeviation_Z"             
[49] "FrequencyDomain_BodyAccelerometer_Mean_Frequency_X"               
[50] "FrequencyDomain_BodyAccelerometer_Mean_Frequency_Y"               
[51] "FrequencyDomain_BodyAccelerometer_Mean_Frequency_Z"               
[52] "FrequencyDomain_BodyAccelerometer_Jerk_Mean_X"                    
[53] "FrequencyDomain_BodyAccelerometer_Jerk_Mean_Y"                    
[54] "FrequencyDomain_BodyAccelerometer_Jerk_Mean_Z"                    
[55] "FrequencyDomain_BodyAccelerometer_Jerk_StandarDeviation_X"        
[56] "FrequencyDomain_BodyAccelerometer_Jerk_StandarDeviation_Y"        
[57] "FrequencyDomain_BodyAccelerometer_Jerk_StandarDeviation_Z"        
[58] "FrequencyDomain_BodyAccelerometer_Jerk_Mean_Frequency_X"          
[59] "FrequencyDomain_BodyAccelerometer_Jerk_Mean_Frequency_Y"          
[60] "FrequencyDomain_BodyAccelerometer_Jerk_Mean_Frequency_Z"          
[61] "FrequencyDomain_BodyGyroscope_Mean_X"                             
[62] "FrequencyDomain_BodyGyroscope_Mean_Y"                             
[63] "FrequencyDomain_BodyGyroscope_Mean_Z"                             
[64] "FrequencyDomain_BodyGyroscope_StandarDeviation_X"                 
[65] "FrequencyDomain_BodyGyroscope_StandarDeviation_Y"                 
[66] "FrequencyDomain_BodyGyroscope_StandarDeviation_Z"                 
[67] "FrequencyDomain_BodyGyroscope_Mean_Frequency_X"                   
[68] "FrequencyDomain_BodyGyroscope_Mean_Frequency_Y"                   
[69] "FrequencyDomain_BodyGyroscope_Mean_Frequency_Z"                   
[70] "FrequencyDomain_BodyAccelerometer_Magnitude_Mean"                 
[71] "FrequencyDomain_BodyAccelerometer_Magnitude_StandarDeviation"     
[72] "FrequencyDomain_BodyAccelerometer_Magnitude_Mean_Frequency"       
[73] "FrequencyDomain_BodyAccelerometer_Jerk_Magnitude_Mean"            
[74] "FrequencyDomain_BodyAccelerometer_Jerk_Magnitude_StandarDeviation"    
[75] "FrequencyDomain_BodyAccelerometer_Jerk_Magnitude_Mean_Frequency"  
[76] "FrequencyDomain_BodyGyroscope_Magnitude_Mean"                     
[77] "FrequencyDomain_BodyGyroscope_Magnitude_StandarDeviation"         
[78] "FrequencyDomain_BodyGyroscope_Magnitude_Mean_Frequency"           
[79] "FrequencyDomain_BodyGyroscope_Jerk_Magnitude_Mean"                
[80] "FrequencyDomain_BodyGyroscope_Jerk_Magnitude_StandarDeviation"    
[81] "FrequencyDomain_BodyGyroscope_Jerk_Magnitude_Mean_Frequency"