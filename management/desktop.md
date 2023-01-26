<h1 style="text-align: center;">How to launch Ubuntu Desktop in Google Cloud</h1>

<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://www.ubuntufree.com/wp-content/uploads/2020/04/Black-Ubuntu-20-04-Default-Wallpaper-2048x1280.png" alt="" width="1000" height="620" /></p>

This tutorial shows you how to set up a Ubuntu Desktop on Google Cloud. If you need a graphic interface to your virtual desktop on the cloud, this tutorial will teach you how to set up a desktop environment just like what you can get on your own computer.

We need four steps to set up a machine:

1. Create a Ubuntu VM instance on Google Cloud.
2. Install and configure the Chrome Remote Desktop service on the VM instance.
3. Set up a Ubuntu desktop environment in the VM instance
4. Connect from your Chrome web browser to the desktop environment on the VM instance.

### Create a Ubuntu VM instance

At this stage, we will launch a copy of the virtual machine in Google Cloud.

1. In the Google Cloud Console, go to the VM Instances page:
> ![изображение](https://user-images.githubusercontent.com/101510056/214898217-19e8349e-53b7-4f65-bcbd-1c356fc41eeb.png)
3. Click `CREATE INSTANCE`.
4. Set the instance name, region, boot disk options.

❗ Operating System, select Ubuntu-Pro-20.04-LTS 

8. Click `CREATE` to create the instance.
9. In less than one minute, you will be able to see your Ubuntu instance in RUNNING status. You can click the SSH button in the instance list to connect to your new instance.

### Install Chrome Remote Desktop on the VM instance

The next step is to install Chrome Remote Desktop on the VM instance.

1. In the SSH window connected to your VM instance, update the package manager data and install wget and tasksel. Wget is a free software package for retrieving files using HTTP, HTTPS, FTP and FTPS, the most widely used Internet protocols. Tasksel is a Debian/Ubuntu tool that installs multiple related packages as a co-ordinated “task” onto your system.

```
sudo apt update
sudo apt install --assume-yes wget tasksel
```

2. Download and install the Debian Linux Chrome Remote Desktop installation package:
```
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo apt-get install --assume-yes ./chrome-remote-desktop_current_amd64.deb
```

### Set up a Ubuntu desktop environment in the VM instance

Now we need to install a desktop environment and window manager for Chrome Remote Desktop to communicate with the VM instance.

1. In the SSH window connected to your VM instance, install Ubuntu desktop environment:

sudo tasksel install ubuntu-desktop

2. Set your Chrome Remote Desktop session to use Gnome, which is the default desktop environment for Ubuntu:
```
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/gnome-sessio" > /etc/chrome-remote-desktop-session'
```
3. You just need to reboot your Ubuntu VM instance.

```
sudo reboot
```

You will lose connection to your VM instance immediately. Don’t panic, close the SSH window, wait a few seconds and you will SSH into it through the Cloud Console again in the next step.

### Configure the Chrome Remote Desktop service and Connect to your Ubuntu Desktop

To start the remote desktop connection, you need to have an authorization key for your Google account.

1. In the Cloud Console, click the SSH button to connect to your instance.

2. On your local computer, using the Chrome browser, go to the Chrome Remote Desktop command line setup page:
```
https://remotedesktop.google.com/headless
```

3. On the Set up another computer page, click Begin.
4. Click Next. You already installed the Chrome Remote Desktop on the remote computer in STEP2(Install and configure the Chrome Remote Desktop service on the VM instance)
5. Click Authorize.
6. Now you get the command to set up and start the Chrome Remote Desktop service on your VM instance. Copy the command for Debian Linux.

7. Paste the command to the SSH window that connects to your VM instance. Run the command.

8. Enter a 6 digit PIN when prompted. This PIN will be used when you log into the VM instance from your Chrome. If you see errors like Fail to read or No net_fetcher, ignore them.

9. Verify that the Chrome Remote Desktop service is running by using the following command.
```
sudo systemctl status chrome-remote-desktop@$USER
```
If the service is running, you will see the status is active:
```
Active: active (running) since DATE_TIME; ELAPSED_TIME
```
Now you are ready to connect to the VM instance through Chrome Remote Desktop web application.