Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 371782C41EB
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 15:16:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E94F63C4E32
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 15:16:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E2E4F3C2451
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 15:16:26 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8832D6011F7
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 15:16:26 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C5669ABDE;
 Wed, 25 Nov 2020 14:16:25 +0000 (UTC)
Date: Wed, 25 Nov 2020 15:16:24 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20201125141624.GA32471@pevik>
References: <20201113164944.26101-1-pvorel@suse.cz>
 <20201113164944.26101-4-pvorel@suse.cz>
 <20201119102740.GD2785@yuki.lan>
 <CAOQ4uxigsk5e7GHgDHydd03D1bAih1SJv36dB4209mpE_dU6PQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxigsk5e7GHgDHydd03D1bAih1SJv36dB4209mpE_dU6PQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/5] fanotify: Introduce SAFE_FANOTIFY_MARK()
 macro
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

Hi Amir,

> > > +++ b/testcases/kernel/syscalls/fanotify/fanotify01.c
> > > @@ -101,19 +101,8 @@ static void test_fanotify(unsigned int n)
> > >                       "failed", tc->init_flags);
> > >       }

> > > -     if (fanotify_mark(fd_notify, FAN_MARK_ADD | mark->flag,
> > > -                       FAN_ACCESS | FAN_MODIFY | FAN_CLOSE | FAN_OPEN,
> > > -                       AT_FDCWD, fname) < 0) {
> > > -             if (errno == EINVAL && mark->flag == FAN_MARK_FILESYSTEM) {
> > > -                     tst_res(TCONF,
> > > -                             "FAN_MARK_FILESYSTEM not supported in kernel?");
> > > -                     return;
> > > -             }

> > Here we had tst_res(TCONF, ...) followed by a return but we will can
> > tst_brk() after the change. I guess that we may skip part of the test on
> > older kernels with that change.


> That's not good. I missed that in my review.
> There are many tests where only the FAN_MARK_FILESYSTEM
> test cases are expected to result in TCONF, but the rest of the test
> cases should run.

I'm not sure if I understand you. Is my approach correct here?

Kind regards,
Petr

> In most of these tests the FAN_MARK_FILESYSTEM test cases are
> last because they were added later. This is not the case with fanotify01
> and fanotify15 and we do not want to reply on the ordering anyway.

> Thanks,
> Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
