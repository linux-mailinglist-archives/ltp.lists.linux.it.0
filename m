Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7F6104DC3
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 09:21:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C00FF3C1CA3
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 09:21:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 24BDD3C04F9
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 09:21:22 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 08350100EFA0
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 09:21:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2E061AF21;
 Thu, 21 Nov 2019 08:21:20 +0000 (UTC)
Date: Thu, 21 Nov 2019 09:21:18 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191121082118.GA14920@dell5510>
References: <1574241216-15168-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1574241216-15168-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191120151244.GA28197@dell5510> <20191120151610.GB28197@dell5510>
 <efb495a4-1071-68fd-d5a2-7597646228e1@cn.fujitsu.com>
 <20191121051022.GA59487@x230>
 <46954cdf-042b-fffd-583d-b1494d7747dd@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46954cdf-042b-fffd-583d-b1494d7747dd@cn.fujitsu.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/5] syscalls/quotactl01: Add Q_GETNEXTQUOTA
 test
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

Hi Xu,

> Yes. I check <sys/quota.h> and <sys/prctl.h> on musl libc[1] and they don't include linux header files.
> So I think checking both kernel and libc headers on other libc(musl,bionic) is meaningful.
But in single C file we decide only on one of these two.
It's a similar problem as testing raw syscall or libc wrapper (which we already
solved with .test_variants).
NOTE: Bionic has generate it's headers from linux headers.

> ps: If our travis-ci has a target with musl, I think it will be better. I don't know whether possible.
It's here. But it requires some more fixes (in a meantime files are deleted),
so I'll post it once it's everything fixed
https://github.com/pevik/ltp/commits/travis/musl
https://travis-ci.org/pevik/ltp/builds/614575796

There is also CI on LTP on all glibc/uclibc-ng/musl in Buildroot
http://autobuild.buildroot.net/index.php?reason=ltp-testsuite-20190930

+ There are other CI based on yocto/openembedded on glibc/uclibc-ng/musl

> [1]http://git.musl-libc.org/cgit/musl/tree/include/sys/quota.h

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
