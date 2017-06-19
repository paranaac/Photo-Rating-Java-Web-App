<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ps" %>

<c:import url="/header.jsp">
	<c:param name="title" value="Photo Ranking: Photo View"></c:param>
</c:import>

<sql:transaction dataSource="jdbc/acparana_photos">
	<sql:query sql="select * from photos where id=?" var="results">
		<sql:param>${param.photoID}</sql:param>
	</sql:query>	
	
	<c:set scope="page" var="img" value = "${results.rows[0]}"></c:set>
	<c:set scope="page" var= "average" value= "${img.average}"></c:set>
	<c:set scope="page" var= "myranks" value= "${img.ranks}"></c:set>
	
	<c:if test='${param.action == "rate"}'>
		<c:set scope="page" var="newvote" value="${(img.average * img.ranks + param.rating)/(img.ranks + 1)}"></c:set>
		<c:set scope="page" var="average" value="${newvote}"></c:set>
		<c:set scope="page" var="myranks" value="${img.ranks+1}"></c:set>
	
		<sql:update sql="update photos set average=? where id=?">
			<sql:param>${newvote}</sql:param>
			<sql:param>${param.photoID}</sql:param>
		</sql:update>
		
		<sql:update sql="update photos set ranks=? where id=?">
			<sql:param>${img.ranks+1}</sql:param>
			<sql:param>${param.photoID}</sql:param>
		</sql:update>
	</c:if>
</sql:transaction>

<p id="photoTitle">${img.title}</p>
<ps:image width="500" name="${img.name}" ext="${img.ext}"></ps:image>
<br/>
<span class="rating">Rating: <fmt:formatNumber value="${average}" maxFractionDigits="2"/></span>
<br/>
<span class="rating">(Based on <fmt:formatNumber value="${myranks}" maxFractionDigits="2"/> votes)</span>

<center>
<table>
	<tr>
		<td>
			<form action='<c:url value="/album"/>' method="post">
				<input type="hidden" name="action" value="rate" /> <input type="hidden" name="photoID" value="${img.id}" />
				<table>
					<tr><td><p id="rateText">Rate This Photo</p></td></tr>
					<tr><td align="left"><input type="radio" name="rating" value="5" checked="checked">5 Stars &#9733;&#9733;&#9733;&#9733;&#9733;</td></tr>
					<tr><td align="left"><input type="radio" name="rating" value="4">4 Stars &#9733;&#9733;&#9733;&#9733;</td></tr>
					<tr><td align="left"><input type="radio" name="rating" value="3">3 Stars &#9733;&#9733;&#9733;</td></tr>
					<tr><td align="left"><input type="radio" name="rating" value="2">2 Stars &#9733;&#9733;</td></tr>
					<tr><td align="left"><input type="radio" name="rating" value="1">1 Star &#9733;</td></tr>
					<tr><td align="left"><br/><div class="button"><input type="submit" name="submit" value="Submit Rating"></div></td></tr>
				</table>
			</form>
		</td>
	</tr>
</table>
</center>	   		
<c:import url="/footer.jsp"></c:import>


