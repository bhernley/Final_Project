
# Final Project - Diabetes Factors

## Links:
Slide deck - https://docs.google.com/presentation/d/141F7PRugIfyXXmmNoxr6E6akwN18IX1v0AwdYgSdBLA/edit?usp=sharing


## File Info:
Diabetes_FP_GradientTree.ipynb = the final MachineLearning model coding analysis

## Members:
- Bradley
- Christopher
- Laine
## Project Topic:
For our project, we are analyzing a dataset from Kaggle about Diabetes and other health risks of certain individuals. This dataset highlights a certain amount of the population and their health information revolving around whether or not they have diabetes. With certain scientific diagnoses identified as possible contributers to diabetes, we wanted to dive into the many factors that may or may not contribute to diabetes. We don't have the specifics on which type of diabetes (1 or 2), but we do know that overall, Type 2 diabetes is on the rise worldwide with obesity and physical inactivity as the leading causes [^1]. Type 1 diabetes is related to genetics and environmental factors. The dataset expresses different demographic and medical features such as BMI, age & gender, hypertension, heart disease, smoking history, blood glucose levels, etc. - its safe to assume that we are working closer to Type 2 diabetes. This can be a great way to test possible causation of different risk factors upon diabetes diagnoses.
## Dataset Info:
The dataset is a collection of EHRs (Electronic Health Records) sourced from different healthcare providers as part of their clinical practices. EHRs are a great way to analyze patient health records and can be used progressively along the life of the patient. The dataset was sourced from Kaggle, licensed by the original author,[Mohammed Mustafa](https://www.kaggle.com/datasets/iammustafatz/diabetes-prediction-dataset). The dataset was collected from patients on a random scale from surveys, medical records, and lab tests. It has been pre-processed, and processed farther by this team, leaving the dataset with 11 columns and ~64,000 rows turned into integers where necessary for MachineLearning analysis.

The following image shows the original, raw data as we received it with categories hypertension, heart_disease, smoking_history and diabetes.  The dataset originally contained 100k rows of information.
![Original Dataset Example](https://github.com/bhernley/Final_Project/assets/119247984/d58bfa09-6e91-4dd7-9cc8-ccbff3249015)

The file was then cleaned removing any null values and adding a unique identifier as "patient_no" in order to further process the dataset.  This left us approximately 64k rows of information and the following ERD 

![ERD](https://github.com/bhernley/Final_Project/assets/119247984/b9f08baf-a047-4a01-8a39-95e6e6044a21)

And finally the data set was converted to all numerical values so that it could be used in our machine learning tools.

![final dataset sample](https://github.com/bhernley/Final_Project/assets/119247984/4765572d-75d4-4e5e-be2c-c33b7ae9ba76)

The above image illustrates our final database. 

- Values of 1 equate to true/positive, and values of 0 equate to false/negative 
- For the "gender" column, 0 is female and 1 is male.

![Gender_Count_Final](https://github.com/bhernley/Final_Project/assets/119247984/8390c6d9-4408-419c-b1b9-0e04bf10c0da)

We can see that the gender breakdown is fairly close.

![Age_Group_Count_Final](https://github.com/bhernley/Final_Project/assets/119247984/87387965-56eb-4d4a-96a3-98d7c01ca6a8)

We were able to bin the data into age groups as shown above.  As age increases, we see the number of patients increase with each age group.

## Question to be answered: 
If one is positive for more factors featured in this data set, is one more likely to test positive for diabetes?
  - Yes - limited indications with existing data.

Is there a discernable difference if the patient has a history of high blood sugar, BMI, smoking, etc.?
  - Yes. See (final) images.

How do the features given affect a likely outcome of positive diabetes diagnosis?
  - Will a mix of features correlate in an identifiable and way?
  - Can such features be linked with this data?
  - How does age impact a likely diagnosis
  - Does gender play a role?

  ANSWERS: See slide deck, Tableau Story, and Below for summary

There are slight but noticeable associations between diabetes and many factors included in the data set:
Diabetes likelihood increases with age, peaking in early 60s in our observations
Males show a marginally higher inclination for diabetes than females
Smoking extends a likely association with diabetes in conjunction with age
A relatively higher BMI than the non-diabetic average after age 22 is consistently correlated with diabetes
Relatively higher Hba1c & blood glucose levels compared to non-diabetic averages  most significantly and consistently indicate positively for diabetes
Heart disease and hypertension are shared risk factors with Type 2 Diabetes but do not show high correlation in our data set - possibly due to limited values or a wide age range

## Data Exploration & Findings:

  - See Dashboard and Slide Deck findings and future recommendations

### DataBase Management:
After initially pulling the data, we removed all null values while also altering some categorization that did not make sense. For example, the smoking_history category had ever instead of never. The data was first cleaned by giving each patient was given a unique identifier as a "patient_no", as well has removing rows with missing information. Smoking history responses were also coverted to a yes/no format for any level of smoking history.
The final data contained the features patient_no, gender_num, age_range, hypertension, heart_disease, smoking_history, bmi, hba1c_level, blood_glucose, and diabetic.
We also bucketed the ages in order to add another analytics aspect based on age. We created numeric data to allow for MachineLearning models to run which were successful.

Binned Age Range:

 0= <18
 1= 19-25
 2= 26-35
 3= 36-45
 4= 46-55
 5= 56+
 
### MachineLearning Management:

While we were exploring, we found that the accuracy score was great with the Gradient Tree MachineLearning.
We've found that the Gradient Tree MachineLearning model gives us the best output resulting in a 96% accuracy rating after using the GradientBoostingClassifer. We decided to use the GradientTree MachineLearning since our output was so successful after trying Decision Tree, Logistical Regression, Random Forest Classifier, and Random OverSampling all with accuracy scores and confusion matrixes.
We trained the model with a train_test_split twice, moving into the StandardScaler instance and using the Decision Tree Classifier, confusion matrix and accuracy score, the results were less than optimal.
Then, we trained the Random Forest Classifier coding with the confusion matrix and accuracy score with the classification report. This gave us a very good outcome, but recall is a less than optimal.
Then we sorted the importance of the features.

![Screenshot 2023-05-10 at 7 32 59 PM](https://github.com/bhernley/Final_Project/assets/117100491/575b9d61-3d41-4f73-ae27-4136f7c3d134)

The results show that hba1c_levels and blood_glucose_levels, both blood sugar factors, are particularly important. 
Then we coded the Gradient Boosting Classifier from the sklearn ensemble, fitting the model to a classifier and accuracy.
Finally, we moved into the Gradient Boosting Classifier to predict the actual data. Resulting in with a precision score of 96/98, recall of 100/70, anf fl-score of 98/82 which was by far our best outcome.

![Screenshot 2023-05-15 at 5 14 25 PM](https://github.com/bhernley/Final_Project/assets/117100491/003cbf01-cfa6-4c9c-bcfe-27d2343a44b4)


**Above is a basic summary of our findings for MachineLearning!**

## Communication
- Communicate through Slack every day concerning progress of personal tasks.
- Communicating what has been done when we have finished or made progress on our assigned roles.
- The README is updated as progress is reported by individuals.
- Meeting during class and communicating outside of class to complete each segment and review before Wed night.
### Current Team Processes:
- Bradley has created a clean data set through Python coding and SQL database/tables.
- Laine has placed the CSV in MachineLearning - She has built out Logistical Regression, Random Forest Classifier, Random Over Sampling, Decision Tree, and Gradient Tree, and is working on explaining her finding. She has made some basic python .groupbys to give a quick glance at the makeup of the dataset as we move forward and has worked on the presentation slides as the data analysis progresses.
- Christopher is working on Tableau visualization/interactive dashboard showcasing the likelihood of diabetes based on factors generally, and more specifically seeking highly correlative factors not just for patients with diabetes but additional physiological or lifestyle features highlighted in this data set. Further recording and ultimately reporting with comment from team on the data analysis and exploration experience and what we learned as we worked through the data assessment, cleaning, and learning process.
## Technologies:
- Jupyter Notebook/Python/Pandas/Numpy
- SQL/PgAdmin/Postgres
- MachineLearning/LogisticalRegression/RandomForestClassifier/Oversampling/DecisionTree/GradientTree/Confusion Matrix - Accuracy Score
- Tableau/Visualizations - story telling
- Google Slides

## Challenges:
- Identifying proper MachineLearning language in presentation. 
- Need to set bring our different pieces together for the charts and slides

## Future Recommendations:
 A visual anomaly was identified in sugar values among Diabetes-Positive individuals around the 18-22 age range. We recommend further assessment of medical and socio-cultural factors among this or other relevant populations to seek cause or correlation explaining the measure deltas in sugar scores. Could this be related to when people traditionally “leave home” and make their own choices and explorations in diet and socio-cultural behaviors like smoking (inhibiting hunger drive), poor diet, sedentary behavior, etc.?

## Moving Forward:
**Segment 1 Requirements:**
- [X] Need to fix table issues recorded in grade review - README.md has been updated as mentioned in review

**Segment 2 Requirements:**
- [X] Detailed README.md that includes project status, images, descriptions, and results. (20 points)
- [X] At least 8 commits per team member (20 points)
- [X] Machine learning model, confusion matrix/accuracy score (20)
- [X] Database that stores data from the project with at least two tables or collections (20)
- [X] Selected topic and reasoning for the selection
- [X] Description of data
- [X] Questions planned to answer
- [ ] Description of the data exploration phase
- [ ] Description of the analysis phase
- [X] Technologies, languages, tools, and algorithms that the team used.

Visualisation Components Under Construction - Plan to show fundamental correlations among data set population and present notable standout correlative indicators for Diabetes and/or physical/behavioral norms.  Below are snips from the current dash:

![Data set raw counts +/-](Set%20Raw%20Count.PNG)

![BG & BMI Pos D](BG%20&%20BMI%20Positive%20D.PNG)

![BG & BMI Neg D](BG%20&%20BMI%20Negative%20D.PNG)

![Avg BG & BMI for Pos & Neg D](Avg%20BG%20&%20BMI%20for%20Pos%20&%20Neg%20D.PNG)

![Avg BG for Pos & Neg D](Avg%20Blood%20Glucose%20PosNeg.PNG)

The above is for further discussion regarding priorities, thematics, and order - inclusive of more images covering more correlative standards and anomalies.

[^1]: [https://www.niddk.nih.gov/health-information/diabetes/overview/symptoms-causes#:~:text=Overweight%2C%20obesity%2C%20and%20physical%20inactivity,people%20with%20type%202%20diabetes.]

