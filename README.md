# 📱 PassingDataBack

Этот проект был создан с учебной целью — для практики и демонстрации корректных способов обратной передачи данных между экранами (ViewController’ами) в iOS, без нарушения архитектурных принципов UIKit.

⸻

🎯 Цель проекта

Научиться правильно возвращать данные от второго экрана к первому в рамках iOS-приложения, избегая прямых связей между контроллерами и используя лучшие практики:
closure и delegate.

⸻

Что конкретно отрабатывается:
	•	Понимание навигационного стека (UINavigationController)
	•	Умение реализовать обратную связь от дочернего к родительскому экрану
	•	Применение двух основных паттернов передачи данных:
	•	Замыкание (closure)
	•	Протокол и делегат (delegate pattern)
	•	Избежание антипаттерна: childVC.firstVC = parentVC
(жёсткая связь, нарушающая SOLID и принцип низкой связанности)

⸻

Если кратко:

Этот проект — упражнение по построению обратной связи между экранами с соблюдением архитектурной чистоты и практикой ключевых iOS-паттернов.

## 🧠 Основная функия

Демонстрация **двух корректных способов обратной передачи данных** от второго экрана (`SecondViewController`) к первому (`FirstViewController`) в UIKit-проекте:

* ✅ Через **closure (замыкание)**
* ✅ Через **delegate (делегирование по протоколу)**

---

## 🗂 Структура

* `FirstViewController`

  * Содержит 2 кнопки:

    * `Open with Closure`
    * `Open with Delegate`
  * Получает случайный цвет от второго экрана и меняет свой фон.

* `SecondViewController`

  * Содержит 1 кнопку: `Change First VC Background`
  * При нажатии отправляет цвет назад через:

    * либо `onColorChange` (если closure установлен),
    * либо `delegate?.changeColor(to:)`.

* `SecondViewControllerDelegate`

  * Протокол, используемый для передачи данных через делегат.

* `SceneDelegate`

  * Запускает приложение с `FirstViewController`, обёрнутым в `UINavigationController`.

---

## ⚙️ Используемые технологии

* UIKit
* UINavigationController
* Weak references (во избежание retain cycle)
* Swift closures
* Protocols + Delegates

---

## 💡 Важно

* Второй экран **не содержит прямой ссылки** на первый ViewController (это плохая практика).
* Используются два **правильных по архитектуре способа** взаимодействия ViewController'ов.
* Проект без storyboard, всё реализовано через код.

---

# 📱 PassingDataBack (English Version)

🎯 Project Purpose

The goal of this project is to practice and demonstrate correct ways to pass data back from one screen (ViewController) to another in iOS, while respecting UIKit architectural principles and avoiding tight coupling between view controllers.

⸻

Specifically, this project focuses on:
	•	Understanding the navigation stack (UINavigationController)
	•	Learning how to pass data back from a child to a parent view controller
	•	Implementing the two main patterns of backward communication:
	•	Closure-based callback
	•	Protocol and delegate
	•	Avoiding the anti-pattern:
childVC.parentVC = parentVC
which leads to tight coupling and breaks SOLID principles.

⸻

In short:
This project is an exercise in building backward communication between view controllers using clean architecture and practicing key iOS patterns.

## 🧠 Main function

Demonstrate **two correct ways to pass data back** from a second screen (`SecondViewController`) to the first (`FirstViewController`) in a UIKit project:

* ✅ Using a **closure (callback)**
* ✅ Using a **delegate (protocol-based communication)**

---

## 🗂 Structure

* `FirstViewController`

  * Contains 2 buttons:

    * `Open with Closure`
    * `Open with Delegate`
  * Receives a random color from the second screen and applies it to its background.

* `SecondViewController`

  * Contains 1 button: `Change First VC Background`
  * On tap, sends the color back via:

    * `onColorChange` closure if set,
    * or `delegate?.changeColor(to:)`.

* `SecondViewControllerDelegate`

  * Protocol used for passing data through delegation.

* `SceneDelegate`

  * Boots the app with `FirstViewController` embedded in a `UINavigationController`.

---

## ⚙️ Technologies Used

* UIKit
* UINavigationController
* Weak references (to avoid retain cycles)
* Swift closures
* Protocols and Delegates

---

## 💡 Notes

* The second screen **does not hold a direct reference** to the first ViewController (good practice).
* Both data passing methods follow **clean architecture principles**.
* Entire app is code-based (no storyboard).

