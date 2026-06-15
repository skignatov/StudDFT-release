п»ї# StudDFT

Scientific-educational quantum chemistry program implementing HF and DFT
(RHF/RKS/UHF/UKS) with ECP support, analytical gradients, and
Hessians. Written in Fortran 2008, built with Intel Fortran.
Parallelization with OpenMP. Current build is StudDFT.exe, release x64 for Win7/10/11
See manual \StudDFT\docs\StudDFT_MANUAL.md for input file format and further detail.

## Features
- RHF/UHF, RKS/UKS, MP2/UMP2/PUMP2 calculations
- LDA and GGA functionals (SVWN, BLYP, BP86, BPW91, PBE, B3LYP, PBE0)
- Cartesian and spherical basis sets with optional ECPs
- SP energy, geometry optimization, frequency calculations, PES scanning
- Analytical energy gradients and Hessians

## Start calculations (Windows)

1. Click on the file `StudDFT_win_x64.zip` to get inside and push the button `Downoad raw file` on the right. 
   Place the file to your local disk and unzip it. 
   You will have directory like `c:\StudDFT` on your computer with programs inside. 
   Do not put this directory to the secured Windows folders like "Program Files", folders with cyrillic symbols in their names etc.

2. Run `set_user_environment.bat` to set up PATH and STUDDFT environment variables for current user
  (you also can set them up manually with the directory name where the program residues. Probably, new terminal/window should be started to find the changes)

3. If needed, open sd.bat with any ASCII text editor (Far, Notepad, WordPad, ...) and correct the OMP variables for your computer: 

      set OMP_NUM_THREADS=4       <-- set number of cores on your processor

      set OMP_STACKSIZE=64M       <-- set reasonable OMP stack size (32M, 64M, 128M ...)

5. Go to your working directory (with your input file `your_molecule.inp` ) and run the program:

    sd yourfile.inp

   After successful run the output file `your_molecule.log` will appear.

### РќР°С‡Р°Р»Рѕ СЂР°СЃС‡РµС‚РѕРІ (Windows)

1. Р©РµР»РєРЅРёС‚Рµ РїРѕ С„Р°Р№Р»Сѓ `StudDFT_win_x64.zip`, С‡С‚РѕР±С‹ РѕС‚РєСЂС‹С‚СЊ РµРіРѕ, Рё РЅР°Р¶РјРёС‚Рµ РєРЅРѕРїРєСѓ `Download raw file` СЃРїСЂР°РІР°.
   РЎРєРѕРїРёСЂСѓР№С‚Рµ zip-С„Р°Р№Р» РЅР° Р»РѕРєР°Р»СЊРЅС‹Р№ РґРёСЃРє Рё СЂР°СЃРїР°РєСѓР№С‚Рµ РµРіРѕ РІ РїР°РїРєСѓ СЃ РїСЂРѕСЃС‚С‹Рј РёРјРµРЅРµРј, РЅР°РїСЂРёРјРµСЂ, `c:\StudDFT`.
   РќРµ СЂР°Р·РјРµС‰Р°Р№С‚Рµ СЌС‚РѕС‚ РєР°С‚Р°Р»РѕРі РІ Р·Р°С‰РёС‰РµРЅРЅС‹С… РїР°РїРєР°С… Windows, С‚Р°РєРёС… РєР°Рє "Program Files", РїР°РїРєР°С… СЃ СЂСѓСЃСЃРєРёРјРё СЃРёРјРІРѕР»Р°РјРё РІ РЅР°Р·РІР°РЅРёСЏС… Рё С‚. Рґ.

2. Р—Р°РїСѓСЃС‚РёС‚Рµ `set_user_environment.bat`, С‡С‚РѕР±С‹ РЅР°СЃС‚СЂРѕРёС‚СЊ РїРµСЂРµРјРµРЅРЅС‹Рµ СЃСЂРµРґС‹ PATH Рё STUDDFT РґР»СЏ С‚РµРєСѓС‰РµРіРѕ РїРѕР»СЊР·РѕРІР°С‚РµР»СЏ.
  (Р’С‹ С‚Р°РєР¶Рµ РјРѕР¶РµС‚Рµ Р·Р°РґР°С‚СЊ PATH Рё STUDDFT РІСЂСѓС‡РЅСѓСЋ РІ РЅР°СЃС‚СЂРѕР№РєР°С… Windows, СѓРєР°Р·Р°РІ РёРјСЏ РєР°С‚Р°Р»РѕРіР°, РіРґРµ РЅР°С…РѕРґРёС‚СЃСЏ РїСЂРѕРіСЂР°РјРјР°. 
   Р’РѕР·РјРѕР¶РЅРѕ, РїРѕС‚СЂРµР±СѓРµС‚СЃСЏ РѕС‚РєСЂС‹С‚СЊ РЅРѕРІРѕРµ РѕРєРЅРѕ С‚РµСЂРјРёРЅР°Р»Р°, С‡С‚РѕР±С‹ РёР·РјРµРЅРµРЅРёСЏ РІСЃС‚СѓРїРёР»Рё РІ РґРµР№СЃС‚РІРёРµ.

3. РџСЂРё РЅРµРѕР±С…РѕРґРёРјРѕСЃС‚Рё РѕС‚РєСЂРѕР№С‚Рµ sd.bat РІ Р»СЋР±РѕРј С‚РµРєСЃС‚РѕРІРѕРј СЂРµРґР°РєС‚РѕСЂРµ ASCII (Far, Notepad, WordPad Рё С‚.Рґ.) Рё РѕС‚СЂРµРґР°РєС‚РёСЂСѓР№С‚Рµ РїРµСЂРµРјРµРЅРЅС‹Рµ OpenMP 
   РґР»СЏ РїР°СЂР°Р»Р»РµР»СЊРЅРѕР№ СЂР°Р±РѕС‚С‹ РїСЂРѕРіСЂР°РјРјС‹ РЅР° РІР°С€РµРј РєРѕРјРїСЊСЋС‚РµСЂРµ:

   set OMP_NUM_THREADS=4 <-- СѓСЃС‚Р°РЅРѕРІРёС‚Рµ РєРѕР»РёС‡РµСЃС‚РІРѕ СЏРґРµСЂ РЅР° РІР°С€РµРј РїСЂРѕС†РµСЃСЃРѕСЂРµ (1, 4, 8,...)

   set OMP_STACKSIZE=64M <-- СѓСЃС‚Р°РЅРѕРІРёС‚Рµ СЂР°Р·СѓРјРЅС‹Р№ СЂР°Р·РјРµСЂ СЃС‚РµРєР° OpenMP (32M, 64M, 128M, ...)

5. РџРµСЂРµР№РґРёС‚Рµ РІ СЃРІРѕР№ СЂР°Р±РѕС‡РёР№ РєР°С‚Р°Р»РѕРі (СЃ РІР°С€РёРј РІС…РѕРґРЅС‹Рј С„Р°Р№Р»РѕРј `your_molecule.inp`) Рё Р·Р°РїСѓСЃС‚РёС‚Рµ РїСЂРѕРіСЂР°РјРјСѓ:

   sd your_molecule.inp

РџРѕСЃР»Рµ СѓСЃРїРµС€РЅРѕРіРѕ РІС‹РїРѕР»РЅРµРЅРёСЏ РїРѕСЏРІРёС‚СЃСЏ С„Р°Р№Р» c СЂРµР·СѓР»СЊС‚Р°С‚Р°РјРё СЂР°СЃС‡РµС‚Р° `your_molecule.log`.


## Documentation
See `Short Manual_v_0_82_1.pdf` for the keyword list of StudDFT.
See `docs/` for additional documentation.
See `examples/` for sample inputs.
Download and unpack `tests` to check the test results for 50+ molecules with various methods.

