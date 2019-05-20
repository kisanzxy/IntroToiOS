# IntroToiOS
personal practice for iOS development<br>

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









### xib<br>
https://www.jianshu.com/p/ea3f90cc744b <br>

### UIkit
https://www.cnblogs.com/lbjventure/p/4343370.html

##### @property
https://www.devtalking.com/articles/you-should-to-know-property/



