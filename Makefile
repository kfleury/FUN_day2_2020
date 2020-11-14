##
## EPITECH PROJECT, 2020
## FUN_day1_2020
## File description:
## Makefile
##

## USEFUL DEF ########################################
CC		=	ghc
RM		=	-rm -f
EXT		=	.hs
#######################################################

## Sources ############################################
MAIN		=	$(addsuffix $(EXT), DoOp)

SRC_DIR		=	./src/

SRC_FILES	=

SRC			=	$(addsuffix $(EXT), $(addprefix $(SRC_DIR), $(SRC_FILES)))

TEST_MAIN	=	$(addsuffix $(EXT), Main)

TEST_DIR	=	test/

TEST_FILES	=	UnitTestMy

TEST_SRC	=	$(addsuffix .hs, $(addprefix $(TEST_DIR), $(TEST_FILES)))
#######################################################

## FLAGS ##############################################
CFLAGS		=	-Wall -Wextra
#######################################################

## NAMES ##############################################
BIN			=   doop
TEST_BIN	=	unit_test
#######################################################

## RULES ##############################################
.PHONY: all
all:	$(BIN)
$(BIN): $(MAIN) $(SRC)
	$(CC) -o $(BIN) $(MAIN)

.PHONY: tests_run
tests_run: $(TEST_BIN) fclean
$(TEST_BIN): $(TEST_MAIN) $(TEST_SRC)
	$(CC) -o $(TEST_BIN) $(TEST_MAIN) $(TEST_SRC)
	./$(TEST_BIN)
	@$(RM) $(TEST_BIN)

## Clear rules
.PHONY: clean
clean:
	@$(RM) $(BIN)
	@$(RM) $(TEST_BIN)

.PHONY: fclean
fclean: clean
	@$(RM)	*.hi
	@$(RM)	*.o
	@$(RM)	$(TEST_DIR)*.hi
	@$(RM)	$(TEST_DIR)*.o

.PHONY: re
re:	fclean all clean
