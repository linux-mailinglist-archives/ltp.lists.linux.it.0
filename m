Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 580CD76572
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 14:13:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0839B3C1D05
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 14:13:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 94B5A3C020A
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 14:12:59 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 564851A01224
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 14:12:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7CDB1AF8C;
 Fri, 26 Jul 2019 12:12:57 +0000 (UTC)
Date: Fri, 26 Jul 2019 14:12:55 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190726121255.GA28028@rei.lan>
References: <20190725033713.8551-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725033713.8551-1-liwang@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] move_pages12: handle errno EBUSY for
 madvise(..., MADV_SOFT_OFFLINE)
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
>  static void do_test(unsigned int n)
>  {
> -	int i;
> +	int i, ret, retrys;
> +	void *ptr;
>  	pid_t cpid = -1;
>  	int status;
>  	unsigned int twenty_percent = (tst_timeout_remaining() / 5);
> @@ -135,19 +136,37 @@ static void do_test(unsigned int n)
>  	if (cpid == 0)
>  		do_child(tcases[n].tpages);
>  
> -	for (i = 0; i < LOOPS; i++) {
> -		void *ptr;
> +	for (i = 0; i < LOOPS; retrys = 0, i++) {
> +retry:
> +		ptr = mmap(NULL, tcases[n].tpages * hpsz,
> +				PROT_READ | PROT_WRITE,
> +				MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
> +		if (ptr == MAP_FAILED) {
> +			if (errno == ENOMEM) {
> +				if (retrys < LOOPS) {
> +					retrys++;
> +					usleep(1000);
> +					goto retry;
> +				}
> +
> +				if (i > 0) {
> +					tst_res(TINFO, "Test run %d times", i);
> +					goto out;
> +				}
> +			}
> +
> +			tst_brk(TBROK | TERRNO, "Cannot allocate hugepage");
> +		}

Why so complicated?

What about just doing usleep() and continue in case of the failure?


	for (i = 0; i < LOOPS; i++) {
		ptr = mmap(...);
		if (ptr == MAP_FAILED) {
			if (errno == ENOMEM) {
				usleep(1000);
				continue;
			}

			tst_brk(...);
		}

		...
	}


> -		ptr = SAFE_MMAP(NULL, tcases[n].tpages * hpsz,
> -			PROT_READ | PROT_WRITE,
> -			MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
>  		if (ptr != addr)
>  			tst_brk(TBROK, "Failed to mmap at desired addr");
>  
>  		memset(addr, 0, tcases[n].tpages * hpsz);
>  
>  		if (tcases[n].offline) {
> -			if (do_soft_offline(tcases[n].tpages) == EINVAL) {
> +			ret = do_soft_offline(tcases[n].tpages);
> +
> +			if (ret == EINVAL) {
>  				SAFE_KILL(cpid, SIGKILL);
>  				SAFE_WAITPID(cpid, &status, 0);
>  				SAFE_MUNMAP(addr, tcases[n].tpages * hpsz);
> @@ -163,6 +182,7 @@ static void do_test(unsigned int n)
>  			break;
>  	}
>  
> +out:
>  	SAFE_KILL(cpid, SIGKILL);
>  	SAFE_WAITPID(cpid, &status, 0);
>  	if (!WIFEXITED(status))
> -- 
> 2.20.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
