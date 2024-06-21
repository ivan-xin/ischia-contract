# Gateway Details

# Gateway Overview

Ischia gateway is responsible for collecting task events data such as check-in, online time, twitter follow,retweet… , analysising and verifying the data to the corresponable events and sending them to the points system periodly to invoke smartcontract . The third party can follow the defined json format to send the relative data to the gateway.

# Events posted to the gateway

| Event type | Parameter in json ‘event_type’ | Available | Logic of handling |
| --- | --- | --- | --- |
| X-binding | - | - |  |
| Github-binding | - | - |  |
| Daily activation | CHECK-IN | true | Only select the valid daily check-in data once  |
| Online time | ONLINE-TIME | true | Collect and analysis the reported online time task data, the reported interval and duration must follow the configurations in .env  |
| Number of transactions | - | - |  |
| Interaction with smartcotract | - | - |  |
| … |  |  |  |

# Way To Post

## Api for project manager

1. POST  {domain}/`/gateway`/post_data with json body 
- Request

```json
{
    "project": "project-name",   // project name
    "event_type": "CHECK-IN || ONLINE-TIME", // event type
    "address": "16ac7b790fb262e4e935593a7236b60ba084745f3fb5791c1ca7cd79c555ce4b", //wallet address
    "timestamp": "12312312312", //UTC timestamp
    "sign_method": "ED25519", //sign method
    "sign": "4cfdc8825c4b36f5a0401c66bb980db9f99a4dc9957d00bf0f8bd9bb59ea9a621ec407d2b87462c7272ba381539244bcd8816249bced0fab78a4eb271c6ca30e" //sign data
    "data": {
				/*flexible for the project requirements*/
		}

}
```

- Response:

```json

{
"message": "success" / 500
}
```

## Examples

Checkin Event

```jsx
{
    "project": "project-A",
    "event_type": "CHECK-IN",
    "address": "16ac7b790fb262e4e935593a7236b60ba084745f3fb5791c1ca7cd79c555ce4b",
    "timestamp": 1718093606,
    "sign_method": "ED25519",
    "sign": "4cfdc8825c4b36f5a0401c66bb980db9f99a4dc9957d00bf0f8bd9bb59ea9a621ec407d2b87462c7272ba381539244bcd8816249bced0fab78a4eb271c6ca30e",
    "data": {}
}
```

Online Time Event

```jsx
{
    "project": "project-A",
    "event_type": "ONLINE-TIME",
    "address": "16ac7b790fb262e4e935593a7236b60ba084745f3fb5791c1ca7cd79c555ce4b",
    "timestamp": 1718093606,
    "sign_method": "ED25519",
    "sign": "4cfdc8825c4b36f5a0401c66bb980db9f99a4dc9957d00bf0f8bd9bb59ea9a621ec407d2b87462c7272ba381539244bcd8816249bced0fab78a4eb271c6ca30e",
    "data": {}
}
```

## Api for ischia web client

1. POST  {domain}/`/gateway`/post_data with json body 
- Request

```json
{
    "project": "project-name",   //
    "event_type": "RETWEET || X-FOLLOW", //
    "address": "16ac7b790fb262e4e935593a7236b60ba084745f3fb5791c1ca7cd79c555ce4b",
    "timestamp": "12312312312",
    "sign_method": "ED25519",
    "sign": "4cfdc8825c4b36f5a0401c66bb980db9f99a4dc9957d00bf0f8bd9bb59ea9a621ec407d2b87462c7272ba381539244bcd8816249bced0fab78a4eb271c6ca30e"
    "data": {
				/*flexible for the project requirements*/
		}

}
```

- Response:

```json

{
"message": "success" / 500
}
```

## Examples

X Twitter Retweet Event

```jsx
{
    "project": "project-A",
    "event_type": "RETWEET",
    "address": "16ac7b790fb262e4e935593a7236b60ba084745f3fb5791c1ca7cd79c555ce4b",
    "timestamp": 1718093606,
    "sign_method": "ED25519",
    "sign": "4cfdc8825c4b36f5a0401c66bb980db9f99a4dc9957d00bf0f8bd9bb59ea9a621ec407d2b87462c7272ba381539244bcd8816249bced0fab78a4eb271c6ca30e",
    "data": {
	    "url": "https://XXXX.com"
    }
}
```

X Follow Event

```jsx
{
    "project": "project-A",
    "event_type": "X-FOLLOW",
    "address": "16ac7b790fb262e4e935593a7236b60ba084745f3fb5791c1ca7cd79c555ce4b",
    "timestamp": 1718093606,
    "sign_method": "ED25519",
    "sign": "4cfdc8825c4b36f5a0401c66bb980db9f99a4dc9957d00bf0f8bd9bb59ea9a621ec407d2b87462c7272ba381539244bcd8816249bced0fab78a4eb271c6ca30e",
    "data": {
	    "project_x_id": "1311523773590327296",
	    "user_x_id": "1311523773590327296"
    }
}
```