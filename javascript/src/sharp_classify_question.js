function SharpClassifyQuestion(html, shuffle){
    this.html = html;
    this.shuffle = shuffle;
    this.locals = this._variables();
}

SharpClassifyQuestion.prototype = new QuestionBase();

//common interface
SharpClassifyQuestion.new_question = function(html){
    return new SharpClassifyQuestion(html, function(array){
        array.sort(function(){return (Math.round(Math.random())-0.5);})
    })
}

var new_question = SharpClassifyQuestion.new_question;


SharpClassifyQuestion.prototype._variables = function(){
    var variables_country = ["X1", "X2", "X3", "X4", "X5", "X6", "X7", "X8", "X9"];
    var variables_country_values = ["甲","乙","丙","丁","戊","己", "庚", "辛", "壬"];
    //console.log(this.shuffle)
    //console.log(this._build_shuffled_variables_context(variables_bid_values_with_answer.variables, variables_bid))

    return this._build_context([
        this._build_shuffled_variables_context(variables_country_values, variables_country)

    ]);
}

SharpClassifyQuestion.prototype._answer = function(){
    return ["1", this.locals["X2"],this.locals["X7"],"2",this.locals["X5"],"3",this.locals["X1"],this.locals["X6"]].join(",");
}



