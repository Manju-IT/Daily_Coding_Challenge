import pandas as pd
import numpy as np

df = pd.read_csv('winemag-data-130k-v2.csv', index_col=0)

print(df.head())  

print("\nMissing values per column:")              
print(df.isnull().sum())

""" 
Output :-
Missing values per column:
country                     63
description                  0
designation              37465
points                       0
price                     8996
province                    63
region_1                 21247
region_2                 79460
taster_name              26244
taster_twitter_handle    31213
title                        0
variety                      1
winery                       0
dtype: int64
"""

print("\nNumber of duplicates:", df.duplicated().sum())    # Output:-  Number of duplicates: 9983
   
df['price'] = df.groupby('country')['price'].transform(lambda x: x.fillna(x.median()))

df = df.dropna(subset=['country']) 

df['region_1'] = df['region_1'].fillna('Unknown')
df['taster_name'] = df['taster_name'].fillna('Unknown')

print("\nRemaining missing values:")
print(df.isnull().sum())

"""
Output :-
Remaining missing values:
country                      0
description                  0
designation              37454
points                       0
price                        1
province                     0
region_1                     0
region_2                 79397
taster_name                  0
taster_twitter_handle    31213
title                        0
variety                      1
winery                       0
dtype: int64
"""

df = df.drop_duplicates(subset=['title', 'description'], keep='first')

print("Data shape after removing duplicates:", df.shape)      # Output:- Data shape after removing duplicates: (119929, 13)

#  Feature Engineering

df['vintage_year'] = df['title'].str.extract(r'(\b\d{4}\b)').astype(float)

df['vintage_year'] = df['vintage_year'].fillna(df['vintage_year'].mode()[0])

# Define bins and labels for points

bins = [0, 80, 85, 90, 95, 100]
labels = ['Poor', 'Fair', 'Good', 'Very Good', 'Excellent']
df['points_tier'] = pd.cut(df['points'], bins=bins, labels=labels, right=False)

# Price bins

price_bins = [0, 20, 50, 100, 200, 500, np.inf]
price_labels = ['<$20', '$20-50', '$50-100', '$100-200', '$200-500', '>$500']
df['price_range'] = pd.cut(df['price'], bins=price_bins, labels=price_labels)

country_mapping = {'US': 'USA', 'England': 'United Kingdom'}
df['country'] = df['country'].replace(country_mapping)

df['variety'] = df['variety'].str.lower().str.strip()

variety_mapping = {'pinot noir': 'pinot noir', 'cabernet sauvignon': 'cabernet sauvignon'}
df['variety'] = df['variety'].replace(variety_mapping)

df.to_csv('cleaned_wine_reviews.csv', index=False)

# Final check
print("\nCleaned dataset sample:")

print(df[['title', 'country', 'points', 'price', 'vintage_year', 'price_range']].head())


"""
Output:-
Cleaned dataset sample:
                                               title   country  points  price  vintage_year price_range
0                  Nicosia 2013 Vulkà Bianco  (Etna)     Italy      87   28.0        2013.0      $20-50
1      Quinta dos Avidagos 2011 Avidagos Red (Douro)  Portugal      87   15.0        2011.0        <$20
2      Rainstorm 2013 Pinot Gris (Willamette Valley)       USA      87   14.0        2013.0        <$20
3  St. Julian 2013 Reserve Late Harvest Riesling ...       USA      87   13.0        2013.0        <$20
4  Sweet Cheeks 2012 Vintner's Reserve Wild Child...       USA      87   65.0        2012.0     $50-100
"""
