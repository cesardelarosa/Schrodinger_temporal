% free_evol.m

function [psi_evol] = free_evol(psi, x, dx, dt, Nt)
    psi_evol = zeros(length(psi), Nt);
	for j = 1:Nt
        psi(2:end-1) = psi(2:end-1) + ...
            (1i * dt / (2 * dx^2)) * (psi(3:end) - 2 * psi(2:end-1) + psi(1:end-2));
        psi = psi / norm(psi);
		psi_evol(:, j) = psi;
    end
end
