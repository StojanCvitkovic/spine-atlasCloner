@ECHO off
setlocal enableDelayedExpansion

SET target_directory=%1
CD /D %target_directory%

REM Pronalaženje prve .atlas datoteke u trenutnom direktoriju
FOR /R %%F IN (*.atlas) DO (
    SET source=%%F
    GOTO found
)
:found

REM Pronalaženje .webp ili .png datoteke u trenutnom direktoriju
FOR %%W IN (*.webp *.png *.jpg *.tga *.bmp *.gif) DO (
    SET image_file=%%W
    GOTO found_image
)
:found_image

IF NOT DEFINED image_file (
    ECHO Slika nije pronadjena.
    PAUSE
    EXIT
)

REM Brojanje .json datoteka u trenutnom direktoriju
SET /a count=0
FOR %%J IN (*.json) DO (
    SET /a count+=1
)

REM Kreiranje, uređivanje i kopiranje .atlas datoteke
FOR %%J IN (*.json) DO (
    SET destination=%%~nJ
    ECHO Kreiranje, uredjivanje i kopiranje !source! u !destination!

    REM Kreiranje i uređivanje privremene .atlas datoteke
    SET temp_file=!destination!.tmp
    (
        REM Čitanje sadržaja .atlas datoteke i zamjena prve linije s nazivom .webp ili .png datoteke
        SET "first_line="
        FOR /F "usebackq delims=" %%A IN ("!source!") DO (
            IF NOT DEFINED first_line (
                ECHO !image_file!
                SET "first_line=1"
            ) ELSE (
                ECHO %%A
            )
        )
    ) > "!temp_file!"

    REM Brisanje originalne .atlas datoteke
    DEL "!source!"

    REM Promjena ekstenzije .tmp datoteke u .atlas
    REN "!temp_file!" "*.atlas"

    REM Dupliciranje .atlas datoteke za svaki .json file
    FOR %%K IN (*.json) DO (
        COPY "!destination!.atlas" "%%~nK.atlas"
    )
    ECHO Kreirano atlasa: !count!
    
    REM Brisanje privremene .tmp datoteke
    DEL "!destination!.tmp"
)
PAUSE
