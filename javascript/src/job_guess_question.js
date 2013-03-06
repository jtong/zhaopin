function JobGuessQuestionBuilder(html, shuffle){
    this.html = html;
    this.shuffle = shuffle;
    this.locals = this._variables();
}

//common interface
JobGuessQuestionBuilder.new_question = function(html){
    return new JobGuessQuestionBuilder(html, function(array){
        array.sort(function(){return (Math.round(Math.random())-0.5);})
    })
}

var new_question = JobGuessQuestionBuilder.new_question;

//extends
JobGuessQuestionBuilder.prototype = new QuestionBase();

//public


//private
JobGuessQuestionBuilder.prototype._answer = function(){
    return this.locals.P1+"是医生，"+this.locals.P2+"是律师，"+this.locals.P3+"是推销员"
}


JobGuessQuestionBuilder.prototype._variables = function(){
    var variables = ["P1", "P2","P3"];
    var variable_values = ["张三", "李四", "王五"];
    //console.log(this.shuffle)

    return this._build_shuffled_variables_context(variable_values, variables);
}





