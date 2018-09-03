*** Keywords ***
open portal
    [Arguments]  ${url}
    open browser  url=${url}  browser=chrome
    wait until page contains element  //button[@id="flightBooking_search"]
    set window size  1920  1080

select depatrure country
   [Arguments]  ${dep_cnt_id}  ${dep_aip_id}
    click element  //button[@id="id_openOriginsModal"]
    select country and airport  ${dep_cnt_id}  ${dep_aip_id}
    capture page screenshot


select destrination country
    [Arguments]  ${dest_cnt_id}  ${dest_aip_id}
    click element  //button[@id="btnOpenDestinationsModal"]
    select country and airport  ${dest_cnt_id}  ${dest_aip_id}

select country and airport
    [Arguments]    ${dep_cnt_id}  ${dep_aip_id}
    wait until element is visible  //div[@class="modal-content"]
    wait until element is visible  //a[@id="${dep_cnt_id}"]
    mouse over  //a[@id="${dep_cnt_id}"]
    click element  //a[@id="${dep_cnt_id}"]
    wait until element is visible  //a[@id="${dep_aip_id}"]
    click element  //a[@id="${dep_aip_id}"]
    wait until page does not contain  //div[@class="modal-content"]

select departure date
   [Arguments]  ${date}
   click element  id=flightBooking_date_from_btn
   select date from dropdown  id_from2_date_${date}

select return date
   [Arguments]  ${date}
   click element  id=flightBooking_date_to_btn
   select date from dropdown  id_to_date_${date}

select date from dropdown
   [Arguments]  ${id_date}
   wait until element is visible  //div[@class="ng-daterangepicker"]
   wait until element is visible  //*[@id="${id_date}"]
   click element  //*[@id="${id_date}"]
   wait until page does not contain  //div[@class="ng-daterangepicker"]

submit search form
   click button  id=flightBooking_search
