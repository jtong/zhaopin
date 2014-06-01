function ClockTimeChangeQuestion(html, shuffle){
    this.html = html;
    this.shuffle = shuffle;
    this.locals = this._variables();
}
//extends
ClockTimeChangeQuestion.prototype = new QuestionBase();

//common interface
ClockTimeChangeQuestion.new_question = function(html){
    return new ClockTimeChangeQuestion(html, function(array){
        array.sort(function(){return (Math.round(Math.random())-0.5);})
    })
}

var new_question = ClockTimeChangeQuestion.new_question;

ClockTimeChangeQuestion.prototype._answer = function(){
    var time = new Date();
    time.setHours(8)
    time.setMinutes(20);

    time.setHours(time.getHours()-this.locals.H1);
    time.setMinutes(time.getMinutes()+60 * this.locals.M1);

    time.setHours(time.getHours() + 12 * this.locals.H2);
    time.setMinutes(time.getMinutes() - 60 * this.locals.M2);

    time.setHours(time.getHours() + this.locals.H3);
    time.setMinutes(time.getMinutes() + this.locals.M3);

    var hours = time.getHours()>12?time.getHours() - 12:time.getHours();
    return [hours,time.getMinutes()].join(",");
}

ClockTimeChangeQuestion.prototype._variables = function(){
    var hour_variables = ["H1", "H2","H3"];
    var minute_variables =["M1","M2","M3"];
    var hour_variable_scopes = [
        [1,2,3,4,5,6,7,8,9,10,11],
        [0.5,1.5,2.5,3.5,4.5,5.5,6.5],
        [1,2,3,4,5,6,7,8,9,10,11]
    ];
    var minute_variable_scopes = [
        [1,2,3,4,5,6,7,8,9],
        [1,2,3,4,5,6,7,8,9],
        [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    ]
    var hour_variable_values = [];
    var minute_variable_values = [];
    var me = this;
    _(hour_variable_scopes).each(function(scope){
        me.shuffle(scope);
        hour_variable_values.push(scope[0]);
    });

    _(minute_variable_scopes).each(function(scope){
        me.shuffle(scope);
        minute_variable_values.push(scope[0]);
    });

    var result = {};
    _(hour_variables).each(function(param, index){
        result[param] = hour_variable_values[index];
    });

    _(minute_variables).each(function(param, index){
        result[param] = minute_variable_values[index];
    });
    return result;
}

