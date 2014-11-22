JGLinkedStoryboard
==================

## Summary

`UIStoryboards` are very powerful and useful. However, to make the best use of storyboards, they need to be broken down into natural modules. The problem with having many storyboards is writing the code to transition between them. `JGLinkedStoryboard` solves this problem by allowing segues between `UIStoryboards`. These segues can be built without leaving Interface Builder and without writing any extra code.

## Installation

CocoaPods is a library dependency management tool for Objective-C. To use JGLinkedStoryboard with CocoaPods, simply add the following to your Podfile and run pod install:

	pod 'JGLinkedStoryboard'
	

## How to use

1. Your app's storyboards must first be decomposed into their natural modules. See this [guide][1] for some tips.

2. Where ever you want create a transition into a different storyboard, create a `UIViewController` representing the scene to be pushed.

3. Create the desired segue type (Push, Modal, Custom) to these surrogate view controllers. To take advantage of the new linking, set the identifier of the segue with the syntax `controller@storyboard`. Where `controller` is the `Storyboard ID` of the destination view controller and `storyboard` the name of the storyboard or the name of the method in our `UIStoryboard` category. If you omit the controller name, it will link to the initial view controller.

4. Enjoy !


## Implementation notes

* I highly recommend to put your storyboards in an `UIStoryboard` category.
* Otherwise, if you do it repeatedly, you'll get new copies of the storyboard each time.
* See the demo for more details.


## Contribution

Contributions are welcomed. If you want to contribute and don't know what to tackle, take a look at the issues list.

## Thanks
Thanks to Ken Fox and his superb [article][2] that made me develop this solution.

## License

`JGLinkedStoryboard` is licensed under the MIT license, which is reproduced in its entirety here:

>The MIT License (MIT)
>
>Copyright (c) 2014 Grenier Jeremy
>
>Permission is hereby granted, free of charge, to any person obtaining a copy
>of this software and associated documentation files (the "Software"), to deal
>in the Software without restriction, including without limitation the rights
>to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>copies of the Software, and to permit persons to whom the Software is
>furnished to do so, subject to the following conditions:
>
>The above copyright notice and this permission notice shall be included in all
>copies or substantial portions of the Software.
>
>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
>AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
>SOFTWARE.

  [1]: http://robsprogramknowledge.blogspot.com/2012/01/uistoryboard-best-practices.html
  [2]: http://spin.atomicobject.com/2014/03/06/multiple-ios-storyboards/
