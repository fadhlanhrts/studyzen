import PySimpleGUI as sg

#sg.theme("DarkAmber")

layout = [
    [sg.CalendarButton("click to open",target="-IN4-",format="%m-%d",default_date_m_d_y=(1,None,2021))],
    [sg.Button("Date"),sg.Exit()]
]

window = sg.Window("Calendar",layout,no_titlebar=False)
while True:
    event, values = window.read()
    print(event, values)
    if event in (sg.WIN_CLOSED,"Exit"):
        break
    elif event=='Date':
        sg.popup("Pilihan anda",sg.popup_get_date())

window.close()



admin)
    cd ~/Katalon_Studio_Engine_Linux_64-8.0.5;
    ./katalonc -projectPath='/project/katalon/pwc/admin/admin.prj' -browserType="Chrome (headless)" -retry=0 -retryStrategy=failedExecutions -statusDelay=15 -testSuitePath='Test Suites/security-tax-admin' -apikey="cbebdcc3-a96e-44d8-b4ca-5b625529efac" -testOpsProjectId=162816 --config -webui.autoUpdateDrivers=true
    ;;