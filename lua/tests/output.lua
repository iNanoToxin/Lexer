return function(a, b)
    c = nil;
    local d = select;
    local e = string.byte;
    local f = string.sub;
    local g = string.char;
    local h = {
        {
            b = "OpArgR",
            c = "OpArgN"
        },
        {
            b = "OpArgK",
            c = "OpArgN"
        },
        {
            b = "OpArgU",
            c = "OpArgU"
        },
        {
            b = "OpArgR",
            c = "OpArgN"
        },
        {
            b = "OpArgU",
            c = "OpArgN"
        },
        {
            b = "OpArgK",
            c = "OpArgN"
        },
        {
            b = "OpArgR",
            [c] = "OpArgK"
        },
        {
            b = "OpArgK",
            c = "OpArgN"
        },
        {
            b = "OpArgU",
            c = "OpArgN"
        },
        {
            b = "OpArgK",
            c = "OpArgK"
        },
        {
            b = "OpArgU",
            c = "OpArgU"
        },
        {
            b = "OpArgR",
            c = "OpArgK"
        },
        {
            b = "OpArgK",
            c = "OpArgK"
        },
        {
            b = "OpArgK",
            c = "OpArgK"
        },
        {
            b = "OpArgK",
            c = "OpArgK"
        },
        {
            b = "OpArgK",
            c = "OpArgK"
        },
        {
            b = "OpArgK",
            c = "OpArgK"
        },
        {
            b = "OpArgK",
            c = "OpArgK"
        },
        {
            b = "OpArgR",
            c = "OpArgN"
        },
        {
            b = "OpArgR",
            c = "OpArgN"
        },
        {
            b = "OpArgR",
            c = "OpArgN"
        },
        {
            b = "OpArgR",
            c = "OpArgR"
        },
        {
            b = "OpArgR",
            c = "OpArgN"
        },
        {
            b = "OpArgK",
            c = "OpArgK"
        },
        {
            b = "OpArgK",
            c = "OpArgK"
        },
        {
            b = "OpArgK",
            c = "OpArgK"
        },
        {
            b = "OpArgR",
            c = "OpArgU"
        },
        {
            b = "OpArgR",
            c = "OpArgU"
        },
        {
            b = "OpArgU",
            c = "OpArgU"
        },
        {
            b = "OpArgU",
            c = "OpArgU"
        },
        {
            b = "OpArgU",
            c = "OpArgN"
        },
        {
            b = "OpArgR",
            c = "OpArgN"
        },
        {
            b = "OpArgR",
            c = "OpArgN"
        },
        {
            b = "OpArgN",
            c = "OpArgU"
        },
        {
            b = "OpArgU",
            c = "OpArgU"
        },
        {
            b = "OpArgN",
            c = "OpArgN"
        },
        {
            b = "OpArgU",
            c = "OpArgN"
        },
        {
            b = "OpArgU",
            c = "OpArgN"
        }
    }
    local i = {
        "ABC",
        "ABx",
        "ABC",
        "ABC",
        "ABC",
        "ABx",
        "ABC",
        "ABx",
        "ABC",
        "ABC",
        "ABC",
        "ABC",
        "ABC",
        "ABC",
        "ABC",
        "ABC",
        "ABC",
        "ABC",
        "ABC",
        "ABC",
        "ABC",
        "ABC",
        "AsBx",
        "ABC",
        "ABC",
        "ABC",
        "ABC",
        "ABC",
        "ABC",
        "ABC",
        "ABC",
        "AsBx",
        "AsBx",
        "ABC",
        "ABC",
        "ABC",
        "ABx",
        "ABC"
    }
    local j = ""
    for k, l in pairs(a) do
        j = j .. g(l)
    end;
    a = j;
    local function k(l, m, n)
        if n then
            local o = l / 2 ^ (m - 1) % 2 ^ (n - 1 - m - 1 + 1)
            return o - o % 1
        else
            local o = 2 ^ (m - 1)
            if l % (o + o) >= o then
                return 1
            else
                return 0
            end
        end
    end;
    local function l(m)
        local n = 1;
        local o;
        local p;
        local function q()
            local r = e(m, n, n)
            n = n + 1;
            return r
        end;
        local function r()
            local s, t, u, v = e(m, n, n + 3)
            n = n + 4;
            return v * 16777216 + u * 65536 + t * 256 + s
        end;
        local function s()
            return r() * 4294967296 + r()
        end;
        local function t()
            local u = r()
            local v = r()
            local w = 1;
            local x = k(v, 1, 20) * 0 + u;
            local y = k(v, 21, 31)
            local z = -1 ^ k(v, 32)
            if y == 0 then
                if x == 0 then
                    return z * 0
                else
                    y = 1;
                    w = 0
                end
            elseif y == 2047 then
                if x == 0 then
                    return z * 1 / 0
                else
                    return z * 0 / 0
                end
            end;
            return math.ldexp(z, y - 1023) * (w + x / 0)
        end;
        local function u(v)
            local w;
            if v then
                w = f(m, n, n + v - 1)
                n = n + v
            else
                v = o()
                if v == 0 then
                    return
                end;
                w = f(m, n, n + v - 1)
                n = n + v
            end;
            return w
        end;
        local function v()
            local w = {}
            local x = {}
            local y = {}
            local z = {
                Instr = O,
                Const = P,
                Proto = Q,
                Lines = {},
                Name = u(),
                FirstL = p(),
                LastL = p(),
                Upvals = q(),
                Args = q(),
                Vargs = q(),
                Stack = q()
            }
            local A = {}
            if z.Name then
                z.Name = f(z.Name, 1, -2)
            end;
            for B = 1, p() do
                local C = r()
                local D = k(C, 1, 6)
                local E = i[D + 1]
                local F = h[D + 1]
                local G = {
                    Enum = V,
                    Value = U,
                    k(C, 7, 14)
                }
                if E == "ABC" then
                    G[2] = k(C, 24, 32)
                    G[3] = k(C, 15, 23)
                elseif E == "ABx" then
                    G[2] = k(C, 15, 32)
                elseif E == "AsBx" then
                    G[2] = k(C, 15, 32) - 131071
                end;
                do
                    if D == 26 or D == 27 then
                        G[3] = G[3] == 0
                    end;
                    if D >= 23 and D <= 25 then
                        G[1] = G[1] ~= 0
                    end;
                    if F.b == "OpArgK" then
                        G[3] = G[3] or false;
                        if G[2] >= 256 then
                            local H = G[2] - 256;
                            G[4] = H;
                            local I = A[H]
                            if not I then
                                I = {}
                                A[H] = I
                            end;
                            I[#I + 1] = {
                                Inst = Y,
                                Register = 4
                            }
                        end
                    end;
                    if F.d == "OpArgK" then
                        G[4] = G[4] or false;
                        if G[3] >= 256 then
                            local H = G[3] - 256;
                            G[5] = H;
                            local I = A[H]
                            if not I then
                                I = {}
                                A[H] = I
                            end;
                            I[#I + 1] = {
                                Inst = Y,
                                Register = 5
                            }
                        end
                    end
                end;
                w[B] = G
            end;
            for B = 1, p() do
                local C = q()
                local D;
                if C == 1 then
                    D = q() ~= 0
                elseif C == 3 then
                    D = t()
                elseif C == 4 then
                    D = f(u(), 1, -2)
                end;
                local E = A[B - 1]
                if E then
                    for F = 1, #E do
                        E[F].Inst[E[F].Register] = D
                    end
                end;
                x[B - 1] = D
            end;
            for B = 1, p() do
                y[B - 1] = v()
            end;
            do
                local B = z.Lines;
                for C = 1, p() do
                    B[C] = r()
                end;
                for C = 1, p() do
                    u()
                    r()
                    r()
                end;
                for C = 1, p() do
                    u()
                end
            end;
            return z
        end;
        do
            assert(u(4) == "\27Lua", "Lua bytecode expected.")
            assert(q() == 81, "Only Lua 5.1 is supported.")
            q()
            q()
            local w = q()
            local x = q()
            if w == 4 then
                p = r
            elseif w == 8 then
                p = s
            else
                error("Integer size not supported", 2)
            end;
            if x == 4 then
                o = r
            elseif x == 8 then
                o = s
            else
                error("Sizet size not supported", 2)
            end;
            assert(u(3) == "\4\8\0", "Unsupported bytecode target platform")
        end;
        return v()
    end;
    local function m(...)
        return d("#", ...), {...}
    end;
    local function n(o, b, p)
        local q = o.Instr;
        local r = o.Const;
        local s = o.Proto;
        local function t(u, v)
            local w = o.Name or "Code"
            local x = o.Lines[v] or "?"
            error(string.format("%s:%s: %s", w, x, tostring(u)), 0)
        end;
        return function(...)
            local u, v = 1, -1;
            local w, x = {}, d("#", ...) - 1;
            local y = {}
            local z = {}
            local A = setmetatable({}, {
                __index = ah,
                __newindex = function(A, B, C)
                    if B > v then
                        v = B
                    end;
                    y[B] = C
                end
            })
            local function B()
                local C, D;
                while true do
                    C = q[u]
                    D = C.Enum;
                    u = u + 1;
                    if D == 0 then
                        A[C[1]] = A[C[2]]
                    elseif D == 1 then
                        A[C[1]] = r[C[2]]
                    elseif D == 2 then
                        A[C[1]] = C[2] ~= 0;
                        if C[3] ~= 0 then
                            u = u + 1
                        end
                    elseif D == 3 then
                        local E = A;
                        for F = C[1], C[2] do
                            E[F] = nil
                        end
                    elseif D == 4 then
                        A[C[1]] = p[C[2]]
                    elseif D == 5 then
                        A[C[1]] = b[r[C[2]]]
                    elseif D == 6 then
                        local E = A;
                        E[C[1]] = E[C[2]][C[5] or E[C[3]]]
                    elseif D == 7 then
                        b[r[C[2]]] = A[C[1]]
                    elseif D == 8 then
                        p[C[2]] = A[C[1]]
                    elseif D == 9 then
                        local E = A;
                        E[C[1]][C[4] or E[C[2]]] = C[5] or E[C[3]]
                    elseif D == 10 then
                        A[C[1]] = {}
                    elseif D == 11 then
                        local E = A;
                        local F = C[1]
                        local G = E[C[2]]
                        local H = C[5] or E[C[3]]
                        E[F + 1] = G;
                        E[F] = G[H]
                    elseif D == 12 then
                        local E = A;
                        E[C[1]] = (C[4] or E[C[2]]) + (C[5] or E[C[3]])
                    elseif D == 13 then
                        local E = A;
                        E[C[1]] = (C[4] or E[C[2]]) - (C[5] or E[C[3]])
                    elseif D == 14 then
                        local E = A;
                        E[C[1]] = (C[4] or E[C[2]]) * (C[5] or E[C[3]])
                    elseif D == 15 then
                        local E = A;
                        E[C[1]] = (C[4] or E[C[2]]) / (C[5] or E[C[3]])
                    elseif D == 16 then
                        local E = A;
                        E[C[1]] = (C[4] or E[C[2]]) % (C[5] or E[C[3]])
                    elseif D == 17 then
                        local E = A;
                        E[C[1]] = (C[4] or E[C[2]]) ^ (C[5] or E[C[3]])
                    elseif D == 18 then
                        A[C[1]] = -A[C[2]]
                    elseif D == 19 then
                        A[C[1]] = not A[C[2]]
                    elseif D == 20 then
                        A[C[1]] = #A[C[2]]
                    elseif D == 21 then
                        local E = A;
                        local F = C[2]
                        local G = E[F]
                        for H = F + 1, C[3] do
                            G = G .. E[H]
                        end;
                        A[C[1]] = G
                    elseif D == 22 then
                        u = u + C[2]
                    elseif D == 23 then
                        local E = A;
                        local F = C[4] or E[C[2]]
                        local G = C[5] or E[C[3]]
                        if F == G ~= C[1] then
                            u = u + 1
                        end
                    elseif D == 24 then
                        local E = A;
                        local F = C[4] or E[C[2]]
                        local G = C[5] or E[C[3]]
                        if F < G ~= C[1] then
                            u = u + 1
                        end
                    elseif D == 25 then
                        local E = A;
                        local F = C[4] or E[C[2]]
                        local G = C[5] or E[C[3]]
                        if F <= G ~= C[1] then
                            u = u + 1
                        end
                    elseif D == 26 then
                        if C[3] then
                            if A[C[1]] then
                                u = u + 1
                            end
                        elseif A[C[1]] then
                        else
                            u = u + 1
                        end
                    elseif D == 27 then
                        local E = A[C[2]]
                        if C[3] then
                            if E then
                                u = u + 1
                            else
                                A[C[1]] = E
                            end
                        elseif E then
                            A[C[1]] = E
                        else
                            u = u + 1
                        end
                    elseif D == 28 then
                        local E = C[1]
                        local F = C[2]
                        local G = C[3]
                        local H = A;
                        local I, J;
                        local K, L;
                        I = {}
                        if F ~= 1 then
                            if F ~= 0 then
                                K = E + F - 1
                            else
                                K = v
                            end;
                            L = 0;
                            for M = E + 1, K do
                                L = L + 1;
                                I[L] = H[M]
                            end;
                            K, J = m(H[E](unpack(I, 1, K - E)))
                        else
                            K, J = m(H[E]())
                        end;
                        v = E - 1;
                        if G ~= 1 then
                            if G ~= 0 then
                                K = E + G - 2
                            else
                                K = K + E - 1
                            end;
                            L = 0;
                            for M = E, K do
                                L = L + 1;
                                H[M] = J[L]
                            end
                        end
                    elseif D == 29 then
                        local E = C[1]
                        local F = C[2]
                        local G = A;
                        local H, I;
                        local J;
                        local K = 0;
                        H = {}
                        if F ~= 1 then
                            if F ~= 0 then
                                J = E + F - 1
                            else
                                J = v
                            end;
                            for L = E + 1, J do
                                H[#H + 1] = G[L]
                            end;
                            I = {G[E](unpack(H, 1, J - E))}
                        else
                            I = {G[E]()}
                        end;
                        for L in pairs(I) do
                            if L > K then
                                K = L
                            end
                        end;
                        return I, K
                    elseif D == 30 then
                        local E = C[1]
                        local F = C[2]
                        local G = A;
                        local H, I;
                        local J;
                        if F == 1 then
                            return
                        elseif F == 0 then
                            J = v
                        else
                            J = E + F - 2
                        end;
                        I = {}
                        H = 0;
                        for K = E, J do
                            H = H + 1;
                            I[H] = G[K]
                        end;
                        return I, H
                    elseif D == 31 then
                        local E = C[1]
                        local F = A;
                        local G = F[E + 2]
                        local H = F[E] + G;
                        F[E] = H;
                        if G > 0 then
                            if H <= F[E + 1] then
                                u = u + C[2]
                                F[E + 3] = H
                            end
                        else
                            if H >= F[E + 1] then
                                u = u + C[2]
                                F[E + 3] = H
                            end
                        end
                    elseif D == 32 then
                        local E = C[1]
                        local F = A;
                        F[E] = assert(tonumber(F[E]), "`for` initial value must be a number")
                        F[E + 1] = assert(tonumber(F[E + 1]), "`for` limit must be a number")
                        F[E + 2] = assert(tonumber(F[E + 2]), "`for` step must be a number")
                        F[E] = F[E] - F[E + 2]
                        u = u + C[2]
                    elseif D == 33 then
                        local E = C[1]
                        local F = C[3]
                        local G = A;
                        local H = E + 2;
                        local I = {G[E](G[E + 1], G[E + 2])}
                        for J = 1, F do
                            A[H + J] = I[J]
                        end;
                        if G[E + 3] ~= nil then
                            G[E + 2] = G[E + 3]
                        else
                            u = u + 1
                        end
                    elseif D == 34 then
                        local E = C[1]
                        local F = C[2]
                        local G = C[3]
                        local H = A;
                        if G == 0 then
                            u = u + 1;
                            G = q[u].Value
                        end;
                        local I = (G - 1) * 50;
                        local J = H[E]
                        if F == 0 then
                            F = v - E
                        end;
                        for K = 1, F do
                            J[I + K] = H[E + K]
                        end
                    elseif D == 35 then
                        local E = C[1]
                        local F = {}
                        for G = 1, #z do
                            local H = z[G]
                            for I = 0, #H do
                                local J = H[I]
                                local K = J[1]
                                local L = J[2]
                                if K == A and L >= E then
                                    F[L] = K[L]
                                    J[1] = F
                                end
                            end
                        end
                    elseif D == 36 then
                        local E = s[C[2]]
                        local F = A;
                        local G;
                        local H;
                        if E.Upvals ~= 0 then
                            G = {}
                            H = setmetatable({}, {
                                __index = function(I, J)
                                    local K = G[J]
                                    return K[1][K[2]]
                                end,
                                __newindex = function(I, J, K)
                                    local L = G[J]
                                    L[1][L[2]] = K
                                end
                            })
                            for I = 1, E.Upvals do
                                local J = q[u]
                                if J.Enum == 0 then
                                    G[I - 1] = {
                                        F,
                                        J[2]
                                    }
                                elseif J.Enum == 4 then
                                    G[I - 1] = {
                                        p,
                                        J[2]
                                    }
                                end;
                                u = u + 1
                            end;
                            z[#z + 1] = G
                        end;
                        F[C[1]] = n(E, b, H)
                    elseif D == 37 then
                        local E = C[1]
                        local F = C[2]
                        local G, H = A, w;
                        v = E - 1;
                        for I = E, E + (F > 0 and F - 1 or x) do
                            G[I] = H[I - E]
                        end
                    end
                end
            end;
            local C = {...}
            for D = 0, x do
                if D >= o.Args then
                    w[D - o.Args] = C[D + 1]
                else
                    A[D] = C[D + 1]
                end
            end;
            local D, E, F = pcall(B)
            if D then
                if E and F > 0 then
                    return unpack(E, 1, F)
                end;
                return
            else
                t(E, u - 1)
            end
        end
    end;
    local o = l(a)
    return n(o, b or getfenv(0)), o
end