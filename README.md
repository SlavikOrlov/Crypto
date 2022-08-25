# Crypto

## Проект "Cryptocurrency wallet"

**Структура приложения:**
1. LaunchScreen
2. Регистрация
3. TabBar
    * Главная
    * Профиль
4. Сортировка
5. Детально

[URL для запроса информации](https://data.messari.io/api/v1/assets)

## Описание:
- [X] Приложение реализовано стандартными библиотеками (UIKit, SnapKit)
- [X] Экран регистрации/RegistrationViewController 
(Логин и пароль задан константами; Сообщение об ошибке при неверном логине/пароле; Расширения клавиатуры)
- [X] Главный экран/WalletViewController
(UITableView со списком криптовалют. В ячейках хранятся названия криптовалюты, цена и изменения за сутки)
- [X] Экран сортировки/SortViewController
(UITableView с вариантами сортировки: Drop in a day ↓ / Increase per day ↑
- [X] Экран детальной информации/DetailInfoViewController
- [X] Экран профиля/ProfileViewController
(Возможность выйти из учетной записи. При нажатии на "LogOut", будет запущен экран регистрации)

**Примеры экранов:**

<img width="200" alt="Снимок экрана 2022-08-25 в 23 33 23" src="https://user-images.githubusercontent.com/99760600/186769230-00b77a35-a170-42bb-bf9f-067c1f04cbd2.png">
<img width="200" alt="Снимок экрана 2022-08-25 в 23 33 58" src="https://user-images.githubusercontent.com/99760600/186769285-03bb8753-4286-43c0-9884-4256a7e8eeef.png">
<img width="200" alt="Снимок экрана 2022-08-25 в 23 34 13" src="https://user-images.githubusercontent.com/99760600/186769345-5592aea7-4f6a-4250-a6bf-c38435b603ad.png">
<img width="200" alt="Снимок экрана 2022-08-25 в 23 34 24" src="https://user-images.githubusercontent.com/99760600/186769404-48f332af-d461-4d29-bef5-4cffda8d18e4.png">
<img width="200" alt="Снимок экрана 2022-08-25 в 23 35 07" src="https://user-images.githubusercontent.com/99760600/186769409-601b2e1d-51da-468e-9ddf-9fac7d3d6a66.png">
<img width="200" alt="Снимок экрана 2022-08-25 в 23 34 47" src="https://user-images.githubusercontent.com/99760600/186769413-6006960f-af07-4a9f-8e42-e0b3458ee1c5.png">
