# Toshiba Scan Manager

Application web de gestion des multifonctions Toshiba développée par **OMB Informatique**.

## Fonctionnalités

### Gestionnaire de Templates Scan
- Import, création, édition, duplication et suppression de profils de scan
- Configuration complète : format (PDF, JPEG, TIFF, DOCX, XLSX), mode couleur, recto/verso, résolution (200/300/600 DPI)
- Édition en masse des chemins SMB par groupe
- Import/Export XML compatible TopAccess Toshiba

### Générateur d'Address Book
- Conversion Excel/CSV vers format CSV TopAddress Toshiba
- Détection automatique des colonnes (email, nom, prénom, entreprise, téléphone)
- Support des colonnes combinées (ex: "DUPONT Jean")
- Dédoublonnage et validation des emails

### Testeur SMTP
- Test de connectivité SMTP pour le scan email
- Support Gmail, Office365 et serveurs personnalisés
- Test de connexion et envoi d'email de test

### Script de configuration SMB
- `Toshiba+Partage.bat` : création automatique de l'utilisateur Windows "Toshiba" et du partage `C:\Scan`

## Technologies

| Composant | Technologie |
|-----------|-------------|
| Backend | Python 3 / Flask |
| Frontend | HTML / CSS / JavaScript |
| XML | xml.etree.ElementTree |
| Excel | openpyxl |
| Design | Thème clair/sombre |

## Installation

### Prérequis
- Python 3.10+
- pip

### Installation manuelle

```bash
git clone https://github.com/reflexnpt/toshiba-scan-manager.git
cd toshiba-scan-manager
pip install -r requirements.txt
python app.py
```

L'application est accessible sur `http://localhost:5000`

### Installation Docker

```bash
docker compose up -d
```

### Déploiement Portainer

1. Créer une nouvelle stack
2. Sélectionner **Git repository**
3. Repository URL : `https://github.com/reflexnpt/toshiba-scan-manager.git`
4. Compose path : `docker-compose.yml`
5. Reference : `main`
6. Deploy the stack

## Structure du projet

```
├── app.py                    # Application principale (routes Flask)
├── addressbook.py            # Logique de conversion Excel → CSV
├── smtp_test.py              # Testeur SMTP standalone (Tkinter)
├── toshiba_template.py       # Version antérieure (XML uniquement)
├── Toshiba+Partage.bat       # Script de configuration SMB
├── requirements.txt          # Dépendances Python
├── Dockerfile                # Image Docker
├── docker-compose.yml        # Configuration Docker Compose
├── modele_xml/
│   └── template_base.xml     # XML par défaut (7 templates de scan)
├── templates/
│   ├── hub.html              # Page d'accueil
│   ├── index.html            # Gestionnaire de templates
│   ├── addressbook.html      # Générateur d'address book
│   ├── smtp_test.html        # Testeur SMTP
│   ├── parametrage.html      # Sous-hub de configuration
│   └── toshiba_scan.html     # Ancienne version du gestionnaire
└── static/
    ├── style.css             # Feuille de style (thème clair/sombre)
    ├── script.js             # Manipulation XML côté client
    ├── addressbook.js        # Script address book
    └── smtp.js               # Script SMTP
```

## Configuration du scan-to-folder

1. Exécuter `Toshiba+Partage.bat` en tant qu'administrateur sur le PC cible
2. Cela crée :
   - Utilisateur local : `Toshiba` / `T0sh!b@`
   - Dossier partagé : `C:\Scan`
3. Configurer le template avec le chemin SMB : `\\<NOM-PC>\Scan`
4. Exporter l'XML et l'importer dans le copieur via TopAccess

## Licence

Projet privé - OMB Informatique
