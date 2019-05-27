### UICollectionView

is a subtype of UIScrollView, protocal is inherited from UIScrollViewDelegate

inportant property:
frame: the visible area of the whole view

contentSize: scrollable area

contentOffset: set the distance between view origin and the visible area left upper corner

contentInset: teh area that not for scrollable view use UIEdgeInsetMake(int, int, int, int)

#### Reuse collectionViewCell

```
registerClass: (class) forCellWithReuseIdentifier: 
registerNib: forCellWithReuseIdentifier:

call for reuse
dequeueReuseableCellWithIdentifier: forIndexPath:

```

#### UICollectionViewCell

```
clear up cell data before reuse

- (void)prepareForReuse // have to call super

two delegate methods have to be override
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section // return number of items 
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath // return the cell

batch operation
performBatchUpdates: ^(block)() completion: (id)

```

#### layers in cell
when adding view, add to **contentView**, not self
between **contentView** and **UICollectionViewCell** thiere is **selectedBackgroundView** , **backgroudView**

### UICollectionFlowLayout自定义布局
```
常用属性
//同一组当中，行与行之间的最小行间距，但是不同组之间的不同行cell不受这个值影响。
@property (nonatomic) CGFloat minimumLineSpacing;
//同一行的cell中互相之间的最小间隔，设置这个值之后，那么cell与cell之间至少为这个值
@property (nonatomic) CGFloat minimumInteritemSpacing;
//每个cell统一尺寸
@property (nonatomic) CGSize itemSize;
//滑动反向，默认滑动方向是垂直方向滑动
@property (nonatomic) UICollectionViewScrollDirection scrollDirection;
//每一组头视图的尺寸。如果是垂直方向滑动，则只有高起作用；如果是水平方向滑动，则只有宽起作用。
@property (nonatomic) CGSize headerReferenceSize;
//每一组尾部视图的尺寸。如果是垂直方向滑动，则只有高起作用；如果是水平方向滑动，则只有宽起作用。
@property (nonatomic) CGSize footerReferenceSize;
//每一组的内容缩进
@property (nonatomic) UIEdgeInsets sectionInset;
继承##UICollectionFlowLayout##, 重写 ##init##方法
```

创建一个类，继承于 **UICollectionViewFlowlayout**，重写它 ```init``` 方法 (对layout的设置)
#### 重写布局方法 layoutAttributesForElementsInRect:

通过父类方法 ```[super layoutAttributesForElementsInRect:rect]``` 先创建了一个正常情况下的所有属性的数组。这个父类方法默认情况下，只会创建在 ```rect``` 范围内的视图的布局属性。
修改的时候我们还要判断 ```attrs.representedElementKind == nil```。这是由于这个属性数组包含了所有视图的布局信息，包括 cell,supplementary view,decortation view。当 ##representedElementKind## 是 ```nil``` 的时候，表示这个布局信息是  ```Item``` 的布局信息。

### layoutSubview
layoutSubview ：为该View添加子控件，设置frame值
layoutSubview的调用场景：

使用addSubview添加时会调用layoutSubView
设置视图的父视图的Size时会调用
改变视图的frame的时候会被调用
滚动scrollview的时候会被调用
设备的orientation(方向)改变时,涉及改变的UIViewControl 的root view
(此时所有的控件被重新布局,相当于A的frame被改变 那么会调用layoutSubview 而且如果控件有B的话会再调用一次layoutSubview)
调用setNeedsLayout时会被调用

layoutSubview不是在调用完比如addSubview等方法之后就马上调用,而是会在调用addSubview方法所在的作用域结束之后之后才调用,因此即使你在同一个方法中既使用了addSubViews又更改了frame，也是只会调用一次layoutSubview而已

source：https://www.jianshu.com/p/0ec6ef1c39a5




