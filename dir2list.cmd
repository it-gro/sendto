pushd "%~1"
if exist index.md (
   rename  index.md index.%date:.=%.bak
)
for /f %%A in ('dir /a-d/b "*.m*"') do (
    for /f "tokens=1* delims=:" %%B in ('type "%%A"^| findstr /b title:') do (
        for /f "tokens=*" %%D in ("%%C") do (
            for /f "delims='" %%E in ("%%~D") do (
                echo - [%%E](%%~nA/^)>>index.md
                echo.>>index.md
            )
        )
    )
)
pause
