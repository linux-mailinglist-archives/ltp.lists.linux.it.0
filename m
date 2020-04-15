Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F301AAC4F
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 17:53:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 880663C6F6F
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 17:53:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 004053C6C02
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 17:53:30 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6C8B51A01125
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 17:53:30 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F4011AC94
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 15:53:28 +0000 (UTC)
Date: Wed, 15 Apr 2020 17:53:47 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200415155347.GB21877@yuki.lan>
References: <20200414154206.21237-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414154206.21237-1-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Add test for CVE 2018-9568
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
> +/*
> + * Copyright (C) 2017 Christoph Paasch <cpaasch@apple.com>
> + * Copyright (C) 2020 SUSE LLC <mdoucha@suse.cz>
> + *
> + * CVE-2018-9568
> + *
> + * Test that connect() to AF_UNSPEC address correctly converts IPV6 socket
> + * to IPV4 listen socket when IPV6_ADDRFORM is set to AF_INET.
> + * Kernel memory corruption fixed in:
> + *
> + *  commit 9d538fa60bad4f7b23193c89e843797a1cf71ef3
> + *  Author: Christoph Paasch <cpaasch@apple.com>
> + *  Date:   Tue Sep 26 17:38:50 2017 -0700
> + *
> + *  net: Set sk_prot_creator when cloning sockets to the right proto
> + */
> +
> +#include <sys/types.h>
> +#include <sys/socket.h>
> +#include <netinet/in.h>
> +#include <netinet/tcp.h>
> +
> +#include "tst_test.h"
> +#include "tst_net.h"
> +#include "tst_taint.h"
> +
> +static int listenfd;
> +static struct sockaddr_in6 bind_addr;
> +static struct sockaddr_in bind_addr4, client_addr;
> +static struct sockaddr reset_addr;
> +
> +static void setup(void)
> +{
> +	tst_taint_init(TST_TAINT_W | TST_TAINT_D);
> +
> +	tst_init_sockaddr_inet6_bin(&bind_addr, &in6addr_any, 42424);
> +	tst_init_sockaddr_inet_bin(&bind_addr4, INADDR_ANY, 0);
> +	tst_init_sockaddr_inet(&client_addr, "127.0.0.1", 42424);

Do we have use the hardcoded port here?

We do have TST_GET_UNUSED_PORT() that should be used for port
allocation.

> +	memset(&reset_addr, 0, sizeof(reset_addr));
> +	reset_addr.sa_family = AF_UNSPEC;
> +
> +	listenfd = SAFE_SOCKET(AF_INET6, SOCK_STREAM, IPPROTO_TCP);
> +	SAFE_BIND(listenfd, (struct sockaddr *)&bind_addr, sizeof(bind_addr));
> +	SAFE_LISTEN(listenfd, 5);
> +}
> +
> +static void cleanup(void)
> +{
> +	if (listenfd >= 0)
> +		SAFE_CLOSE(listenfd);
> +}
> +
> +static void run(void)
> +{
> +	int i, addrlen, fd, confd1, confd2, confd3;
> +	struct sockaddr_storage client_addr2;
> +
> +	for (i = 0; i < 1000; i++) {
> +		confd1 = SAFE_SOCKET(AF_INET, SOCK_STREAM, IPPROTO_TCP);
> +		SAFE_CONNECT(confd1, (struct sockaddr *)&client_addr,
> +			sizeof(client_addr));
> +
> +		fd = SAFE_ACCEPT(listenfd, NULL, NULL);
> +		SAFE_SETSOCKOPT_INT(fd, SOL_IPV6, IPV6_ADDRFORM, AF_INET);
> +		SAFE_CONNECT(fd, (struct sockaddr *)&reset_addr,
> +			sizeof(reset_addr));
> +		SAFE_BIND(fd, (struct sockaddr *)&bind_addr4,
> +			sizeof(bind_addr4));
> +		SAFE_LISTEN(fd, 5);
> +
> +		addrlen = tst_get_connect_address(fd, &client_addr2);
> +		confd2 = SAFE_SOCKET(AF_INET, SOCK_STREAM, IPPROTO_TCP);
> +		SAFE_CONNECT(confd2, (struct sockaddr *)&client_addr2, addrlen);
> +		confd3 = SAFE_ACCEPT(fd, NULL, NULL);
> +
> +		SAFE_CLOSE(confd3);
> +		SAFE_CLOSE(confd2);
> +		SAFE_CLOSE(confd1);
> +		SAFE_CLOSE(fd);
> +
> +		if (tst_taint_check()) {
> +			tst_res(TFAIL, "Kernel is vulnerable");
> +			return;
> +		}
> +	}
> +
> +	tst_res(TPASS, "Nothing bad happened, probably");
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.tags = (const struct tst_tag[]) {
> +		{"linux-git", "9d538fa60bad"},
> +		{"CVE", "2018-9568"},
> +		{}
> +	}
> +};
> -- 
> 2.26.0
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
