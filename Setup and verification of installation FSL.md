# FSL installation from Andy's Brain Book instructions
    Here saving only the steps that works on laptop (Windows11: 16 GB RAM, 1 TB SSD) - WSL 2.6.1.0

# 1. Install WSL/Ubuntu
    #Open a Windows PowerShell (as administrator) window, copy+paste these commands into the PowerShell, press enter, and follow any prompts given:
    wsl --update
    wsl --shutdown
    wsl --set-default-version 2
    wsl --install -d Ubuntu-22.04

#2. Install FSL and depencencies - in Ubuntu terminal
    curl -Ls https://fsl.fmrib.ox.ac.uk/fsldownloads/fslconda/releases/getfsl.sh | sh -s

    #Please read the output carefully - the following message will be printed when the installation has completed successfully:
    #FSL successfully installed
    2.1, 2.2 #helps to set the display options ready for using X server adapter
    2.1. #Open a Windows PowerShell (as administrator) window, and type:
          wsl --shutdown
          notepad "$env:USERPROFILE/.wslconfig"
    2.2. #In the Notepad window, enter the following text, and save the file. If [wsl2] is already present, don't add it again - just add guiApplications=false line         underneath [wsl2]:
          [wsl2]
          guiApplications=false
# 3. X server
    #Though i am using WSL2 i still needed to install X server as otherwise the display connection did not work resulting in error "Error: couldn't open display 10.255.255.254:0"
    3.1. #Download and run the installer from https://sourceforge.net/projects/vcxsrv/. This will install an application called XLaunch.
    #In order for VcXsrv to work, Ubuntu configuration profile has to be moedified as follows. 
    3.1.1 #for WS1, copy+paste the following code into the Ubuntu shell:
          echo "export DISPLAY=:0" >> ~/.bashrc
    3.1.2 #for WSL2 (my laptop), copy+paste the following code into the Ubuntu shell:
          echo "export DISPLAY=\$(grep nameserver /etc/resolv.conf  | awk '{print \$2; exit}'):0" >> ~/.bashrc
          echo "export LIBGL_ALWAYS_INDIRECT=1" >> ~/.bashrc
    3.2. Start the XLaunch app. 
      #Display settings → Multiple windows
      #Display number → 0 both work (setting 0 worked for me)
      #Start no client → checked
      #Extra parameters → paste this exactly: -ac -wgl (this made the glxgears to work)
      #Finish and save the config as “WSL2” so you can just double-click it next time.
    3.3. #Type glxgears into the Ubuntu shell, and press enter . A window with three spinning gears should open.

# 4. Logging in with user name and email id so the commits to github gets saved with username and email id
    # Getting the working directory
    pwd
# 4.1 Logging in with username and email id
    git config --global user.name "Divakar Buddha"
    git config --global user.email "divakarbuddha@outlook.com"


# 5. Use the following lines of code in Ubuntu terminal everytime its opened new 
    #Fix the broken DISPLAY variable and point it to Windows
    export DISPLAY=$(ip route | awk '/default/ {print $3}'):0
    #or even simpler (works 99% of the time):
    export DISPLAY=$(hostname).local:0
    
# 6. Testing the adapter connection
    glxgears
    #Should show three different colored (blue, gree, red) gears roatating)

# 7. Verifying the installation and running status of FSL
    fslmaths
    #give information about datatype

# 8. imcp - verifying the installation of FSL
    imcp
    #gives help text of imcp command

# 9. FSL GUI through Ubuntu
    fsl &
