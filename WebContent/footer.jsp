	<br/>
	<br/>
	</div>
	
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate var="year" value="${now}" pattern="yyyy" />
	
	<footer>
		<br/>
		Copyright &copy; ${year} Alejandro Parana
	</footer>	
</body>
</html>