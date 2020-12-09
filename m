Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B362D410B
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Dec 2020 12:26:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C02EC3C2BDC
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Dec 2020 12:26:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 8A4A03C23EA
 for <ltp@lists.linux.it>; Wed,  9 Dec 2020 12:26:55 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2140D200241
 for <ltp@lists.linux.it>; Wed,  9 Dec 2020 12:26:54 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 24C37AC94;
 Wed,  9 Dec 2020 11:26:54 +0000 (UTC)
To: Li Wang <liwang@redhat.com>, ltp@lists.linux.it
References: <20201203110616.28302-1-liwang@redhat.com>
 <20201204063305.6820-1-liwang@redhat.com>
 <20201204063305.6820-3-liwang@redhat.com>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <80776321-e6ae-0817-5e9b-d3009922b0cb@suse.cz>
Date: Wed, 9 Dec 2020 12:26:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201204063305.6820-3-liwang@redhat.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/3] af_alg07: add dynamic bias for ARM
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 04. 12. 20 7:33, Li Wang wrote:
> We observed that af_alg07 sporadically failed on hpe-moonshot(aarch64) with
> fixed kernel, but after trying manually we can NOT reproduce it again, one
> possibility is that the FAIL is caused by an unaligned race window between
> two threads, so here add dynamic bias adjustment to see if it helps.
> 
> From Martin Doucha:
> 
> 1) fchownat() returns 0 => fchownat() was called too early or the kernel is vulnerable
> 2) fchwonat() fails with ENOENT => kernel is fixed, print TPASS and exit
> 3) fchownat() fails with EBADF => fchownat() was called too late
> 
> Considering the test does NOT takes too time in 1) so we only adjust
> delay when syscalls return an error state that clearly falls outside
> the race window.
> 
> Signed-off-by: Li Wang <liwang@redhat.com>
> CC: Richard Palethorpe <rpalethorpe@suse.com>
> CC: Martin Doucha <mdoucha@suse.cz>
> CC: Joerg Vehlow <lkml@jv-coder.de>
> CC: Chunyu Hu <chuhu@redhat.com>
> CC: Cyril Hrubis <chrubis@suse.cz>

Reviewed-by: Martin Doucha <mdoucha@suse.cz>

> ---
>  testcases/kernel/crypto/af_alg07.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/testcases/kernel/crypto/af_alg07.c b/testcases/kernel/crypto/af_alg07.c
> index 539ebee11..c94bb292f 100644
> --- a/testcases/kernel/crypto/af_alg07.c
> +++ b/testcases/kernel/crypto/af_alg07.c
> @@ -76,6 +76,11 @@ static void run(void)
>  			return;
>  		}
>  
> +		if (TST_RET == -1 && TST_ERR == EBADF) {
> +			tst_fzsync_pair_add_bias(&fzsync_pair, 1);
> +			continue;
> +		}
> +
>  		if (TST_RET == -1 && TST_ERR == ENOENT) {
>  			tst_res(TPASS | TTERRNO,
>  				"fchownat() failed successfully");
> 


-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
