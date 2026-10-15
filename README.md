# What Drives Property Prices in Barcelona?

**SAS** | Data Mining, Quinnipiac University

## The brief

A firm considering investments in Barcelona's housing market needs to know which property features actually move price. Starting from 8,000 raw listings, the task was to prepare the data properly and explore it for insights that support investment decisions.

## What I did

**Preprocessing (SAS DATA steps)**
- Renamed variables with spaces in their names (for example `"square meters"n` → `square_meters`).
- Converted text-stored quantities (price, size, bedrooms, bathrooms, floor, year built) to numeric types.
- Removed incomplete rows with `cmiss()` and dropped identifiers (`id`, `address`).
- Result: 6,500 clean rows and 13 variables.

**Exploration**
- Univariate analysis with `PROC FREQ` and `PROC MEANS`, covering property types, neighborhoods, and year built.
- Bivariate and trivariate analysis with `PROC MEANS` (CLASS), `PROC CORR`, and `PROC SGPLOT`, covering price by size, by amenity pairs, and by age and renovation status.

## Findings

1. **Property type:** apartments make up most listings, while estates have the highest average price. The market is a volume segment plus a premium niche.
2. **Size:** square meters correlates strongly and positively with price.
3. **Amenities:** listings with a garden, terrace, pool, balcony, air conditioning, or heating consistently have higher prices.
4. **Age and condition:** newer properties are priced higher, and homes that need renovating are valued lower at every age.

**Recommendations:** pursue estates for high-end returns and apartments for volume; favor larger units; add high-value amenities during renovation; and prioritize properties that are newer or have already been renovated.

## Files

| File | Contents |
|---|---|
| `barcelona_property_analysis.sas` | Full preprocessing and exploration script |
| `docs/report.pdf` | Written findings and business implications |

To run the script, place the listings file at `data/barcelona_listings.csv`.
