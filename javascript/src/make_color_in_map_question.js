function MakeColorInMapQuestion(html, shuffle){
    this.html = html;
    this.shuffle = shuffle;
    this.locals = this._variables();
}

MakeColorInMapQuestion.prototype = new QuestionBase();


//common interface
MakeColorInMapQuestion.new_question = function(html){
    return new MakeColorInMapQuestion(html, function(array){
        array.sort(function(){return (Math.round(Math.random())-0.5);})
    })
}

var new_question = MakeColorInMapQuestion.new_question;

MakeColorInMapQuestion.prototype._variables = function(){
    var variables_country = ["C1","C2","C3","C4","C5","C6"];
    var variables_country_values = ["A","B","C","D","E","F"];
    //console.log(this.shuffle)
    //console.log(this._build_shuffled_variables_context(variables_bid_values_with_answer.variables, variables_bid))

    return this._build_context([
        this._build_shuffled_variables_context(variables_country_values, variables_country)

    ]);
}

MakeColorInMapQuestion.prototype._answer = function(){
    return JSON.stringify({
        "1":[this.locals["C1"]],
        "2":[this.locals["C4"],this.locals["C6"]],
        "3":[this.locals["C3"]],
        "4":[this.locals["C2"],this.locals["C5"]]});
}



MakeColorInMapQuestion.prototype._answer_verify_type = function(){
    return "multi_contains";
}
