%dw 2.0
output application/java
---
{
  "ID": payload.ID,
  "subject": payload.subject,
  "class_period": payload.class_period
}