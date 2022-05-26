<style>
h2 {
    width:95%;
    background-color:#7BA7C7;
    font-family:Tahoma;
    color: #fffc35;
    font-size:16pt;
}
h4 {
    width:95%;
    background-color:#b5f144;
}
body {
    background-color:#FFFFFF;
    font-family:Tahoma;
    font-size:12pt;
}
td, th {
    border:1px solid black;
    border-collapse:collapse;
}
th {
    color:white;
    background-color:black;
}
table, tr, td, th {
    padding-left: 10px;
    margin: 0px
}
tr:nth-child(odd) {background-color: lightgray}
table {
    width:95%;
    margin-left:5px;
    margin-bottom:20px;
}
.alert { color:red; }
.new { color:green; }
table.footer tr,
table.footer td {
    background-color: white;
    border-collapse: collapse;
    border: none;
}
table.footer {
    width: 25%;
    padding-left: 10px;
    margin-left: 70%;
    font-size: 10pt;
}
td.size {
    text-align: right;
    padding-right: 25px;
}
.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;
}
table.header tr,
table.header td {
    background-color:white;
    border-collapse: collapse;
    border: none;
}
</style>
<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js'>
</script>
<script type='text/javascript'>
function toggleDiv(divId) {
$("#"+divId).toggle();
}
function toggleAll() {
var divs = document.getElementsByTagName('div');
for (var i = 0; i < divs.length; i++) {
var div = divs[i];
$("#"+div.id).toggle();
}
}
</script>
</head><body>
<table class='header'>
<tr>
<td><H1>Active Directory Change Report</H1></td>
</tr>
</table>
<H2>esgihamfa.fr</H2>
<a href='javascript:toggleAll();' title='Click to toggle all sections'>+/-</a>
<a href='javascript:toggleDiv("User");' title='click to collapse or expand this section'><H3>User [60]</H3></a><div id="User"> <table><colgroup><col /><col /><col /><col /><col /></colgroup><tr><th>DistinguishedName</th><th>Name</th><th>WhenCreated</th><th>WhenChanged</th><th>IsDeleted</th></tr><tr class="alert"><td>CN=Mohamed TOURE \0ADEL:242c705a-c4b1-4145-afaa-1475daaafb92,CN=Deleted Objects,DC=esgihamfa,DC=fr</td><td>Mohamed TOURE 
DEL:242c705a-c4b1-4145-afaa-1475daaafb92</td><td>23/05/2022 23:23:17</td><td>24/05/2022 10:56:39</td><td>True</td></tr><tr class="alert"><td>CN=Jolyon Clifton \0ADEL:bfccb5ad-de4a-476e-b3c7-0daaa492736f,CN=Deleted Objects,DC=esgihamfa,DC=fr</td><td>Jolyon Clifton 
DEL:bfccb5ad-de4a-476e-b3c7-0daaa492736f</td><td>23/05/2022 23:23:18</td><td>24/05/2022 10:56:39</td><td>True</td></tr><tr class="alert"><td>CN=Kelsey Mason \0ADEL:613ecab8-3553-4ae9-9e29-65f9842b0c03,CN=Deleted Objects,DC=esgihamfa,DC=fr</td><td>Kelsey Mason 
DEL:613ecab8-3553-4ae9-9e29-65f9842b0c03</td><td>23/05/2022 23:23:18</td><td>24/05/2022 10:56:39</td><td>True</td></tr><tr class="alert"><td>CN=Kelsey Mason 1\0ADEL:a25d1409-2433-48a2-97b5-ce645eabd223,CN=Deleted Objects,DC=esgihamfa,DC=fr</td><td>Kelsey Mason 1
DEL:a25d1409-2433-48a2-97b5-ce645eabd223</td><td>23/05/2022 23:23:24</td><td>24/05/2022 10:56:39</td><td>True</td></tr><tr class="alert"><td>CN=Jolyon Clifton 1\0ADEL:12b0c7fb-5313-45e9-b3af-cbc09d211acc,CN=Deleted Objects,DC=esgihamfa,DC=fr</td><td>Jolyon Clifton 1
DEL:12b0c7fb-5313-45e9-b3af-cbc09d211acc</td><td>23/05/2022 23:23:24</td><td>24/05/2022 10:56:39</td><td>True</td></tr><tr class="alert"><td>CN=Mohamed TOURE 1\0ADEL:cd83262b-5b31-4773-9b0a-9893b7314102,CN=Deleted Objects,DC=esgihamfa,DC=fr</td><td>Mohamed TOURE 1
DEL:cd83262b-5b31-4773-9b0a-9893b7314102</td><td>23/05/2022 23:23:23</td><td>24/05/2022 10:56:39</td><td>True</td></tr><tr class="alert"><td>CN=Amadou BA \0ADEL:ad034f92-c196-4960-81c5-48d83389f13a,CN=Deleted Objects,DC=esgihamfa,DC=fr</td><td>Amadou BA 
DEL:ad034f92-c196-4960-81c5-48d83389f13a</td><td>23/05/2022 23:23:17</td><td>24/05/2022 10:56:40</td><td>True</td></tr><tr class="alert"><td>CN=Anthoine Kowalski 1\0ADEL:adf44a55-3289-4a54-84b9-a53cb039be12,CN=Deleted Objects,DC=esgihamfa,DC=fr</td><td>Anthoine Kowalski 1
DEL:adf44a55-3289-4a54-84b9-a53cb039be12</td><td>23/05/2022 23:23:25</td><td>24/05/2022 10:56:40</td><td>True</td></tr><tr class="alert"><td>CN=Ibrahima Seydi 1\0ADEL:8c9e4185-530c-4407-839f-221ef5d50830,CN=Deleted Objects,DC=esgihamfa,DC=fr</td><td>Ibrahima Seydi 1
DEL:8c9e4185-530c-4407-839f-221ef5d50830</td><td>23/05/2022 23:23:24</td><td>24/05/2022 10:56:40</td><td>True</td></tr><tr class="alert"><td>CN=Earnest Britton 1\0ADEL:cbf890e3-2bb6-4bf9-839e-997fad352f11,CN=Deleted Objects,DC=esgihamfa,DC=fr</td><td>Earnest Britton 1
DEL:cbf890e3-2bb6-4bf9-839e-997fad352f11</td><td>23/05/2022 23:23:24</td><td>24/05/2022 10:56:40</td><td>True</td></tr><tr class="alert"><td>CN=Conway Basil 1\0ADEL:991f0f92-880c-4e0a-80e5-bb50a37bd305,CN=Deleted Objects,DC=esgihamfa,DC=fr</td><td>Conway Basil 1
DEL:991f0f92-880c-4e0a-80e5-bb50a37bd305</td><td>23/05/2022 23:23:24</td><td>24/05/2022 10:56:40</td><td>True</td></tr><tr class="alert"><td>CN=Clyde Braiden 1\0ADEL:ec6b9461-542e-4948-a335-5b4e78c09072,CN=Deleted Objects,DC=esgihamfa,DC=fr</td><td>Clyde Braiden 1
DEL:ec6b9461-542e-4948-a335-5b4e78c09072</td><td>23/05/2022 23:23:24</td><td>24/05/2022 10:56:40</td><td>True</td></tr><tr class="alert"><td>CN=Alexandre KOY 1\0ADEL:7e3c2926-e0e6-469d-add0-7b35f4f8819b,CN=Deleted Objects,DC=esgihamfa,DC=fr</td><td>Alexandre KOY 1
DEL:7e3c2926-e0e6-469d-add0-7b35f4f8819b</td><td>23/05/2022 23:23:23</td><td>24/05/2022 10:56:40</td><td>True</td></tr><tr class="alert"><td>CN=Freskim HAJDANI 1\0ADEL:a5e97a61-0242-4ed4-8ffe-ae7cd5285c90,CN=Deleted Objects,DC=esgihamfa,DC=fr</td><td>Freskim HAJDANI 1
DEL:a5e97a61-0242-4ed4-8ffe-ae7cd5285c90</td><td>23/05/2022 23:23:23</td><td>24/05/2022 10:56:40</td><td>True</td></tr><tr class="alert"><td>CN=Amadou BA 1\0ADEL:ea21ac96-0319-4401-b0f9-57981fe46891,CN=Deleted Objects,DC=esgihamfa,DC=fr</td><td>Amadou BA 1
DEL:ea21ac96-0319-4401-b0f9-57981fe46891</td><td>23/05/2022 23:23:23</td><td>24/05/2022 10:56:40</td><td>True</td></tr><tr class="alert"><td>CN=Anthoine Kowalski \0ADEL:e1916800-a664-43b3-a859-5361d896327c,CN=Deleted Objects,DC=esgihamfa,DC=fr</td><td>Anthoine Kowalski 
DEL:e1916800-a664-43b3-a859-5361d896327c</td><td>23/05/2022 23:23:18</td><td>24/05/2022 10:56:40</td><td>True</td></tr><tr class="alert"><td>CN=Ibrahima Seydi \0ADEL:07ec31e4-3efc-428a-b549-8556e32e9a77,CN=Deleted Objects,DC=esgihamfa,DC=fr</td><td>Ibrahima Seydi 
DEL:07ec31e4-3efc-428a-b549-8556e32e9a77</td><td>23/05/2022 23:23:18</td><td>24/05/2022 10:56:40</td><td>True</td></tr><tr class="alert"><td>CN=Earnest Britton \0ADEL:e56ad7c9-92cf-4a73-99fa-81edf7135a0b,CN=Deleted Objects,DC=esgihamfa,DC=fr</td><td>Earnest Britton 
DEL:e56ad7c9-92cf-4a73-99fa-81edf7135a0b</td><td>23/05/2022 23:23:18</td><td>24/05/2022 10:56:40</td><td>True</td></tr><tr class="alert"><td>CN=Conway Basil \0ADEL:560b8c1d-3a30-49cc-95d6-4ce1c00da27b,CN=Deleted Objects,DC=esgihamfa,DC=fr</td><td>Conway Basil 
DEL:560b8c1d-3a30-49cc-95d6-4ce1c00da27b</td><td>23/05/2022 23:23:18</td><td>24/05/2022 10:56:40</td><td>True</td></tr><tr class="alert"><td>CN=Clyde Braiden \0ADEL:6e8eb3d4-52de-48b3-885a-748e5ced7139,CN=Deleted Objects,DC=esgihamfa,DC=fr</td><td>Clyde Braiden 
DEL:6e8eb3d4-52de-48b3-885a-748e5ced7139</td><td>23/05/2022 23:23:18</td><td>24/05/2022 10:56:40</td><td>True</td></tr><tr class="alert"><td>CN=Alexandre KOY \0ADEL:0873445b-6747-4874-866d-a5d77298b629,CN=Deleted Objects,DC=esgihamfa,DC=fr</td><td>Alexandre KOY 
DEL:0873445b-6747-4874-866d-a5d77298b629</td><td>23/05/2022 23:23:17</td><td>24/05/2022 10:56:40</td><td>True</td></tr><tr class="alert"><td>CN=Freskim HAJDANI \0ADEL:ce5356e5-cbee-46af-ac8b-94c5c51948fe,CN=Deleted Objects,DC=esgihamfa,DC=fr</td><td>Freskim HAJDANI 
DEL:ce5356e5-cbee-46af-ac8b-94c5c51948fe</td><td>23/05/2022 23:23:17</td><td>24/05/2022 10:56:40</td><td>True</td></tr><tr class="alert"><td>CN=Hawa SISSOKO \0ADEL:84e0d1f0-4ba2-4f64-844e-310f17c6d234,CN=Deleted Objects,DC=esgihamfa,DC=fr</td><td>Hawa SISSOKO 
DEL:84e0d1f0-4ba2-4f64-844e-310f17c6d234</td><td>23/05/2022 23:23:17</td><td>24/05/2022 10:56:40</td><td>True</td></tr><tr class="alert"><td>CN=Hawa SISSOKO 1\0ADEL:2b6667c3-8c7a-44ac-8ff7-898f4aab912d,CN=Deleted Objects,DC=esgihamfa,DC=fr</td><td>Hawa SISSOKO 1
DEL:2b6667c3-8c7a-44ac-8ff7-898f4aab912d</td><td>23/05/2022 23:23:23</td><td>24/05/2022 10:56:40</td><td>True</td></tr><tr class="new"><td>CN=Alexandre KOY\ ,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Alexandre KOY </td><td>24/05/2022 10:56:55</td><td>24/05/2022 10:56:55</td><td></td></tr><tr class="new"><td>CN=Freskim HAJDANI\ ,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Freskim HAJDANI </td><td>24/05/2022 10:56:55</td><td>24/05/2022 10:56:55</td><td></td></tr><tr class="new"><td>CN=Clyde Braiden\ ,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Clyde Braiden </td><td>24/05/2022 10:56:55</td><td>24/05/2022 10:56:55</td><td></td></tr><tr class="new"><td>CN=Hawa SISSOKO\ ,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Hawa SISSOKO </td><td>24/05/2022 10:56:55</td><td>24/05/2022 10:56:55</td><td></td></tr><tr class="new"><td>CN=Anthoine Kowalski\ ,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Anthoine Kowalski </td><td>24/05/2022 10:56:56</td><td>24/05/2022 10:56:56</td><td></td></tr><tr class="new"><td>CN=Jolyon Clifton\ ,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Jolyon Clifton </td><td>24/05/2022 10:56:56</td><td>24/05/2022 10:56:56</td><td></td></tr><tr class="new"><td>CN=Kelsey Mason\ ,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Kelsey Mason </td><td>24/05/2022 10:56:56</td><td>24/05/2022 10:56:56</td><td></td></tr><tr class="new"><td>CN=Conway Basil\ ,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Conway Basil </td><td>24/05/2022 10:56:56</td><td>24/05/2022 10:56:56</td><td></td></tr><tr class="new"><td>CN=Earnest Britton\ ,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Earnest Britton </td><td>24/05/2022 10:56:56</td><td>24/05/2022 10:56:56</td><td></td></tr><tr class="new"><td>CN=Ibrahima Seydi\ ,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Ibrahima Seydi </td><td>24/05/2022 10:56:56</td><td>24/05/2022 10:56:56</td><td></td></tr><tr class="new"><td>CN=Amadou BA\ ,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Amadou BA </td><td>24/05/2022 10:56:55</td><td>24/05/2022 11:00:49</td><td></td></tr><tr class="new"><td>CN=Mohamed TOURE\ ,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Mohamed TOURE </td><td>24/05/2022 10:56:55</td><td>24/05/2022 11:04:55</td><td></td></tr><tr class="new"><td>CN=Amadou BA 1,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Amadou BA 1</td><td>24/05/2022 11:06:16</td><td>24/05/2022 11:06:16</td><td></td></tr><tr class="new"><td>CN=Hawa SISSOKO 1,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Hawa SISSOKO 1</td><td>24/05/2022 11:06:16</td><td>24/05/2022 11:06:16</td><td></td></tr><tr class="new"><td>CN=Freskim HAJDANI 1,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Freskim HAJDANI 1</td><td>24/05/2022 11:06:16</td><td>24/05/2022 11:06:16</td><td></td></tr><tr class="new"><td>CN=Mohamed TOURE 1,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Mohamed TOURE 1</td><td>24/05/2022 11:06:16</td><td>24/05/2022 11:06:16</td><td></td></tr><tr class="new"><td>CN=Alexandre KOY 1,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Alexandre KOY 1</td><td>24/05/2022 11:06:16</td><td>24/05/2022 11:06:16</td><td></td></tr><tr class="new"><td>CN=Clyde Braiden 1,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Clyde Braiden 1</td><td>24/05/2022 11:06:16</td><td>24/05/2022 11:06:16</td><td></td></tr><tr class="new"><td>CN=Jolyon Clifton 1,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Jolyon Clifton 1</td><td>24/05/2022 11:06:16</td><td>24/05/2022 11:06:16</td><td></td></tr><tr class="new"><td>CN=Anthoine Kowalski 1,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Anthoine Kowalski 1</td><td>24/05/2022 11:06:17</td><td>24/05/2022 11:06:17</td><td></td></tr><tr class="new"><td>CN=Ibrahima Seydi 1,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Ibrahima Seydi 1</td><td>24/05/2022 11:06:17</td><td>24/05/2022 11:06:17</td><td></td></tr><tr class="new"><td>CN=Kelsey Mason 1,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Kelsey Mason 1</td><td>24/05/2022 11:06:16</td><td>24/05/2022 11:06:17</td><td></td></tr><tr class="new"><td>CN=Conway Basil 1,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Conway Basil 1</td><td>24/05/2022 11:06:17</td><td>24/05/2022 11:06:17</td><td></td></tr><tr class="new"><td>CN=Earnest Britton 1,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Earnest Britton 1</td><td>24/05/2022 11:06:17</td><td>24/05/2022 11:06:17</td><td></td></tr><tr class="new"><td>CN=Amadou BA 2,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Amadou BA 2</td><td>24/05/2022 11:06:20</td><td>24/05/2022 11:06:20</td><td></td></tr><tr class="new"><td>CN=Hawa SISSOKO 2,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Hawa SISSOKO 2</td><td>24/05/2022 11:06:20</td><td>24/05/2022 11:06:20</td><td></td></tr><tr class="new"><td>CN=Freskim HAJDANI 2,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Freskim HAJDANI 2</td><td>24/05/2022 11:06:20</td><td>24/05/2022 11:06:20</td><td></td></tr><tr class="new"><td>CN=Mohamed TOURE 2,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Mohamed TOURE 2</td><td>24/05/2022 11:06:20</td><td>24/05/2022 11:06:20</td><td></td></tr><tr class="new"><td>CN=Alexandre KOY 2,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Alexandre KOY 2</td><td>24/05/2022 11:06:20</td><td>24/05/2022 11:06:20</td><td></td></tr><tr class="new"><td>CN=Ibrahima Seydi 2,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Ibrahima Seydi 2</td><td>24/05/2022 11:06:21</td><td>24/05/2022 11:06:21</td><td></td></tr><tr class="new"><td>CN=Clyde Braiden 2,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Clyde Braiden 2</td><td>24/05/2022 11:06:21</td><td>24/05/2022 11:06:21</td><td></td></tr><tr class="new"><td>CN=Jolyon Clifton 2,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Jolyon Clifton 2</td><td>24/05/2022 11:06:21</td><td>24/05/2022 11:06:21</td><td></td></tr><tr class="new"><td>CN=Kelsey Mason 2,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Kelsey Mason 2</td><td>24/05/2022 11:06:21</td><td>24/05/2022 11:06:21</td><td></td></tr><tr class="new"><td>CN=Conway Basil 2,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Conway Basil 2</td><td>24/05/2022 11:06:21</td><td>24/05/2022 11:06:21</td><td></td></tr><tr class="new"><td>CN=Earnest Britton 2,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Earnest Britton 2</td><td>24/05/2022 11:06:21</td><td>24/05/2022 11:06:21</td><td></td></tr><tr class="new"><td>CN=Anthoine Kowalski 2,OU=Domain Users,OU=esgihamfa,DC=esgihamfa,DC=fr</td><td>Anthoine Kowalski 2</td><td>24/05/2022 11:06:22</td><td>24/05/2022 11:06:22</td><td></td></tr></table> </div>
<a href='javascript:toggleDiv("Computer");' title='click to collapse or expand this section'><H3>Computer [2]</H3></a><div id="Computer"> <table><colgroup><col /><col /><col /><col /><col /></colgroup><tr><th>DistinguishedName</th><th>Name</th><th>WhenCreated</th><th>WhenChanged</th><th>IsDeleted</th></tr><tr class="new"><td>CN=PCP-ABA,CN=Computers,DC=esgihamfa,DC=fr</td><td>PCP-ABA</td><td>24/05/2022 10:47:51</td><td>24/05/2022 10:49:29</td><td></td></tr><tr class="new"><td>CN=PCP-MTOURE,CN=Computers,DC=esgihamfa,DC=fr</td><td>PCP-MTOURE</td><td>24/05/2022 10:51:37</td><td>24/05/2022 10:53:39</td><td></td></tr></table> </div>

Active Directory changes since 05/24/2022 07:09:38 as reported from domain controller DC01. 

<table>
</table>
<table class='footer'>
    <tr align = "right"><td>Report run: <i>05/24/2022 11:09:42</i></td></tr>
    <tr align = "right"><td>Report version: <i>2.3.3</i></td></tr>
    <tr align = "right"><td>Source: <i>C:\Users\Administrator.DOUAMDC01\Desktop\src\ABADManagement\ABADReport.ps1</i></td></tr>
    <tr align = "right"><td>Author: <i>ESGIHAMFA\ADMINISTRATOR</i></td></tr>
    <tr align = "right"><td>Computername: <i>DC01.ESGIHAMFA.FR</i></td></tr>
</table>
</body></html>
