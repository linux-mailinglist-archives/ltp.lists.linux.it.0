Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6351A9B5E
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 12:49:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5BB8A3C2B23
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 12:49:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 4FC133C2AF5
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 12:49:22 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B7BB41001154
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 12:49:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 40A4BAC51;
 Wed, 15 Apr 2020 10:49:20 +0000 (UTC)
Date: Wed, 15 Apr 2020 12:49:07 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200415104907.GC12705@rei.lan>
References: <20200415092809.20240-1-pvorel@suse.cz>
 <20200415092809.20240-2-pvorel@suse.cz>
 <20200415093038.GA12705@rei.lan> <20200415094932.GA29975@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415094932.GA29975@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > +extern const char *TCID;
> 
> > Do we really need this extern or can we remove it?
> Some code is using TCID, not sure if it could be replaced by something else or
> whether is worth to add API function which returns TCID.
> 
> In file included from memfd_create01.c:17:
> memfd_create01.c: In function ???verify_memfd_create???:
> memfd_create01.c:244:21: error: ???TCID??? undeclared (first use in this function)
>   244 |  fd = CHECK_MFD_NEW(TCID, MFD_DEF_SIZE, tc->flags);
>       |                     ^~~~
> ---

This one is used as a unique test identifier, we can hardcode something
as "ltp_memfd_create01" there instead.

> 
> In file included from testcases/kernel/mem/include/mem.h:4,
>                  from overcommit_memory.c:72:
> overcommit_memory.c: In function ???setup???:
> overcommit_memory.c:105:33: error: ???TCID??? undeclared (first use in this function)
>   105 |     "can't support to test %s", TCID);
>       |                                 ^~~~
> ---
> 
> In file included from ima_mmap.c:9:
> ima_mmap.c: In function ???run???:
> ima_mmap.c:36:43: error: ???TCID??? undeclared (first use in this function)
>    36 |   tst_brk(TBROK, "Usage: %s -f filename", TCID);
>       |                                           ^~~~

Hmm these two are using the TCID as a test binary name, which kind of
works by accident. Because:

1. The library uses argv[0] to initialize TCID
2. Then TCID is used as a prefix for the temporary directory
   the test has created and also for filename on tmpfs

There is no guarantee that TCID is equal to argv[0], it's only supposed
to be unique identifier for a test.

So I would rather be for removing TCID from these tests. The question is
if we want to replace it with something that is guaranteed to contain
the test binary name or remove it completely.

-- 
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
