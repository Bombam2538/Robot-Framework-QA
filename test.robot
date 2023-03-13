*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Suite Teardown     Close Browser
*** Variable ***
${url_TodoList}        https://abhigyank.github.io/To-Do-List/
${title_todolist}      To Do List
${input_additem}      //*[@id="new-task"]
${btn_add}            //*[@id="add-item"]/button/i
${lnk_todotasks}      //*[@href="To-Do Tasks"]/a
${chk_box}            //*[@id="incomplete-tasks"]/li/label/span[3]
${lnk_compt}          //*[@href="Completed"]/a
${btn_dlt}           //*[@id="1"]
${text_taskname}      //*[@id="completed-tasks"]/li/span/i
${task_pass}            test
*** Keywords ***
Verify to do list page
    [Arguments]                ${title}
    Title Should Be            ${title}
Input Item
     [Arguments]      ${xpath_task}
     Element Should Be Visible    ${xpath_task}
     Input Text       ${xpath_task}

Click Button ADD
     [Arguments]       ${btn}
     Element Should Be Visible    ${btn}
     Click Element        ${btn}

Click link To-Do Tasks
     [Arguments]       ${lnk}
     Element Should Be Visible    ${lnk}
     Click Element        ${lnk}

Check box task name
     [Arguments]       ${chk}
     Element Should Be Visible    ${chk}
     Click Element        ${chk}

Click link COMPLETED
     [Arguments]       ${lnk}
     Element Should Be Visible    ${lnk}
     Click Element        ${lnk}

Verify Add Item Success
   [Arguments]        ${xpath}
   Element Should Be Visible        ${xpath}
*** Test Cases ***
Add Item - Success
    [tags]    success
    Open Browser    about:blank    chrome
    Go To    ${url_TodoList}
    Verify To Do List page    ${title_todolist}
    Input Task    ${input_additem}    ${task_pass}   
    Click Button ADD    ${btn_add}
    Click Link TO-D0 Tasks    ${lnk_todotasks}
    Check box Task    ${chk_box}
    Click Link TO-D0 Tasks    ${lnk_compt}
    Verify ADD Item Success    ${text_taskname}