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
between **contentView** and **UICollectionViewCell** thiere is **selectedBackgroundView## , ##backgroudView##




