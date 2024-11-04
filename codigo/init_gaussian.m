% init_gaussian.m

function psi = init_gaussian(x, sigma, p0)
	A = 1;
	psi = A * exp(-0.5 * (x / sigma).^2) .* exp(1i * p0 * x);
end
