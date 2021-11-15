# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dev <dev@student.42lyon.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 15:39:22 by mlokhate          #+#    #+#              #
#    Updated: 2021/11/15 23:50:12 by dev              ###   ########lyon.fr    #
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
PATH_INCS	=	include/
PATH_OBJS	=	obj/

#~~~~ Sources ~~~~#

SRCS		= 	server.c \
				client.c \
				utils.c

#~~~~ Objects ~~~~#

OBJS		=	$(addprefix $(PATH_OBJS), $(SRCS:.c=.o))

#~~~~ Includes ~~~~#

INCS		=	$(addprefix $(PATH_INCS), minitalk.h)

#~~~~ Compiler ~~~~#

CC			=	gcc
CFLAGS		=	-Wall -Wextra -Werror

#========================================#
#=============== TARGETS ================#
#========================================#

#~~~~ Main Rules ~~~~#

all :		$(SERVER) $(CLIENT)

bonus :		all

$(SERVER) :	$(OBJS)
			$(CC) $(CFLAGS) obj/server.o obj/utils.o -o $(SERVER) -I $(PATH_INCS)

$(CLIENT) :	$(OBJS)
			$(CC) $(CFLAGS) obj/client.o obj/utils.o -o $(CLIENT) -I $(PATH_INCS)

re :		fclean all

#~~~~ Compilation Rule ~~~~#

$(PATH_OBJS)%.o :	%.c $(INCS)
					@mkdir -p $(PATH_OBJS)
					$(CC) $(CFLAGS) -c $< -o $@ -I $(PATH_INCS)

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
								  
.PHONY:		all bonus clean fclean re eugene
