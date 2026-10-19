<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Fiche Employé</title>
</head>
<body>
    <h2>Employé Enregistré avec Succès !</h2>

    <ul>
        <li><strong>Nom :</strong> ${employe.nom}</li>
        <li><strong>Prénom :</strong> ${employe.prenom}</li>
        <li><strong>Département :</strong> ${employe.departement}</li>
        
        <% 
            app.models.Employe emp = (app.models.Employe) request.getAttribute("employe");
            if (emp != null && emp.getProfile() != null) { 
        %>
            <li><strong>Fichier profil :</strong> <%= emp.getProfile().getFilename() %> (<%= emp.getProfile().getSize() %> octets)</li>
            <li><strong>Chemin de sauvegarde :</strong> <%= emp.getProfile().getSavedPath() %></li>
        <% } %>
    </ul>

    <a href="${pageContext.request.contextPath}/emp/add">Ajouter un autre employé</a>
</body>
</html>