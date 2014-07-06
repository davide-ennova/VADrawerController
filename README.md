## VADrawerController

A simple Side View Controller "Android style", appearing in front of the Main View Controller, not behind.

## The purpose

I never liked the feeling of Side View Controllers I found, most of them are not very responsive and usually you really need to catch the side bar very horizontally with your fingers, often you can fail at drag the side bar and this is what I hated the most. So I decided to do it by myself. I was needing a Side View Controller appearing in front of the Main View Controller, since there's not a built-in iOS SideViewController I did it and I'll try to improve it as soon as I can.

## Usage

Instantiate the **Main** ViewController, then instantiate your **Side** ViewController, call it like you want but make it a **subclass** of **VADrawerController**.

Then go to the AppDelegate inside the **application:didFinishLaunchingWithOptions:**
```
// 1. setup the window @property using the VADrawerManager
self.window = [[VADrawerManager manager] prepareWindow];

// 2. attach the SideViewController to the MainViewController
[[VADrawerManager manager] attachDrawer:SideVC toViewController:MainVC];

// Done.
```

You can edit the size and appearance within Interface Builder both via XIB files or via Storyboard.

## To do

* options to customize the sidebar appearance (such as shadows, gray layer On/Off etc)
* make it work on both sides
* add it to cocoapods

## License

VADrawerController Copyright (c) 2014 Vincenzo Alampi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
