<a name="olkDD"></a>
### 
<a name="TqFpI"></a>
### 1.函数

<br />函数首字母不大写<br />​<br />
<a name="P0jQh"></a>
### 2.List
字符串实际上就是一组字符的List："Hello"只是['h','e','l','l','o']的语法糖而已<br />List前插<br />`Prelude> 1:2:3:[]<br />[1,2,3]`
<a name="fvhlN"></a>
#### 构造函数：[]构造一个空列表，:通过连接一个元素和一个列表构造出一 个新的列表，所有列表的构造都是一个递归的过程
即有` "abc"<br />= (:) 'a' ['b', 'c'] <br />= 'a' : 'b' : ['c'] <br />= 'a' : 'b' : 'c' : []<br />= ['a', 'b', 'c']`<br />​

List连接<br />`Prelude> num = "hello"<br />Prelude> num ++ "world"<br />"helloworld"`<br />取元素，下标从0开始<br />`Prelude> num !! 1 <br />'e'<br />-- num = "hello"

`<br />last 取最后一个元素 	init 取last之外元素<br />head 取第一个元素	tail 取head之外元素<br />`Prelude> (==) (last [[],[],[]]) [] <br />True <br />Prelude> last [[[]],[]] == [] <br />True`<br />null检查一个List是否为空<br />take a [] 返回一个List的前a个元素<br />`Prelude> take 1(take 2(take 3(take 4 num))) <br />"h"<br />Prelude> take 1 ( take 0 num) <br />""<br />-- 若是图取超过List长度的元素个数，只能得到原List。若take 0个元素，则会得到一个空List

`<br />maximum返回一个List中最大的那个元素。miniimun返回最小的。<br />sum返回一个List中所有元素的和。product返回一个List中所有元素的积。<br />elem判断一个元素是否在包含于一个List，通常以中缀函数的形式调用它。<br />Range:<br />步长为1:`Prelude> [1..20]<br />[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]`<br />声明步长：`Prelude> [1,3..30]<br />[1,3,5,7,9,11,13,15,17,19,21,23,25,27,29]`<br />特殊的：`Prelude> ['A'..'z']<br />"ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz"`<br />避免在Range中使用浮点数<br />无限长度的List`Prelude> take 24 [13,26..][13,26,39,52,65,78,91,104,117,130,143,156,169,182,195,208,221,234,247,260,273,286,299,312]`<br />无限循环的cycle`Prelude> 10 `take` (cycle [1,2,3,4]) <br />[1,2,3,4,1,2,3,4,1,2]`<br />replicate n x<br />`Prelude> n = 10<br />Prelude> replicate n []<br />[[],[],[],[],[],[],[],[],[],[]]`
<a name="xILpp"></a>
### 3.集合(List Comprehension )
`Prelude> [x*2 | x<-[1..10]]<br />[2,4,6,8,10,12,14,16,18,20]`<br />取乘以3后的元素，x在1到100之内，x的平方小于10<br />`Prelude> [x*3| a<-[1..100], a^2 < 100,let x = a]<br />[3,6,9,12,15,18,21,24,27]`<br />取50到100间所有除7的余数为3的元素<br />`Prelude> [x | x <- [50..70], x `mod` 7 == 3]<br />[52,59,66]`<br />多个集合<br />`Prelude> [x + y | x <- [2,6..20], y <- [3,9..21], x + y > 10, x + y < 38][11,17,23,15,21,27,13,19,25,31,17,23,29,35,21,27,33]`<br />计算长度<br />`Prelude> length' xs = sum [ 1 | _ <- xs]<br />Prelude> length' "hello world"<br />11<br />Prelude> length' [1,1,1,0,0,0]<br />6<br />Prelude> length' ['a'..'z'] <br />26`<br />除去字串中所有非小写字母的函数：<br />`Prelude> removeCapital xs = [ x | x <- xs, x `elem` ['a'..'z']]<br />Prelude> removeCapital ['A'..'z'] <br />"abcdefghijklmnopqrstuvwxyz"`<br />嵌套<br />若操作含有 List 的 List，使用嵌套的 List comprehension 也是可以的。假设有个包含许多数值的 List 的 List，让我们在不拆开它的前提下除去其中的所有奇数：<br />` <br />ghci> let xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]<br />ghci> [ [ x | x <- xs, even x ] | xs <- xxs]<br />[[2,2,4],[2,4,6,8],[2,4,2,6,2,6]]`
<a name="Umcbh"></a>
### 4.元组(Tuple)：可以存入多态别项的组合

<br />有序对`(8, 11)<br />("Wow",True)

`<br />三元组`("name","age",12)`<br />​

**fst** 返回一个序对的首项`Prelude> fst ("wow", False) "wow"`<br />​

**snd** 返回序对的尾项 `Prelude> snd ("hello",1984) 1984`<br />​

**zip 笛卡尔积**<br />`Prelude> a = [1,2,3,4]  <br />Prelude> b = ['h', 'e', 'l', 'l'] <br />Prelude> zip a b <br />[(1,'h'),(2,'e'),(3,'l'),(4,'l')]`<br />不等长时：将长串截断为短串长度<br />`Prelude> a = [1,2,3,4,5,6] <br />Prelude> b = ["hello", "world"] <br />Prelude> zip a b <br />[(1,"hello"),(2,"world")]`<br />用 zip 同时处理有限和无限的 List 也是可以的<br />`ghci> zip [1..] ["apple", "orange", "cherry", "mango"]<br />[(1,"apple"),(2,"orange"),(3,"cherry"),(4,"mango")]

`<br />如何取得所有三边长度皆为整数且小于等于 10，周长为 24 的直角三角形？<br />`Prelude> let tar = [(a,b,c)|a+b+c==24, a<-[1..10], b<-[1..10], c<-[1..10], a+b>c, a+c>b, c+b>a]  

`<br />`<interactive>:83:24: error: Variable not in scope: c :: [[Char]]`<br />why?<br />`Prelude> let tar = [ (a,b,c)|c<-[1..10], b<-[1..10], a<-[1..10],a+b>c, a+c>b, c+b>a,a+b+c==24] <br />Prelude> tar [(10,10,4),(10,9,5),(9,10,5),(10,8,6),(9,9,6),(8,10,6),(10,7,7),(9,8,7),(8,9,7),(7,10,7),(10,6,8),(9,7,8),(8,8,8),(7,9,8),(6,10,8),(10,5,9),(9,6,9),(8,7,9),(7,8,9),(6,9,9),(5,10,9),(10,4,10),(9,5,10),(8,6,10),(7,7,10),(6,8,10),(5,9,10),(4,10,10)] 

`<br />直角三角形<br />`Prelude> let tar = [(a,b,c)|a<-[1..10], b<-[1..10], c<-[1..10], a+b>c, a+c>b, c+b>a,a+b+c==24,a^2+b^2==c^2]<br />Prelude> tar [(6,8,10),(8,6,10)]

`<br />函数式编程语言的一般思路：先取一个初始的集合并将其变形，执行过滤条件，最终取得正确的结果。<br />​<br />
<a name="n1tUw"></a>
### 5.类型与类型系统
凡是明确的型别，其首字母必为大写。<br />`ghci> :t 'a'   <br />'a' :: Char   <br />ghci> :t True   <br />True :: Bool   <br />ghci> :t "HELLO!"   <br />"HELLO!" :: [Char]  <br />ghci> :t (True, 'a')   <br />(True, 'a') :: (Bool, Char)   <br />ghci> :t 4 == 5   <br />4 == 5 :: Bool`<br />函数也有类型:参数之间由 -> 分隔，而与回传值之间并无特殊差异。回传值是最后一项，参数就是前三项。<br />`addThree :: Int -> Int -> Int<br />addThree x y z = x + y + z

`<br />**Int：带符号整数，32位范围[-2147483648, 2147483647]**<br />**Integer：大整数，无界，可以存放非常大的数**<br />**Float：单精度浮点数**<br />**Double：双精度浮点数**<br />**Bool：布尔值**<br />**Char 表示一个字符。一个字符由单引号括起，一组字符的 List 即为字串。**Tuple 的型别取决于它的长度及其中项的型别。注意，空 Tuple 同样也是个型别，它只有一种值：()。**
<a name="SNhBP"></a>
#### 5.1类型变量
型别无关的函数：使用到型别变量的函数被称作"多态函数 "，型别变量使用多个字符是合法的，不过约定俗成，通常都是使用单个字符，如 a, b ,c ,d...<br />`Prelude> :t fst <br />fst :: (a, b) -> a`<br />`Prelude> :t (==) <br />(==) :: Eq a => a -> a -> Bool`<br />*Note*: 判断相等的==运算子是函数，``+-*/``之类的运算子也是同样。在缺省条件下，它们多为中缀函数。若要检查它的型别，就必须得用括号括起使之作为另一个函数，或者说以`首码函数(前缀函数)的形式`调用它。<br />`=> 符号`。它左边的部分叫做`类型约束`。我们可以这样阅读这段型别声明："相等函数取`两个相同型别`的值作为参数并回传一个布尔值，而这两个参数的型别同在 Eq 类之中(即类型约束)"<br />`Prelude> :t elem<br />elem :: (Foldable t, Eq a) => a -> t a -> Bool`<br />它在检测值是否存在于一个 List 时使用到了==

| **Eq**​ | 判断相等性：== 和 /= | 除函数以外的所有型别都属于 Eq，所以它们都可以判断相等性。 |
| --- | --- | --- |
| **Ord** | 可比较大小：<, >, <=, >= | compare 函数取两个 Ord 类中的相同型别的值作参数，回传比较的结果。这个结果是如下三种型别之一：GT, LT, EQ |
| **Show** | 可用字串表示的型别 | 除函数以外的所有型别都是 Show 的成员，最常用的函数表示 show。它可以取任一Show的成员型别并将其转为字串 |
| **Read** | `read "4" :: Float<br />4.2` | read 函数可以将一个字串转为 Read 的某成员型别 |
| **Bounded** | 上限与下限 | minBound, maxBound,<br />Float没有上下限（IEEE754）<br />元组也可以用<br />`Prelude> minBound :: (Bool, Int, Char) (False,-9223372036854775808,'\NUL')<br />Prelude> maxBound :: (Bool, Int, Char) (True,9223372036854775807,'\1114111')` |
| **Num** | 表示数字 | Num 包含所有的数字：实数和整数。 |
| **Integ​ral** |  | Integral 仅包含整数，其中的成员型别有 Int 和 Integer |
| **Floating** |  | 仅包含浮点型别：Float 和 Double |

fromIntegral<br />`Prelude> :t fromIntegral <br />fromIntegral :: (Integral a, Num b) => a -> b<br />取一个整数做参数并回传一个更加通用的数字，这在同时处理整数和浮点时会尤为有用`
<a name="sFJ78"></a>
### 6.函数的语法
<a name="ZtUox"></a>
#### 6.1模式匹配
![image.png](https://cdn.nlark.com/yuque/0/2022/png/23175396/1642852699626-760ced6f-9567-4570-8f63-96212cace147.png#clientId=ue340f9ef-6d9d-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=228&id=uca6dd2bd&margin=%5Bobject%20Object%5D&name=image.png&originHeight=456&originWidth=1364&originalType=binary&ratio=1&rotation=0&showTitle=false&size=177282&status=done&style=none&taskId=ue6f1f9d0-f1e8-4427-93f9-230ec4e453d&title=&width=682)
> 在ghci中声明function signature会失败。应该是直接写函数，会进行类型推断
> [https://stackoverflow.com/questions/5417623/ghci-not-in-scope-message/5417707](https://stackoverflow.com/questions/5417623/ghci-not-in-scope-message/5417707)

向量加法<br />定义向量数据类型：`Prelude> data Vector = Vector Int Int`<br />定义加法（数据类型）<br />![截屏2022-01-22 下午9.11.23.png](https://cdn.nlark.com/yuque/0/2022/png/23175396/1642857087991-b14d64b9-7775-4703-9b96-c26466a7671e.png#clientId=uf63c205c-04e4-4&crop=0&crop=0&crop=1&crop=1&from=drop&height=104&id=u2a4ccaa1&margin=%5Bobject%20Object%5D&name=%E6%88%AA%E5%B1%8F2022-01-22%20%E4%B8%8B%E5%8D%889.11.23.png&originHeight=240&originWidth=1256&originalType=binary&ratio=1&rotation=0&showTitle=false&size=114794&status=done&style=none&taskId=u1bcd6a3c-b48d-4b5c-a256-4c582466547&title=&width=544)<br />模式匹配类型：<br />`Prelude> let addVector2 (x1,y1) (x2,y2) = (x1+x2, y1+y2)<br />Prelude> addVector2 (1,4) (2,99)<br />(3,103)<br />Prelude> addVector2 (0.111,0.9999) <br />(1.873, 99.876)(1.984,100.8759)`<br />模式匹配能够处理Num类型的有序对<br />​

三元组的模式匹配<br />![截屏2022-01-22 下午9.21.47.png](https://cdn.nlark.com/yuque/0/2022/png/23175396/1642857713127-99e96212-df39-4b66-b72a-6d9fdea78b14.png#clientId=uf63c205c-04e4-4&crop=0&crop=0&crop=1&crop=1&from=drop&id=u7e5aa772&margin=%5Bobject%20Object%5D&name=%E6%88%AA%E5%B1%8F2022-01-22%20%E4%B8%8B%E5%8D%889.21.47.png&originHeight=282&originWidth=1054&originalType=binary&ratio=1&rotation=0&showTitle=false&size=130232&status=done&style=none&taskId=ub2c20e62-a797-4836-a07e-029a86d20a1&title=)<br />List的模式匹配<br />**有：操作**` 1 : [2, 3] = [1, 2, 3]`<br />则有 `data [a] = a:[a]|[]`<br />可定义函数 `head(x : xs) = x<br />tail(x : xs) = xs`<br />推广到：`foo (a:b:c) = c<br />foo [1, 2, 3, 4] = [3, 4]`<br />![image.png](https://cdn.nlark.com/yuque/0/2022/png/23175396/1642857880507-6a28a842-55b1-4a7b-9e78-b7c20ac24c60.png#clientId=uf63c205c-04e4-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=73&id=u2717afdb&margin=%5Bobject%20Object%5D&name=image.png&originHeight=146&originWidth=1052&originalType=binary&ratio=1&rotation=0&showTitle=false&size=49769&status=done&style=none&taskId=u68043dce-fdcd-4331-83ac-a9b56413e87&title=&width=526)<br />![](https://cdn.nlark.com/yuque/__latex/68cf407bbc759ffaa328f35fddbebf81.svg#card=math&code=%5Cforall%20%28x_i%2Cy_i%29%20%5Cin%20A%2C%20%5C%5C%0AS%20%3D%20%5C%7Bs_i%7Cs_i%20%3D%20x_i%20%2B%20y_i%5C%7D&id=oU2rL)
<a name="Y6CQE"></a>
#### 6.2 递归:**定义边界条件，即什么时候递归中止。  定义两次递归之间的联系，即递推规则。**
6.2.1 List的构造函数：[]构造一个空列表，**:通过连接一个元素和一个列表构造**出一 个新的列表，所有列表的构造都是一个递归的过程<br />`data List a : List a | Nil<br />Nil :: List a<br />1 : Nil :: List Int<br />1 : 2 : 3 : Nil :: List Int<br />其中，[]=Nil`<br />6.2.2 等差数列 [A..B]zheshi<br />6.2.3 init<br />`1	init :: [a] -> [a]<br />2	init [] = error "..."<br />3	init [x] = []<br />4	init (x:xs) = x : init xs`<br />
<br />​<br />
