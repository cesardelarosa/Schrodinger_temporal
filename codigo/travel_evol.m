% travel_evol.m

function [psi_evol] = evolucion_viajera(psi, x, dx, dt, Nt, V0)
    xb = 0;
    V = V0 * (x >= xb);
    for j = 1:Nt
        psi(2:end-1) = psi(2:end-1) + ...
            (1i * dt / (2 * dx^2)) * (psi(3:end) - 2 * psi(2:end-1) + ...
			psi(1:end-2)) - (1i * dt) * V(2:end-1) .* psi(2:end-1);
        psi_evol(:, j) = psi;
    end
end
