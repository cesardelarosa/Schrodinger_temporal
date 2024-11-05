% plot_system.m

function plot_system(x, t, psi_evol, plot_title)
    figure;
    for j = 1:length(t)
        plot(x, abs(psi_evol(:, j)), 'LineWidth', 1.5);
        title([plot_title, ' - Tiempo t = ', num2str(t(j))]);
        xlabel('Posición x');
        ylabel('|\Psi(x,t)|');
        pause(0.1);
    end
end
