Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F73332474
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 12:52:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F27213C6A8F
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 12:52:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 80CF23C4FC7
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 12:52:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1853D1400062
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 12:52:36 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6C96EAD73;
 Tue,  9 Mar 2021 11:52:36 +0000 (UTC)
Date: Tue, 9 Mar 2021 12:52:34 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <YEdhgvXg/mYkppz6@pevik>
References: <20210309080028.16284-1-liwang@redhat.com>
 <20210309094525.4ggmppfpvavsvjzl@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210309094525.4ggmppfpvavsvjzl@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCh v2] clock_gettime04: print more info to help
 debugging
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

Hi Li, Viresh,

> On 09-03-21, 08:00, Li Wang wrote:
> > We catch some sporadically failures[1] like below, but we don't know which
> > test loop it comes from. So adding more prints to help locate issue.

> >   tst_test.c:1286: TINFO: Timeout per run is 0h 05m 00s
> >   vdso_helpers.c:76: TINFO: Couldn't find vdso_gettime64()
> >   clock_gettime04.c:157: TPASS: CLOCK_REALTIME: Difference between successive readings is reasonable
> >   clock_gettime04.c:150: TFAIL: CLOCK_REALTIME_COARSE: Difference between successive readings greater than 5 ms (1): 8
> >   clock_gettime04.c:157: TPASS: CLOCK_MONOTONIC: Difference between successive readings is reasonable
> >   clock_gettime04.c:150: TFAIL: CLOCK_MONOTONIC_COARSE: Difference between successive readings greater than 5 ms (0): 5
> >   clock_gettime04.c:157: TPASS: CLOCK_MONOTONIC_RAW: Difference between successive readings is reasonable
> >   clock_gettime04.c:157: TPASS: CLOCK_BOOTTIME: Difference between successive readings is reasonable

> > After patching, it will show more details about the iteration:

> >   tst_test.c:1288: TINFO: Timeout per run is 0h 05m 00s
> >   vdso_helpers.c:76: TINFO: Couldn't find vdso_gettime64()
> >   clock_gettime04.c:158: TPASS: CLOCK_REALTIME: Difference between successive readings is reasonable for following variants:
> >   clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
> >   clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
> >   clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec
> >   clock_gettime04.c:162: TINFO:   - gettimeofday
> >   clock_gettime04.c:158: TPASS: CLOCK_REALTIME_COARSE: Difference between successive readings is reasonable for following variants:
> >   clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
> >   clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
> >   clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec
> >   clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC: Difference between successive readings is reasonable for following variants:
> >   clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
> >   clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
> >   clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec
> >   clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC_COARSE: Difference between successive readings is reasonable for following variants:
> >   clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
> >   clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
> >   clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec
> >   clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC_RAW: Difference between successive readings is reasonable for following variants:
> >   clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
> >   clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
> >   clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec
> >   clock_gettime04.c:158: TPASS: CLOCK_BOOTTIME: Difference between successive readings is reasonable for following variants:
> >   clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
> >   clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
> >   clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec

Sorry for putting my opinion late. Instead of repeating variants (duplicity)
I'd prefer just print variants once at the beginning + print which variant
failed.

BTW Some time ago I planned to print test variants in the library,
so it does not have to be copy pasted in every test which uses variants.
Variants could deserve some code optimisation anyway.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
