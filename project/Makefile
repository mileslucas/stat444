G := g++
FLAGS := -Wall -Werror
LIBS := -L /diamonds/build

NAME := dmnds

$(NAME) : src/$(NAME).cpp
	$(G) $(FLAGS) -o $@ $< $(LIBS)

clean :
	rm -rf *.o $(NAME)

.PHONY: clean