# Harry-Keates-Masters
Repository containing the main csv and R files used to generate the data frames used in analysis

### The 3 R files contain the code used the complete the following stages outlined in my thesis
1. Reformatting the original data to have a single entry per capture event. (1_ReformattingCodeWithComments.R)
2. Improving on that process by removing duplicate entries through filtering out repeated ring numbers per year before reformatting takes place. This was done to remove bias in the data where certain birds were very active. (2_RemovingDuplicatesCodeWithComments.R)
3. Condensing that data down to a yearly average to account for seasonal differences between capture sites (3_CondenseToYearsCodeWithComments.R)

The code in R files 1 and 2 was run seven times, once on the data from each capture site. This is explained in the comments in the code.

### R Version
RStudio 2023.03.1+446 "Cherry Blossom" Release (6e31ffc3ef2a1f81d377eeccab71ddc11cfbd29e, 2023-05-09) for windows
Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) RStudio/2023.03.1+446 Chrome/108.0.5359.179 Electron/22.0.3 Safari/537.36
