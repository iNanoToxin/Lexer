--[[
 .____                  ________ ___.    _____                           __
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|
         \/          \/         \/    \/                \/     \/     \/
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.5) ~  Much Love, Ferib

]]--

local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function() return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...) local v18=0;local v19;local v20;local v21;local v22;local v23;local v24;local v25;local v26;local v27;local v28;local v29;local v30;while true do if (v18==2) then function v22() local v31=0 -0 ;local v32;while true do if (v31==(0 -0)) then v32=v1(v16,v19,v19);v19=v19 + (1 -0) ;v31=932 -(857 + (642 -(367 + 201))) ;end if (v31==1) then return v32;end end end v23=nil;function v23() local v33,v34=v1(v16,v19,v19 + (929 -(214 + 713)) );v19=v19 + 1 + 1 ;return (v34 * (41 + 215)) + v33 ;end v18=3;end if (v18==1) then v21=nil;function v21(v35,v36,v37) if v37 then local v69=(v35/(((862 + 17) -(282 + 595))^(v36-1)))%((1639 -(1523 + 26 + 88))^(((v37-(1 + 0)) -(v36-(1 -0))) + (1066 -(68 + 997)))) ;return v69-(v69%(1271 -(226 + 1044))) ;else local v70=(8 -6)^(v36-1) ;return (((v35%(v70 + v70))>=v70) and 1) or (117 -(32 + 85)) ;end end v22=nil;v18=2;end if (v18==4) then function v25() local v38=v24();local v39=v24();local v40=958 -(892 + 65) ;local v41=(v21(v39,1,47 -27 ) * ((3 -1)^(58 -26))) + v38 ;local v42=v21(v39,371 -(87 + 263) ,211 -((505 -(145 + 293)) + 113) );local v43=((v21(v39,1219 -(1069 + 118) )==(2 -1)) and  -((1 -0) -0)) or (1 + 0) ;if (v42==((430 -(44 + 386)) -0)) then if (v41==(0 + 0)) then return v43 * (0 -0) ;else v42=1 + 0 ;v40=0 -0 ;end elseif (v42==(2999 -(802 + 150))) then return ((v41==(0 -(1486 -(998 + 488)))) and (v43 * ((2 -1)/(0 -0)))) or (v43 * NaN) ;end return v8(v43,v42-(1855 -832) ) * (v40 + (v41/((1 + 1)^52))) ;end v26=nil;function v26(v44) local v45;if  not v44 then local v71=(0 -0) -0 ;while true do if (v71==(0 + 0)) then v44=v24();if (v44==(772 -(11 + 190 + 571))) then return "";end break;end end end v45=v3(v16,v19,(v19 + v44) -((2 + 1) -2) );v19=v19 + v44 ;local v46={};for v67=1139 -(116 + 1022) , #v45 do v46[v67]=v2(v1(v3(v45,v67,v67)));end return v6(v46);end v18=5;end if (5==v18) then v27=v24;v28=nil;function v28(...) return {...},v12("#",...);end v18=6;end if (v18==0) then v19=1;v20=nil;v16=v4(v3(v16,5),"..",function(v47) if (v1(v47,2)==79) then v20=v0(v3(v47,1,1));return "";else local v72=v2(v0(v47,16));if v20 then local v80=0;local v81;while true do if (v80==1) then return v81;end if (v80==0) then v81=v5(v72,v20);v20=nil;v80=1;end end else return v72;end end end);v18=1;end if (v18==3) then v24=nil;function v24() local v48=885 -(261 + 624) ;local v49;local v50;local v51;local v52;while true do if ((1 -0)==v48) then return (v52 * ((16780043 -(760 + 987)) -(1020 + 60))) + (v51 * (66959 -(630 + (2706 -(1789 + 124))))) + (v50 * (867 -611)) + v49 ;end if (v48==(0 -0)) then v49,v50,v51,v52=v1(v16,v19,v19 + 2 + (767 -(745 + 21)) );v19=v19 + (13 -(4 + 5)) ;v48=1;end end end v25=nil;v18=4;end if (7==v18) then function v30(v53,v54,v55) local v56=0;local v57;local v58;local v59;while true do if (v56==1) then v59=v53[3];return function(...) local v82=v57;local v83=v58;local v84=v59;local v85=v28;local v86=1;local v87= -1;local v88={};local v89={...};local v90=v12("#",...) -1 ;local v91={};local v92={};for v103=0,v90 do if (v103>=v84) then v88[v103-v84 ]=v89[v103 + 1 ];else v92[v103]=v89[v103 + 1 ];end end local v93=(v90-v84) + 1 ;local v94;local v95;while true do v94=v82[v86];v95=v94[1];if (v95<=1) then if (v95>0) then do return;end else local v110=0;local v111;while true do if (0==v110) then v111=v94[2];v92[v111](v92[v111 + 1 ]);break;end end end elseif (v95==2) then v92[v94[2]]=v55[v94[3]];else v92[v94[2]]=v94[3];end v86=v86 + 1 ;end end;end if (v56==0) then v57=v53[1];v58=v53[2];v56=1;end end end return v30(v29(),{},v17)(...);end if (v18==6) then v29=nil;function v29() local v60=0;local v61;local v62;local v63;local v64;local v65;local v66;while true do if (v60==(1905 -(1881 + 24))) then local v76=0 -0 ;local v77;while true do if ((1763 -(454 + 1309))~=v76) then else v77=0 + 0 ;while true do if (v77==(2 -0)) then v60=1 -0 ;break;end if (v77~=(2 -1)) then else v63={};v64={v61,v62,nil,v63};v77=2;end if (v77~=(0 -0)) then else local v116=1990 -(582 + 1408) ;while true do if (v116~=(0 -0)) then else v61={};v62={};v116=1;end if ((1 -0)==v116) then v77=3 -2 ;break;end end end end break;end end end if (v60~=2) then else for v96=1825 -(1195 + 629) ,v24() do local v97=0 -0 ;local v98;local v99;local v100;while true do if (v97~=(241 -(187 + 54))) then else v98=0;v99=nil;v97=1;end if (v97~=(781 -(162 + 618))) then else v100=nil;while true do if (v98==1) then while true do if (v99==0) then v100=v22();if (v21(v100,1,1)~=0) then else local v124=0;local v125;local v126;local v127;local v128;local v129;while true do if (v124==(0 + 0)) then v125=0 + 0 ;v126=nil;v124=1;end if (v124==1) then v127=nil;v128=nil;v124=3 -1 ;end if (v124==2) then v129=nil;while true do if (v125==(0 -0)) then local v132=0;while true do if (v132==0) then v126=0 + 0 ;v127=nil;v132=1;end if (v132==1) then v125=1;break;end end end if (v125~=(1637 -(1373 + 263))) then else local v133=1000 -(451 + 549) ;while true do if (v133==(0 + 0)) then v128=nil;v129=nil;v133=1;end if (v133==1) then v125=2;break;end end end if (2~=v125) then else while true do if (v126~=(1 -0)) then else local v134=0 -0 ;local v135;local v136;while true do if ((1385 -(746 + 638))==v134) then while true do if (0==v135) then v136=0 + 0 ;while true do if (v136==(0 -0)) then v129={v23(),v23(),nil,nil};if (v127==(1581 -(1535 + 46))) then local v148=0;local v149;while true do if (v148==0) then v149=0 + 0 ;while true do if (v149==0) then v129[3]=v23();v129[1 + 3 ]=v23();break;end end break;end end elseif (v127==(561 -(306 + 254))) then v129[1 + 2 ]=v24();elseif (v127==(3 -1)) then v129[1470 -(899 + 568) ]=v24() -(2^16) ;elseif (v127==3) then local v154=0;local v155;local v156;while true do if (v154~=(1 + 0)) then else while true do if (v155==(0 -0)) then v156=603 -(268 + 335) ;while true do if (v156==0) then v129[3]=v24() -(2^(306 -(60 + 230))) ;v129[576 -(426 + 146) ]=v23();break;end end break;end end break;end if (v154~=(0 + 0)) then else v155=0;v156=nil;v154=1;end end end v136=1457 -(282 + 1174) ;end if (1~=v136) then else v126=813 -(569 + 242) ;break;end end break;end end break;end if (v134==0) then v135=0 -0 ;v136=nil;v134=1;end end end if (v126==2) then local v137=0 + 0 ;while true do if (v137~=(1025 -(706 + 318))) then else v126=3;break;end if (0==v137) then if (v21(v128,1252 -(721 + 530) ,1)==1) then v129[2]=v66[v129[2]];end if (v21(v128,2,1273 -(945 + 326) )==(2 -1)) then v129[3]=v66[v129[3]];end v137=1;end end end if (v126~=(3 + 0)) then else if (v21(v128,3,3)~=(701 -(271 + 429))) then else v129[4 + 0 ]=v66[v129[4]];end v61[v96]=v129;break;end if (v126~=0) then else local v139=1500 -(1408 + 92) ;while true do if (v139==1) then v126=1087 -(461 + 625) ;break;end if (v139~=(1288 -(993 + 295))) then else local v142=0;local v143;while true do if (v142~=0) then else v143=0;while true do if (v143==(1 + 0)) then v139=1172 -(418 + 753) ;break;end if (v143==0) then v127=v21(v100,1 + 1 ,1 + 2 );v128=v21(v100,4,6);v143=1 + 0 ;end end break;end end end end end end break;end end break;end end end break;end end break;end if (v98==(0 + 0)) then v99=529 -(406 + 123) ;v100=nil;v98=1;end end break;end end end for v101=1,v24() do v62[v101-(1770 -(1749 + 20)) ]=v29();end return v64;end if ((1 + 0)==v60) then local v78=1322 -(1249 + 73) ;local v79;while true do if (v78==(0 + 0)) then v79=1145 -(466 + 679) ;while true do if (v79==(4 -2)) then v60=5 -3 ;break;end if (v79~=0) then else v65=v24();v66={};v79=1901 -(106 + 1794) ;end if (v79==(1 + 0)) then local v117=0 + 0 ;while true do if (0==v117) then for v120=2 -1 ,v65 do local v121=0 -0 ;local v122;local v123;while true do if (v121==0) then local v130=0;while true do if (0==v130) then v122=v22();v123=nil;v130=115 -(4 + 110) ;end if ((585 -(57 + 527))~=v130) then else v121=1;break;end end end if (v121==(1428 -(41 + 1386))) then if (v122==(104 -(17 + 86))) then v123=v22()~=0 ;elseif (v122==2) then v123=v25();elseif (v122==3) then v123=v26();end v66[v120]=v123;break;end end end v64[3]=v22();v117=1 + 0 ;end if (v117~=(1 -0)) then else v79=5 -3 ;break;end end end end break;end end end end end v30=nil;v18=7;end end end return v15("LOL!023O0003053O007072696E74030D3O0048652O6C6F2C20776F726C642100043O0012023O00013O001203000100028O000200012O00013O00017O00",v9(),...);
