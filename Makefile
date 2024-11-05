GREEN := \033[0;32m
YELLOW := \033[0;33m
BLUE := \033[0;34m
NC := \033[0m

OCTAVE = octave
OCTAVE_FLAGS = --no-gui --silent

TEX_DIR = tex_fuente
AUX_DIR = build
PDF_DIR = ..
MAIN_TEX = main.tex
LATEXMK = latexmk
LATEXMK_FLAGS = -pdf -aux-directory=$(AUX_DIR) -outdir=$(PDF_DIR) -silent

all: run_octave compile_tex

run_octave:
	@$(OCTAVE) $(OCTAVE_FLAGS) codigo/main.m > /dev/null 2>&1
	@echo -e "$(GREEN)Scripts de Octave ejecutados correctamente.$(NC)"

compile_tex:
	@cd $(TEX_DIR) && $(LATEXMK) $(LATEXMK_FLAGS) $(MAIN_TEX) > /dev/null 2>&1
	@echo -e "$(GREEN)Documentos LaTeX compilados correctamente.$(NC)"

clean:
	@rm -rf $(TEX_DIR)/$(AUX_DIR) > /dev/null 2>&1
	@echo -e "$(GREEN)Archivos de compilación de LaTeX limpiados.$(NC)"

fclean: clean
	@rm -rf main.pdf $(TEX_DIR)/main.synctex.gz > /dev/null 2>&1
	@echo -e "$(GREEN)Limpieza completa realizada.$(NC)"

.PHONY: all run_octave compile_tex clean fclean
