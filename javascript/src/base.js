function QuestionBase(){

}

QuestionBase.prototype.build = function(){
    var me = this;
    return {
        content: me._content(),
        answer: me._answer()
    }
}

QuestionBase.prototype._content = function(){
    var fn = jade.compile(this.html);
    return fn(this.locals);
}


QuestionBase.prototype._build_shuffled_variables_context = function(variable_values, variables) {
    this.shuffle(variable_values);
    var result = {};
    for (index in variables) {
        result[variables[index]] = variable_values[index];
    }
    return result;
}

QuestionBase.prototype._build_context = function(array){
    result = {};
    for(var i =0;i < array.length; i++){
        var obj = array[i];
        for(prop in obj){
            result[prop] = obj[prop];
        }
    }
    return result;
}