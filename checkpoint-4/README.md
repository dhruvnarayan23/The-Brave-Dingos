# Data Science Seminar

## Checkpoint-4 Graph Analytics

We have enclosed our findings and source code in this directory.

We have attached 'officer_css_awards.sql' which we used to generate the 'officer_css_awards.csv' (Also under src folder).
The user does not have to run the query. This is just for reference. The CSV is already generated.
'officer_css_awards.sql' includes the updated query to generate the Complaint Severity Score (CSS) for an officer.

The main code is included in SparkGraphX.ipynb which needs to be uploaded on Google Colab by the user.
Once uploaded to colab, follow the instructions and start executing the code cells. 
Next, when the following code cell is executed, an option to upload a file will pop up - upload 'officer_css_awards.csv' here.
from google.colab import files
files.upload()

The user can execute the remaining cells together or one-by-one and observe our analysis results.

With this checkpoint, we categorize the police officers under buckets based on their CSS percentile. We want to know whether the Chicago police department rewards its good police officers. Past research has shown us that good police officers stay away from the bad ones. This means their first degree connections would also have qualities similar to good officers (i.e. low CSS scores). Hence, we would also expect their first degree connections to have higher rewards. We aim to do a similar analysis for ‘bad’ cops (i.e. high CSS scores). Furthermore, we use PageRank GraphX algorithm to observe the most connected (i.e. they have been listed along with other officers under complaints filed by civilians) police officers having a high PageRank score and observe their average CSS. We carry out the same steps for the least connected police officers.