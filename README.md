# Szablon Pracy Dyplomowej AGH (WIMiIP) 🎓

Nieoficjalna klasa LaTeX zgodna z wymogami edytorskimi Wydziału Inżynierii Metali i Informatyki Przemysłowej (WIMiIP) Akademii Górniczo-Hutniczej w Krakowie.

Szablon został dostosowany do wytycznych na rok akademicki **2025/2026**.

## ✨ Cechy klasy
* **Czcionka:** Times New Roman (pakiet `newtxtext`) - tekst podstawowy 12pt.
* **Układ:** Marginesy 2cm + 1cm na oprawę, interlinia 1.5.
* **Strona tytułowa:** Zgodna z nowym wzorem (Logotypy, wielkie litery).
* **Bibliografia:** Nowoczesny silnik `biblatex` (Biber).
* **Kod źródłowy:** Skonfigurowane środowisko `listings` z kolorowaniem składni.

---

## 🚀 Jak zacząć?

Masz dwie proste metody, aby rozpocząć pisanie pracy na bazie tego szablonu.

### Metoda 1: Pobranie (Dla każdego)
1. Kliknij zielony przycisk **<> Code** na górze strony.
2. Wybierz **Download ZIP**.
3. Rozpakuj folder na swoim komputerze.
4. Otwórz plik `main.tex` w swoim edytorze LaTeX i zacznij pisać!

### Metoda 2: GitHub Fork (Dla znających Gita)
1. Kliknij przycisk **Fork** w prawym górnym rogu tej strony.
2. Utworzysz w ten sposób własną kopię tego repozytorium na swoim koncie.
3. Sklonuj swoje nowe repozytorium: `git clone https://github.com/TWOJA-NAZWA/agh-wimiip-thesis.git`

---

## 📄 Jak używać? (Konfiguracja `main.tex`)

Głównym plikiem pracy jest `main.tex`. Klasa `thesis.cls` powinna znajdować się w tym samym folderze (lub w podkatalogu, jeśli zmienisz ścieżkę).

☁️ Integracja z Overleaf
Ten szablon działa bezproblemowo w Overleaf.

Pobierz to repozytorium jako ZIP (patrz wyżej).

Zaloguj się do Overleaf.

Kliknij New Project -> Upload Project.

Wrzuć pobrany plik ZIP.

Gotowe! Projekt się skompiluje.

Wskazówka: W Overleaf upewnij się, że w ustawieniach projektu (Menu -> Compiler) wybrany jest TeX Live version 2023 (lub nowszy), aby obsłużyć wszystkie pakiety.

📚 Zarządzanie bibliografią (JabRef)
Do wygodnego tworzenia pliku bibliografia.bib zalecany jest darmowy program JabRef.

Pobierz i zainstaluj JabRef.

Utwórz w nim nowy plik i zapisz jako bibliografia.bib w folderze z pracą.

Dodawanie źródeł:

Kliknij ikonę plusa lub wklej link DOI/ISBN, aby pobrać dane automatycznie.

Uzupełnij brakujące pola (Autor, Tytuł, Rok).

Cytowanie w tekście:

Każda pozycja ma tzw. Citation Key (kluczyk), np. Kowalski2025.

W tekście pracy wpisz: \cite{Kowalski2025}.

Po zapisaniu pliku .bib, LaTeX automatycznie wygeneruje bibliografię.

🐙 Połączenie GitHub + Overleaf (Opcjonalne)
Jeśli chcesz trzymać kopię zapasową na GitHubie, a pisać w Overleaf:

Zrób Fork tego repozytorium na swoje konto GitHub.

W Overleaf utwórz nowy projekt wybierając Import from GitHub.

Wybierz swoje zforkowane repozytorium.

Teraz możesz synchronizować zmiany przyciskiem Menu -> GitHub w Overleaf.

⚖️ Licencja
Ten szablon jest dostępny na licencji MIT. Możesz go dowolnie modyfikować i używać do swojej pracy dyplomowej.


***

### Pro Tip dla Ciebie (Jako właściciela repozytorium)

Aby ułatwić innym życie jeszcze bardziej, wejdź w ustawienia swojego repozytorium na GitHubie (**Settings** -> **General**) i zaznacz opcję:

**[x] Template repository**

Dzięki temu na głównej stronie Twojego repozytorium, zamiast zwykłego "Fork", poj
