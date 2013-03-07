function DutchAuctionQuestion(html, shuffle){
    this.html = html;
    this.shuffle = shuffle;
//    this.locals = {
//        "P1":"张三",
//        "P2":"李四",
//        "P3":"王五",
//        "P4":"刘六",
//        "P5":"赵大",
//        "P6":"钱二",
//        "P7":"孙甲",
//        "P8":"李乙",
//        "P9":"周丙",
//        "P10":"吴丁",
//        "P11":"郑戊",
//        "P12":"王己",
//        "P13":"李庚",
//        "P14":"吴辛",
//        "P15":"谢壬",
//        "P16":"周癸",
//        "B1":"3",
//        "B2":"14",
//        "B3":"2",
//        "B4":"4",
//        "B5":"5",
//        "B6":"4",
//        "B7":"9",
//        "B8":"2",
//        "B9":"4",
//        "B10":"3",
//        "B11":"10",
//        "B12":"8",
//        "B13":"11",
//        "B14":"5",
//        "B15":"13",
//        "B16":"9"
//    }
    this.locals = this._variables();
}

DutchAuctionQuestion.prototype = new QuestionBase();

//common interface
var new_question = DutchAuctionQuestion.new_question;

DutchAuctionQuestion.new_question = function(html){
    return new DutchAuctionQuestion(html, function(array){
        array.sort(function(){return (Math.round(Math.random())-0.5);})
    })
}

DutchAuctionQuestion.prototype._variables = function(){
    var variables_person = ["P1","P2","P3","P4","P5","P6","P7","P8","P9","P10","P11","P12","P13","P14","P15","P16"];
    var variables_bid = ["B1","B2","B3","B4","B5","B6","B7","B8","B9","B10","B11","B12","B13","B14","B15","B16"];
    var variables_person_values = ["张三","李四","王五","刘六","赵大","钱二","孙甲","李乙","周丙","吴丁","郑戊","王己","李庚","吴辛","谢壬","周癸"];
    var variables_bid_values_with_answer = build_number_variable(variables_bid.length);
    //console.log(this.shuffle)
    //console.log(this._build_shuffled_variables_context(variables_bid_values_with_answer.variables, variables_bid))


    var shuffled_variables_bid_values_context = this._build_shuffled_variables_context(variables_bid_values_with_answer.variables, variables_bid);
    this.answer_index = 1;
    for(prop in shuffled_variables_bid_values_context){
        if( shuffled_variables_bid_values_context[prop] == variables_bid_values_with_answer.answer){
            break;
        }
        this.answer_index++;
    }

    return this._build_context([
        this._build_shuffled_variables_context(variables_person_values, variables_person),
        shuffled_variables_bid_values_context
    ]);
}

DutchAuctionQuestion.prototype._answer = function(){
    return this.locals["P"+this.answer_index];
}

function build_number_variable(length){
    var answer = Math.round(Math.random()*100);
    var result = {};
    result.answer = answer;
    result.variables = [answer];
    while(result.variables.length < 5){
        var variable = Math.round(Math.random()*100);
        if(variable < answer){
            result.variables.push(variable);
            result.variables.push(variable);
        }
    }
    while(result.variables.length < length){
        var variable = Math.round(Math.random()*100);
        if(variable > answer){
            result.variables.push(variable);
        }
    }
    return result;
}

