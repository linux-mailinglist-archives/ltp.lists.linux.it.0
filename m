Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5472CD583
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Dec 2020 13:32:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 57C9D3C4CA4
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Dec 2020 13:32:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id BC0663C2B95
 for <ltp@lists.linux.it>; Thu,  3 Dec 2020 13:32:56 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6D814600F79
 for <ltp@lists.linux.it>; Thu,  3 Dec 2020 13:32:56 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC2B8AC65;
 Thu,  3 Dec 2020 12:32:55 +0000 (UTC)
References: <20201203110616.28302-1-liwang@redhat.com>
 <20201203110616.28302-3-liwang@redhat.com>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <20201203110616.28302-3-liwang@redhat.com>
Date: Thu, 03 Dec 2020 12:32:54 +0000
Message-ID: <878saf6pe1.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] af_alg07: add dynamic bias for ARM
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Li Wang <liwang@redhat.com> writes:

> We observed that af_alg07 sporadically failed on hpe-moonshot(aarch64) with
> fixed kernel, but after trying manually we can NOT reproduce it again, one
> possibility is that the FAIL is caused by an unaligned race window between
> two threads, so here add dynamic bias adjustment to see if it helps.
>
> Point of view from Martin Doucha:
> 1) fchownat() returns 0 => fchownat() was called too early or the kernel is vulnerable
> 2) fchwonat() fails with ENOENT => kernel is fixed, print TPASS and exit
> 3) fchownat() fails with EBADF => fchownat() was called too late

Just FYI, what really prevents fzsync from working is if the temporal
behaviour (time to execute) of a syscall changes dramatically depending
on the outcome of a race[1].

For example if fchownat returns very quickly after EBADF, but takes a
long time otherwise, then the delay will be too small. I guess most
syscalls will check the FD very early so this is likely to be the
problem.

>
> Signed-off-by: Li Wang <liwang@redhat.com>
> CC: Richard Palethorpe <rpalethorpe@suse.com>
> CC: Martin Doucha <mdoucha@suse.cz>
> CC: Joerg Vehlow <lkml@jv-coder.de>
> CC: Chunyu Hu <chuhu@redhat.com>
> CC: Cyril Hrubis <chrubis@suse.cz>
> ---
>  testcases/kernel/crypto/af_alg07.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/testcases/kernel/crypto/af_alg07.c b/testcases/kernel/crypto/af_alg07.c
> index 539ebee11..ee48c2edb 100644
> --- a/testcases/kernel/crypto/af_alg07.c
> +++ b/testcases/kernel/crypto/af_alg07.c
> @@ -76,6 +76,16 @@ static void run(void)
>  			return;
>  		}
>  
> +		if (TST_RET == 0) {
> +			tst_fzsync_pair_add_bias(&fzsync_pair, -1);
> +			continue;
> +		}

It may actually be better to remove this and only increase the delay if
EBADF?

> +
> +		if (TST_RET == -1 && TST_ERR == EBADF) {
> +			tst_fzsync_pair_add_bias(&fzsync_pair, 1);
> +			continue;
> +		}
> +
>  		if (TST_RET == -1 && TST_ERR == ENOENT) {
>  			tst_res(TPASS | TTERRNO,
>  				"fchownat() failed successfully");

[1] Not necessarily the race which causes the bug.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
