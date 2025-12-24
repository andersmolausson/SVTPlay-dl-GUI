# SNABB UPPDATERING - Cookie-autentisering saknas i GUI

Om du inte ser "Autentisering"-avsnittet i Web GUI:t, följ dessa steg:

## Steg 1: Stoppa servern
- Gå till kommandotolken där servern körs
- Tryck `Ctrl+C` för att stoppa servern

## Steg 2: Diagnostisera (valfritt)
Dubbelklicka på `diagnose.bat` för att se vad som saknas.

ELLER gå direkt till steg 3.

## Steg 3: Hämta uppdateringarna
Öppna kommandotolken i projektmappen och kör:

```bash
git pull origin claude/svtplay-web-gui-011CUj663bMRfHVL4uGdSV5F
```

Du bör se något liknande:
```
Updating 34b1250..33c30cf
Fast-forward
 .gitignore               |   3 +
 COOKIE_AUTH_GUIDE.md     | 231 +++++++++++++++++++++++
 README.md                |  12 +-
 app.py                   |  71 +++++++
 config.py                |  11 ++
 static/js/app.js         | 100 ++++++++++
 svtplay_handler.py       |   8 +
 templates/index.html     |  84 ++++++++
 8 files changed, 514 insertions(+), 6 deletions(-)
```

## Steg 4: Starta servern igen
Dubbelklicka på `start.bat` eller kör:
```bash
start.bat
```

## Steg 5: Rensa webbläsarens cache
1. Öppna webbläsaren och gå till `http://localhost:5000`
2. Tryck `Ctrl+F5` eller `Ctrl+Shift+R` för att hårdladda sidan

## Steg 6: Verifiera
Du bör nu se ett nytt avsnitt högst upp på sidan med rubriken:
```
🔒 Autentisering (för TV4 Play Plus och andra betalväggar)
```

Med följande funktioner:
- ✅ Cookie-status-indikator
- ✅ "Ladda upp cookies.txt" fil-väljare
- ✅ "Ladda upp cookies" knapp
- ✅ "Ta bort cookies" knapp
- ✅ Instruktioner som kan expanderas

---

## Felsökning

### "git pull säger 'Already up to date'"
Detta betyder att din lokala kod REDAN är uppdaterad. Problemet är då förmodligen:
1. **Servern inte har startats om** - Kör steg 4 igen
2. **Webbläsarens cache** - Tryck `Ctrl+F5` hårdare eller:
   - Chrome: Högerklicka på Ladda om → "Töm cache och ladda om sidan"
   - Firefox: Öppna DevTools (F12) → högerklicka på Ladda om → "Töm cache"

### "Ser fortfarande inte autentiserings-avsnittet"
Kör `diagnose.bat` för att se om koden verkligen finns lokalt.

Om `diagnose.bat` säger att koden FINNS men du inte ser den:
1. Kontrollera att servern verkligen startade om (kolla i kommandotolken)
2. Prova i incognito-läge/privat fönster
3. Kontrollera webbläsarens konsol för JavaScript-fel (tryck F12)

### "git pull ger fel"
Om du ser ett fel som "You have unstaged changes", kör:
```bash
git stash
git pull origin claude/svtplay-web-gui-011CUj663bMRfHVL4uGdSV5F
```

---

## Snabbtest: Är uppdateringen installerad?

Öppna `templates/index.html` i en textredigerare och sök efter "cookieCard".

- **✅ Om du hittar det**: Koden finns! Servern behöver bara startas om.
- **❌ Om du inte hittar det**: Kör `git pull` igen.

---

## Hjälp!

Om inget av detta fungerar, berätta:
1. Vad säger `diagnose.bat`?
2. Vad händer när du kör `git pull`?
3. Ser du några felmeddelanden när servern startar?
