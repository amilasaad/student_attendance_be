%dw 2.0
output application/java
var dateTime = now() as String {format: 'yyyy-MM-dd hh:mm:ss a'}
var inboundData = if(sizeOf(vars.inbound) as Number > 0) vars.inbound else {}
fun returnAttendance(data: Any) =
    if(data is Array) data filter ((item, index) -> item.record_no ~= inboundData.record_no) reduce ($$ ++ $) else payload
var dbPayload = if(sizeOf(payload) as Number > 0) returnAttendance(payload) else {}
var in = if(inboundData.in ~= '1') dateTime else dbPayload.in
var out = if(inboundData.out ~= '1') dateTime else dbPayload.out
---
{
    "record_no": inboundData.record_no default dbPayload.record_no,
    "student_id": dbPayload.student_id as String,
    "in": in,
    "out": out
}