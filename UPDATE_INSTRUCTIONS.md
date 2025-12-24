# Instruktioner för att uppdatera och starta om servern

## Steg 1: Stoppa den körande servern

Om servern körs, stoppa den genom att:
- Tryck `Ctrl+C` i kommandotolken där servern körs
- Alternativt, stäng kommandotolksfönstret

## Steg 2: Hämta de senaste ändringarna

Öppna en ny kommandotolk (eller använd samma) och navigera till projektmappen:

```bash
cd C:\path\to\SVTPlay-dl-GUI
```

Hämta de senaste ändringarna från Git:

```bash
git pull origin claude/svtplay-web-gui-011CUj663bMRfHVL4uGdSV5F
```

## Steg 3: Starta om servern

### Alternativ A: Använd start.bat (enklast)

Dubbelklicka på `start.bat` eller kör:

```bash
start.bat
```

### Alternativ B: Manuell start

```bash
# Aktivera virtual environment
venv\Scripts\activate

# Starta servern
python app.py
```

## Steg 4: Öppna Web GUI

Öppna din webbläsare och gå till:
```
http://localhost:5000
```

**VIKTIGT:** Tryck `Ctrl+F5` eller `Ctrl+Shift+R` i webbläsaren för att rensa cache och ladda den senaste versionen av gränssnittet.

## Du bör nu se:

✅ Ett nytt **"Autentisering"**-avsnitt högst upp på sidan med möjlighet att ladda upp cookies

## Felsökning

### "Git pull säger already up to date"
Detta är OK - koden är redan uppdaterad. Starta bara om servern.

### "Ser fortfarande inte det nya avsnittet"
1. Kontrollera att servern startade om korrekt
2. Hårdladda om webbläsaren med `Ctrl+F5`
3. Öppna Developer Tools (`F12`) och kolla Console för eventuella fel

### "Servern startar inte"
Kontrollera att:
- Virtual environment är aktiverat (`venv\Scripts\activate`)
- Alla dependencies är installerade (`pip install -r requirements.txt`)
- Ingen annan process använder port 5000

---

## Snabb one-liner för uppdatering:

Om du vill göra allt i ett steg:

```bash
git pull && start.bat
```

Detta hämtar ändringar och startar servern automatiskt.
