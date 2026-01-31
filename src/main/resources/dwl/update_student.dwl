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
    "course": inboundData.course default payload.course,
    "gender": inboundData.gender default payload.gender
}