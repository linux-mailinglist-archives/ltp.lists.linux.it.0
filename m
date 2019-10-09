Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1A9D10AA
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 15:57:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B47163C2266
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 15:57:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B87083C0823
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 15:57:00 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 013611000F62
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 15:55:30 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B5A12B14B;
 Wed,  9 Oct 2019 13:56:58 +0000 (UTC)
Date: Wed, 9 Oct 2019 15:56:56 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191009135656.GD7561@rei.lan>
References: <26d555b1d9deddb5a6f0a93a7c7d3b00e8abc1ff.1570616598.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <26d555b1d9deddb5a6f0a93a7c7d3b00e8abc1ff.1570616598.git.jstancek@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] read_all: retry to queue work for any worker
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
> +static void work_push_retry(int worker, const char *buf)
> +{
> +	int i, ret, worker_min, worker_max;
> +
> +	if (worker < 0) {
> +		/* pick any, try -worker first */
> +		worker_min = worker * (-1);
> +		worker_max = worker_count;
> +	} else {
> +		/* keep trying worker */
> +		worker_min = worker;
> +		worker_max = worker + 1;
> +	}
> +	i = worker_min;
> +
> +	for (;;) {
> +		ret = queue_push(workers[i].q, buf);
> +		if (ret == 1)
> +			break;
> +
> +		if (++i >= worker_max) {
> +			i = worker_min;
> +			usleep(100000);


My only concern is that we sleep for too long here. Maybe we should
start with smaller sleep here and increase it after a while.

Or have you checked that the tests runs as fast as if we had smaller
sleep here?

> +		}
> +	}
> +}
> +
>  static void stop_workers(void)
>  {
>  	const char stop_code[1] = { '\0' };
> @@ -292,7 +319,7 @@ static void stop_workers(void)
>  
>  	for (i = 0; i < worker_count; i++) {
>  		if (workers[i].q)
> -			TST_RETRY_FUNC(queue_push(workers[i].q, stop_code), 1);
> +			work_push_retry(i, stop_code);
>  	}
>  
>  	for (i = 0; i < worker_count; i++) {
> @@ -310,7 +337,7 @@ static void rep_sched_work(const char *path, int rep)
>  	for (i = j = 0; i < rep; i++, j++) {
>  		if (j >= worker_count)
>  			j = 0;
> -		TST_RETRY_FUNC(queue_push(workers[j].q, path), 1);
> +		work_push_retry(-j, path);
>  	}
>  }
>  
> -- 
> 1.8.3.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
