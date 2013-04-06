function HouseColorSequenceGuessQuestion(html, shuffle){
    this.html = html;
    this.shuffle = shuffle;
    this.locals = this._variables();
}


//common interface
var new_question = HouseColorSequenceGuessQuestion.new_question;

HouseColorSequenceGuessQuestion.new_question = function(html){
    return new HouseColorSequenceGuessQuestion(html, function(array){
        array.sort(function(){return (Math.round(Math.random())-0.5);})
    })
}
//extends
HouseColorSequenceGuessQuestion.prototype = new QuestionBase();

//public

//private
HouseColorSequenceGuessQuestion.prototype._answer = function(){
    return this.locals.H3+"黄房子"+this.locals.H4+this.locals.H2+this.locals.H1
}

HouseColorSequenceGuessQuestion.prototype._variables = function(){
    var variables = ["H1","H2","H3","H4"];
    var variable_values = ["黑房子", "绿房子", "白房子", "红房子"];
    //console.log(this.shuffle)

    return this._build_shuffled_variables_context(variable_values, variables);
}