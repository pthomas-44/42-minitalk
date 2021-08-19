/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   minitalk.h                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pthomas <pthomas@student.42lyon.fr>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/08/11 17:21:07 by pthomas           #+#    #+#             */
/*   Updated: 2021/08/19 13:31:48 by pthomas          ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#ifndef MINITALK_H
# define MINITALK_H

/*** ~~ LIBS ~~ ***/

# include <unistd.h>
# include <stdlib.h>
# include <signal.h>
# include <stdbool.h>
# include <math.h>

/*** ~~ PROTOTYPES ~~ ***/

// ~~ server.c
void			get_sig(int sig);
void			get_str(int sig);
int				get_char(int sig, char *r);
void			print_char(bool new);
// ~~ client.c
void			check_reception(int sig);
void			send_char(char c, int pid);
// ~~ utils.c
size_t			ft_strlen(const char *s);
void			ft_bzero(void *b, size_t n);
void			ft_putnbr_fd(int n, int fd);
int				ft_atoi(const char *str);
char			*ft_strjoin(const char *s1, const char *s2);

#endif