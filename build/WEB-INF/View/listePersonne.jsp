<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%
    List<String> personnes = (List<String>) request.getAttribute("personnes");
%> 

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Personnes - Volta Framework</title>
</head>
<body>
    <h1>Liste des personnes enregistrées</h1>

    <% if (personnes != null && !personnes.isEmpty()) { %>
        <ul>
            <% for (String personne : personnes) { %>
                <li><%= personne %></li>
            <% } %>
        </ul>
    <% } else { %>
        <p>Aucune personne n'a été trouvée ou transmise.</p>
    <% } %>

</body>
</html>