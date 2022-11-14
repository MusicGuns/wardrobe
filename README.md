# Wardrobe

### Table of Contents

[About](#about)

[How to add new clothes](#edit)

[How to use](#use)

<a name="about"><h3>About</h3></a>

This is a simple Wardrobe console program that helps you pick up clothes for the weather

### View
```
Введите температуру
3
Вот ваш сегодняшний лук
Для вас нету вещей типа (головной убор)
брюки (штаны), -10..5
Шерстяные трусы (трусы), -5..20
```
___

<a name="edit"><h3>How to add new clothes</h3></a>

Create a txt file in the folder "data" with any name

Specify the content without comment

Before creating the file, look at the types of clothes that are given in other files, so that you are not offered to wear a cap and a cap at the same time today

#### File Contents

```
кепка # name
головной убор # type_cloth
(5,20) # temperature range
```
___

<a name="use"><h3>How to use</h3></a>
---------------
First of all **Ruby** & **Git** must be installed (on Debian based):
```
sudo apt install ruby git
```
clone repo: 
```
git clone https://github.com/moonmeander47/wardrobe.git && cd hangman
```
run:
```
ruby main.rb
```


