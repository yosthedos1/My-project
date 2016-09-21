<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Yossi Online Store FAQ</title>        
        <!-- Default Stylesheets -->
        <link rel="shortcut icon" href="images/logo/ico.ico"/>

        <link rel="stylesheet" type="text/css" href="css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="css/text.css"/>
        <link rel="stylesheet" type="text/css" href="css/960_16.css"/>
        <link rel="stylesheet" type="text/css" href="css/styles.css"/>
        <link rel="stylesheet" type="text/css" href="css/product.css"  />

        <script type="text/javascript" src="js/jquery.js"></script>

        <script type="text/javascript" src="js/myScript.js"></script>

    </head>
    <body>
        
        <%
            if (session.getAttribute("user") == null) {// Then it is a new user, so show join now
%>
        <jsp:include page="includesPage/_join.jsp"></jsp:include>
        <%        } else {
        %>
        <jsp:include page="includesPage/_logout.jsp"></jsp:include>
        <%            }
        %>
        
        <%@include file="includesPage/_search_navigationbar.jsp" %>

        <%@include file="includesPage/_joinToFacebook.jsp" %>

        <div class="container_16">
            <div id="whiteBox" style="padding: 10px;">
                <br/>
                <h1>שאלות נפוצות</h1>
                <hr/>
            </div>
        </div>

        <div class="container_16">
            <div id="whiteBox" class="grid_16" style="text-align:right;">
                <div name="top" class="push_1">
                <br/><br/>
            <a href="#1">תוך כמה זמן מגיע המוצר ללקוח&bull;</a>
                <br/><br/>
            <a href="#2" >האם ניתן לבטל מוצר שרכשתי&bull;</a>
                <br/><br/>
            <a href="#3" >האם ניתן להחזיר מוצר עקב פגם או מוצר שגוי שנשלח&bull;</a>
                <br/><br/>
            <a href="#4" >האם קימת אפשרות של איסוף עצמי&bull;</a>
                <br/><br/>
            <a href="#5" >האם בטוח לרכוש דרך האתר&bull;</a>
                <br/><br/>
       </div> 
                <br/><br/>
            <hr/>
                <a  href="#top" name="1">תוך כמה זמן מגיע המוצר ללקוח&bull;</a>
                    <div>
                    <p>הספקים וחברות המשלוח איתם אנו עובדים עושים ככל יכולתם בשביל לספק את המוצרים במהירות רבה ולפני הזמן המובטח! זמן האספקה מצוין בדף המכירה של המוצר ועומד בדרך כלל כמפורט להלן:
מוצרים עד 600 ש"ח: משלוח ללא תשלום עד 7 ימי עסקים באמצעות דואר רשום. בתוספת 29 ש"ח ניתן לקבל את המוצר עם שליח עד הבית תוך 3 ימי עסקים.
מוצרים מעל 600 ש"ח: עד 3 ימי עסקים עם שליח עד הבית ללא תוספת תשלום</p>
                    </div>
            <br/><br/>
            <a  href="#top"  name="2">האם ניתן לבטל מוצר שרכשתי&bull;</a>
                    <div>
               <p>
	ניתן לבטל את הרכישה של המוצר תוך 14 ימי עסקים בהתאם להוראות חוק הגנת הצרכן. דמי הביטול שנקבעו בחוק הינם בשיעור שלא יעלה על 5% ממחיר המוצר או 100 ₪, לפי הנמוך מביניהם. מוצרים מתחת ל-1,000 ש"ח ניתן להחזיר תוך 30 יום ללא דמי ביטול.
</p>

                    </div>
            <br/><br/>
            <a  href="#top" name="3">האם ניתן להחזיר מוצר עקב פגם או מוצר שגוי שנשלח&bull;</a>
                    <div>
                    <p>כמובן. החזרת מוצר עקב פגם או מוצר שגוי שנשלח ללקוח תיעשה בתיאום עם הספק ושירות הלקוחות של No-Risk. במידה וטענת הלקוח בדבר מוצר פגום או שגוי נכונה, ספק המוצר יישא בכל עלויות הביטול והמשלוח. הלקוח לא יחויב עבור הביטול. אם טענתו של הלקוח תימצא שגויה, יהיה הספק רשאי לגבות מהלקוח את דמי הביטול, הטיפול והמשלוח. הלקוח מחויב להחזיר מוצר פגום או שגוי תוך 14 יום. </p>
                    </div>
            <br/><br/>
            <a  href="#top" name="4">האם קימת אפשרות של איסוף עצמי</a>
                    <div>
                    <p>בהחלט. ברוב המוצרים הלקוח יכול לבצע איסוף עצמי. יחד עם זאת, הלקוח בלבד יישא באחריות לכל פגם אשר נגרם למוצר כתוצאה מהובלה עצמית</p>
                   
                    </div>
            <br/><br/>
            <a  href="#top" name="5">האם בטוח לרכוש דרך האתר&bull;</a>
            <div><p>ודאי, כל ההזמנות מבוצעות טלפונית ולכן אין שום חשש של חדירה לפרטיות</p>
                    </div>
            <br/><br/>
            
                    </div>
                </div>
        <jsp:include page="includesPage/_footer.jsp"></jsp:include>
    </body>
</html>
