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
# 3. Allocate enough RAM
    This step is only required if you are using a computer with 8GB or less of RAM.
    3.1. If you are using a computer with 8GB or less of RAM, you may need to perform some additional steps to ensure that enough RAM is allocated to the WSL subsystem.
        Open a Windows PowerShell (as administrator) window, and type:
        wsl --shutdown
        notepad "$env:USERPROFILE/.wslconfig"
        Notepad should open up a file named .wslconfig - enter the following lines into the file, and save it:
            [wsl2]
            memory=10GB # Limits VM memory to 10GB
    3.2. Restart WSL/Ubuntu and confirm that the available RAM has increased by running this command:
        free -mh
        Due to how WSL2 works, you must close WSL (by running wsl --shutdown in a PowerShell window) between uses of FSL, to ensure RAM is freed up for your Windows sessions. You may            also wish to change the memory value in the .wslconfig file, e.g. to memory=4GB, if you experience degraded performance when using Windows applications
# 4. X server
    #Though i am using WSL2 i still needed to install X server as otherwise the display connection did not work resulting in error "Error: couldn't open display 10.255.255.254:0"
    4.1. #Download and run the installer from https://sourceforge.net/projects/vcxsrv/. This will install an application called XLaunch.
    #In order for VcXsrv to work, Ubuntu configuration profile has to be moedified as follows. 
    4.1.1 #for WS1, copy+paste the following code into the Ubuntu shell:
          echo "export DISPLAY=:0" >> ~/.bashrc
    4.1.2 #for WSL2 (my laptop), copy+paste the following code into the Ubuntu shell:
          echo "export DISPLAY=\$(grep nameserver /etc/resolv.conf  | awk '{print \$2; exit}'):0" >> ~/.bashrc
          echo "export LIBGL_ALWAYS_INDIRECT=1" >> ~/.bashrc
    4.2. Start the XLaunch app. 
      # Display settings → Multiple windows
      # Start no client → checked
      # Native openGL → Unchecked (Deselected)
      #Finish and save the config as “WSL2” so you can just double-click it next time.
    4.3. Copy+paste this code into Ubuntu terminal (WSL distribution) (My windows laptop has 2 GPUs with NVIDIA GEFORCE GTX 1650 Ti (Dedicated 4GB + Shared 8GB) + Intel UHD graphics                (Dedicated 128MB + Shared 8GB): The GPU automatically switches depending on underlying process demands
        export DISPLAY=:0
        unset LIBGL_ALWAYS_INDIRECT   # if set
    4.4. #Type glxgears into the Ubuntu shell, and press enter . A window with three spinning gears should open.

# 5. Logging in with user name and email id so the commits to github gets saved with username and email id
    # Getting the working directory
    pwd
# 5.1 Logging in with username and email id
    git config --global user.name "Divakar Buddha"
    git config --global user.email "divakarbuddha@outlook.com"

    
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
