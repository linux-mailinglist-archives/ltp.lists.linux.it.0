Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBBC203926
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 16:26:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A89C43C2BEF
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 16:26:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 641263C136B
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 16:26:35 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 84B5F6019EA
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 16:26:35 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6D217C1DD;
 Mon, 22 Jun 2020 14:26:33 +0000 (UTC)
Date: Mon, 22 Jun 2020 15:34:00 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20200622133239.GA6965@dell5510>
References: <20200617154926.32588-1-alexey.kodanev@oracle.com>
 <CAEemH2dOxAnaaMXhKyj36FqmYDQ_p_kfi-=pMQhrE3O9oQO8LA@mail.gmail.com>
 <20200618055105.GA42990@x230> <20200618093646.GA11962@dell5510>
 <8b5eef18-1c3e-d89c-9af2-b27828f3cb02@oracle.com>
 <20200618134945.GA21692@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618134945.GA21692@dell5510>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/nsf_lib.sh: TCONF on mount (udp/udp6)
 failure for Linux v5.6+
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> > Also the option's name can be renamed in new releases, so the decision
> > should be made only if the option is found (i.e. if we check without the
> > the kernel version).
> FYI (you may have noticed) there was an effort to add boolean OR for C
> implementation:
> https://patchwork.ozlabs.org/project/ltp/list/?series=149804&state=*

> > tst_check_kconfig - will be really nice to have.
> +1. Is anybody planning to work on it?

https://github.com/linux-test-project/ltp/issues/700
I'll try to implement it in July, unless somebody does it before.

> > Then, we will tconf
> > earlier in the setup if this option is found.

> > What about TCONF_IF_KCONFIG, in addition to NEEDS_KCONFIG?
> +1 (+ add it to C as well).
I'd prefer TWARN_IF_NO_CONFIG, more info in the ticket.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
