# 📱 Android NAS / Home Cloud

Turn an old Android phone into your own **local NAS / personal home cloud** using [Termux](https://github.com/termux/termux-app) and [File Browser](https://github.com/filebrowser/filebrowser).

> **⚠️ Project status:** This guide is currently experimental and has not been fully tested yet. Use it at your own risk.

---

## ✨ What is this?

This project allows you to repurpose an old Android phone as a simple **local file server**.

Your phone can act as a small NAS that you can access from other devices on the same network through a web browser.

### Features

* 📁 Web-based file management
* 👤 Multiple users
* 🔐 Separate folders for different users
* 📱 Runs directly on Android
* 🏠 Designed for use on a local network
* 💾 Useful for repurposing old Android phones

---

## 📋 Requirements

Before starting, you will need:

* An Android phone
* Wi-Fi access
* Enough free storage for your files
* [Termux](https://github.com/termux/termux-app)
* A device connected to the same local network as the phone

> **⚠️ Important:** Android may terminate background processes, especially on newer Android versions. Termux's official documentation warns about process-killing behavior on Android 12 and newer.

Disable battery optimization for Termux in your device settings.

---

# 🚀 Installation

## 1. Install Termux

Download Termux from Github.

* [Termux GitHub repository](https://github.com/termux/termux-app)


**Do not mix Termux installations from different sources.** Termux's official documentation states that the app and its plugins must come from the same source because they use different signing keys.

> **Note:** If Android displays a warning when installing an APK, this can happen because the APK was not installed through Google Play. Always verify that you downloaded Termux from an official source.

---

## 2. Give Termux access to your storage

Open Termux and run:

```bash
termux-setup-storage
```

Android will display a permission dialog.

Allow Termux to access your files.

Then update the Termux packages:

```bash
pkg update && pkg upgrade -y
```

Install `wget`:

```bash
pkg install wget
```

---

# 📦 3. Install File Browser

Run the following command:

```bash
wget -qO- https://raw.githubusercontent.com/ilGiannino98/TurnYourOldPhoneIntoNAS/main/InstallScript.sh | sh
```

This downloads and executes the installation script from this repository.


If the command fails because of a temporary network problem, try running it again.

---

# 🗄️ 4. Initialize the database and create the administrator

Initialize the File Browser database:

```bash
./filebrowser config init
```

File Browser officially provides `config init` for creating a new database.

Now create your administrator account:

```bash
./filebrowser users add YourName YourPassword --perm.admin
```

Replace:

* `YourName` → your desired username
* `YourPassword` → your desired password

For example:

```bash
./filebrowser users add admin MyStrongPassword123 --perm.admin
```



The `--perm.admin` option grants administrator permissions.

---


# 👥 5. Create additional users

You can create multiple users and restrict each one to a specific directory using `--scope`.

> **Note:** The directory MUST exist on your phone before adding the user, and you must use the absolute path `/storage/emulated/0/...`.

First, create the folders for your users:
```bash
mkdir -p /storage/emulated/0/user1
mkdir -p /storage/emulated/0/user2
```
Then, add the users with their respective scopes:
```bash
./filebrowser users add user1 Password123 --scope /storage/emulated/0/user1
./filebrowser users add user2 Password456 --scope /storage/emulated/0/user2
```
With this configuration:
user1 → /storage/emulated/0/user1
user2 → /storage/emulated/0/user2

user1 will only have access to their assigned scope, while user2 will have their own scope.

File Browser officially supports the --scope option for restricting a user's accessible directory.


# 🌐 6. Find your phone's IP address

    Open Settings on your Android device.

    Go to Network & Internet (or Connections) and select Wi-Fi.

    Tap the Gear icon (⚙️) next to the Wi-Fi network you are connected to.

    Scroll down until you see the IP address entry (or tap Advanced / Details if it's hidden).

    Note down the address (it usually starts with 192.168.x.x or 10.x.x.x).
    
### ⚠️ Save this IP address

You will need it to connect to the server from another device.



---

# ▶️ 7. Start the server

Run:

```bash
./filebrowser -a 0.0.0.0 -p 8080
```

The server should now listen on port `8080`.

Keep Termux and the File Browser process running.

### ⚠️ Important

If Android terminates Termux or the process stops, the server will become unavailable.

You may therefore need to run the command again:

```bash
./filebrowser -a 0.0.0.0 -p 8080
```

Android's background-process restrictions can affect Termux on newer Android versions.

---

# 🌍 8. Connect to your NAS

On another device connected to the **same Wi-Fi network**, open a web browser.

Enter:

```text
http://YOUR-IP:8080
```


You should now see the File Browser login page.

Enter the username and password you created earlier.

🎉 **Your Android phone is now acting as a local NAS / home cloud!**

---



---

# ⚠️ Current limitations

This project is currently **experimental**.

Things that still need testing include:

* [ ] Long-term stability
* [ ] Android background-process behavior
* [ ] Multiple simultaneous users
* [ ] Large file transfers
* [ ] Wi-Fi disconnections/reconnections
* [ ] Different Android versions
* [ ] Storage permissions
* [ ] Performance on older phones

If you encounter a problem, please open an issue with:

* Android version
* Phone model
* Termux version
* The command you were running
* The complete error message

**Please do not post your passwords or private files.**

---

# 📺 Video Tutorial

A YouTube tutorial for this project will be available soon on my channel:

**[▶️ IlGiannino98 on YouTube](https://www.youtube.com/@IlGiannino98)**

Stay tuned!

---

# 📚 Credits

This project makes use of the following independent open-source projects:

### Termux

[Termux](https://github.com/termux/termux-app) is an Android terminal emulator and Linux environment.

### File Browser

[File Browser](https://github.com/filebrowser/filebrowser) is a web-based file management interface and file server.

> **⚠️ No affiliation**
>
> This project is **not affiliated with, endorsed by, sponsored by, or officially connected in any way to Termux, File Browser, or their respective developers, maintainers, or communities.**
>
> Termux and File Browser are independent projects. This repository simply provides instructions and scripts for using them together for this specific setup.

All trademarks, names, logos, and project copyrights belong to their respective owners.

---

# 📄 License

The original content and code contained in **this repository** are licensed under the **MIT License**.

The MIT License applies **only to the original work contained in this repository**. It does not apply to third-party software or projects used by this guide.

Third-party projects remain under their respective licenses:

* [Termux](https://github.com/termux/termux-app)
* [File Browser](https://github.com/filebrowser/filebrowser)

See the respective projects for their complete license terms.


