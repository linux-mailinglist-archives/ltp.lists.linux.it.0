Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE511A9BC0
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 13:08:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0F0883C2B0F
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 13:08:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 848DF3C2AFF
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 13:08:44 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 178E820115C
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 13:08:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9C7E2AE70;
 Wed, 15 Apr 2020 11:08:42 +0000 (UTC)
Date: Wed, 15 Apr 2020 13:08:41 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200415110841.GB29975@dell5510>
References: <20200415092809.20240-1-pvorel@suse.cz>
 <20200415092809.20240-2-pvorel@suse.cz>
 <20200415093038.GA12705@rei.lan> <20200415094932.GA29975@dell5510>
 <20200415104907.GC12705@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415104907.GC12705@rei.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/8] lib: Fix linking error multiple TCID
 definitions with -fno-common
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

Hi Cyril,

> > In file included from memfd_create01.c:17:
> > memfd_create01.c: In function ???verify_memfd_create???:
> > memfd_create01.c:244:21: error: ???TCID??? undeclared (first use in this function)
> >   244 |  fd = CHECK_MFD_NEW(TCID, MFD_DEF_SIZE, tc->flags);
> >       |                     ^~~~
> > ---

> This one is used as a unique test identifier, we can hardcode something
> as "ltp_memfd_create01" there instead.
+1.

> > In file included from testcases/kernel/mem/include/mem.h:4,
> >                  from overcommit_memory.c:72:
> > overcommit_memory.c: In function ???setup???:
> > overcommit_memory.c:105:33: error: ???TCID??? undeclared (first use in this function)
> >   105 |     "can't support to test %s", TCID);
> >       |                                 ^~~~
> > ---

> > In file included from ima_mmap.c:9:
> > ima_mmap.c: In function ???run???:
> > ima_mmap.c:36:43: error: ???TCID??? undeclared (first use in this function)
> >    36 |   tst_brk(TBROK, "Usage: %s -f filename", TCID);
> >       |                                           ^~~~

> Hmm these two are using the TCID as a test binary name, which kind of
> works by accident. Because:

> 1. The library uses argv[0] to initialize TCID
> 2. Then TCID is used as a prefix for the temporary directory
>    the test has created and also for filename on tmpfs

> There is no guarantee that TCID is equal to argv[0], it's only supposed
> to be unique identifier for a test.

> So I would rather be for removing TCID from these tests. The question is
> if we want to replace it with something that is guaranteed to contain
> the test binary name or remove it completely.

I'd be for just hardcoding the info in overcommit_memory.c as it's name from
kernel.
            access(PATH_SYSVM "overcommit_ratio", F_OK) == -1)
-               tst_brk(TCONF, "The system "
-                        "can't support to test %s", TCID);
+               tst_brk(TCONF, "The system can't support to test overcommit_memory");

But for IMA I'll just remove TCID:
testcases/kernel/security/integrity/ima/src/ima_mmap.c
        if (!filename)
-               tst_brk(TBROK, "Usage: %s -f filename", TCID);
+               tst_brk(TBROK, "missing filename (-f filename)");

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
