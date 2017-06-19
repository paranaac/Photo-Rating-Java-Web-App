    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	<c:import url="/header.jsp">
	<c:param name="title" value="Photo Ranking: Home"></c:param>
	</c:import>
	
	<sql:setDataSource var="dSource" dataSource="jdbc/acparana_photos"/>
	<sql:query dataSource="${dSource}" sql="select * from photos" var="results"/>
	
	<table class="photosTable">
		<c:forEach var="img" items="${results.rows}" varStatus="row">
			<c:set scope="page" var="images" value = "${img.name}.${img.ext}"></c:set>
			<c:if test="${row.index % 5 == 0}">
			 <tr>
		    </c:if>	
			<td>
				<p>
					<a href="<c:url value ="/album?action=click&photoID=${img.id}"/>">
						<img src="${pageContext.request.contextPath}/images/photos/${images}" width="250" />
					</a>
				</p>
			</td>
		   		
		   <c:if test="${row.index + 1 % 5 == 0}"></tr></c:if>
		</c:forEach>
	</table>
	
	<c:import url="/footer.jsp"></c:import>