const characterList = ['@','#','/','_', '&', '%'];

function countUsage(text, curChar) {

  const r = new RegExp(curChar, 'g');
  let matches = text.match(r);
  return (matches ? matches.length : 0);

}

function constructHistogram(text) {

  hist = {};
  for (let c = 0; c < characterList.length; c += 1) {
    hist[characterList[c]] = countUsage(text, characterList[c]);
  }
  return hist;
}


module.exports = {characterList, constructHistogram};
