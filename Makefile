# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dev <dev@student.42lyon.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 15:39:22 by mlokhate          #+#    #+#              #
#    Updated: 2021/11/16 13:40:00 by dev              ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#========================================#
#=============== VARIABLES ==============#
#========================================#

#~~~~ Output ~~~~#

SERVER		= server
CLIENT		= client

#~~~~ Paths ~~~~#

VPATH		=	src/
PATH_INC	=	include/
PATH_OBJ	=	obj/

#~~~~ Files ~~~~#

SRCS		= 	server.c \
				client.c \
				utils.c

OBJ		=	$(addprefix $(PATH_OBJ), $(SRCS:.c=.o))

INC		=	$(addprefix $(PATH_INC), minitalk.h)

#~~~~ Compiler ~~~~#

CC			=	gcc
CFLAGS		=	-Wall -Wextra -Werror
RM			=	rm -rf

#========================================#
#=============== TARGETS ================#
#========================================#

#~~~~ Main Rules ~~~~#

all :		$(SERVER) $(CLIENT)

bonus :		all

$(SERVER) :	$(OBJ)
			$(CC) $(CFLAGS) obj/server.o obj/utils.o -o $@ -I $(PATH_INC)

$(CLIENT) :	$(OBJ)
			$(CC) $(CFLAGS) obj/client.o obj/utils.o -o $@ -I $(PATH_INC)

re :		fclean all

#~~~~ Compilation Rule ~~~~#

$(PATH_OBJ)%.o :	%.c $(INC)
					@mkdir -p $(PATH_OBJ)
					$(CC) $(CFLAGS) -c $< -o $@ -I $(PATH_INC)

#~~~~ Cleaning Rules ~~~~#

clean :
			$(RM) $(PATH_OBJ)

fclean :		
			$(RM) $(PATH_OBJ) $(SERVER) $(CLIENT)

#~~~~ Eugene ~~~~#

eugene :	
			@ echo "               _,........__"
			@ echo "            ,-'            \"\`-."
			@ echo "          ,'                   \`-."
			@ echo "        ,'                        \\"
			@ echo "      ,'                           ."
			@ echo "      .'\\               ,\"\".       \`"
			@ echo "     ._.'|             / |  \`       \\"
			@ echo "     |   |            \`-.'  ||       \`."
			@ echo "     |   |            '-._,'||       | \\"
			@ echo "     .\`.,'             \`..,'.'       , |\`-."
			@ echo "     l                       .'\`.  _/  |   \`."
			@ echo "     \`-.._'-   ,          _ _'   -\" \\  .     \`"
			@ echo "\`.\"\"\"\"\"'-.\`-...,---------','         \`. \`....__."
			@ echo ".'        \`\"-..___      __,'\\          \\  \\     \\"
			@ echo "\\_ .          |   \`\"\"\"\"'    \`.           . \\     \\"
			@ echo "  \`.          |              \`.          |  .     L"
			@ echo "    \`.        |\`--...________.'.        j   |     |"
			@ echo "      \`._    .'      |          \`.     .|   ,     |"
			@ echo "         \`--,\\       .            \`7\"\"' |  ,      |"
			@ echo "            \` \`      \`            /     |  |      |    _,-'\"\"\"\`-."
			@ echo "             \\ \`.     .          /      |  '      |  ,'          \`."
			@ echo "              \\  v.__  .        '       .   \\    /| /              \\"
			@ echo "               \\/    \`\"\"\\\"\"\"\"\"\"\"\`.       \\   \\  /.''                |"
			@ echo "                \`        .        \`._ ___,j.  \`/ .-       ,---.     |"
			@ echo "                ,\`-.      \\         .\"     \`.  |/        j     \`    |"
			@ echo "               /    \`.     \\       /         \\ /         |     /    j"
			@ echo "              |       \`-.   7-.._ .          |\"          '         /"
			@ echo "              |          \`./_    \`|          |            .     _,'"
			@ echo "              \`.           / \`----|          |-............\`---'"
			@ echo "                \\          \\      |          |"
			@ echo "               ,'           )     \`.         |"
			@ echo "                7____,,..--'      /          |"
			@ echo "                                  \`---.__,--.'"
								  
.PHONY:		all bonus clean fclean re eugene
