
# Final Project - Diabetes Factors

## Members:
- Bradley
- Christopher
- Laine
## Project Topic:
For our project, we are analyzing a dataset from Kaggle about Diabetes and other health risks of certain individuals. This dataset highlights a certain amount of the population and their health information revolving around whether or not they have diabetes. With certain scientific diagnoses identified as possible contributers to diabetes, we wanted to dive into the many factors that may or may not contribute to diabetes. We don't have the specifics on which type of diabetes (1 or 2), but we do know that overall, Type 2 diabetes is on the rise worldwide with obesity and physical inactivity as the leading causes [^1]. Type 1 diabetes is related to genetics and environmental factors. The dataset expresses different demographic and medical features such as BMI, age & gender, hypertension, heart disease, smoking history, blood glucose levels, etc. - its safe to assume that we are working closer to Type 2 diabetes. This can be a great way to test possible causation of different risk factors upon diabetes diagnoses.
## Dataset Info:
The dataset is a collection of EHRs (Electronic Health Records) sourced from different healthcare providers as part of their clinical practices. EHRs are a great way to analyze patient health records and can be used progressively along the life of the patient. The dataset was sourced from Kaggle, licensed by the original author,([Mohammed Mustafa](https://www.kaggle.com/datasets/iammustafatz/diabetes-prediction-dataset). The dataset was collected from patients on a random scale from surveys, medical records, and lab tests. It has been pre-processed, and processed farther by this team, leaving the dataset with 11 columns and 64,185 rows turned into integers where necessary for MachineLearning analysis.


<img width="737" alt="Screenshot 2023-05-08 at 5 52 26 PM" src="https://user-images.githubusercontent.com/117100491/236954421-e62f2e19-c026-475a-b8af-07085cfd35e9.png">

The above image shows the original data we pulled with categories hypertension, heart_disease, smoking_history and diabetes being transfered to true/false.

<img width="779" alt="Screenshot 2023-05-08 at 5 54 06 PM" src="https://user-images.githubusercontent.com/117100491/236954628-3264b41b-f271-4a09-9419-11bf874b55e2.png">


The above image illustrates our final database, transformed into numeric data by the lovely Bradley Henley in order to complete MachineLearning protocols.
The final data contained the features patient_no, gender_num, age, age_range, hypertension, heart_disease, smoking_history, bmi, hba1c_level, blood_glucose, and diabetic_numeric.
The diabetic_numeric is 0 & 1, with 0 being no diabetes and 1 being diabetes with the data 

![Screenshot 2023-05-08 at 6 12 54 PM](https://user-images.githubusercontent.com/117100491/236956839-489f478d-5011-4b73-8a43-0fd677f2f88e.png)

We can see that the gender breakdown is fairly close, and the diabetes data leans more towards not having it. 

As far as age goes, there is a wide... wide breadth of data. There are 101 rows of age data, which we have binned by 10 year marks for analysis.

## Question to be answered: 
If you have more of the factors, are you more likely to have diabetes?
  - Can this be proven by the data?
 
![Screenshot 2023-05-08 at 6 25 57 PM](https://user-images.githubusercontent.com/117100491/236958147-1ee79e1a-4312-4636-bba8-ea2a5ab2d241.png)

Is there a discernable difference if the patient has a smoking_history?

![Screenshot 2023-05-08 at 6 23 47 PM](https://user-images.githubusercontent.com/117100491/236957894-43763dc8-3ad2-4585-b516-5b8bae6f969c.png)

How do the features given affect the output (diabetes diagnoses)?
  - Does a mix of features impact?
  - Can they be linked?
  - Does age play a role? 
  - Does gender play a role? Answered below

![Screenshot 2023-05-08 at 6 20 57 PM](https://user-images.githubusercontent.com/117100491/236957593-92e95baf-240c-494c-ba8a-28a197fd97c7.png)


## Links:
Slide deck - https://docs.google.com/presentation/d/141F7PRugIfyXXmmNoxr6E6akwN18IX1v0AwdYgSdBLA/edit?usp=sharing

## Communication
- Communicate through Slack every day concerning progress of personal tasks.
- Communicating what has been done when we have finished or made progress on our assigned roles.
- The README is updated as progress is reported by individuals.
- Meeting during class and communicating outside of class to complete each segment and review before Wed night.
### Current Team Processes:
- Bradley has created a clean data set through Python coding and SQL database/tables.
- Laine has placed the CSV in MachineLearning - She has built out Logistical Regression, Random Forest Classifier, Random Over Sampling, Decision Tree, and Gradient Tree, and is working on explaining her finding. BUT we have an accuracy upwards of 95%! She has made some basic python .groupbys to give a quick glance at the makeup of the dataset as we move forward.
- Christopher is working on Tableau visualization/interactive dashboard showcasing the likelihood of diabetes based on factors.
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
- [ ] Detailed README.md that includes project status, images, descriptions, and results. (20 points)
- [ ] At least 8 commits per team member (20 points)
- [ ] Machine learning model, confusion matrix/accuracy score (20)
- [ ] Database that stores data fro the project with at least two tables or collections (20)
- [ ] Selected topic and reasoning for the selection
- [ ] Description of data
- [ ] Questions planned to answer
- [ ] Description of the data exploration phase
- [ ] Description of the analysis phase
- [ ] Technologies, languages, tools, and algorithms that the team used.


[^1]: [https://www.niddk.nih.gov/health-information/diabetes/overview/symptoms-causes#:~:text=Overweight%2C%20obesity%2C%20and%20physical%20inactivity,people%20with%20type%202%20diabetes.]
