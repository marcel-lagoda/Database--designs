# Projekt 1

---------------------------------------------------------------
Stwórz bazę danych do poniższego opisu:
Hurtownia z ubraniami XYZ potrzebuje bazy danych do monitorowania zamówień i płatności.

Baza powinna gromadzić informacje o produktach (każdy produkt ma swoją cenę netto, podatek VAT i może posiadać kilkuzdaniowy opis) oraz klientach.

Każdy z klientów tej hurtowni ma odpowiedni rabat: 30%, 40% lub 50%. Rabat jest zawsze przyznawany na cały asortyment. Każdy klient jest firmą, która posiada numer NIP i do każdego klienta może być przypisanych wiele osób kontaktowych.

Każda osoba kontaktowa musi mieć adres e-mail i może mieć numer telefonu.

Klienci mogą dokonywać wielu zamówień, ale płacą jednorazowo za jedno lub wiele zamówień. Przykładowo, klient zamawia 10 sukienek za 60zł/szt., 5 par butów za 100zł/para i 3
bluzki za 20zł/szt., a może zapłacić tylko raz kwotą 1160zł lub np. W dwóch po 580zł.

Potrzebna jest baza danych, która:

* Będzie przechowywać dane o klientach, osobach kontaktowych oraz rabatach.
* Będzie przechowywać informację o produktach.
* Będzie przechowywać zamówienia klientówBędzie przechowywać płatności klientów i powiązania tych płatności z zamówieniami.

![db_schema](./images/db_schema.png)
