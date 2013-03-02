function QuestionBase(){

}

QuestionBase.prototype._content = function(){
    var fn = jade.compile(this.html);
    return fn(this.locals);
}

QuestionBase.prototype.build = function(){
    var me = this;
    return {
        content: me._content(),
        answer: me._answer()
    }
}