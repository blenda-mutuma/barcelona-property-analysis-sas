/* Mid term project */

/*
Imagine…
You've been asked to analyze market trends to guide the
company’s investment decisions in Barcelona. You've just been
handed a rich dataset of property listings across the city,
detailing everything from prices and square footage to
amenities like garden and swimming pool.
Your task is to preprocess and explore the data to uncover key
insights that could give the company a competitive edge in
this booming market.
To preprocess the data, please:
- Rename the variables for your convenience
- Ensure the categorical variables are properly encoded:
 
- Ensure that all quantitative variables are numeric data types (i.e., NUM)
- Remove any rows with missing values
- Remove any rows that you want to exclude from your analysis
- Remove any variables that aren't part of your analysis
- Save the final dataset as a CSV file

After exploring the data using uni-/bi-/trivariate analyses, please answer the following questions:

- Q: What is your 1st key insight?
Apartments are the most frequent property type and Estates have the highest average price
- A: As property size increases, the price tends to increase as well.
     This analysis shows that square meters is a key factor influencing property prices in the dataset.
- Q: What is your 2nd key insight?
- A: properties with Amenities like balcony and swimming pool have higher prices, shows that amenities impact price structure
- Q: What is your 3rd key insight?
- A: properties with a garden and a terrace have higher prices
properties with air conditioning and heating have higher prices 
- Q: What is your 4th key insight?
- A: There is a clear relationship between the age of the property and the need for renovations.
 Generally, older properties are more likely to need renovations, 
 while newer properties are less likely to require such work.
 There are more outliers in the "No" category, indicating that while most properties in this group were built more recently,
 there are a few older homes that are still in good condition and do not require renovations.
- Q: What is your 5th key insight?
- A: Properties built in more recent years (closer to the present) tend to have a higher price,
 as shown by the upward trend in the scatter plot. There is a clustering of lower-priced properties for older years, especially before the 1900s.
As the year built increases, there is a higher spread in property prices, indicating that more recently built properties vary significantly in value.
 property prices are positively correlated with the year built, indicating that newer properties generally have higher prices. Additionally, 
 the need for renovation has a significant impact, with properties requiring renovation typically showing lower market values. This suggests that properties in good condition (not needing renovation) are more highly valued, regardless of age.
*/
/* Load data */
proc import datafile="data/barcelona_listings.csv" out=Barcelona replace;
    guessingrows=max;
run;
/* Print data */
proc print data=Barcelona(obs=10);
run;
/* Rename variables */
data Barcelona ;
  set Barcelona;
  rename "property type"n =property_type
         "square meters"n =square_meters
         "n bedrooms"n =n_bedrooms
         "n bathrooms"n =n_bathrooms
         "year built"n =year_built
         "second hand"n =second_hand
         "needs renovating"n =needs_renovating
         "swimming pool"n =	swimming_pool
         "air conditioning"n =air_conditioning;       
run;
/* Print data */
proc print data=Barcelona(obs=10);
run;
proc contents data=Barcelona;
run;
/* Convert 	n_bathrooms (quantitative variable) to numeric data type */
/* FYI: Any text strings will generate errors in the log and become missing values */
data Barcelona;
   set Barcelona;
   _temp=input(	n_bathrooms, best32.);
   drop	n_bathrooms;
   rename _temp=n_bathrooms;
run;

/* Convert 	n_bedrooms (quantitative variable) to numeric data type */
/* FYI: Any text strings will generate errors in the log and become missing values */
data Barcelona;
   set Barcelona;
   _temp=input(	n_bedrooms, best32.);
   drop	n_bedrooms;
   rename _temp=n_bedrooms;
run;
/* Convert 	price(quantitative variable) to numeric data type */
/* FYI: Any text strings will generate errors in the log and become missing values */
data Barcelona;
   set Barcelona;
   _temp=input(	price, best32.);
   drop	price;
   rename _temp=price;
run;
/* Convert square_meters(quantitative variable) to numeric data type */
/* FYI: Any text strings will generate errors in the log and become missing values */
data Barcelona;
   set Barcelona;
   _temp=input(square_meters, best32.);
   drop	square_meters;
   rename _temp=square_meters;
run;
/* Convert floor(quantitative variable) to numeric data type */
/* FYI: Any text strings will generate errors in the log and become missing values */
data Barcelona;
   set Barcelona;
   _temp=input(floor, best32.);
   drop	floor;
   rename _temp=floor;
run;
/* Convert year_built (quantitative variable) to numeric data type */
/* FYI: Any text strings will generate errors in the log and become missing values */
data Barcelona;
   set Barcelona;
   _temp=input(year_built, best32.);
   drop	year_built;
   rename _temp=year_built;
run;
proc contents data=Barcelona;
run;
/* Count missing values */
proc means data=Barcelona nmiss;
run;
/* Keep rows with no missing values */
data Barcelona;
    set Barcelona;
    if cmiss(of  _all_) =0 then output;
run;
/* Print data */
proc means data=Barcelona nmiss;
run;
/* calculate descriptive stastics */
proc means data= Barcelona;
run;
/* observation: The average price is 530956.17 */
/* Delete variables */
data Barcelona;
  set Barcelona ;
  drop "id"n  "address"n ;
run;
/* Print data */
proc print data=Barcelona(obs=10);
run;
/* Calculate frequencies for categorical variables */
proc freq data=Barcelona order=freq ;
    tables 	property_type  neighborhood 	year_built / norow nocol nopercent;
run;
/* observation: Apartments are the most frequent property type */
/*Examine the relationship between property size and price.*/
/* Calculate descriptive statistics of price (quantitative variable) by Property type(categorical variable) */
proc means data=Barcelona;
     class Property_type;
    var price;
run;
/*Determine price variations across different neighborhoods.*/
/* Calculate correlation coefficient between  neighborhood and price   */
proc means data=Barcelona;
     class neighborhood;
    var price;
run;
/* Observation:Estates have the highest average price */
/*Examine the relationship between property size(square_meters) and price.*/
/* Calculate correlation coefficient between square_meters and price  (2 quantitative variables) */
proc corr data=Barcelona;
    var   square_meters   price ;
run;
/* Plot square_meters and price (2 quantitative variables) */
proc sgplot data=Barcelona;
    scatter x=square_meters y=price;
run;
/* 2 Categorical Variables & 1 Quantitative Variable */

/* Calculate descriptive statistics of price (quantitative variable) by n_bathrooms and n_bedrooms (2 categorical variables) */
proc means data=Barcelona;
  class n_bathrooms  n_bedrooms ;
   var price ;
run;

/* Calculate descriptive statistics of price (quantitative variable) by balcony and swimming_pool (2 categorical variables) */
proc means data=Barcelona;
  class balcony  swimming_pool ;
   var price ;
run;

/* Calculate descriptive statistics of price (quantitative variable) by garden and terrace (2 categorical variables) */
proc means data=Barcelona;
  class garden  terrace;
   var price ;
run;

/* Calculate descriptive statistics of price (quantitative variable) by air_conditioning and heating(2 categorical variables) */
proc means data=Barcelona;
  class air_conditioning  heating;
   var price ;
run;


/* Calculate descriptive statistics of price (quantitative variable) by air_conditioning and heating(2 categorical variables) */
proc means data=Barcelona;
  class air_conditioning  heating;
   var price ;
run;
/* 1 Categorical Variable & 1 Quantitative Variable */


/* Calculate descriptive statistics of year_built  (quantitative variable) by needs_renovating (categorical variable) */
proc means data=Barcelona;
     class needs_renovating;
    var year_built;
run;

/* Plot  year_built(quantitative variable) by needs_renovating (categorical variable) */
proc sgplot data=Barcelona;
    vbox  year_built / category=needs_renovating ;
run;
/* 1 Categorical Variable & 2 Quantitative Variables */

/* Calculate correlation coefficients between  year_built and price (2 quantitative variables) by needs_renovating (categorical variable) */
/* Need to first sort data by needs_renovating (categorical variable) */
proc sort data=Barcelona;
   by needs_renovating;
run;   
proc corr Barcelona;
    var  year_built  price;
run;

/* Plot */
proc sgplot data=Barcelona;
    scatter x=year_built y=price / group=needs_renovating;
run;
