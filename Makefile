# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zlayine <zlayine@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/29 10:47:32 by zlayine           #+#    #+#              #
#    Updated: 2020/01/29 10:57:12 by zlayine          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME=libasm.a

SRCS= srcs/ft_read.s \
	srcs/ft_strcmp.s \
	srcs/ft_strcpy.s \
	srcs/ft_strdup.s \
	srcs/ft_strlen.s \
	srcs/ft_write.s

SRCS_BONUS= srcs/ft_atoi_base_bonus.s \
		srcs/ft_list_push_front_bonus.s \
		srcs/ft_list_size_bonus.s \
		srcs/ft_list_sort_bonus.s \
		srcs/ft_list_remove_if_bonus.s


OBJS= $(SRCS:.s=.o)

OBJS_BONUS= $(SRCS_BONUS:.s=.o)

NASM=nasm

NASM_FLAG= -fmacho64


all: $(NAME)

$(NAME): $(OBJS)
	@ar rcs $(NAME) $(OBJS)
	@echo "SUCCESS!"
	
bonus: $(OBJS_BONUS) $(OBJS)
	@ar rcs $(NAME) $(OBJS_BONUS) $(OBJS)
	@echo "SUCCESS!"

%.o: %.s
	@$(NASM) $(NASM_FLAG) $<

clean:
	@rm -rf $(OBJS)
	@rm -rf $(OBJS_BONUS)
	@echo "CLEAN!"
	
fclean: clean
	@rm -rf $(NAME)

re: fclean all
