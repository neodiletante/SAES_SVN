 <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <sql:query var="rs" dataSource="jdbc/saes">
 select 1 as id, 2 as foo, 6 as bar from dual
 </sql:query>   

 <html>
   <head>
     <title>DB Test</title>
   </head>
   <body>

   <h2>Results</h2>
  
 <c:forEach var="row" items="${rs.rows}">
     Foo ${row.foo}<br/>
     Bar ${row.bar}<br/>
 </c:forEach>

   </body>
 </html>
