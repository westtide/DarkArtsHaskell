data Position = MakePosition Double Double 
distance :: Position -> Position -> Double 
distance p1 p2 =
    case p1 of
        MakePosition x1 y1 ->
            case p2 of
                MakePosition x2 y2 -> sqrt ((x1-x2)^2 + (y1-y2)^2)

pointA :: Position
pointA = MakePosition 0 0 
pointB :: Position 
pointB = MakePosition 3 4

-- 中缀表达式版本的Position
data Position2 = Double :+ Double 
distance2 :: Position2 -> Position2 -> Double 
distance2 p1 p2 = 
    case p1 of x1 :+ y1 -> case p2 of x2 :+ y2 -> sqrt ((x1-x2)^2 + (y1-y2)^2)
-- 会出现奇怪的换行问题
pointA1 :: Position2
pointB1 :: Position2
pointA1 = 0 :+ 0
pointB1 = 3 :+ 4

-- 更简洁形式的distance 融入构造函数
-- let产生的绑定在in后面的表达式里可见
-- 只能有一个被匹配的模式
distance3 :: Position -> Position -> Double 
distance3 (MakePosition x1 y1) (MakePosition x2 y2) =
    sqrt ((x1-x2)^2 + (y1-y2)^2)

-- let in 方法的distance
distance4 p1 p2 = 
    let MakePosition x1 y1 = p1
        MakePosition x2 y2 = p2
    in sqrt ((x1-x2)^2 + (y1-y2)^2)

-- 多构造函数
-- 同时表示笛卡尔坐标和极坐标
