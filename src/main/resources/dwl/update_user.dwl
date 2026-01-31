%dw 2.0
output application/java
var inboundData = if(sizeOf(vars.inbound) as Number > 0) vars.inbound else {}
var id = if(inboundData.id != payload.id) inboundData.id else payload.id
---
{
	"id": vars.key.'key',
    "new_ID": id,
    "name": inboundData.name default payload.name,
    "address": inboundData.address default payload.address,
    "user_type": inboundData.user_type default payload.user_type,
    "gender": inboundData.course default payload.gender,
    "username": inboundData.username default payload.username,
    "password": inboundData.password default payload.password
}