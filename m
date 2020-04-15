Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF101A9A47
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 12:20:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 45FAB3C2B0E
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 12:20:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id BC54F3C0878
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 12:19:58 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4CFEC20114C
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 12:19:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B8FA1AD0E;
 Wed, 15 Apr 2020 10:19:56 +0000 (UTC)
Date: Wed, 15 Apr 2020 12:19:55 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200415101955.GA21676@dell5510>
References: <20200401083228.GA18685@dell5510> <20200401093934.GA23773@yuki.lan>
 <20200409074505.GA2601@dell5510>
 <CAEemH2fo2HOsgrS7q8s3gr5-BdLfO530f0WGszDDWmpw_V=KOg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2fo2HOsgrS7q8s3gr5-BdLfO530f0WGszDDWmpw_V=KOg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] hugemmap01 warnings with -i [was Re: LTP compilation broken
 with -fno-common]
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>,
 Martin Doucha <martin.doucha@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

> After building LTP with CFLAGS="-fno-common" locally, I just find more
> places that need to do the same improvement.

>     ltp/testcases/kernel/controllers/libcontrollers/libcontrollers.h:56:
> multiple definition of `num_line'
>     ltp/lib/../include/tst_hugepage.h:16: multiple definition of `Hopt'

> Sorry for involving the definition in tst_hugetlb.h without 'extern' issue
> many hours ago. It'd be appreciated if you can fix them together in your
> coming patch.
BTW that's a fix 156f91396 ("hugetlb: move nr_opt to tst_hugepage.h")

I haven't checked whether -i worked without warning before, but not it
produces it:

./hugemmap01  -s 2 -i 2
tst_hugepage.c:48: INFO: 2 hugepage(s) reserved
tst_test.c:1244: INFO: Timeout per run is 0h 05m 00s
hugemmap01.c:61: PASS: call succeeded
hugemmap01.c:61: PASS: call succeeded
hugemmap01.c:69: WARN: Number of HUGEPAGES_FREE stayed the same. Okay if multiple copies running due to test collision.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
