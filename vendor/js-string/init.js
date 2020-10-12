var S = function (str, vars) {

  if (str === undefined || str === null || str.trim() === '') return '';

  if (typeof vars === 'object') {
    if (Array.isArray(vars)) {
      return replaceEach(str, vars);
    } else {
      return replaceFromHash(str, vars);
    }
  } else if (vars === undefined) {
    return str;
  } else if (vars === null) {
    return str;
  } else {
    return replaceAll(str, vars);
  }


  function replaceAll(str, x) {
    var result    = str;
    var regex_all = new RegExp('{x}', 'g');
    result        = result.replace(regex_all, x);
    return result;
  }


  function replaceEach(str, arr) {
    var regex_first = new RegExp('{x}');
    var regex_all   = new RegExp('{x}', 'g');
    var result      = str;

    // return str if no items in array
    if (arr.length === 0) return result;

    // replace each occurrence fin array's order
    for (let i = 0; i < arr.length; i++) {
      result = result.replace(regex_first, arr[i]);
    }

    // replace the rest of occurrences with last item in array
    result = result.replace(regex_all, arr[arr.length - 1]);

    return result;
  }


  function replaceFromHash(str, hash) {
    var result = str;

    for (var key in hash) {
      var regex = new RegExp('{' + key + '}', 'g');
      result    = result.replace(regex, hash[key]);
    }

    return result;
  }

};
