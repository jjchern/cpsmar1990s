About
=====

This R data package contains data from IPUMS's Annual Social and Economic Supplement of the Current Population Survey (ASEC, i.e., CPS March Supplement), 1990-1999. All the currently avaiblable variables (as of Aug. 30, 2015) are included.

See [IPUMS's codebooks](https://cps.ipums.org/cps/documentation.shtml) for documentations.

Research based on the IPUMS-CPS database should cite it as follows:

> Miriam King, Steven Ruggles, J. Trent Alexander, Sarah Flood, Katie Genadek, Matthew B. Schroeder, Brandon Trampe, and Rebecca Vick. Integrated Public Use Microdata Series, Current Population Survey: Version 3.0. [Machine-readable database]. Minneapolis: University of Minnesota, 2010.

Installation
============

Install from github with

``` r
devtools::install_github("jjchern/cpsmar1990s")
```

Since there're 10 years of data, the package is kind of big (about 86 MB). It might take a while to download.

Usage
=====

``` r
library(cpsmar1990s)
library(dplyr)

# All the datasets
ls("package:cpsmar1990s", all = TRUE)
#>  [1] "cpsmar1990" "cpsmar1991" "cpsmar1992" "cpsmar1993" "cpsmar1994"
#>  [6] "cpsmar1995" "cpsmar1996" "cpsmar1997" "cpsmar1998" "cpsmar1999"

# All variables in cpsmar1993
names(cpsmar1993)
#>   [1] "rectype"     "year"        "serial"      "mish"        "numprec"    
#>   [6] "hwtsupp"     "hrhhid"      "huhhnum"     "gq"          "hhintype"   
#>  [11] "region"      "statefip"    "statecensus" "asecflag"    "metro"      
#>  [16] "metarea"     "county"      "farm"        "ownershp"    "hhincome"   
#>  [21] "housret"     "proptax"     "pubhous"     "rentsub"     "heatsub"    
#>  [26] "heatval"     "foodstmp"    "stampno"     "stampmo"     "stampval"   
#>  [31] "atelunch"    "lunchsub"    "frelunch"    "unitsstr"    "phone"      
#>  [36] "nfams"       "ncouples"    "nmothers"    "nfathers"    "cpi99"      
#>  [41] "month"       "pernum"      "hiurule"     "hiunpers"    "hiuid"      
#>  [46] "hiufpginc"   "hiufpgbase"  "ffngcare"    "ffngcaid"    "wtsupp"     
#>  [51] "earnwt"      "lineno"      "hinswt"      "momloc"      "stepmom"    
#>  [56] "momrule"     "poploc"      "steppop"     "poprule"     "sploc"      
#>  [61] "sprule"      "famsize"     "nchild"      "nchlt5"      "famunit"    
#>  [66] "eldch"       "yngch"       "nsibs"       "relate"      "age"        
#>  [71] "sex"         "race"        "marst"       "popstat"     "bpl"        
#>  [76] "yrimmig"     "citizen"     "mbpl"        "fbpl"        "nativity"   
#>  [81] "hispan"      "educ"        "higrade"     "educ99"      "schlcoll"   
#>  [86] "empstat"     "labforce"    "occ"         "occ1990"     "ind1990"    
#>  [91] "occ1950"     "ind"         "ind1950"     "classwkr"    "occly"      
#>  [96] "occ50ly"     "indly"       "ind50ly"     "classwly"    "wkswork1"   
#> [101] "wkswork2"    "hrswork"     "uhrswork"    "wksunem1"    "wksunem2"   
#> [106] "absent"      "looking"     "durunem2"    "durunemp"    "fullpart"   
#> [111] "nwlookwk"    "hourwage"    "paidhour"    "pension"     "union"      
#> [116] "whyunemp"    "firmsize"    "whyabsnt"    "majoract"    "wantjob"    
#> [121] "blvenowk"    "cantfind"    "lackschl"    "wrongage"    "handicap"   
#> [126] "kidduty"     "famduty"     "schlduty"    "ilhealth"    "othereas"   
#> [131] "unkreasn"    "fwkads"      "fwkemplr"    "fwkother"    "fwkpubag"   
#> [136] "fwkpvtag"    "fwkrelat"    "intenfwk"    "whyptly"     "whyptlwk"   
#> [141] "usftablw"    "usftptlw"    "lkwkftpt"    "payifabs"    "numemps"    
#> [146] "wnftlook"    "wnlwnilf"    "strechlk"    "whylook"     "whynwly"    
#> [151] "actnlfly"    "overtime"    "whyleft"     "ptweeks"     "ftotval"    
#> [156] "inctot"      "incwage"     "incbus"      "incfarm"     "incss"      
#> [161] "incwelfr"    "incretir"    "incssi"      "incint"      "incunemp"   
#> [166] "incwkcom"    "incvet"      "incsurv"     "incdisab"    "incdivid"   
#> [171] "incrent"     "inceduc"     "incchild"    "incalim"     "incasist"   
#> [176] "incother"    "earnweek"    "gotvdisa"    "gotveduc"    "gotvothe"   
#> [181] "gotvpens"    "gotvsurv"    "incdisa1"    "incdisa2"    "inclongj"   
#> [186] "increti1"    "increti2"    "incsurv1"    "incsurv2"    "mthwelfr"   
#> [191] "oincbus"     "oincfarm"    "oincwage"    "srcdisa1"    "srcdisa2"   
#> [196] "srcearn"     "srceduc"     "srcreti1"    "srcreti2"    "srcsurv1"   
#> [201] "srcsurv2"    "srcunemp"    "srcwelfr"    "srcwkcom"    "vetqa"      
#> [206] "offpov"      "offpovuniv"  "offtotval"   "offcutoff"   "offreason"  
#> [211] "poverty"     "cutoff"      "adjginc"     "capgain"     "caploss"    
#> [216] "eitcred"     "fedretir"    "fedtax"      "fica"        "filestat"   
#> [221] "margtax"     "statetax"    "taxinc"      "vetstat"     "vetlast"    
#> [226] "disabwrk"    "health"      "quitsick"    "migsta1"     "migsta5"    
#> [231] "whymove"     "country"     "migrate1"    "migrate5"    "hcovany"    
#> [236] "hcovpriv"    "hinsemp"     "hinspur"     "hcovpub"     "hinscaid"   
#> [241] "hinscare"    "hinsmil"     "inclugh"     "paidgh"      "emcontrb"   
#> [246] "himcaid"     "himcare"     "hichamp"     "phinsur"     "phiown"     
#> [251] "phispous"    "phihhkid"    "phinhkid"    "phiothr"     "phiself"    
#> [256] "caid"        "care"        "pmvcaid"     "champus"     "champva"    
#> [261] "militva"     "indianh"     "groupown"    "groupdep"    "privown"    
#> [266] "privdep"     "grouptyp"    "privtyp"     "grpwho1"     "grpwho2"    
#> [271] "privwho1"    "privwho2"    "mocaid"      "groupout"    "privout"    
#> [276] "out"         "pripurlw"    "caidlw"      "carelw"      "champlw"    
#> [281] "coverlw"     "covergh"     "coverpi"     "grouplw"     "ihslw"      
#> [286] "kidpriv"     "kidcaid"     "milvalw"     "outothlw"    "ftype"      
#> [291] "wkstat"      "csout"       "cswhy"       "cslegal"     "csagree"    
#> [296] "cstype"      "cspay"       "csyear"      "csyearpay"   "cssupp"     
#> [301] "csreas"      "csdduct"     "cswaypay"    "cschg"       "cschgyr"    
#> [306] "csfreq1"     "csback1"     "csfreq2"     "csback2"     "csrecv"     
#> [311] "csall"       "cstime"      "csfull"      "csamdue"     "csamrec"    
#> [316] "cscontact"   "csvis"       "csvisleg"    "csphycus"    "cslegcus"   
#> [321] "csdays"      "csyrdiv"     "csyrmar"     "cswork"      "cswork5"    
#> [326] "cselig"      "cssuppwt"    "hrsworkorg"  "famkind"     "eligorg"

# Select a few variables
cpsmar1993 %>% 
  select(year, statefip, age, sex, race, educ99, fullpart) 
#> Source: local data frame [155,197 x 7]
#> 
#>    year statefip age sex race educ99 fullpart
#> 1  1993       23  55   1  100     10        1
#> 2  1993       23  56   2  100     13        0
#> 3  1993       23  36   1  100     11        1
#> 4  1993       23  32   2  100     13        1
#> 5  1993       23  58   1  100     10        1
#> 6  1993       23  52   2  100     10        1
#> 7  1993       23  34   1  100     13        1
#> 8  1993       23  31   2  100     10        2
#> 9  1993       23   8   1  100      0        0
#> 10 1993       23   7   1  100      0        0
#> ..  ...      ... ... ...  ...    ...      ...

# Each variable is a "labelled" vector (from the `haven` package)
cpsmar1994$sex %>% str
#> Class 'labelled'  atomic [1:150943] 1 2 1 1 2 2 1 1 1 2 ...
#>   ..- attr(*, "label")= chr "Sex"
#>   ..- attr(*, "labels")= Named int [1:3] 1 2 9
#>   .. ..- attr(*, "names")= chr [1:3] "Male" "Female" "NIU"
attr(cpsmar1994$sex, "label") # like Stata's label
#> [1] "Sex"
attr(cpsmar1994$sex, "labels") # like Stata's label values
#>   Male Female    NIU 
#>      1      2      9
```
