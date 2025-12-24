# Guide: Ladda ner från TV4 Play Plus och andra betalväggar

Den här guiden visar hur du laddar ner innehåll från TV4 Play Plus och andra sajter som kräver inloggning.

## Översikt

För att ladda ner innehåll som ligger bakom paywall (t.ex. TV4 Play Plus) behöver du exportera cookies från din webbläsare där du är inloggad. Dessa cookies används sedan av svtplay-dl för att autentisera nedladdningar.

## Steg 1: Exportera cookies från din webbläsare

### Metod 1: Använd "Get cookies.txt LOCALLY" (Rekommenderas)

Detta är det enklaste sättet och fungerar för de flesta webbläsare.

#### För Chrome/Edge:
1. Installera tillägget [Get cookies.txt LOCALLY](https://chrome.google.com/webstore/detail/get-cookiestxt-locally/cclelndahbckbenkjhflpdbgdldlbecc)
2. Gå till [TV4 Play](https://www.tv4play.se/) och logga in
3. Klicka på tilläggsikonen i verktygsfältet
4. Välj "Export" eller "Export as cookies.txt"
5. Spara filen som `cookies.txt`

#### För Firefox:
1. Installera tillägget [cookies.txt](https://addons.mozilla.org/en-US/firefox/addon/cookies-txt/)
2. Gå till [TV4 Play](https://www.tv4play.se/) och logga in
3. Klicka på tilläggsikonen
4. Välj "Current Site" för att bara exportera cookies från TV4 Play
5. Spara filen som `cookies.txt`

### Metod 2: Använd EditThisCookie (Chrome/Edge)

1. Installera [EditThisCookie](https://chrome.google.com/webstore/detail/editthiscookie/fngmhnnpilhplaeedifhccceomclgfbg)
2. Gå till [TV4 Play](https://www.tv4play.se/) och logga in
3. Klicka på EditThisCookie-ikonen
4. Klicka på "Export" längst ner i menyn (välj Netscape-format)
5. Kopiera innehållet
6. Skapa en textfil `cookies.txt` och klistra in innehållet
7. Spara filen

### Metod 3: Manuell export med webbläsarens Developer Tools (Avancerat)

#### Chrome/Edge:
1. Gå till [TV4 Play](https://www.tv4play.se/) och logga in
2. Tryck `F12` för att öppna Developer Tools
3. Gå till fliken "Application"
4. Under "Storage" → "Cookies" → välj "https://www.tv4play.se"
5. Du kan se alla cookies här, men det är enklare att använda ett tillägg

## Steg 2: Ladda upp cookies till Web GUI

1. Öppna SVTPlay-dl Web GUI i din webbläsare
2. Längst upp på sidan ser du avsnittet **"Autentisering"**
3. Klicka på "Välj fil" och välj din `cookies.txt`
4. Klicka på **"Ladda upp cookies"**
5. Du bör se ett meddelande att cookies är uppladdade

När cookies är uppladdade visas:
```
✅ Cookies är uppladdade och aktiva. Senast uppdaterad: [datum]
```

## Steg 3: Ladda ner innehåll

Nu kan du ladda ner innehåll från TV4 Play Plus som vanligt:

1. Kopiera URL:en till programmet du vill ladda ner
   - Exempel: `https://www.tv4play.se/program/xxxxx`
2. Klistra in URL:en i "Video-URL" fältet
3. Välj om du vill ladda ner ett enskilt avsnitt eller hela säsongen
4. Klicka "Starta nedladdning"

Cookies kommer automatiskt att användas för autentisering.

## Felsökning

### "Nedladdningen misslyckas fortfarande"

1. **Kontrollera att du är inloggad:** Gå till TV4 Play i samma webbläsare och kontrollera att du är inloggad
2. **Uppdatera cookies:** Cookies kan bli gamla. Exportera och ladda upp dem igen
3. **Logga ut och in igen:** Logga ut från TV4 Play, logga in igen, och exportera nya cookies
4. **Kontrollera prenumeration:** Se till att du har en aktiv TV4 Play Plus-prenumeration

### "Cookies verkar inte fungera"

1. **Kontrollera filformatet:** Cookies-filen måste vara i Netscape-format (vanlig textfil)
2. **Kontrollera filinnehållet:** Öppna `cookies.txt` i en textredigerare. Den ska börja med något liknande:
   ```
   # Netscape HTTP Cookie File
   .tv4play.se    TRUE    /    FALSE    1234567890    cookie_name    cookie_value
   ```
3. **Exportera från rätt sajt:** Se till att du exporterar cookies från tv4play.se (inte från andra sajter)

### "Cookies är för gamla"

Cookies har en begränsad livslängd. Om du får felmeddelanden om autentisering:
1. Logga in på TV4 Play igen i din webbläsare
2. Exportera nya cookies
3. Ladda upp de nya cookies i Web GUI

**Tips:** Exportera och ladda upp nya cookies var 7:e dag för bästa resultat.

## Säkerhet och integritet

### Viktigt att veta:

- **Cookies innehåller känslig information:** Dina cookies ger åtkomst till ditt TV4 Play-konto
- **Dela aldrig cookies:** Ge aldrig din cookies-fil till andra
- **Lokal lagring:** Cookies lagras endast på din server i mappen `cookies/`
- **Automatisk användning:** Cookies används automatiskt för alla nedladdningar när de finns

### För att ta bort cookies:

1. Gå till Web GUI
2. I "Autentisering"-avsnittet, klicka på **"Ta bort cookies"**
3. Bekräfta att du vill ta bort dem

Alternativt kan du manuellt ta bort filen:
```bash
# Windows
del cookies\cookies.txt

# Linux/Mac
rm cookies/cookies.txt
```

## Vilka sajter fungerar?

Cookies fungerar för:
- ✅ TV4 Play Plus (betalinnehåll)
- ✅ SVT Play (gratis men vissa program kan vara geo-blockerade)
- ✅ Andra svenska streamingsajter som kräver inloggning

**Obs:** DRM-skyddat innehåll kan fortfarande inte laddas ner, även med cookies.

## Andra alternativ: Token (mindre tillförlitligt)

Tidigare kunde man använda token-baserad autentisering, men detta fungerar inte lika bra längre. Cookie-metoden är **mycket mer tillförlitlig**.

Om du ändå vill prova token-metoden:
1. Se instruktionerna under "Token"-fältet i Web GUI
2. Cookies har företräde - om cookies finns används de istället för token

## Support

Om du fortsatt har problem:
1. Kontrollera att svtplay-dl är uppdaterat: `pip install --upgrade svtplay-dl`
2. Testa nedladdning via kommandoraden för att verifiera att det fungerar:
   ```bash
   svtplay-dl --cookies cookies/cookies.txt [URL]
   ```
3. Öppna en issue på GitHub med felmeddelandet

## Exempel: Komplett workflow

1. **Logga in på TV4 Play** i Chrome
2. **Installera "Get cookies.txt LOCALLY"** från Chrome Web Store
3. **Klicka på tilläggsikonen** och välj "Export"
4. **Spara som** `cookies.txt`
5. **Öppna SVTPlay-dl Web GUI**
6. **Ladda upp** `cookies.txt` i "Autentisering"-avsnittet
7. **Kopiera URL** från ett TV4 Play Plus-program
8. **Klistra in URL**, välj kvalitet och nedladdningstyp
9. **Klicka "Starta nedladdning"**
10. **Vänta** - programmet laddas ner automatiskt!

---

**Lycka till med dina nedladdningar! 🎬**
