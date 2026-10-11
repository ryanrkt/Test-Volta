<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ajouter un Employé</title>
</head>
<body>
    <h2>Formulaire d'ajout d'employé</h2>

    <form action="${pageContext.request.contextPath}/emp/save" method="POST">
        <div>
            <label for="nom">Nom :</label>
            <input type="text" id="nom" name="nom" required />
        </div>
        <br/>
        <div>
            <label for="prenom">Prénom :</label>
            <input type="text" id="prenom" name="prenom" required />
        </div>
        <br/>
        <div>
            <label for="departement">Département :</label>
            <input type="text" id="departement" name="departement" required />
        </div>
        <br/>
        <button type="submit">Enregistrer</button>
    </form>
</body>
</html>