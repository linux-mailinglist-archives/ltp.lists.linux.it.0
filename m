Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8BC1CF980
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 17:43:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 13C503C24C6
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 17:43:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 93AFE3C209F
 for <ltp@lists.linux.it>; Tue, 12 May 2020 17:43:42 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2258F6008B4
 for <ltp@lists.linux.it>; Tue, 12 May 2020 17:43:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 219F9AC2C;
 Tue, 12 May 2020 15:43:44 +0000 (UTC)
Date: Tue, 12 May 2020 17:44:09 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <20200512154409.GA9960@yuki.lan>
References: <20200512142824.13063-1-rpalethorpe@suse.com>
 <20200512142824.13063-2-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512142824.13063-2-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] pty04: Retry reads when short
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
> +static ssize_t try_read(int fd, char *data, ssize_t size, ssize_t *n)
> +{
> +	ssize_t ret = read(fd, data, size);
> +
> +	if (ret < 0)
> +		return -(errno != EAGAIN);
> +
> +	return (*n += ret) >= size;
> +}

I had to read this piece twice, but I think it's correct.

>  static void read_netdev(const struct ldisc_info *ldisc)
>  {
> -	int rlen, plen = 0;
> +	int ret, rlen, plen = 0;
> +	ssize_t n;
>  	char *data;
>  
>  	switch (ldisc->n) {
> @@ -305,20 +316,27 @@ static void read_netdev(const struct ldisc_info *ldisc)
>  
>  	tst_res(TINFO, "Reading from socket %d", sk);
>  
> -	SAFE_READ(1, sk, data, plen);
> +	n = 0;
> +	ret = TST_RETRY_FUNC(try_read(sk, data, plen, &n), TST_RETVAL_NOTNULL);
> +	if (ret < 0)
> +		tst_brk(TBROK | TERRNO, "Read %zd of %d bytes", n, plen);

I wonder if a simple loop without exponential backoff would suffice
here. A least the code would probably be more readable.

>  	check_data(ldisc, data, plen);
>  	tst_res(TPASS, "Read netdev 1");
>  
> -	SAFE_READ(1, sk, data, plen);
> +	n = 0;
> +	ret = TST_RETRY_FUNC(try_read(sk, data, plen, &n), TST_RETVAL_NOTNULL);
> +	if (ret < 0)
> +		tst_brk(TBROK | TERRNO, "Read %zd of %d bytes", n, plen);
>  	check_data(ldisc, data, plen);
>  	tst_res(TPASS, "Read netdev 2");
>  
>  	TST_CHECKPOINT_WAKE(0);
> -	while((rlen = read(sk, data, plen)) > 0)
> +	while ((rlen = read(sk, data, plen)) > 0)
>  		check_data(ldisc, data, rlen);

This should have been part of the previous cleanup patch.

>  	tst_res(TPASS, "Reading data from netdev interrupted by hangup");
>  
> +	close(sk);
>  	tst_free_all();
>  }
>  
> @@ -357,6 +375,7 @@ static void cleanup(void)
>  {
>  	ioctl(pts, TIOCVHANGUP);
>  	ioctl(ptmx, TIOCVHANGUP);
> +	close(sk);
>  
>  	tst_reap_children();
>  }
> -- 
> 2.26.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
