Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6731FF3B2
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 15:49:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BAD0E3C2C92
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 15:49:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E57A03C2C81
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 15:49:48 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BFCB460047E
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 15:48:59 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2D18EAB98;
 Thu, 18 Jun 2020 13:49:47 +0000 (UTC)
Date: Thu, 18 Jun 2020 15:49:45 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20200618134945.GA21692@dell5510>
References: <20200617154926.32588-1-alexey.kodanev@oracle.com>
 <CAEemH2dOxAnaaMXhKyj36FqmYDQ_p_kfi-=pMQhrE3O9oQO8LA@mail.gmail.com>
 <20200618055105.GA42990@x230> <20200618093646.GA11962@dell5510>
 <8b5eef18-1c3e-d89c-9af2-b27828f3cb02@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b5eef18-1c3e-d89c-9af2-b27828f3cb02@oracle.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

Hi Li, Alexey, Cyril,

> > Requiring kernel config is ok for traditional distros (and even here is
> > sometimes readable only for root, e.g. Debian/Ubuntu), but it's still rare on
> > arm (other embedded archs). I guess it'd be nice to have some variable, which
> > would turn kernel config based requirement into warning.


> Also the option's name can be renamed in new releases, so the decision
> should be made only if the option is found (i.e. if we check without the
> the kernel version).
FYI (you may have noticed) there was an effort to add boolean OR for C
implementation:
https://patchwork.ozlabs.org/project/ltp/list/?series=149804&state=*

> tst_check_kconfig - will be really nice to have.
+1. Is anybody planning to work on it?

> Then, we will tconf
> earlier in the setup if this option is found.

> What about TCONF_IF_KCONFIG, in addition to NEEDS_KCONFIG?
+1 (+ add it to C as well).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
