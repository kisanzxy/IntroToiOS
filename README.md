# iOS learning note

### selector vs. method vs. message
Selector - a Selector is the name of a method. You're very familiar with these selectors: alloc, init, release, dictionaryWithObjectsAndKeys:, setObject:forKey:, etc. Note that the colon is part of the selector; it's how we identify that this method requires parameters. Also (though it's extremely rare), you can have selectors like this: doFoo:::. This is a method that takes three parameters, and you'd invoke it like [someObject doFoo:arg1 :arg2 :arg3]. There's no requirement that there be letters before each part of the selector components. As I said, this is extremely rare, and you will not find it used in the Cocoa frameworks. You can work with selectors directly in Cocoa. They have the type SEL:  SEL aSelector = @selector(doSomething:) or SEL aSelector = NSSelectorFromString(@"doSomething:");

Message - a message is a selector and the arguments you are sending with it. If I say [dictionary setObject:obj forKey:key], then the "message" is the selector setObject:forKey: plus the arguments obj and key. Messages can be encapsulated in an NSInvocation object for later invocation. Messages are sent to a receiver. (ie, the object that "receives" the message).

Method - a method is a combination of a selector and an implementation (and accompanying metadata). The "implementation" is the actual block of code; it's a function pointer (an IMP). An actual method can be retrieved internally using a Method struct (retrievable from the runtime).

Method Signature - a method signature represents the data types returned by and accepted by a method. They can be represented at runtime via an NSMethodSignature and (in some cases) a raw char*.

Implementation - the actual executable code of a method. Its type at runtime is an IMP, and it's really just a function pointer. iOS 4.3 includes a new ability to turn a block into an IMP. This is really cool.

source: https://stackoverflow.com/questions/5608476/whats-the-difference-between-a-method-and-a-selector



### ARC
未指定初始值的变量都会被初始化为**nil**<br>

cannot call retain, release, autorelease, and retainCount<br>
use @autoreleasepool to replace NSAutoareleasePool

naming convention： 特殊方法族： （alloc, copy, mutableCopy, new, init）以此为开头的方法表示调用者必须有被创建者的所有权， 其中init 必须为实例方法<br>

不可explicitly call dealloc [super dealloc], because ARC will take care of memory release, but you can use free for
null pointers

@autoreleasepool 可以嵌套使用

weak reference **__weak**<br>
未加__weak，or __strong 为strong reference（reference count +1 when being referred to)
while weak reference will not affect the reference counts, and will be automatically set to nil when the referencing instance is released (opposite to strong reference which will still hold the instance)<br>
*lifetime qualifier*<br>
__weak, __strong, __autoreleasing, __unsafe_unretained


### Target-Action
**target** : the receiver of an action message

**action** : the message a control send to the target(stored a SEL type)

```
- (void)capitalizeWord:(id)sender
- (IBAction)deleteRecord:(id)sender
- (void)action:(id)sender forEvent:(UIEvent *)event //UIKit
 ```
IBAction is a type qualifier 
the sender parameter identifies the control sending the action message 

to set the target and action programmatically
you need to definde the setAction and setTarget method to send messages to a control or to cell object
```
- (void)setTarget:(id)anObject;
- (void)setAction:(SEL)aSelector;
```
to use this methods
```
[aCell setTarget: myController]
[aControl setAction: @selector(deleteRecord)]
```





### objective c 中的多线程

http://www.cocoachina.com/ios/20150731/12819.html

深入理解GCD
https://justinyan.me/post/2420
Runloop
https://juejin.im/post/5a352c6c5188251fbd33b345




### xib<br>
https://www.jianshu.com/p/ea3f90cc744b <br>

### UIkit
https://www.cnblogs.com/lbjventure/p/4343370.html

### YYModel
https://github.com/kisanzxy/YYModel
YYModel 详解
https://www.jianshu.com/p/25e678fa43d3

###YYCatche详解
https://juejin.im/post/5a657a946fb9a01cb64ee761


##### @property
https://www.devtalking.com/articles/you-should-to-know-property/


getter and setter . operation
when instance variables are not explicitly declared, a variable start with "_" will autamatically be declared.

###ios开发必备知识点
https://www.jianshu.com/p/ea10e5a03c70


