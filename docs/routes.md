# Routes

## Publisher

| Method | Adresse                 | Beschreibung              |
|--------|-------------------------|---------------------------|
| GET    | /publishers             | Übersichtsliste           |
| GET    | /publishers/{id}        | Detailseite               |
| GET    | /publishers/create      | Neuer Eintrag - View      |
| POST   | /publishers/            | Neuer Eintrag - Save      |
| GET    | /publishers/{id}/edit   | Eintrag bearbeiten - View |
| PATCH  | /publishers/{id}        | Eintrag bearbeiten - Save |
| GET    | /publishers/{id}/delete | Eintrag löschen - View    |
| DELETE | /publishers/{id}        | Eintrag löschen - Save    |

## Series

| Method | Adresse                           | Beschreibung                         |
|--------|-----------------------------------|--------------------------------------|
| GET    | /series                           | Übersichtsliste                      |
| GET    | /series/{id}                      | Detailseite                          |
| GET    | /series/create                    | Neuer Eintrag - View                 |
| GET    | /series/create/withPublisher/{id} | Neuer Eintrag mit Vorbelegung - View |
| POST   | /series/                          | Neuer Eintrag - Save                 |
| GET    | /series/{id}/edit                 | Eintrag bearbeiten - View            |
| PATCH  | /series/{id}                      | Eintrag bearbeiten - Save            |
| GET    | /series/{id}/delete               | Eintrag löschen - View               |
| DELETE | /series/{id}                      | Eintrag löschen - Save               |

## Issues

| Method | Adresse                           | Beschreibung                         |
|--------|-----------------------------------|--------------------------------------|
| GET    | /issues                           | Übersichtsliste                      |
| GET    | /issues/{id}                      | Detailseite                          |
| GET    | /issues/create                    | Neuer Eintrag - View                 |