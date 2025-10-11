![Last Report](https://img.shields.io/badge/Last%20Report-2025-10-12-blue?style=for-the-badge)

\# === Generate README.md for checha-reports ===

$repoRoot = "D:\\CHECHA\_CORE\\REPO"

$readme   = Join-Path $repoRoot "README.md"

$today    = (Get-Date).ToString('yyyy-MM-dd')



@"

\# 🛰️ CHECHA | UAP Reports Hub



!\[Last Report](https://img.shields.io/badge/Last%20Report-$today-blue?style=for-the-badge)



\*\*UAP Reports Hub\*\* — частина системи \*\*CHECHA\_CORE\*\*.  

Це автоматизований аналітичний вузол, який щодня генерує звіти про \*UAP-активність, динаміку системи, тренди та аномалії\* на основі даних із DataLake.



---



\## 📂 Структура




