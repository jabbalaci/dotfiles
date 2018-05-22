import strutils
from strutils import intToStr
import typetraits

# for i in 1..10:
  # echo i

# for i in countdown(10, 1):
  # echo i

# for i in 0..<10:
  # echo i

var s = "lacika"
for i in 0..<s.len:
  echo "$1: $2".format(i, s[i])

echo "la", "ci", 9

proc duplaz(n: int): int =
  return 2 * n

echo duplaz(10)

proc hello() =
  echo "hello"

hello()

var c = 'a'
echo $c

var name = "laci"
echo name.len
echo len(name)
name.add("ka")
echo name

var num = 25
echo num div 5

var x = 36
echo x.toFloat()

var ss: string
var szam = 1977
echo szam.type.name
echo $szam & "eh"
