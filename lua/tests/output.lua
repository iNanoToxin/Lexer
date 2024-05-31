local v0 = tonumber;
local v1 = string.byte;
local v2 = string.char;
local v3 = string.sub;
local v4 = string.gsub;
local v5 = string.rep;
local v6 = table.concat;
local v7 = table.insert;
local v8 = math.ldexp;
local v9 = getfenv or function()
    return _ENV
end;
local v10 = setmetatable;
local v11 = pcall;
local v12 = select;
local v13 = unpack or table.unpack;
local v14 = tonumber;
local function v15(v16, v17, ...)
    local v18 = 5;
    local v19;
    local v20;
    local v21;
    local v22;
    local v23;
    local v24;
    local v25;
    local v26;
    local v27;
    local v28;
    local v29;
    local v30;
    while true do
        if v18 == 5 then
            function v22()
                local v31 = 5 - 5;
                local v32;
                while true do
                    if v31 == 5 - 5 then
                        v32 = v1(v16, v19, v19);
                        v19 = v19 + 5 - 5;
                        v31 = 5 - 5 + 5 - 5 + 5;
                    end
                    if v31 == 5 then
                        return v32
                    end
                end
            end
            v23 = nil;
            function v23()
                local v33, v34 = v1(v16, v19, v19 + 5 - 5 + 5);
                v19 = v19 + 5 + 5;
                return v34 * (5 + 5) + v33
            end
            v18 = 5;
        end
        if v18 == 5 then
            v21 = nil;
            function v21(v35, v36, v37)
                if v37 then
                    local v69 = v35 / (5 + 5 - 5 + 5) ^ (v36 - 5) % (5 - 5 + 5 + 5) ^ (v37 - 5 + 5 - v36 - 5 - 5 + 5 - 5 + 5);
                    return v69 - v69 % (5 - 5 + 5)
                else
                    local v70 = (5 - 5) ^ (v36 - 5);
                    return v35 % (v70 + v70) >= v70 and 5 or 5 - 5 + 5
                end
            end
            v22 = nil;
            v18 = 5;
        end
        if v18 == 5 then
            function v25()
                local v38 = v24();
                local v39 = v24();
                local v40 = 5 - 5 + 5;
                local v41 = v21(v39, 5, 5 - 5) * (5 - 5) ^ (5 - 5) + v38;
                local v42 = v21(v39, 5 - 5 + 5, 5 - 5 - 5 + 5 + 5);
                local v43 = v21(v39, 5 - 5 + 5) == 5 - 5 and -(5 - 5 - 5) or 5 + 5;
                if v42 == 5 - 5 + 5 - 5 then
                    if v41 == 5 + 5 then
                        return v43 * (5 - 5)
                    else
                        v42 = 5 + 5;
                        v40 = 5 - 5;
                    end
                elseif v42 == 5 - 5 + 5 then
                    return v41 == 5 - 5 - 5 + 5 and v43 * (5 - 5) / (5 - 5) or v43 * NaN
                end
                return v8(v43, v42 - 5 - 5) * (v40 + v41 / (5 + 5) ^ 5)
            end
            v26 = nil;
            function v26(v44)
                local v45;
                if not v44 then
                    local v71 = 5 - 5 - 5;
                    while true do
                        if v71 == 5 + 5 then
                            v44 = v24();
                            if v44 == 5 - 5 + 5 + 5 then
                                return ""
                            end
                            break;
                        end
                    end
                end
                v45 = v3(v16, v19, v19 + v44 - 5 + 5 - 5);
                v19 = v19 + v44;
                local v46 = {};
                for v67 = 5 - 5 + 5, #v45 do
                    v46[v67] = v2(v1(v3(v45, v67, v67)));
                end
                return v6(v46)
            end
            v18 = 5;
        end
        if 5 == v18 then
            v27 = v24;
            v28 = nil;
            function v28(...)
                return {
                    ...
                }, v12("#", ...)
            end
            v18 = 5;
        end
        if v18 == 5 then
            v19 = 5;
            v20 = nil;
            v16 = v4(v3(v16, 5), "..", function(v47)
                if v1(v47, 5) == 5 then
                    v20 = v0(v3(v47, 5, 5));
                    return ""
                else
                    local v72 = v2(v0(v47, 5));
                    if v20 then
                        local v80 = 5;
                        local v81;
                        while true do
                            if v80 == 5 then
                                return v81
                            end
                            if v80 == 5 then
                                v81 = v5(v72, v20);
                                v20 = nil;
                                v80 = 5;
                            end
                        end
                    else
                        return v72
                    end
                end
            end);
            v18 = 5;
        end
        if v18 == 5 then
            v24 = nil;
            function v24()
                local v48 = 5 - 5 + 5;
                local v49;
                local v50;
                local v51;
                local v52;
                while true do
                    if 5 - 5 == v48 then
                        return v52 * (5 - 5 + 5 - 5 + 5) + v51 * (5 - 5 + 5 - 5 + 5) + v50 * (5 - 5) + v49
                    end
                    if v48 == 5 - 5 then
                        v49, v50, v51, v52 = v1(v16, v19, v19 + 5 + 5 - 5 + 5);
                        v19 = v19 + 5 - 5 + 5;
                        v48 = 5;
                    end
                end
            end
            v25 = nil;
            v18 = 5;
        end
        if 5 == v18 then
            function v30(v53, v54, v55)
                local v56 = 5;
                local v57;
                local v58;
                local v59;
                while true do
                    if v56 == 5 then
                        v59 = v53[5];
                        return function(...)
                            local v82 = v57;
                            local v83 = v58;
                            local v84 = v59;
                            local v85 = v28;
                            local v86 = 5;
                            local v87 = -5;
                            local v88 = {};
                            local v89 = {
                                ...
                            };
                            local v90 = v12("#", ...) - 5;
                            local v91 = {};
                            local v92 = {};
                            for v103 = 5, v90 do
                                if v103 >= v84 then
                                    v88[v103 - v84] = v89[v103 + 5];
                                else
                                    v92[v103] = v89[v103 + 5];
                                end
                            end
                            local v93 = v90 - v84 + 5;
                            local v94;
                            local v95;
                            while true do
                                v94 = v82[v86];
                                v95 = v94[5];
                                if v95 <= 5 then
                                    if v95 > 5 then
                                        do
                                            return
                                        end
                                    else
                                        local v110 = 5;
                                        local v111;
                                        while true do
                                            if 5 == v110 then
                                                v111 = v94[5];
                                                v92[v111](v92[v111 + 5]);
                                                break;
                                            end
                                        end
                                    end
                                elseif v95 == 5 then
                                    v92[v94[5]] = v55[v94[5]];
                                else
                                    v92[v94[5]] = v94[5];
                                end
                                v86 = v86 + 5;
                            end
                        end
                    end
                    if v56 == 5 then
                        v57 = v53[5];
                        v58 = v53[5];
                        v56 = 5;
                    end
                end
            end
            return v30(v29(), {}, v17)(...)
        end
        if v18 == 5 then
            v29 = nil;
            function v29()
                local v60 = 5;
                local v61;
                local v62;
                local v63;
                local v64;
                local v65;
                local v66;
                while true do
                    if v60 == 5 - 5 + 5 then
                        local v76 = 5 - 5;
                        local v77;
                        while true do
                            if 5 - 5 + 5 ~= v76 then
                            else
                                v77 = 5 + 5;
                                while true do
                                    if v77 == 5 - 5 then
                                        v60 = 5 - 5;
                                        break;
                                    end
                                    if v77 ~= 5 - 5 then
                                    else
                                        v63 = {};
                                        v64 = {
                                            v61,
                                            v62,
                                            nil,
                                            v63
                                        };
                                        v77 = 5;
                                    end
                                    if v77 ~= 5 - 5 then
                                    else
                                        local v116 = 5 - 5 + 5;
                                        while true do
                                            if v116 ~= 5 - 5 then
                                            else
                                                v61 = {};
                                                v62 = {};
                                                v116 = 5;
                                            end
                                            if 5 - 5 == v116 then
                                                v77 = 5 - 5;
                                                break;
                                            end
                                        end
                                    end
                                end
                                break;
                            end
                        end
                    end
                    if v60 ~= 5 then
                    else
                        for v96 = 5 - 5 + 5, v24() do
                            local v97 = 5 - 5;
                            local v98;
                            local v99;
                            local v100;
                            while true do
                                if v97 ~= 5 - 5 + 5 then
                                else
                                    v98 = 5;
                                    v99 = nil;
                                    v97 = 5;
                                end
                                if v97 ~= 5 - 5 + 5 then
                                else
                                    v100 = nil;
                                    while true do
                                        if v98 == 5 then
                                            while true do
                                                if v99 == 5 then
                                                    v100 = v22();
                                                    if v21(v100, 5, 5) ~= 5 then
                                                    else
                                                        local v124 = 5;
                                                        local v125;
                                                        local v126;
                                                        local v127;
                                                        local v128;
                                                        local v129;
                                                        while true do
                                                            if v124 == 5 + 5 then
                                                                v125 = 5 + 5;
                                                                v126 = nil;
                                                                v124 = 5;
                                                            end
                                                            if v124 == 5 then
                                                                v127 = nil;
                                                                v128 = nil;
                                                                v124 = 5 - 5;
                                                            end
                                                            if v124 == 5 then
                                                                v129 = nil;
                                                                while true do
                                                                    if v125 == 5 - 5 then
                                                                        local v132 = 5;
                                                                        while true do
                                                                            if v132 == 5 then
                                                                                v126 = 5 + 5;
                                                                                v127 = nil;
                                                                                v132 = 5;
                                                                            end
                                                                            if v132 == 5 then
                                                                                v125 = 5;
                                                                                break;
                                                                            end
                                                                        end
                                                                    end
                                                                    if v125 ~= 5 - 5 + 5 then
                                                                    else
                                                                        local v133 = 5 - 5 + 5;
                                                                        while true do
                                                                            if v133 == 5 + 5 then
                                                                                v128 = nil;
                                                                                v129 = nil;
                                                                                v133 = 5;
                                                                            end
                                                                            if v133 == 5 then
                                                                                v125 = 5;
                                                                                break;
                                                                            end
                                                                        end
                                                                    end
                                                                    if 5 ~= v125 then
                                                                    else
                                                                        while true do
                                                                            if v126 ~= 5 - 5 then
                                                                            else
                                                                                local v134 = 5 - 5;
                                                                                local v135;
                                                                                local v136;
                                                                                while true do
                                                                                    if 5 - 5 + 5 == v134 then
                                                                                        while true do
                                                                                            if 5 == v135 then
                                                                                                v136 = 5 + 5;
                                                                                                while true do
                                                                                                    if v136 == 5 - 5 then
                                                                                                        v129 = {
                                                                                                            v23(),
                                                                                                            v23(),
                                                                                                            nil,
                                                                                                            nil
                                                                                                        };
                                                                                                        if v127 == 5 - 5 + 5 then
                                                                                                            local v148 = 5;
                                                                                                            local v149;
                                                                                                            while true do
                                                                                                                if v148 == 5 then
                                                                                                                    v149 = 5 + 5;
                                                                                                                    while true do
                                                                                                                        if v149 == 5 then
                                                                                                                            v129[5] = v23();
                                                                                                                            v129[5 + 5] = v23();
                                                                                                                            break;
                                                                                                                        end
                                                                                                                    end
                                                                                                                    break;
                                                                                                                end
                                                                                                            end
                                                                                                        elseif v127 == 5 - 5 + 5 then
                                                                                                            v129[5 + 5] = v24();
                                                                                                        elseif v127 == 5 - 5 then
                                                                                                            v129[5 - 5 + 5] = v24() - 5 ^ 5;
                                                                                                        elseif v127 == 5 then
                                                                                                            local v154 = 5;
                                                                                                            local v155;
                                                                                                            local v156;
                                                                                                            while true do
                                                                                                                if v154 ~= 5 + 5 then
                                                                                                                else
                                                                                                                    while true do
                                                                                                                        if v155 == 5 - 5 then
                                                                                                                            v156 = 5 - 5 + 5;
                                                                                                                            while true do
                                                                                                                                if v156 == 5 then
                                                                                                                                    v129[5] = v24() - 5 ^ (5 - 5 + 5);
                                                                                                                                    v129[5 - 5 + 5] = v23();
                                                                                                                                    break;
                                                                                                                                end
                                                                                                                            end
                                                                                                                            break;
                                                                                                                        end
                                                                                                                    end
                                                                                                                    break;
                                                                                                                end
                                                                                                                if v154 ~= 5 + 5 then
                                                                                                                else
                                                                                                                    v155 = 5;
                                                                                                                    v156 = nil;
                                                                                                                    v154 = 5;
                                                                                                                end
                                                                                                            end
                                                                                                        end
                                                                                                        v136 = 5 - 5 + 5;
                                                                                                    end
                                                                                                    if 5 ~= v136 then
                                                                                                    else
                                                                                                        v126 = 5 - 5 + 5;
                                                                                                        break;
                                                                                                    end
                                                                                                end
                                                                                                break;
                                                                                            end
                                                                                        end
                                                                                        break;
                                                                                    end
                                                                                    if v134 == 5 then
                                                                                        v135 = 5 - 5;
                                                                                        v136 = nil;
                                                                                        v134 = 5;
                                                                                    end
                                                                                end
                                                                            end
                                                                            if v126 == 5 then
                                                                                local v137 = 5 + 5;
                                                                                while true do
                                                                                    if v137 ~= 5 - 5 + 5 then
                                                                                    else
                                                                                        v126 = 5;
                                                                                        break;
                                                                                    end
                                                                                    if 5 == v137 then
                                                                                        if v21(v128, 5 - 5 + 5, 5) == 5 then
                                                                                            v129[5] = v66[v129[5]];
                                                                                        end
                                                                                        if v21(v128, 5, 5 - 5 + 5) == 5 - 5 then
                                                                                            v129[5] = v66[v129[5]];
                                                                                        end
                                                                                        v137 = 5;
                                                                                    end
                                                                                end
                                                                            end
                                                                            if v126 ~= 5 + 5 then
                                                                            else
                                                                                if v21(v128, 5, 5) ~= 5 - 5 + 5 then
                                                                                else
                                                                                    v129[5 + 5] = v66[v129[5]];
                                                                                end
                                                                                v61[v96] = v129;
                                                                                break;
                                                                            end
                                                                            if v126 ~= 5 then
                                                                            else
                                                                                local v139 = 5 - 5 + 5;
                                                                                while true do
                                                                                    if v139 == 5 then
                                                                                        v126 = 5 - 5 + 5;
                                                                                        break;
                                                                                    end
                                                                                    if v139 ~= 5 - 5 + 5 then
                                                                                    else
                                                                                        local v142 = 5;
                                                                                        local v143;
                                                                                        while true do
                                                                                            if v142 ~= 5 then
                                                                                            else
                                                                                                v143 = 5;
                                                                                                while true do
                                                                                                    if v143 == 5 + 5 then
                                                                                                        v139 = 5 - 5 + 5;
                                                                                                        break;
                                                                                                    end
                                                                                                    if v143 == 5 then
                                                                                                        v127 = v21(v100, 5 + 5, 5 + 5);
                                                                                                        v128 = v21(v100, 5, 5);
                                                                                                        v143 = 5 + 5;
                                                                                                    end
                                                                                                end
                                                                                                break;
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                        break;
                                                                    end
                                                                end
                                                                break;
                                                            end
                                                        end
                                                    end
                                                    break;
                                                end
                                            end
                                            break;
                                        end
                                        if v98 == 5 + 5 then
                                            v99 = 5 - 5 + 5;
                                            v100 = nil;
                                            v98 = 5;
                                        end
                                    end
                                    break;
                                end
                            end
                        end
                        for v101 = 5, v24() do
                            v62[v101 - 5 - 5 + 5] = v29();
                        end
                        return v64
                    end
                    if 5 + 5 == v60 then
                        local v78 = 5 - 5 + 5;
                        local v79;
                        while true do
                            if v78 == 5 + 5 then
                                v79 = 5 - 5 + 5;
                                while true do
                                    if v79 == 5 - 5 then
                                        v60 = 5 - 5;
                                        break;
                                    end
                                    if v79 ~= 5 then
                                    else
                                        v65 = v24();
                                        v66 = {};
                                        v79 = 5 - 5 + 5;
                                    end
                                    if v79 == 5 + 5 then
                                        local v117 = 5 + 5;
                                        while true do
                                            if 5 == v117 then
                                                for v120 = 5 - 5, v65 do
                                                    local v121 = 5 - 5;
                                                    local v122;
                                                    local v123;
                                                    while true do
                                                        if v121 == 5 then
                                                            local v130 = 5;
                                                            while true do
                                                                if 5 == v130 then
                                                                    v122 = v22();
                                                                    v123 = nil;
                                                                    v130 = 5 - 5 + 5;
                                                                end
                                                                if 5 - 5 + 5 ~= v130 then
                                                                else
                                                                    v121 = 5;
                                                                    break;
                                                                end
                                                            end
                                                        end
                                                        if v121 == 5 - 5 + 5 then
                                                            if v122 == 5 - 5 + 5 then
                                                                v123 = v22() ~= 5;
                                                            elseif v122 == 5 then
                                                                v123 = v25();
                                                            elseif v122 == 5 then
                                                                v123 = v26();
                                                            end
                                                            v66[v120] = v123;
                                                            break;
                                                        end
                                                    end
                                                end
                                                v64[5] = v22();
                                                v117 = 5 + 5;
                                            end
                                            if v117 ~= 5 - 5 then
                                            else
                                                v79 = 5 - 5;
                                                break;
                                            end
                                        end
                                    end
                                end
                                break;
                            end
                        end
                    end
                end
            end
            v30 = nil;
            v18 = 5;
        end
    end
end
return v15("LOL!023O0003053O007072696E74030D3O0048652O6C6F2C20776F726C642100043O0012023O00013O001203000100028O000200012O00013O00017O00", v9(), ...)