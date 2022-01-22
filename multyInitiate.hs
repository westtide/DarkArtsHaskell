-- 多构造函数
-- 同时表示笛卡尔坐标和极坐标,|表示选择，它连接了所有可能的构造函数
data Position3 = Cartesian Double Double | Polar Double Double

distance :: Position3 -> Position3 -> Double 
distance (Cartesian x1 y1) (Cartesian x2 y2) = sqrt ((x1 - x2)^2 + (y1 - y2)^2)
distance (Cartesian x1 y1) (Polar theta r) = 
    let x2 = r * cos theta
        y2 = r * sin theta
    in sqrt ((x1 - x2)^2 + (y1 - y2)^2)
distance (Polar theta r) (Cartesian x2 y2) =
    let x1 = r * cos theta
        y1 = r * sin theta
    in sqrt ((x1 - x2)^2 + (y1 - y2)^2)
distance (Polar theta1 r1)(Polar theta2 r2) = 
    let x1 = r1 * cos theta1
        y1 = r1 * sin theta1
        x2 = r2 * cos theta2
        y2 = r2 * sin theta2
    in sqrt ((x1 - x2)^2 + (y1 - y2)^2)
 
 -- 可以有无参数构造函数
 -- 类型变量
 
data Position a  = MakePosition a a
doubleSmallNumber x = if x > 10 
    then x 
    else  x * 2

-- Maybe
data Maybe a = Just a | Nothing 
Just :: Maybe Int 
Just "hello" :: Maybe String

Nothing :: Maybe 3
Nothing :: Maye Int 
Nothing :: Maybe Char 