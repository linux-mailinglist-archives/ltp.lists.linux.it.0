Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFD71AAC37
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 17:47:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E07F83C6F7E
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 17:47:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 5C9A03C6BF6
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 17:47:16 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B86242011FC
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 17:47:15 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AEB9EAC94
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 15:47:13 +0000 (UTC)
Date: Wed, 15 Apr 2020 17:47:31 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200415154731.GA21877@yuki.lan>
References: <20200409113259.27515-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200409113259.27515-1-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Add write()/ioctl() race variant to snd_seq01
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
> diff --git a/testcases/kernel/sound/snd_seq01.c b/testcases/kernel/sound/snd_seq01.c
> index e0f197e74..c3b4b6ac2 100644
> --- a/testcases/kernel/sound/snd_seq01.c
> +++ b/testcases/kernel/sound/snd_seq01.c
> @@ -24,10 +24,27 @@
>  #include "tst_fuzzy_sync.h"
>  #include "tst_taint.h"
>  
> +typedef void (*racefunc_t)(void);
> +
>  static int fd = -1;
>  static int client_id;
> +static struct snd_seq_remove_events rminfo = {
> +	.remove_mode = SNDRV_SEQ_REMOVE_OUTPUT
> +};
> +static struct snd_seq_event ssev = {
> +	.flags = SNDRV_SEQ_TIME_STAMP_TICK | SNDRV_SEQ_TIME_MODE_REL,
> +	.queue = 0,
> +	.type = SNDRV_SEQ_EVENT_USR0,
> +	.time = { .tick = 10 }
> +};
> +
>  static struct tst_fzsync_pair fzsync_pair;
>  
> +static void race_ioctl(void);
> +static void race_write(void);
> +
> +racefunc_t testfunc_list[] = {race_ioctl, race_write};

Can't we just define this as void (*testfuncs[])(void) instead?

There is no point in having a typedef if we don't use the type anywhere
else.

Also why don't decleare the array after the race_* function
implementation? As is it now we do have two more useless lines with
function signatures here.

>  static void setup(void)
>  {
>  	struct snd_seq_queue_info qconf = { .queue = 0 };
> @@ -44,6 +61,7 @@ static void setup(void)
>  
>  	SAFE_IOCTL(fd, SNDRV_SEQ_IOCTL_CLIENT_ID, &client_id);
>  	SAFE_IOCTL(fd, SNDRV_SEQ_IOCTL_CREATE_QUEUE, &qconf);
> +	ssev.dest.client = client_id;
>  
>  	fzsync_pair.exec_loops = 100000;
>  	tst_fzsync_pair_init(&fzsync_pair);
> @@ -63,28 +81,39 @@ static void reinit_pool(int pool_size)
>  		.client = client_id
>  	};
>  
> -	SAFE_IOCTL(fd, SNDRV_SEQ_IOCTL_SET_CLIENT_POOL, &pconf);
> +	ioctl(fd, SNDRV_SEQ_IOCTL_SET_CLIENT_POOL, &pconf);
> +}
> +
> +static void race_ioctl(void)
> +{
> +	reinit_pool(512);
> +}
> +
> +static void race_write(void)
> +{
> +	write(fd, &ssev, sizeof(ssev));
>  }

Is it okay to use SAFE_WRITE() here? Otherwise write() generates a
warning that couldn't be easily silenced.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
