import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_csv('cleaned_wine_reviews.csv')
def main():
    

    print(df.head())
    print("\nData shape:", df.shape)
    print("\nData types:\n", df.dtypes)

    """ 
    Output :-
    country                                        description                         designation  points  price  ...         variety               winery vintage_year points_tier price_range
    0     Italy  Aromas include tropical fruit, broom, brimston...                        Vulkà Bianco      87   28.0  ...     white blend              Nicosia       2013.0        Good      $20-50
    1  Portugal  This is ripe and fruity, a wine that is smooth...                            Avidagos      87   15.0  ...  portuguese red  Quinta dos Avidagos       2011.0        Good        <$20
    2       USA  Tart and snappy, the flavors of lime flesh and...                                 NaN      87   14.0  ...      pinot gris            Rainstorm       2013.0        Good        <$20
    3       USA  Pineapple rind, lemon pith and orange blossom ...                Reserve Late Harvest      87   13.0  ...        riesling           St. Julian       2013.0        Good        <$20
    4       USA  Much like the regular bottling from 2012, this...  Vintner's Reserve Wild Child Block      87   65.0  ...      pinot noir         Sweet Cheeks       2012.0        Good     $50-100

    [5 rows x 16 columns]

    Data shape: (119929, 16)

    Data types:
    country                   object
    description               object
    designation               object
    points                     int64
    price                    float64
    province                  object
    region_1                  object
    region_2                  object
    taster_name               object
    taster_twitter_handle     object
    title                     object
    variety                   object
    winery                    object
    vintage_year             float64
    points_tier               object
    price_range               object
    dtype: object

    """
    print("\nSummary statistics for Price:")
    print(df['price'].describe())

    """ 
    Summary statistics for Price:
    count    119928.000000
    mean         34.877351
    std          40.715856
    min           4.000000
    25%          17.000000
    50%          25.000000
    75%          40.000000
    max        3300.000000
    Name: price, dtype: float64

    """

    print("\nSummary statistics for Points:")
    print(df['points'].describe())
    """ 
    Summary statistics for Points:
    count    119929.000000
    mean         88.442145
    std           3.093275
    min          80.000000
    25%          86.000000
    50%          88.000000
    75%          91.000000
    max         100.000000
    Name: points, dtype: float64

    """

    print("\nSkewness of Price:", df['price'].skew())  #Skewness of Price: 18.532621168803722
    print("Skewness of Points:", df['points'].skew())   #Skewness of Points: 0.04380344000061179

    high_priced = df[df['price'] > 500]
    print("\nHigh-priced wines (>$500):\n", high_priced[['title', 'price', 'country']])  # Identify price outliers (e.g., > $500)

    """ 
    High-priced wines (>$500):
                                                        title   price  country
    347     Robert Weil 2014 Kiedrich Gräfenberg Trockenbe...   775.0  Germany
    353         Louis Latour 2014 Le Montrachet  (Montrachet)   630.0   France
    1557                        Château Margaux 2009  Margaux  1900.0   France
    1565    Château La Mission Haut-Brion 2009  Pessac-Léo...  1100.0   France
    1570              Château Haut-Brion 2009  Pessac-Léognan  1200.0   France
    ...                                                   ...     ...      ...
    113088                      Louis Latour 2015  Montrachet   650.0   France
    113540  Robert Weil 2010 Kiedrich Gräfenberg Trockenbe...   672.0  Germany
    113980            Château Haut-Brion 2014  Pessac-Léognan   848.0   France
    113985                 Château Ausone 2014  Saint-Émilion   530.0   France
    115261                 Château Ausone 2007  Saint-Émilion   850.0   France

    [91 rows x 3 columns]
    """

    plt.figure(figsize=(12, 6))
    country_counts = df['country'].value_counts().head(10)
    sns.barplot(x=country_counts.values, y=country_counts.index, palette='viridis')
    plt.title('Top 10 Countries by Number of Reviews')
    plt.xlabel('Count')
    plt.ylabel('Country')
    plt.savefig('Top 10 Countries by Number of Reviews.png')
    plt.show()
    plt.close()

    plt.figure(figsize=(12, 6))
    variety_counts = df['variety'].value_counts().head(10)
    sns.barplot(x=variety_counts.values, y=variety_counts.index, palette='magma')
    plt.title('Top 10 Wine Varieties')
    plt.xlabel('Count')
    plt.ylabel('Variety')
    plt.savefig('Top 10 Wine Varieties.png')
    plt.show()
    plt.close()

    plt.figure(figsize=(10, 6))
    sns.histplot(df['points'], bins=20, kde=True, color='purple')
    plt.title('Distribution of Wine Points')
    plt.xlabel('Points')
    plt.ylabel('Frequency')
    plt.savefig('Distribution of Wine Points.png')
    plt.show()
    plt.close()


    plt.figure(figsize=(10, 6))
    sns.histplot(df['price'], bins=50, kde=True, color='green')
    plt.title('Distribution of Wine Prices')
    plt.xlabel('Price (USD)')
    plt.ylabel('Frequency')
    plt.savefig('Distribution of Wine Prices.png')
    plt.show()
    plt.close()

    plt.figure(figsize=(10, 6))
    sns.regplot(x='price', y='points', data=df, scatter_kws={'alpha':0.3}, line_kws={'color':'red'})
    plt.title('Price vs. Points')
    plt.xlabel('Price (USD)')
    plt.ylabel('Points')
    plt.xlim(0, 500)  
    plt.savefig('price_vs_points.png')
    plt.show() # Scatter plot of Price vs. Points
    plt.close()


    corr = df[['price', 'points']].corr(method='spearman')  # Calculate correlation between Price and Points
    print("\nCorrelation between Price and Points:\n", corr)  # Correlation between Price and Points: 0.459

    """
    Output:-

    Correlation between Price and Points:
                price    points
    price   1.000000  0.586297
    points  0.586297  1.000000

    """

    country_avg = df.groupby('country').filter(lambda x: len(x) >= 100)
    country_avg = country_avg.groupby('country')['points'].mean().sort_values(ascending=False).head(10)

    plt.figure(figsize=(12, 6))
    sns.barplot(x=country_avg.values, y=country_avg.index, palette='rocket')
    plt.title('Top 10 Countries by Average Points (Min. 100 Reviews)')
    plt.xlabel('Average Points')
    plt.ylabel('Country')
    plt.savefig('Top 10 Countries by Average Points.png')
    plt.show()
    plt.close()

    top_varieties = df['variety'].value_counts().head(5).index.tolist()
    filtered_df = df[df['variety'].isin(top_varieties)]
    pivot_table = filtered_df.pivot_table(values='points', index='country', columns='variety', aggfunc='mean')

    # Heatmap 
    plt.figure(figsize=(14, 8))
    sns.heatmap(pivot_table, annot=True, cmap='coolwarm', linewidths=0.5)
    plt.title('Average Points by Country and Top 5 Varieties')
    plt.xlabel('Variety')
    plt.ylabel('Country')
    plt.savefig('Average Points by Country and Top 5 Varieties.png')
    plt.show()
    plt.close()

    plt.figure(figsize=(14, 8))
    sns.boxplot(x='country', y='price', data=df[df['country'].isin(country_counts.head(5).index)])
    plt.yscale('log')
    plt.xticks(rotation=45)
    plt.title('Price Distribution by Country (Log Scale)')
    plt.savefig('Price Distribution by Country (Log Scale).png')
    plt.show()
    plt.close()
    
if __name__ == "__main__":
    main()


