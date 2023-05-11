
# Final Project - Diabetes Factors

## Members:
- Bradley
- Christopher
- Laine
## Project Topic:
For our project, we are analyzing a dataset from Kaggle about Diabetes and other health risks of certain individuals. This dataset highlights a certain amount of the population and their health information revolving around whether or not they have diabetes. With certain scientific diagnoses identified as possible contributers to diabetes, we wanted to dive into the many factors that may or may not contribute to diabetes. We don't have the specifics on which type of diabetes (1 or 2), but we do know that overall, Type 2 diabetes is on the rise worldwide with obesity and physical inactivity as the leading causes [^1]. Type 1 diabetes is related to genetics and environmental factors. The dataset expresses different demographic and medical features such as BMI, age & gender, hypertension, heart disease, smoking history, blood glucose levels, etc. - its safe to assume that we are working closer to Type 2 diabetes. This can be a great way to test possible causation of different risk factors upon diabetes diagnoses.
## Dataset Info:
The dataset is a collection of EHRs (Electronic Health Records) sourced from different healthcare providers as part of their clinical practices. EHRs are a great way to analyze patient health records and can be used progressively along the life of the patient. The dataset was sourced from Kaggle, licensed by the original author,[Mohammed Mustafa](https://www.kaggle.com/datasets/iammustafatz/diabetes-prediction-dataset). The dataset was collected from patients on a random scale from surveys, medical records, and lab tests. It has been pre-processed, and processed farther by this team, leaving the dataset with 11 columns and ~64,000 rows turned into integers where necessary for MachineLearning analysis.

![Original Dataset Example](https://github.com/bhernley/Final_Project/assets/119247984/d58bfa09-6e91-4dd7-9cc8-ccbff3249015)

The above image shows the original data as we received it with categories hypertension, heart_disease, smoking_history and diabetes.

![final dataset sample](https://github.com/bhernley/Final_Project/assets/119247984/4765572d-75d4-4e5e-be2c-c33b7ae9ba76)

The above image illustrates our final database.  The data each patient was given a unique identifier as a "patient_no". The remainder of the columns were converted into numeric data in order to complete the MachineLearning protocols.
The final data contained the features patient_no, gender_num, age_range, hypertension, heart_disease, smoking_history, bmi, hba1c_level, blood_glucose, and diabetic.

- Values of 1 equate to true/positive, and values of 2 equate to false/negative 
- For the "gender" column, 0 is female and 1 is male.

![Gender_Count_Final](https://github.com/bhernley/Final_Project/assets/119247984/8390c6d9-4408-419c-b1b9-0e04bf10c0da)

We can see that the gender breakdown is fairly close.

![Age_Group_Count_Final](https://github.com/bhernley/Final_Project/assets/119247984/87387965-56eb-4d4a-96a3-98d7c01ca6a8)

As far as age goes, there is a wide... wide breadth of data. There are 101 rows of age data, which we have binned by 10 year marks for analysis.



## Question to be answered: 
If you have more of the factors, are you more likely to have diabetes?
  - Can this be proven by the data?

Is there a discernable difference if the patient has a smoking_history?

How do the features given affect the output (diabetes diagnoses)?
  - Does a mix of features impact?
  - Can they be linked?
  - Does age play a role? 
  - Does gender play a role?
## Findings:

We've found that the GradientTree MachineLearning model gives us the best output resulting in a 96% accuracy rating after using the GradientBoostingClassifer. We decided to use the GradientTree MachineLearning since our output was so successful, and we did not need Neural Network to support.

<img width="507" alt="Screenshot 2023-05-10 at 5 34 13 PM" src="https://github.com/bhernley/Final_Project/assets/117100491/9e6717af-3e5b-4dd4-b0e0-770963bd48e4">

We trained the model with a train_test_split twice, moving into the StandardScaler instance and using the Decision Tree Classifier, confusion matrix and accuracy score, the results were less than optimal.

![Screenshot 2023-05-10 at 7 28 57 PM](https://github.com/bhernley/Final_Project/assets/117100491/28af2106-62d0-4a39-a4c0-786f04127a41)

Then, we trained the Random Forest Classifier coding with the confusion matrix and accuracy score with the classification report. This gave us a very good outcome, but recall is a less than optimal.

![Screenshot 2023-05-10 at 7 31 45 PM](https://github.com/bhernley/Final_Project/assets/117100491/4a09bfc3-95e3-45e1-ac2b-aad16b26d605)

Then we sorted the importance of the features.

![Screenshot 2023-05-10 at 7 32 59 PM](https://github.com/bhernley/Final_Project/assets/117100491/575b9d61-3d41-4f73-ae27-4136f7c3d134)

The results show that hba1c_levels and blood_glucose_levels, both blood sugar factors, are particularly important. 

Then we coded the Gradient Boosting Classifier from the sklearn ensemble, fitting the model to a classifier and accuracy.

![Screenshot 2023-05-10 at 7 35 32 PM](https://github.com/bhernley/Final_Project/assets/117100491/7728ba47-e006-445b-97df-31d7e84e142b)

Finally, we moved into the Gradient Boosting Classifier to predict the actual data. Resulting in with a precision score of 96/98, recall of 100/70, anf fl-score of 98/82 which was by far our best outcome.


## Links:
Slide deck - https://docs.google.com/presentation/d/141F7PRugIfyXXmmNoxr6E6akwN18IX1v0AwdYgSdBLA/edit?usp=sharing

## Communication
- Communicate through Slack every day concerning progress of personal tasks.
- Communicating what has been done when we have finished or made progress on our assigned roles.
- The README is updated as progress is reported by individuals.
- Meeting during class and communicating outside of class to complete each segment and review before Wed night.
### Current Team Processes:
- Bradley has created a clean data set through Python coding and SQL database/tables.
- Laine has placed the CSV in MachineLearning - She has built out Logistical Regression, Random Forest Classifier, Random Over Sampling, Decision Tree, and Gradient Tree, and is working on explaining her finding. BUT we have an accuracy upwards of 95% with every MachineLearning model! She has made some basic python .groupbys to give a quick glance at the makeup of the dataset as we move forward.
- Christopher is working on Tableau visualization/interactive dashboard showcasing the likelihood of diabetes based on factors generally, and more specifically seeking highly correlative factors not just for patients with diabetes but additional physiological or lifestyle features highlighted in this data set. Further recording and ultimately reporting with comment from team on the data analysis and exploration experience and what we learned as we worked through the data assessment, cleaning, and learning process.
## Technologies:
- Jupyter Notebook/Python/Pandas/Numpy
- SQL/PgAdmin/Postgres
- MachineLearning/LogisticalRegression/RandomForestClassifier/Oversampling/DecisionTree/GradientTree/Confusion Matrix - Accuracy Score
- Tableau/Visualizations - story telling
- Google Slides

## Challenges:
- Identifying proper MachineLearning techniques to coding. Trouble rectifying the data set question to the MachineLearning.
- Need to communicate Segment needs earlier. Make sure we're all still in the same boat.
## Moving Forward:
**Segment 1 Requirements:**
- [ ] Need to fix table issues recorded in grade review - README.md has been updated as mentioned in review

**Segment 2 Requirements:**
- [X] Detailed README.md that includes project status, images, descriptions, and results. (20 points)
- [X] At least 8 commits per team member (20 points)
- [X] Machine learning model, confusion matrix/accuracy score (20)
- [ ] Database that stores data from the project with at least two tables or collections (20)
- [ ] Selected topic and reasoning for the selection
- [ ] Description of data
- [ ] Questions planned to answer
- [ ] Description of the data exploration phase
- [ ] Description of the analysis phase
- [ ] Technologies, languages, tools, and algorithms that the team used.


[^1]: [https://www.niddk.nih.gov/health-information/diabetes/overview/symptoms-causes#:~:text=Overweight%2C%20obesity%2C%20and%20physical%20inactivity,people%20with%20type%202%20diabetes.]
