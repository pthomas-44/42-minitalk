/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pthomas <pthomas@student.42lyon.fr>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/08/11 12:33:28 by pthomas           #+#    #+#             */
/*   Updated: 2021/11/16 15:03:56 by pthomas          ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"
#include <stdio.h>

int	get_char(int sig, char *c)
{
	static unsigned char	tmp = 0;
	static int				i = 0;

	tmp |= sig << i++;
	if (i > 7)
	{
		*c = tmp;
		tmp = 0;
		i = 0;
		return (1);
	}
	return (0);
}

void	get_str(int sig)
{
	static char	buf[32];
	static char	*str = NULL;
	static int	i = 0;
	char		c;

	if (!get_char(sig, &c))
		return ;
	buf[i] = c;
	if (buf[i] == '\0')
	{
		str = ft_strjoin(str, buf);
		str = ft_strjoin(str, "\n");
		write(1, str, ft_strlen(str));
		free(str);
		str = NULL;
		i = -1;
		ft_bzero(buf, sizeof(char) * 32);
	}
	else if (i == 30)
	{
		str = ft_strjoin(str, buf);
		i = -1;
		ft_bzero(buf, sizeof(char) * 32);
	}
	i++;
}

void	get_sig(int sig)
{
	if (sig == SIGUSR2)
		get_str(1);
	else if (sig == SIGUSR1)
		get_str(0);
}

int	main(void)
{
	pid_t				pid;

	pid = getpid();
	ft_putnbr_fd(pid, 1);
	write(1, "\n", 1);
	signal(SIGUSR1, get_sig);
	signal(SIGUSR2, get_sig);
	while (1)
		;
	return (0);
}
