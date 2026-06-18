# Assembly Code Error Analysis



## Error Summary Table

| # | Location | Error | Fix |
|---|---|---|---|
| 1 | `N1 DB 37,` | Trailing comma after value | Remove the comma |
| 2 | `SUM DB 'THE SUM IS'` | Missing `'$'` string terminator | Add `', '$'` at the end |
| 3 | Throughout entire file | Fullwidth Unicode `：` and `，` used | Replace with ASCII `:` and `,` |
| 4 | `MOV DX, OFFSEG SUM` | Typo: `OFFSEG` is not a directive | Change to `OFFSET` |
| 5 | `CHANG：PROC` | Colon before `PROC` | Remove the colon |
| 6 | `ROR BH, 1` | Wrong rotation direction | Change to `ROL BH, 1` |
| 7 | `CHANG：ENDP` | Colon before `ENDP` | Remove the colon |

---
