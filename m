Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F5397873
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Aug 2019 13:56:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 86C593C1CF8
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Aug 2019 13:56:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 8FC533C1866
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 13:56:44 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DD4511000672
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 13:56:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9D728ABED;
 Wed, 21 Aug 2019 11:56:43 +0000 (UTC)
References: <20190808153825.18363-1-rpalethorpe@suse.com>
 <20190808153825.18363-2-rpalethorpe@suse.com>
 <CAEemH2czBk5KKgFB0_4bWtnwdnJdq0sJNmo=q3_u1UipEhaOJw@mail.gmail.com>
User-agent: mu4e 1.2.0; emacs 26.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2czBk5KKgFB0_4bWtnwdnJdq0sJNmo=q3_u1UipEhaOJw@mail.gmail.com>
Date: Wed, 21 Aug 2019 13:56:43 +0200
Message-ID: <87v9uqviis.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] capability: Introduce capability API
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
Reply-To: rpalethorpe@suse.de
Cc: Michael Moese <mmoese@suse.com>, LTP List <ltp@lists.linux.it>,
 Richard Palethorpe <richard.palethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

hi,

> It does not work for this simple cap_test.c, did I miss anything?
>
> # whoami
> root
>
> # ./cap_test
> tst_test.c:1111: INFO: Timeout per run is 0h 05m 00s
> tst_capability.c:42: INFO: Dropping CAP_SYS_ADMIN(21)
> tst_capability.c:65: BROK: tst_capset(CAP_SYS_ADMIN): EPERM

Not sure why this fails for you.

>
> # ./cap_test
> tst_test.c:1111: INFO: Timeout per run is 0h 05m 00s
> tst_capability.c:51: CONF: Need CAP_SYS_ADMIN(21)

Ah, I probably got the binary ops wrong.

>
> # cat cap_test.c
> #include "tst_test.h"
> #include "linux/capability.h"
>
> static void do_test(void)
> {
>         tst_res(TPASS, "Hello");
> }
>
> static struct tst_test test = {
>         .test_all = do_test,
>         .needs_root = 1,
>         .caps = (struct tst_cap []) {
> //                TST_CAP(TST_DROP, CAP_SYS_ADMIN),
>                 TST_CAP(TST_REQUIRE, CAP_SYS_ADMIN),
>                 {},
>         },
> };

I will add a test like this, thanks.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
