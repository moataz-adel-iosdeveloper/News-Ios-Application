
# News Ios Project

sample news Project developed in swift 5, used MVVM Architecture & MOYA as network layer (https://github.com/Moya/Moya)
and Kingfisher for download image and cashing image (https://github.com/onevcat/Kingfisher). The App Fetch news list from the Newyork Times Api portal(https://api.nytimes.com) with a detail screen for each news.

# Project Overview

* NewsList.swift & NewsListViewModel.swift & NewsList.xib - show list of news 
* NewsDetails.swift & NewsDetailsViewModel.swift & NewsDetails.xib - Details screen
* ArticlesNetwrok.swift & ArticlesServices.swift - network services by MOYA 
* DownloadImage.swift - Extensions for download images by using Kingfisher

# What to use ?

* Download project
* from terminal navigate to project location by using cd (project folder location in your machine)
* Run comment (pod install)
* open file (NewsApplication.xcworkspace)
* You have to add two schemes for NewsApplication and NewsApplicationTests.
* Choose the scheme you need to run

# change Api key
 from Constants -> URLs -> DomainUrl.swift . change appKey with your key
# how to generate new key ?
 you need to sign up for an API key at: https://developer.nytimes.com/get-started, 
* choose your simulator and run it 
# how to generated the code coverage reports .
* from top selected NewsApplicationTests scheme
* from top selected edit scheme
* from left navigate to test section
* from top screen select options
* select check box Gather coverage for
* select from drop-down list (some targets) then select NewsApplication
* for more details (https://stackoverflow.com/questions/47157041/how-to-display-xcode-code-coverage-when-its-not-displaying)



