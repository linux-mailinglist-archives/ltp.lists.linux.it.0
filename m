Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F5DCBAB9
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Oct 2019 14:42:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56C833C2266
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Oct 2019 14:42:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 6604C3C2214
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 14:42:37 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id EE2A9600738
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 14:42:03 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 70F18B168
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 12:42:36 +0000 (UTC)
Date: Fri, 4 Oct 2019 14:42:35 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20191004124235.GC5442@rei.lan>
References: <20190926151331.25070-1-mdoucha@suse.cz>
 <20190926151331.25070-4-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190926151331.25070-4-mdoucha@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/4] Add socket address initialization
 functions to tst_net library
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
>  include/tst_net.h | 16 +++++++++++
>  lib/tst_net.c     | 71 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 87 insertions(+)
> 
> diff --git a/include/tst_net.h b/include/tst_net.h
> index 740f25bac..2c958da13 100644
> --- a/include/tst_net.h
> +++ b/include/tst_net.h
> @@ -17,6 +17,9 @@
>  
>  #include <arpa/inet.h>
>  #include <stdio.h>
> +#include <sys/types.h>
> +#include <netinet/in.h>
> +#include <netinet/ip.h>
>  
>  #define MAX_IPV4_PREFIX 32
>  #define MAX_IPV6_PREFIX 128
> @@ -49,3 +52,16 @@ int safe_atoi(const char *s, int *ret_i);
>  int get_prefix(const char *ip_str, int is_ipv6);
>  void get_in_addr(const char *ip_str, struct in_addr *ip);
>  void get_in6_addr(const char *ip_str, struct in6_addr *ip6);
> +
> +/*
> + * Find valid connection address for a given bound socket
> + */
> +socklen_t get_connect_address(int sock, struct sockaddr_storage *addr);
> +
> +/*
> + * Initialize AF_INET/AF_INET6 socket address structure with address and port
> + */
> +void init_sockaddr_inet(struct sockaddr_in *sa, const char *ip_str, uint16_t port);
> +void init_sockaddr_inet_bin(struct sockaddr_in *sa, uint32_t ip_val, uint16_t port);
> +void init_sockaddr_inet6(struct sockaddr_in6 *sa, const char *ip_str, uint16_t port);
> +void init_sockaddr_inet6_bin(struct sockaddr_in6 *sa, const struct in6_addr *ip_val, uint16_t port);
> diff --git a/lib/tst_net.c b/lib/tst_net.c
> index 4166641f1..4ccd81eb9 100644
> --- a/lib/tst_net.c
> +++ b/lib/tst_net.c
> @@ -1,5 +1,6 @@
>  /*
>   * Copyright (c) 2017 Petr Vorel <pvorel@suse.cz>
> + * Copyright (c) 2019 Martin Doucha <mdoucha@suse.cz>
>   *
>   * This program is free software: you can redistribute it and/or modify
>   * it under the terms of the GNU General Public License as published by
> @@ -132,3 +133,73 @@ void get_in6_addr(const char *ip_str, struct in6_addr *ip6)
>  	if (inet_pton(AF_INET6, ip_str, ip6) <= 0)
>  		tst_brk_comment("bad IPv6 address: '%s'", ip_str);
>  }
> +
> +socklen_t get_connect_address(int sock, struct sockaddr_storage *addr)
> +{
> +	struct sockaddr_in *inet_ptr;
> +	struct sockaddr_in6 *inet6_ptr;
> +	size_t tmp_size;
> +	socklen_t ret = sizeof(*addr);
> +
> +	SAFE_GETSOCKNAME(sock, (struct sockaddr*)addr, &ret);
> +
> +	// Sanitize wildcard addresses
> +	switch (addr->ss_family) {
> +	case AF_INET:
> +		inet_ptr = (struct sockaddr_in*)addr;
> +
> +		switch (ntohl(inet_ptr->sin_addr.s_addr)) {
> +		case INADDR_ANY:
> +		case INADDR_BROADCAST:
> +			inet_ptr->sin_addr.s_addr = htonl(INADDR_LOOPBACK);
> +			break;
> +		}
> +
> +		break;
> +
> +	case AF_INET6:
> +		inet6_ptr = (struct sockaddr_in6*)addr;
> +		tmp_size = sizeof(struct in6_addr);
> +
> +		if (!memcmp(&inet6_ptr->sin6_addr, &in6addr_any, tmp_size)) {
> +			memcpy(&inet6_ptr->sin6_addr, &in6addr_loopback,
> +				tmp_size);
> +		}
> +
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +void init_sockaddr_inet(struct sockaddr_in *sa, const char *ip_str, uint16_t port)
> +{
> +	memset(sa, 0, sizeof(struct sockaddr_in));
> +	sa->sin_family = AF_INET;
> +	sa->sin_port = htons(port);
> +	get_in_addr(ip_str, &sa->sin_addr);
> +}
> +
> +void init_sockaddr_inet_bin(struct sockaddr_in *sa, uint32_t ip_val, uint16_t port)
> +{
> +	memset(sa, 0, sizeof(struct sockaddr_in));
> +	sa->sin_family = AF_INET;
> +	sa->sin_port = htons(port);
> +	sa->sin_addr.s_addr = htonl(ip_val);
> +}
> +
> +void init_sockaddr_inet6(struct sockaddr_in6 *sa, const char *ip_str, uint16_t port)
> +{
> +	memset(sa, 0, sizeof(struct sockaddr_in6));
> +	sa->sin6_family = AF_INET6;
> +	sa->sin6_port = htons(port);
> +	get_in6_addr(ip_str, &sa->sin6_addr);
> +}
> +
> +void init_sockaddr_inet6_bin(struct sockaddr_in6 *sa, const struct in6_addr *ip_val, uint16_t port)
> +{
> +	memset(sa, 0, sizeof(struct sockaddr_in6));
> +	sa->sin6_family = AF_INET6;
> +	sa->sin6_port = htons(port);
> +	memcpy(&sa->sin6_addr, ip_val, sizeof(struct in6_addr));
> +}

These init functions should really be just static inline functions
instead, there is no point in putting that code into a library code.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
