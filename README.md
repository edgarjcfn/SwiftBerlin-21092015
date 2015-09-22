# swift.berlin Meetup #11 

### Building UIs programatically with SnapKit

Presentation overviewing the capabilities of building UIKit interfaces in code rather than Interface Builder, also an intro to [SnapKit](https://github.com/SnapKit/SnapKit) and it's advantages over the visual format language.

### Slides

You can see the slides [here](http://edgarjcfn.github.io/swift.berlin-210915)

### Demos

The example code on `Demo2/` was actually the first demo. It shows how to build layouts that adjust their constraints dynamically and even animations with SnapKit

The example code on `Demo1/` shows 2 different that do exactly the same thing: shows an ad in 2 different layouts. One was built with IB, another with SnapKit. On the SnapKit demo we leverage _composition_ over _inheritance_ so that the layouting of the view is a responsibility of what they _hold_ and not of what they _are_.

### References
[SnapKit on Github](https://github.com/SnapKit/SnapKit)

[I Stopped Using NIBs Thanks To Auto Layout](http://www.thecave.com/2014/05/04/i-stopped-using-nibs-thanks-to-auto-layout/?utm_campaign=iOS%2BDev%2BWeekly&utm_medium=web&utm_source=iOS_Dev_Weekly_Issue_145)

### Presenters
Edgar Neto | [@edgarjcfn](http://twitter.com/edgarjcfn)

Karolis Stasaitis | [@carlossless](http://twitter.com/carlossless)
