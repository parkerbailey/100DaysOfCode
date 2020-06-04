function checkObj(obj, checkProp) {
    // Only change code below this line
    if (obj.hasOwnProperty(checkProp)) {
      console.log(obj.checkProp);
    }
    else {
      console.log("Not Found");
    }
    // Only change code above this line
}

var obj = {
    "thing": "Yep",
    "stuff": "Indeed"
};

checkObj(obj,"beans")