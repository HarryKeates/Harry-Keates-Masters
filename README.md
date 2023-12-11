# Harry-Keates-Masters
Repository containing the main csv and R files used to generate the data frames used in analysis

### The 3 R files contain the code used the complete the following stages outlined in my thesis
1. Reformatting the original data to have a single entry per capture event. (_ReformattingCodeWithComments.R)
2. Improving on that process by removing duplicate entries through filtering out repeated ring numbers per year before reformatting takes place. This was done to remove bias in the data where certain birds were very active. (_RemovingDuplicatesCodeWithComments.R)
3. Condensing that data down to a yearly average to account for seasonal differences between capture sites (_CondenseToYearsCodeWithComments.R)

The code in R files 1 and 2 was run seven times, once on the data from each capture site. This is explained in the comments in the code.
