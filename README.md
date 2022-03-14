
# News Ios Project

sample news Project developed in swift 5, used MVVM Architecture & MOYA as network layer (https://github.com/Moya/Moya)
and Kingfisher for download image and cashing image (https://github.com/onevcat/Kingfisher). The App Fetch news list from the Newyork Times Api portal(https://api.nytimes.com) with a detail screen for each news.

# Project Overview

* NewsList.swift & NewsListViewModel.swift & NewsList.xib - show list of news 
* NewsDetails.swift & NewsDetailsViewModel.swift & NewsDetails.xib - Details screen
* ArticlesNetwrok.swift & ArticlesServices.swift - network services by MOYA 
* DownloadImage.swift - Extensions for download images by using Kingfisher

# What is MVVM ?

MVVM is proposed by John Gossman in 2005. The main purpose of the MVVM is to move the data state from the View to the ViewModel. 

According to the definition, the View consists of only visual elements. In the View, we only do things like layout, animation, initializing UI components, etc. There’s a special layer between the View and the Model called the ViewModel. The ViewModel is a canonical representation of the View. That is, the ViewModel provides a set of interfaces, each of which represents a UI component in the View. We use a technique called “binding” to connect UI components to ViewModel interfaces. So, in MVVM, we don’t touch the View directly, we deal with business logic in the ViewModel and thus the View changes itself accordingly. We write presentational things such as converting Date to String in the ViewModel instead of the View. Therefore, it becomes possible to write a simpler test for the presentational logic without knowing the implementation of the View.

# Top Articles 
* https://medium.com/ios-os-x-development/ios-architecture-patterns-ecba4c38de52
* https://www.toptal.com/ios/swift-tutorial-introduction-to-mvvm 

# screen shots

![solarized dualmode](https://github.com/FaizalMalik/MVVM-Architecture-SWift/blob/master/Screen%20shots/Simulator%20Screen%20Shot%20-%20iPhone%206s%20-%202018-10-09%20at%2012.32.02.png)
![solarized dualmode](https://github.com/FaizalMalik/MVVM-Architecture-SWift/blob/master/Screen%20shots/Simulator%20Screen%20Shot%20-%20iPhone%206s%20-%202018-10-09%20at%2012.36.47.png)


