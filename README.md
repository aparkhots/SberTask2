# SberTask2

Зарегистрироваться на сервисе передачи данных о погоде - https://www.weatherapi.com/. Для этого нужно указать адрес электронной почты и получить токен (API Key), который используется для запросов. Бесплатный ключ действует две недели.
Документация по API - https://www.weatherapi.com/docs/.

Используя любой BDD фреймворк реализовать:
1.	Позитивный тест: 
-	Запросить текущую погоду (метод /current.json) минимум по четырем городам на свой выбор. 
-	Распарсить результат, сравнить с ожидаемыми значениями из тестового набора. Ожидаемые тестовые данные можно определить или задать для каждого города корректные, либо можно задать\сгенерировать случайным образом с соблюдением формата. 
-	Вывести расхождения по результату сравнения по каждому значению в лог.

2.	Негативный тест:
-	Получить 4 варианта ошибок из списка API Errors (на выбор), сравнить с ожидаемым результатом.
Результат выполнения тестов должен быть в отчете Allure.


# Как запустить?
Для запуска тестов используйте команду  **mvn test**
или
запустите через класс **TestRunner**

Для открытия отчета Allure используйте команду **mvn allure:serve**
