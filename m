Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B8C2A82B1
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Nov 2020 16:53:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B5E8E3C5409
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Nov 2020 16:53:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 73AA53C23B1
 for <ltp@lists.linux.it>; Thu,  5 Nov 2020 16:53:21 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BFAA41A013DD
 for <ltp@lists.linux.it>; Thu,  5 Nov 2020 16:53:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D38FEABD1;
 Thu,  5 Nov 2020 15:53:19 +0000 (UTC)
Date: Thu, 5 Nov 2020 16:54:00 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <20201105155400.GA15701@yuki.lan>
References: <875z6m5rib.fsf@suse.de>
 <20201104163528.13833-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104163528.13833-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] pty04: Limit the number of packets sent to
 avoid timeout
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
> +static ssize_t try_async_write(int fd, const char *data, ssize_t size,
> +			       ssize_t *done)
>  {
> -	ssize_t ret = write(fd, data, size);
> +	ssize_t off = done ? *done : 0;
> +	ssize_t ret = write(fd, data + off, size - off);
>  
>  	if (ret < 0)
>  		return -(errno != EAGAIN);
>  
> -	return !written || (*written += ret) >= size;
> +	if (!done)
> +		return 1;
> +
> +	*done += ret;
> +	return *done >= size;
> +}
> +
> +static ssize_t try_async_read(int fd, char *data, ssize_t size,
> +			      ssize_t *done)
> +{
> +	ssize_t off = done ? *done : 0;
> +	ssize_t ret = read(fd, data + off, size - off);
> +
> +	if (ret < 0)
> +		return -(errno != EAGAIN);
> +
> +	if (!done)
> +		return 1;
> +
> +	*done += ret;
> +	return *done >= size;
>  }
>  
> -static void write_pty(const struct ldisc_info *ldisc)
> +#define RETRY_ASYNC(fn) ({				      \
> +	ssize_t done = 0;				      \
> +	TST_RETRY_FUNC(try_async_##fn(ptmx, data, len, &done),\
> +		       TST_RETVAL_NOTNULL);		      \
> +})

I do not like this macro that much. Maybe we can have two inline
functions here one for read and one for write.

> +static void do_pty(const struct ldisc_info *ldisc)
>  {
>  	char *data;
> -	ssize_t written, ret;
> +	ssize_t ret;
>  	size_t len = 0;
>  
>  	switch (ldisc->n) {
> @@ -171,17 +198,12 @@ static void write_pty(const struct ldisc_info *ldisc)
>  		break;
>  	}
>  
> -
> -	written = 0;
> -	ret = TST_RETRY_FUNC(try_write(ptmx, data, len, &written),
> -			     TST_RETVAL_NOTNULL);
> +	ret = RETRY_ASYNC(write);
>  	if (ret < 0)
>  		tst_brk(TBROK | TERRNO, "Failed 1st write to PTY");
>  	tst_res(TPASS, "Wrote PTY %s %d (1)", ldisc->name, ptmx);
>  
> -	written = 0;
> -	ret = TST_RETRY_FUNC(try_write(ptmx, data, len, &written),
> -			     TST_RETVAL_NOTNULL);
> +	ret = RETRY_ASYNC(write);
>  	if (ret < 0)
>  		tst_brk(TBROK | TERRNO, "Failed 2nd write to PTY");
>  
> @@ -190,14 +212,23 @@ static void write_pty(const struct ldisc_info *ldisc)
>  
>  	tst_res(TPASS, "Wrote PTY %s %d (2)", ldisc->name, ptmx);
>  
> -	while (try_write(ptmx, data, len, NULL) >= 0)
> +	ret = RETRY_ASYNC(read);
> +	if (ret < 0)
> +		tst_brk(TBROK | TERRNO, "Failed read of PTY");
> +
> +	tst_res(TPASS, "Read PTY %s %d", ldisc->name, ptmx);
> +	TST_CHECKPOINT_WAKE(0);
> +
> +	while (RETRY_ASYNC(read) > -1 && RETRY_ASYNC(write) > -1)
>  		;
>  
> -	tst_res(TPASS, "Writing to PTY interrupted by hangup");
> +	tst_res(TPASS, "Transmission on PTY interrupted by hangup");
>  
>  	tst_free_all();
>  }
>  
> +#undef RETRY_ASYNC
> +
>  static void open_netdev(const struct ldisc_info *ldisc)
>  {
>  	struct ifreq ifreq = { 0 };
> @@ -288,7 +319,7 @@ static void check_data(const struct ldisc_info *ldisc,
>  		tst_res(TINFO, "Will continue test without data checking");
>  }
>  
> -static void try_read(int fd, char *data, ssize_t size)
> +static ssize_t try_sync_read(int fd, char *data, ssize_t size)
>  {
>  	ssize_t ret, n = 0;
>  	int retry = mtu;
> @@ -297,13 +328,31 @@ static void try_read(int fd, char *data, ssize_t size)
>  		ret = read(fd, data + n, size - n);
>  
>  		if (ret < 0)
> -			break;
> +			return ret;
>  
>  		if ((n += ret) >= size)
> -			return;
> +			return ret;
> +	}
> +
> +	tst_brk(TBROK | TERRNO, "Only read %zd of %zd bytes", n, size);
> +}
> +
> +static ssize_t try_sync_write(int fd, const char *data, ssize_t size)
> +{
> +	ssize_t ret, n = 0;
> +	int retry = mtu;
> +
> +	while (retry--) {
> +		ret = write(fd, data + n, size - n);
> +
> +		if (ret < 0)
> +			return ret;
> +
> +		if ((n += ret) >= size)
> +			return ret;
>  	}
>  
> -	tst_brk(TBROK | TERRNO, "Read %zd of %zd bytes", n, size);
> +	tst_brk(TBROK | TERRNO, "Only wrote %zd of %zd bytes", n, size);
>  }
>  
>  static void read_netdev(const struct ldisc_info *ldisc)
> @@ -323,19 +372,34 @@ static void read_netdev(const struct ldisc_info *ldisc)
>  
>  	tst_res(TINFO, "Reading from socket %d", sk);
>  
> -	try_read(sk, data, plen);
> +	TEST(try_sync_read(sk, data, plen));
> +	if (TST_RET < 0)
> +		tst_brk(TBROK | TTERRNO, "Read netdev %s %d (1)", ldisc->name, sk);
>  	check_data(ldisc, data, plen);
>  	tst_res(TPASS, "Read netdev %s %d (1)", ldisc->name, sk);
>  
> -	try_read(sk, data, plen);
> +	TEST(try_sync_read(sk, data, plen));
> +	if (TST_RET < 0)
> +		tst_brk(TBROK | TTERRNO, "Read netdev %s %d (2)", ldisc->name, sk);
>  	check_data(ldisc, data, plen);
>  	tst_res(TPASS, "Read netdev %s %d (2)", ldisc->name, sk);
>  
> -	TST_CHECKPOINT_WAKE(0);
> -	while ((rlen = read(sk, data, plen)) > 0)
> +	TEST(try_sync_write(sk, data, plen));
> +	if (TST_RET < 0)
> +		tst_brk(TBROK | TTERRNO, "Write netdev %s %d", ldisc->name, sk);
> +
> +	tst_res(TPASS, "Write netdev %s %d", ldisc->name, sk);
> +
> +	while (1) {
> +		if (try_sync_write(sk, data, plen) < 0)
> +			break;
> +
> +		if ((rlen = try_sync_read(sk, data, plen)) < 0)
> +			break;
>  		check_data(ldisc, data, rlen);
> +	}
>  
> -	tst_res(TPASS, "Reading data from netdev interrupted by hangup");
> +	tst_res(TPASS, "Data transmission on netdev interrupted by hangup");
>  
>  	close(sk);
>  	tst_free_all();
> @@ -356,7 +420,7 @@ static void do_test(unsigned int n)
>  	}
>  
>  	if (!SAFE_FORK()) {
> -		write_pty(ldisc);
> +		do_pty(ldisc);
>  		return;
>  	}

So we do have one process that just reads and one that reads and writes
right? I wonder if that is okay, maybe we should write twice as much as
we read in the do_pty()?

Other than that it looks fine.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
