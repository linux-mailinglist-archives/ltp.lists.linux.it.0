Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D22F18C93F
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 09:54:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A0593C538F
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 09:54:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 01E7C3C537E
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 09:54:30 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 83D0060170E
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 09:54:30 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4A589AEF1
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 08:54:29 +0000 (UTC)
Date: Fri, 20 Mar 2020 09:54:27 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200320085427.GA14750@dell5510>
References: <20200317121057.13529-1-mdoucha@suse.cz>
 <20200317121057.13529-3-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200317121057.13529-3-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/3] Add connection tests for bind()
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

whole patchset is very nice work. Thanks!

> +static void setup(void)
> +{
> +	srand(time(0));
> +
> +	tst_init_sockaddr_inet(&ipv4_addr, IPV4_ADDRESS, 0);
> +	tst_init_sockaddr_inet_bin(&ipv4_any_addr, INADDR_ANY, 0);
> +	tst_init_sockaddr_inet6_bin(&ipv6_addr, &in6addr_loopback, 0);
> +	tst_init_sockaddr_inet6_bin(&ipv6_any_addr, &in6addr_any, 0);
> +}
You don't use tst_init_sockaddr_inet6() at all. How about using it?

Or do you have some reason not to use it?

Kind regards,
Petr

diff --git testcases/kernel/syscalls/bind/bind04.c testcases/kernel/syscalls/bind/bind04.c
index 1be14560b..cdd4f38f5 100644
--- testcases/kernel/syscalls/bind/bind04.c
+++ testcases/kernel/syscalls/bind/bind04.c
@@ -77,7 +77,7 @@ static void setup(void)
 
 	tst_init_sockaddr_inet(&ipv4_addr, IPV4_ADDRESS, 0);
 	tst_init_sockaddr_inet_bin(&ipv4_any_addr, INADDR_ANY, 0);
-	tst_init_sockaddr_inet6_bin(&ipv6_addr, &in6addr_loopback, 0);
+	tst_init_sockaddr_inet6(&ipv6_addr, IPV6_ADDRESS, 0);
 	tst_init_sockaddr_inet6_bin(&ipv6_any_addr, &in6addr_any, 0);
 }
 
diff --git testcases/kernel/syscalls/bind/bind05.c testcases/kernel/syscalls/bind/bind05.c
index 16c9c711d..fdab8b22e 100644
--- testcases/kernel/syscalls/bind/bind05.c
+++ testcases/kernel/syscalls/bind/bind05.c
@@ -77,7 +77,7 @@ static void setup(void)
 
 	tst_init_sockaddr_inet(&ipv4_addr, IPV4_ADDRESS, 0);
 	tst_init_sockaddr_inet_bin(&ipv4_any_addr, INADDR_ANY, 0);
-	tst_init_sockaddr_inet6_bin(&ipv6_addr, &in6addr_loopback, 0);
+	tst_init_sockaddr_inet6(&ipv6_addr, IPV6_ADDRESS, 0);
 	tst_init_sockaddr_inet6_bin(&ipv6_any_addr, &in6addr_any, 0);
 }
 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
