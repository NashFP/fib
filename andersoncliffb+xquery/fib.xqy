xquery version "3.1";

(: Thanks to friends at NashFP, especially Mike K. and Mark W. :)

declare function local:fibC($n as xs:integer, $memo as map(*), $con)  {
    if (map:contains($memo, $n)) then $con(map:get($memo, $n), $memo)
    else
      local:fibC($n - 1, $memo,
        (: n1 = fib(n - 1) :)
        function($n1 as xs:integer, $memo as map(*)) { 
          local:fibC($n - 2, $memo, 
          (: n2 = fib(n - 2) :)
            function($n2 as xs:integer, $memo as map(*)) {
              $con($n1 + $n2, map:put($memo, $n, $n1 + $n2)) 
            } )
        } )
};


local:fibC(30, map{1:1, 2:1}, function($x as xs:integer, $memo as map(*)) { $x })
