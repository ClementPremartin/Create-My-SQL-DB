# Mise en place d'une base de données

## MY SQL dans Docker

Démarrer une base de données MySql et un client Adminer accessible par l'hôte sur http://localhost:8090

```bash
docker compose up
```

Accéder à la console CLI de la base de données :

```bash
docker compose exec db mysql -h localhost -u user -p db
```

# Checkpoint </br>

## Base de données </br>

Dans cet exercice il s'agira d'abord de modéliser puis de créer la base de données d'un job board.

Un job board est un site internet qui permet aux entreprises de publier des offres d'emploi.

Voici les contraintes de la base de données du job board :

- Un recruteur peut s'enregistrer sur le site
- Une fois enregistré il peut créer une seule entreprise
- Il peut ensuite publier des offres au nom de l'entreprise

- Un candidat peut s'enregistrer sur le site
- Une fois enregistré il peut consulter les offres
- Il peut ensuite candidater à des offres

- Le candidat peut retrouver toutes les entreprises auxquelles il a candidaté
- Le recruteur peut retrouver les informations des candidats qui ont postulé à une offre

Un recruteur a les attributs suivants :

- login
- mot de passe

Un candidat a les attributs suivants :

- login
- mot de passe
- nom
- prénom
- email
- numéro de téléphone
- texte de présentation

Une entreprise a les attributs suivants :

- nom
- description

Une offre a les attributs suivants :

- titre du poste
- descriptif du poste
- ville du poste

### 3.1 Modélisation

Modélise le MPD de la base de données, https://www.dbdesigner.net/ te permettra d'exporter le schéma de base de données au format SQL.
Ma modélisation : </br>
https://erd.dbdesigner.net/designer/schema/1684765711-job-board
<br/>

### 3.2 SQL

Dans Postgres, SQLite ou tout autre SGBD de ton choix, crée la base de données avec le schéma obtenu et remplis-la avec des données fictives.

Écris ensuite les requêtes SQL permettant d'obtenir les données suivantes :

- Toutes les offres d'emploi:

```sql
SELECT * from offer;
```

- Toutes les offres d'emploi d'une ville (Paris)

```sql
SELECT * from offer WHERE city='Paris';
```

- Les informations de tous candidats qui ont postulé à une offre précise

```sql
SELECT email, lastname, firstname, phone presentation FROM candidate
LEFT JOIN offer_application AS a ON a.candidate_id=candidate.id
WHERE a.offer_id=2;
```

- Les informations de tous les candidats qui ont postulé aux offres d'une entreprise

```sql
SELECT  email, lastname, firstname, phone presentation FROM candidate
INNER JOIN offer_application AS a ON a.candidate_id=candidate.id
INNER JOIN offer AS o ON a.offer_id=o.id
WHERE company_id.id=1;
```

et de modifier les données suivantes :

- Modifier le numéro de téléphone et le texte de présentation d'un candidat

```sql
UPDATE candidate SET phone='0625635674', presentation='this is a nice presentation' WHERE candidate.id=1;
```

- Supprimer toutes les offres d'une entreprise </br>

```sql
DELETE FROM offer
WHERE company_id=1;
```

