Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3206537A6EE
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 14:40:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED93F3C8AE6
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 14:40:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9D7DC3C651B
 for <ltp@lists.linux.it>; Tue, 11 May 2021 14:40:15 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F38B0200C99
 for <ltp@lists.linux.it>; Tue, 11 May 2021 14:40:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 16D0DB083;
 Tue, 11 May 2021 12:40:14 +0000 (UTC)
Date: Tue, 11 May 2021 14:40:12 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YJp7LBc0IxKuwNh2@pevik>
References: <20210401141210.9536-1-pvorel@suse.cz>
 <YJpF5mq0oftICi+u@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJpF5mq0oftICi+u@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2 1/1] netns_netlink: Rewrite into new API
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
Cc: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>, ltp@lists.linux.it,
 Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > Remove check for iproute 100519 (v2.6.34 => old enough to drop this check).

> I guess that this is fine, it seems to be more than 10 years old now.

> > Remove check for unshare() CLONE_NEWNET support (since 2.6.24, old enough).

> Actually there are CONFIG_FOO_NS variables in kernel .config and
> individual namespaces can be turned on/off. So we have to check if
> network namespaces have been compiled into kernel or not. I guess that
> simplest solution here would be adding .needs_kconfig field with
> "CONFIG_NET_NS=y".
Oh yes, there are other tests which use CONFIG_NET_NS=y.

BTW I guess sooner or later we should introduce variable to print only info that
config file is not available (for these embedded platforms and old android).

...
> >  int child_func(void)

> static int child_func(void)
+1

> >  {
> > @@ -71,8 +48,7 @@ int child_func(void)
> >  	char buffer[4096];
> >  	struct nlmsghdr *nlh;

> > -	/* child will listen to a network interface create/delete/up/down
> > -	 * events */
> > +	/* child will listen to a network interface create/delete/up/down events */
> >  	memset(&sa, 0, sizeof(sa));
> >  	sa.nl_family = AF_NETLINK;
> >  	sa.nl_groups = RTMGRP_LINK;
> > @@ -89,7 +65,7 @@ int child_func(void)
> >  	}

> >  	/* waits for parent to create an interface */
> > -	TST_SAFE_CHECKPOINT_WAIT(NULL, 0);
> > +	TST_CHECKPOINT_WAIT(0);

> >  	/* To get rid of "resource temporarily unavailable" errors
> >  	 * when testing with -i option */
> > @@ -121,60 +97,49 @@ int child_func(void)
> >  	return 0;
> >  }


> We can simplify the code here by using SAFE_MACROS() which is allowed in
> new library.

> > -static void test(void)
> > +static void test_netns_netlink(void)
> >  {
> >  	pid_t pid;
> >  	int status;

> >  	/* unshares the network namespace */
> > -	if (unshare(CLONE_NEWNET) == -1)
> > -		tst_brkm(TBROK | TERRNO, cleanup, "unshare failed");
> > +	SAFE_UNSHARE(CLONE_NEWNET);

> > -	pid = tst_fork();
> > -	if (pid < 0) {
> > -		tst_brkm(TBROK | TERRNO, cleanup, "fork failed");
> > -	}
> > +	pid = SAFE_FORK();
> >  	if (pid == 0) {
> >  		_exit(child_func());

> No need for _exit() here, _exit() is to be used from signal handlers.
+1

> >  	}

> >  	/* creates TAP network interface dummy0 */
> >  	if (WEXITSTATUS(system("ip tuntap add dev dummy0 mode tap")))
> > -		tst_brkm(TBROK, cleanup, "system() failed");
> > +		tst_brk(TBROK, "system() failed");

> >  	/* removes previously created dummy0 device */
> >  	if (WEXITSTATUS(system("ip tuntap del mode tap dummy0")))
> > -		tst_brkm(TBROK, cleanup, "system() failed");
> > +		tst_brk(TBROK, "system() failed");

> >  	/* allow child to continue */
> > -	TST_SAFE_CHECKPOINT_WAKE(cleanup, 0);
> > -
> > +	TST_CHECKPOINT_WAKE(0);

> > -	SAFE_WAITPID(cleanup, pid, &status, 0);
> > +	SAFE_WAITPID(pid, &status, 0);
> >  	if (WIFEXITED(status) && WEXITSTATUS(status) != 0) {
> > -		tst_resm(TFAIL, "netlink interface fail");
> > +		tst_res(TFAIL, "netlink interface fail");
> >  		return;
> >  	}

> We can also get rid of this result propagation as we can:

> - use SAFE_MACROS in child
> - use tst_res() in child as:

> static void child_func(void)
> {
> 	...

> 	if (event_found)
> 		tst_res(TPASS, "...");
> 	else
> 		tst_res(TFAIL, "...");

> 	exit(0);
> }

> And with that all we have to do is a call to tst_reap_children()

Oh yes, that makes sense. Sorry for not catching obvious error not using safe
macros.

Sending v3 now.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
