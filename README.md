# 📱 PassingDataBack

## 🧠 Цель проекта

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

## 🧠 Project Goal

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

