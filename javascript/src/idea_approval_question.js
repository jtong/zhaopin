function IdeaApprovalQuestionBuilder(html, shuffle){
    this.html = html;
    this.shuffle = shuffle;
    this.locals = this._variables();
}

//extends
IdeaApprovalQuestionBuilder.prototype = new QuestionBase();

//common interface
IdeaApprovalQuestionBuilder.new_question = function(html){
    return new IdeaApprovalQuestionBuilder(html, function(array){
        array.sort(function(){return (Math.round(Math.random())-0.5);});
    })
}

var new_question = IdeaApprovalQuestionBuilder.new_question;


//public

//private
IdeaApprovalQuestionBuilder.prototype._answer = function(){
    return [this.locals.I1,this.locals.I3,this.locals.I4].join(",");
}


IdeaApprovalQuestionBuilder.prototype._variables = function(){
    var variables = ["I1", "I2","I3", "I4"];
    var variable_values = ["点餐系统", "抽奖应用", "投票应用","招聘应用"];
    //console.log(this.shuffle)

    return this._build_shuffled_variables_context(variable_values, variables);
}





