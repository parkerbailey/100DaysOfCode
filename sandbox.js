function rangeOfNumbers(startNum, endNum) {
    if (startNum == endNum) {
      return [];
    } else if (startNum > endNum) {
      const number = rangeOfNumbers(startNum + 1, endNum);
      number.unshift(startNum);
      return number;
    }
  };

  console.log(rangeOfNumbers(10,5));
