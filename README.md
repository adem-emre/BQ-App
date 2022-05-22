# BQ App
With this app you can store book quotes. And you can also keep track of which page you stayed on

## Setup

Run command on IDE terminal

```console
flutter pub get
```
### Firebase Setup

To execute this project create and setup a new [Firebase project](https://console.firebase.google.com/)<br>

- Get enable  "Email/Password" sign-in method from Authentication
- Setup Firestore
- Change your Firebase Storage rules to
```javascript
 allow read, write: if request.auth != null;
 ```


# Screen Records

## Splash
![splash](https://user-images.githubusercontent.com/79714460/169696196-b446c5cc-df85-48cc-bb10-397fea924117.gif)
## Auth
![login](https://user-images.githubusercontent.com/79714460/169696265-1643f3b0-a824-4545-a2ae-3dad1c6cac9e.gif)
![forgot_password](https://user-images.githubusercontent.com/79714460/169696270-c0384ea7-a229-48f7-aaed-4b3b0dc8f392.gif)
![register](https://user-images.githubusercontent.com/79714460/169696269-9d2e6bb3-79ad-4343-9914-653b59e69593.gif)
## Books
![add_book](https://user-images.githubusercontent.com/79714460/169696439-039683da-7e27-49d9-b369-827aceb1ea05.gif)
![increment_page](https://user-images.githubusercontent.com/79714460/169696431-4165dfdf-c7ea-4b07-997c-89904551adbd.gif)
![edit_book](https://user-images.githubusercontent.com/79714460/169696436-79c176d0-b2b5-4594-b687-3b5b137c0dd7.gif)
![delete_book](https://user-images.githubusercontent.com/79714460/169696429-f708a0e7-5ecd-4dab-9eca-bf8db901051c.gif)
## Quotes
![add_quote](https://user-images.githubusercontent.com/79714460/169696511-c968de95-55b2-4e57-909b-9cdb6698c458.gif)
![edit_quote](https://user-images.githubusercontent.com/79714460/169696514-51006ecf-8d3f-448b-a98c-431e7a4792ac.gif)
![delete_quote](https://user-images.githubusercontent.com/79714460/169696513-cc5d5aba-e07c-49c2-acc3-cfe5af1e6bdc.gif)
## Share Twitter
![twiitter](https://user-images.githubusercontent.com/79714460/169696509-1d2c9f80-6cb5-428a-aea0-bcde3a8e1d7b.gif)


