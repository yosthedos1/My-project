<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.0";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<div id = "topSearch">
    <div class="container_16">
        <div class="grid_16">
            <div class="grid_9">


                <input type="text" id="search" class="searchBox" placeholder="Quick search an item ..." autofocus="true"/>

            </div>
            <div class="grid_6" id="topNav">
                <ul>
                     <li><a href="index.jsp">בית</a></li>
                    <li><a href="viewProducts_.jsp">מוצרים</a></li>
                    <li><a href="contact-support.jsp">צור קשר</a></li>
                    <li><a href="faq.jsp">שאלות נפוצות</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>


<%
    if (session.getAttribute("admin") != null){
        %>
        <script type="text/javascript">
    $(document).ready(function (){
                
        $('#search').keyup (function (){
            searchbar = $('#search').attr('value');
            if (searchbar.length >= 3){                            
                $('#loadSearches').css('display');
                $.get('findProductLoad.jsp', {searchbar:searchbar}, function (data){                    
                    if (data.length > 760){
                        $('#loadSearches').html(data).slideDown(500);
                    }
                    else {
                        $('#loadSearches').slideUp(500);
                        $('#loadSearches').html("");
                    }
                });
                       
            }else {
                 $('#loadSearches').slideUp(500);
                $('#loadSearches').html("");
            }
        });
    });
            
</script>
<%
    } else {
        %>
<script type="text/javascript">
    $(document).ready(function (){
                
        $('#search').keyup (function (){
            searchbar = $('#search').attr('value');
            if (searchbar.length >= 3){
                
                            
                $('#loadSearches').css('display');
                $.get('findProductLoad_1.jsp', {searchbar:searchbar}, function (data){
                    //alert (data);
                    if (data.length > 760){
                        $('#loadSearches').html(data).slideDown(500);
                    }
                    else {
                        $('#loadSearches').slideUp(500);
                        $('#loadSearches').html("");
                    }
                });
                       
            }else {
                 $('#loadSearches').slideUp(500);
                $('#loadSearches').html("");
            }
        });
    });
            
</script>
<%
    }
%>

<div class="container_16" id="loadSearches" ></div>
