/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   utils.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dev <dev@student.42lyon.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/08/11 17:19:12 by pthomas           #+#    #+#             */
/*   Updated: 2021/11/15 23:57:03 by dev              ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

size_t	ft_strlen(const char *str)
{
	int	i;

	i = 0;
	while (str[i])
		i++;
	return (i);
}

void	ft_bzero(void *dst, size_t len)
{
	void	*start;

	start = dst;
	while (len)
	{
		*(unsigned char *)dst = 0;
		dst++;
		len--;
	}
}

void	ft_putnbr_fd(int n, int fd)
{
	long	nb;
	char	c;

	nb = n;
	if (nb < 0)
	{
		write(fd, "-", 1);
		nb = -nb;
	}
	if (nb > 9)
		ft_putnbr_fd(nb / 10, fd);
	c = nb + 48;
	write(fd, &c, 1);
}

int	ft_atoi(const char *str)
{
	int		nb;
	int		sign;

	nb = 0;
	sign = 1;
	if (*str == '-' || *str == '+')
	{
		if (*str == '-')
			sign = -1;
		str++;
	}
	while ('0' <= *str && *str <= '9')
	{
		nb = nb * 10 + (*str - 48) * sign;
		str++;
	}
	return (nb);
}

char	*ft_strjoin(const char *str1, const char *str2)
{
	int		i;
	int		j;
	char	*new;

	i = 0;
	j = 0;
	new = malloc(sizeof(char) * (ft_strlen(str1) + ft_strlen(str2) + 1));
	if (!new)
		return (NULL);
	while (str1 && str1[j])
		new[i++] = str1[j++];
	j = 0;
	while (str2 && str2[j])
		new[i++] = str2[j++];
	new[i] = '\0';
	free((char *)str1);
	return (new);
}
