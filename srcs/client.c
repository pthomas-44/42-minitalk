/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pthomas <pthomas@student.42lyon.fr>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/08/11 12:33:32 by pthomas           #+#    #+#             */
/*   Updated: 2021/08/19 12:25:35 by pthomas          ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/minitalk.h"

void	send_char(char c, int pid)
{
	bool	sig;
	int		i;

	i = 1;
	while (i < 129)
	{
		sig = i & c;
		if (sig)
		{
			if (kill(pid, SIGUSR2) == -1)
				exit(-1);
		}
		else
			if (kill(pid, SIGUSR1) == -1)
				exit(-1);
		i <<= 1;
		usleep(50);
	}
}

int	main(int ac, char **av)
{
	int		pid;
	char	*str;

	if (ac != 3)
		exit(-1);
	pid = ft_atoi(av[1]);
	str = av[2];
	while (*str)
	{
		send_char(*str, pid);
		str++;
	}
	send_char(0, pid);
	return (0);
}
