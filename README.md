<div align="center">

<img src="static/logo_disquette.png" alt="Logo" width="100">

# Toshiba Scan Manager

**Application web de gestion des multifonctions Toshiba**

Développé par **OMB Informatique**

[![GitHub issues](https://img.shields.io/github/issues/reflexnpt/toshiba-scan-manager?style=for-the-badge)](https://github.com/reflexnpt/toshiba-scan-manager/issues)
[![GitHub forks](https://img.shields.io/github/forks/reflexnpt/toshiba-scan-manager?style=for-the-badge)](https://github.com/reflexnpt/toshiba-scan-manager/network)
[![GitHub stars](https://img.shields.io/github/stars/reflexnpt/toshiba-scan-manager?style=for-the-badge)](https://github.com/reflexnpt/toshiba-scan-manager/stargazers)
[![GitHub license](https://img.shields.io/github/license/reflexnpt/toshiba-scan-manager?style=for-the-badge)](https://github.com/reflexnpt/toshiba-scan-manager/blob/main/LICENSE)

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Flask](https://img.shields.io/badge/Flask-000000?style=for-the-badge&logo=flask&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)

</div>

---

## Fonctionnalites

### :printer: Gestionnaire de Templates Scan
- Import, creation, edition, duplication et suppression de profils de scan
- Configuration complete : format (PDF, JPEG, TIFF, DOCX, XLSX), mode couleur, recto/verso, resolution (200/300/600 DPI)
- Edition en masse des chemins SMB par groupe
- Import/Export XML compatible TopAccess Toshiba

### :busts_in_silhouette: Generateur d'Address Book
- Conversion Excel/CSV vers format CSV TopAddress Toshiba
- Detection automatique des colonnes (email, nom, prenom, entreprise, telephone)
- Support des colonnes combinees (ex: "DUPONT Jean")
- Dedoublonnage et validation des emails

### :incoming_envelope: Testeur SMTP
- Test de connectivite SMTP pour le scan email
- Support Gmail, Office365 et serveurs personnalises
- Test de connexion et envoi d'email de test

### :wrench: Script de configuration SMB
- `Toshiba+Partage.bat` : creation automatique de l'utilisateur Windows "Toshiba" et du partage `C:\Scan`

---

## Apercu

<div align="center">

| Template Manager | Address Book | SMTP Test |
|:---:|:---:|:---:|
| ![Templates](https://img.shields.io/badge/Templates-Scan-blue?style=for-the-badge) | ![Address Book](https://img.shields.io/badge/Address-Book-green?style=for-the-badge) | ![SMTP](https://img.shields.io/badge/SMTP-Test-orange?style=for-the-badge) |

</div>

---

## Installation

### Pre requis

![Python](https://img.shields.io/badge/Python-3.10+-3776AB?style=flat&logo=python&logoColor=white)

### :computer: Installation manuelle

```bash
git clone https://github.com/reflexnpt/toshiba-scan-manager.git
cd toshiba-scan-manager
pip install -r requirements.txt
python app.py
```

L'application est accessible sur `http://localhost:5000`

### :whale: Installation Docker

```bash
docker compose up -d
```

### :ship: Deploiement Portainer

1. Creer une nouvelle stack
2. Selectionner **Git repository**
3. Remplir les champs :

| Champ | Valeur |
|-------|--------|
| Repository URL | `https://github.com/reflexnpt/toshiba-scan-manager.git` |
| Compose path | `docker-compose.yml` |
| Reference | `main` |

4. **Deploy the stack**

---

## Technologies

<div align="center">

| Composant | Technologie | Logo |
|-----------|-------------|------|
| Backend | Python 3 / Flask | ![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white) ![Flask](https://img.shields.io/badge/Flask-000000?style=flat&logo=flask&logoColor=white) |
| Frontend | HTML / CSS / JavaScript | ![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=html5&logoColor=white) ![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=css3&logoColor=white) ![JS](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=javascript&logoColor=black) |
| XML | xml.etree.ElementTree | - |
| Excel | openpyxl | - |
| Conteneurisation | Docker | ![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white) |

</div>

---

## Structure du projet

```
toshiba-scan-manager/
├── app.py                    # Application principale (routes Flask)
├── addressbook.py            # Logique de conversion Excel -> CSV
├── smtp_test.py              # Testeur SMTP standalone (Tkinter)
├── toshiba_template.py       # Version anterieure (XML uniquement)
├── Toshiba+Partage.bat       # Script de configuration SMB
├── requirements.txt          # Dependances Python
├── Dockerfile                # Image Docker
├── docker-compose.yml        # Configuration Docker Compose
├── modele_xml/
│   └── template_base.xml     # XML par defaut (7 templates de scan)
├── templates/
│   ├── hub.html              # Page d'accueil
│   ├── index.html            # Gestionnaire de templates
│   ├── addressbook.html      # Generateur d'address book
│   ├── smtp_test.html        # Testeur SMTP
│   ├── parametrage.html      # Sous-hub de configuration
│   └── toshiba_scan.html     # Ancienne version du gestionnaire
└── static/
    ├── style.css             # Feuille de style (theme clair/sombre)
    ├── script.js             # Manipulation XML cote client
    ├── addressbook.js        # Script address book
    └── smtp.js               # Script SMTP
```

---

## Configuration du scan-to-folder

| Etape | Action |
|:-----:|--------|
| 1 | Executer `Toshiba+Partage.bat` en tant qu'administrateur |
| 2 | Cela cree l'utilisateur `Toshiba` / `T0sh!b@` et le dossier `C:\Scan` |
| 3 | Configurer le template avec le chemin SMB : `\\<NOM-PC>\Scan` |
| 4 | Exporter l'XML et l'importer dans le copieur via TopAccess |

---

## Auteurs

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/reflexnpt">
        <img src="https://github.com/reflexnpt.png" width="100px;" alt=""/>
        <br /><sub><b>Frederic CAINDRY</b></sub>
      </a>
      <br />
      <sub>OMB Informatique</sub>
    </td>
  </tr>
</table>

---

<div align="center">

**Prodeveloppe avec :heart: par [OMB Informatique](https://omb-informatique.fr)**

</div>
