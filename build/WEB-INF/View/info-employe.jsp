<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Fiche Employé</title>
</head>
<body>
    <h2>Employé Enregistré avec Succès !</h2>

    <ul>
        <li><strong>Nom :</strong> ${nom}</li>
        <li><strong>Prénom :</strong> ${prenom}</li>
        <li><strong>Département :</strong> ${departement}</li>
    </ul>

    <a href="${pageContext.request.contextPath}/emp/add">Ajouter un autre employé</a>
</body>
</html>