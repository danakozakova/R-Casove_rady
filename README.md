
# [Projekt zo časových radov](https://github.com/danakozakova/R-Casove_rady/blob/main/Projekt_CasoveRady.pdf)
Tento projekt sa zameriava na analýzu časového radu glykémií u pacienta s diabetom 1. typu, liečeného inzulínovou pumpou s uzavretým okruhom.  Cieľom práce bolo identifikovať a modelovať časové závislosti a sezónne vzory v dátach o glykémii.  
Využila som pritom dáta z klinickej štúdie. Údaje o glykémie boli zisťované v podstate "spojite" - každých 5 minút. Pred spracovaním som ich agregovala na hodinové priemery.  Na modelovanie časového radu som použila SARIMA model. Jeho parametre som identifikovala na základe ACF, PACF a informačných kritérií.  Analýza potvrdila stacionaritu časového radu a odhalila sezónny vzor s periódou 24 hodín.  Výsledky ukázali, že model dokáže zachytiť celkový trend a sezónnosť v dátach, avšak mierne podceňuje ich variabilitu. 
Nepodarilo sa nájsť úplne vhodný SARIMA model. Myslím, že je to práve kvôli vplyvu automatickej kompenzácie v uzavretom okruhu. Tá sa spúšťa v prípade, že glykémia vybočuje zo zadaného limitu. 
Napriek tomu mi  výsledný optimalizovaný SARMA model priniesol zaujímavé vhľady o dynamike glykémií a môže slúžiť ako základ pre ďalšie výskumy a predikcie.

[03 MA procesy 1. rádu s rôznou SD](https://github.com/danakozakova/R-Casove_rady/blob/main/03-Casove-rady.R)
1. Konvergencia MA procesov 1. rádu
2. Simulácia MA procesov s rôznym parametrom pre SD 
