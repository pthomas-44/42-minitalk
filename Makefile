# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pthomas <pthomas@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 15:39:22 by mlokhate          #+#    #+#              #
#    Updated: 2021/08/19 12:31:39 by pthomas          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#========================================#
#=============== VARIABLES ==============#
#========================================#

#~~~~ Output ~~~~#

SERVER		= server
CLIENT		= client

#~~~~ Paths ~~~~#

PATH_INCS	=	includes
PATH_SRCS	=	srcs
PATH_OBJS	=	objs

#~~~~ Sources ~~~~#

SRCS		= 	server.c \
				client.c \
				utils.c \

#~~~~ Objects ~~~~#

OBJS		=	$(addprefix $(PATH_OBJS)/, $(SRCS:.c=.o))

#~~~~ Includes ~~~~#

INCS		=	$(addprefix $(PATH_INCS)/, minitalk.h)

#~~~~ Macros ~~~~#

CC			=	gcc
CFLAGS		=	-Wall -Wextra -Werror

#========================================#
#=============== TARGETS ================#
#========================================#

#~~~~ Main Rules ~~~~#

all :		$(SERVER) $(CLIENT)

bonus :		all

$(SERVER) :	$(OBJS)
			$(CC) $(CFLAGS) -I $(INCS) objs/server.o objs/utils.o -o $(SERVER)

$(CLIENT) :	$(OBJS)
			$(CC) $(CFLAGS) -I $(INCS) objs/client.o objs/utils.o -o $(CLIENT)

re :		fclean all

#~~~~ Compilation Rules ~~~~#

$(PATH_OBJS)/%.o :	$(PATH_SRCS)/%.c $(INCS)
					mkdir -p $(PATH_OBJS)
					$(CC) $(CFLAGS) -O3 -I $(INCS) -c $< -o $@

#~~~~ Norminette ~~~~#

norminette :
			norminette $(PATH_SRCS) $(PATH_INCS)

#~~~~ Cleaning Rules ~~~~#

clean :
			$(RM) -r $(PATH_OBJS)

fclean :		
			$(RM) -r $(PATH_OBJS) $(SERVER) $(CLIENT)

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
								  
.PHONY:		all init bonus norminette clean fclean re eugene
