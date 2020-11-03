Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F7C2A4A14
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 16:42:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1CB973C3023
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 16:42:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 11A703C26CB
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 16:42:04 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 842D760012F
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 16:42:04 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 08983ACB5;
 Tue,  3 Nov 2020 15:42:04 +0000 (UTC)
Date: Tue, 3 Nov 2020 16:42:47 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <20201103154247.GA10565@yuki.lan>
References: <20201028171056.2151-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201028171056.2151-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] pty04: Limit the number of packets sent to avoid
 timeout
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
> At the end of the test we transmit many packets while closing the PTY
> to check for races in the kernel. However if the process which closes
> the PTY is delayed this can result a very large number of packets
> being transmitted. The kernel appears to handle this quite slowly
> which can cause the test to timeout or even a softlockup.
> 
> This is not supposed to be a performance test, so this commit puts an
> upper bound on the number of packets transmitted.
> 
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
> 
> Hopefully will solve: https://github.com/linux-test-project/ltp/issues/674
> 
>  testcases/kernel/pty/pty04.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/testcases/kernel/pty/pty04.c b/testcases/kernel/pty/pty04.c
> index 4adf2cbb7..a59de7830 100644
> --- a/testcases/kernel/pty/pty04.c
> +++ b/testcases/kernel/pty/pty04.c
> @@ -136,7 +136,8 @@ static int open_pty(const struct ldisc_info *ldisc)
>  static ssize_t try_write(int fd, const char *data,
>  			 ssize_t size, ssize_t *written)
>  {
> -	ssize_t ret = write(fd, data, size);
> +	ssize_t off = written ? *written : 0;
> +	ssize_t ret = write(fd, data + off, size);

This seems to be correct, but should be send in a seprate patch.

>  	if (ret < 0)
>  		return -(errno != EAGAIN);
> @@ -149,6 +150,7 @@ static void write_pty(const struct ldisc_info *ldisc)
>  	char *data;
>  	ssize_t written, ret;
>  	size_t len = 0;
> +	int max_writes = 1000;
>  
>  	switch (ldisc->n) {
>  	case N_SLIP:
> @@ -190,7 +192,8 @@ static void write_pty(const struct ldisc_info *ldisc)
>  
>  	tst_res(TPASS, "Wrote PTY %s %d (2)", ldisc->name, ptmx);
>  
> -	while (try_write(ptmx, data, len, NULL) >= 0)
> +	TST_CHECKPOINT_WAIT2(0, 100000);
> +	while (max_writes-- && try_write(ptmx, data, len, NULL) >= 0)
>  		;

I wonder if we should change this to be time based instead. I.e. try to
write packets for 10 seconds or so, since hardcoding number of
iterations usually does not scale from embedded to supercomputers.

>  	tst_res(TPASS, "Writing to PTY interrupted by hangup");

And this should be true only if we do not run out of tries meanwhile,
right?

> @@ -331,7 +334,7 @@ static void read_netdev(const struct ldisc_info *ldisc)
>  	check_data(ldisc, data, plen);
>  	tst_res(TPASS, "Read netdev %s %d (2)", ldisc->name, sk);
>  
> -	TST_CHECKPOINT_WAKE(0);
> +	TST_CHECKPOINT_WAKE2(0, 2);
>  	while ((rlen = read(sk, data, plen)) > 0)
>  		check_data(ldisc, data, rlen);
>  
> -- 
> 2.28.0
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
