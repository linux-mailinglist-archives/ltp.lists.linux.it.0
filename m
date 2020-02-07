Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B215A155681
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 12:19:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5CA4A3C23C2
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 12:19:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 75F9B3C238D
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 12:19:13 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5A2E51003A8A
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 12:19:12 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A08D0B1C2;
 Fri,  7 Feb 2020 11:19:11 +0000 (UTC)
Date: Fri, 7 Feb 2020 12:19:10 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200207111910.GB19508@rei.lan>
References: <7843cc36a04deb034e9479a139f535e5fa5f3135.1580894017.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7843cc36a04deb034e9479a139f535e5fa5f3135.1580894017.git.jstancek@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/getrandom02: lower bufsize if low on
 entropy
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
> Some PPC KVM guests accumulate about 1 bit of entropy per second while idle
> and running getrandom02. Which isn't enough and test sporadically fails on
> timeout.
> 
> Adjust the buffer size by looking at entropy_avail. We want to run the test,
> even if all entropy is exhausted, but with smaller buffer we don't set
> as high expectations on how much entropy is generated within default test time.
> 
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  testcases/kernel/syscalls/getrandom/getrandom02.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/getrandom/getrandom02.c b/testcases/kernel/syscalls/getrandom/getrandom02.c
> index ee0193df9897..1384fc5f32c0 100644
> --- a/testcases/kernel/syscalls/getrandom/getrandom02.c
> +++ b/testcases/kernel/syscalls/getrandom/getrandom02.c
> @@ -10,6 +10,8 @@
>  #include "lapi/syscalls.h"
>  #include "tst_test.h"
>  
> +#define PROC_ENTROPY_AVAIL "/proc/sys/kernel/random/entropy_avail"
> +
>  static int modes[] = { 0, GRND_RANDOM, GRND_NONBLOCK,
>  		       GRND_RANDOM | GRND_NONBLOCK };
>  
> @@ -37,11 +39,17 @@ static int check_content(unsigned char *buf, int nb)
>  static void verify_getrandom(unsigned int n)
>  {
>  	unsigned char buf[256];
> +	int bufsize = 64, entropy_avail;
>  
> -	memset(buf, 0, sizeof(buf));
> +	if (access(PROC_ENTROPY_AVAIL, F_OK) == 0) {
> +		SAFE_FILE_SCANF(PROC_ENTROPY_AVAIL, "%d", &entropy_avail);
> +		if (entropy_avail > 256)
> +			bufsize = sizeof(buf);
> +	}

Looks good to me, acked.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
