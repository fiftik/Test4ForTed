<%@page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JavaScript Translit</title>
</head>
<body>

<input type="text" id="txt"/>
<input type="button" id="btn" value="Translit">
<input type="button" id="btn2" value="Reverse Translit">
<br>
<div id="finishTr"></div>
<div id="finishTrRev"></div>
<script type="text/javascript">
transliterate = (
    function() {
        var
            rus = "щ   ш  ч  ц  ю  я  ё  ж  ъ  ы  э  а б в г д е з и й к л м н о п р с т у ф х ь".split(/ +/g),
            eng = "shh sh ch cz yu ya yo zh `` y' e` a b v g d e z i j k l m n o p r s t u f x `".split(/ +/g)
        ;
        return function(text, engToRus) {
            var x;
            for(x = 0; x < rus.length; x++) {
                text = text.split(engToRus ? eng[x] : rus[x]).join(engToRus ? rus[x] : eng[x]);
                text = text.split(engToRus ? eng[x].toUpperCase() : rus[x].toUpperCase()).join(engToRus ? rus[x].toUpperCase() : eng[x].toUpperCase());
            }
            return text;
        }
    }
)();
</script>

<script>
function translit(){
	var toFinishTr = document.getElementById("finishTr");
	toFinishTr.innerHTML = transliterate(document.getElementById("txt").value);
}
document.getElementById("btn").onclick = translit;

function translitreverse(){
	var toFinishTrRev = document.getElementById("finishTrRev");
	TrRev = transliterate(document.getElementById("txt").value);
	toFinishTrRev.innerHTML = TrRev.split("").reverse().join("");
}
document.getElementById("btn2").onclick = translitreverse;
</script>
</body>
</html>