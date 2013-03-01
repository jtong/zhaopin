function JobGuessQuestion(html, shuffle){
    this.html = html;
    this.shuffle = shuffle;
    this.locals = this._variables();
}



JobGuessQuestion.prototype.render = function(){
    var fn = jade.compile(this.html);
    return fn(this.locals);
}


JobGuessQuestion.prototype.answer = function(){
    return this.locals.P1+"是医生，"+this.locals.P2+"是律师，"+this.locals.P3+"是推销员"
}

JobGuessQuestion.prototype._variables = function(){
    var variables = ["P1", "P2","P3"];
    var variable_values = ["张三", "李四", "王五"];
    //console.log(this.shuffle)

    this.shuffle(variable_values);
    result = {};
    for(index in variables){
      result[variables[index]]= variable_values[index];
    }
    return result;
}





