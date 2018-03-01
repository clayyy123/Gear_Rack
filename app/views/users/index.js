function averageString(str) {
    var map = new Map([["one" ,1],["two" ,2], ["three",3],["four", 4],["five" ,5],["six", 6],["seven",7],["eight",8],["nine",9]])
    let array = str.split(" ")
    let newArray = array.map(x => map.get(x))
    let sumArray = newArray.reduce(function(a,b){
    return a+b
  })
    if (newArray.includes(null) || newArray.length === 0){
      return "n/a"
      }else{
     return Math.floor(sumArray/(newArray.length))
  }
  }
  averageString("one two fourty")
  console.log(newArray)