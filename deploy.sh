#!/usr/bin/env bash

set -e

# --- COULEURS ---
NC='\033[0m'
ROUGE='\033[0;31m'
VERT='\033[0;32m'
JAUNE='\033[0;33m'
BLEU='\033[0;34m'
CYAN='\033[0;36m'

# --- CONFIGURATION ---
APP_NAME=$(basename "$(pwd)")
SRC_DIR="src/main/java"  
WEB_DIR="src/main/webapp"
RES_DIR="src/main/resources" # 🟢 Ajout du dossier des ressources
BUILD_DIR="build"
LIB_DIR="lib"  
TOMCAT_WEBAPPS="/opt/tomcat/webapps"

echo -e "${CYAN}==================================================${NC}"
echo -e "${CYAN} 🚀 Lancement du déploiement : ${VERT}$APP_NAME${NC}"
echo -e "${CYAN}==================================================${NC}"
sleep 1

echo -e "\n${BLEU} Vérification des dépendances...${NC}"
sleep 0.5
if [ ! -d "$LIB_DIR" ] || [ -z "$(ls -A "$LIB_DIR"/*.jar 2>/dev/null)" ]; then
    echo -e "${ROUGE}❌ Erreur : Aucun fichier .jar trouvé dans le dossier /$LIB_DIR/ !${NC}"
    echo -e "${JAUNE}💡 Assure-toi que ton fichier 'volta-mvc.jar' s'y trouve.${NC}"
    exit 1
fi
echo -e "${VERT} -> Dépendances trouvées avec succès.${NC}"
sleep 1

# 2. Nettoyage
echo -e "\n${BLEU} Nettoyage du dossier de build...${NC}"
rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR/WEB-INF/lib"
mkdir -p "$BUILD_DIR/WEB-INF/classes"
echo -e "${VERT} -> Dossier /$BUILD_DIR/ prêt et propre.${NC}"
sleep 1

# 3. Copie des ressources web
echo -e "\n${BLEU} Copie des ressources Web...${NC}"
if [ -d "$WEB_DIR" ] && [ "$(ls -A $WEB_DIR)" ]; then
    cp -r $WEB_DIR/* "$BUILD_DIR/"
    echo -e "${VERT} -> Fichiers Web copiés.${NC}"
else
    echo -e "${JAUNE}⚠️ Attention : Le dossier $WEB_DIR est vide ou inexistant.${NC}"
fi
sleep 1

# 4. Injection des librairies
echo -e "\n${BLEU} Injection des fichiers JAR dans le Classpath...${NC}"
cp "$LIB_DIR"/*.jar "$BUILD_DIR/WEB-INF/lib/"
for jar in "$LIB_DIR"/*.jar; do
    echo -e "${CYAN}    + Ajout de : $(basename "$jar")${NC}"
done
sleep 1

# 5. 🟢 COPIE DES RESSOURCES (volta.properties, etc.) vers WEB-INF/classes/
echo -e "\n${BLEU} 📂 Copie des fichiers de configuration (Resources)...${NC}"
if [ -d "$RES_DIR" ] && [ "$(ls -A $RES_DIR)" ]; then
    cp -r "$RES_DIR"/* "$BUILD_DIR/WEB-INF/classes/"
    echo -e "${VERT} -> Fichiers de configuration copiés dans WEB-INF/classes/.${NC}"
else
    echo -e "${JAUNE}⚠️ Attention : Le dossier $RES_DIR est vide ou inexistant.${NC}"
fi
sleep 1

# 6. Compilation de tes contrôleurs d'application !
echo -e "\n${BLEU} ⚙️ Compilation des fichiers Java de l'application...${NC}"
find "$SRC_DIR" -name "*.java" > sources.txt

if [ -s sources.txt ]; then
    javac -parameters -cp "$LIB_DIR/*" -d "$BUILD_DIR/WEB-INF/classes" @sources.txt
    echo -e "${VERT} -> Compilation terminée. Classes injectées dans WEB-INF/classes/.${NC}"
else
    echo -e "${JAUNE}⚠️ Aucun fichier .java trouvé dans $SRC_DIR.${NC}"
fi
rm -f sources.txt
sleep 1

# 7. Création du livrable
echo -e "\n${BLEU} Création du livrable $APP_NAME.war...${NC}"
cd "$BUILD_DIR"
jar -cvf "../$APP_NAME.war" . > /dev/null
cd ..
sleep 1

# 8. Expédition vers Tomcat
echo -e "\n${BLEU} Expédition vers Tomcat & Redémarrage...${NC}"
cp -f "$APP_NAME.war" "$TOMCAT_WEBAPPS/"
rm -f "$APP_NAME.war" 
echo -e "${JAUNE} -> Arrêt de Tomcat...${NC}"
/opt/tomcat/bin/shutdown.sh || true
sleep 2
echo -e "${JAUNE} -> Démarrage de Tomcat...${NC}"
/opt/tomcat/bin/startup.sh
sleep 1

echo -e "\n${CYAN}==================================================${NC}"
echo -e "${VERT} 🎉 DEPLOIEMENT TERMINE AVEC SUCCES !${NC}"
echo -e "${CYAN}==================================================${NC}"
echo -e "➡️ ${BLEU}http://localhost:8080/$APP_NAME/${NC}\n"