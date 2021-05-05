Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DF43742B8
	for <lists+linux-ltp@lfdr.de>; Wed,  5 May 2021 18:48:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 907143C57A5
	for <lists+linux-ltp@lfdr.de>; Wed,  5 May 2021 18:48:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 24BAE3C576F
 for <ltp@lists.linux.it>; Wed,  5 May 2021 18:47:59 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 95BBF1A002E7
 for <ltp@lists.linux.it>; Wed,  5 May 2021 18:47:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A7D4FAF0E
 for <ltp@lists.linux.it>; Wed,  5 May 2021 16:47:57 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 8137E1F2B59; Wed,  5 May 2021 18:47:57 +0200 (CEST)
Date: Wed, 5 May 2021 18:47:57 +0200
From: Jan Kara <jack@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20210505164757.GC9615@quack2.suse.cz>
References: <20210505153847.6106-1-mdoucha@suse.cz>
 <20210505153847.6106-2-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210505153847.6106-2-mdoucha@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/inotify06: Raise inotify instance
 limit in /proc
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
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed 05-05-21 17:38:47, Martin Doucha wrote:
> inotify_init() sometimes fails with EMFILE because there are too many
> partially closed instances waiting for garbage collection. Bump the limit
> in /proc/sys/fs/inotify/max_user_instances for the duration of the test.
> 
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
> 
> I thought about only reading the procfile and calling yield() after every
> proc_limit/2 iterations to wait for garbage collection but I'm afraid that
> it might reduce the likelihood of triggering the bug. Since I currently have
> no system where I could reproduce the race, I've decided to play it safe and
> bump the /proc limit.

So waiting would be fine as well. One process simply creates & deletes
files in a loop until the other performs TEARDOWNS teardowns. It doesn't
really matter how fast teardowns happen for the race to trigger. But I have
no problem with this solution either.

								Honza

> 
>  testcases/kernel/syscalls/inotify/inotify06.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/testcases/kernel/syscalls/inotify/inotify06.c b/testcases/kernel/syscalls/inotify/inotify06.c
> index f39ab46a1..68813769b 100644
> --- a/testcases/kernel/syscalls/inotify/inotify06.c
> +++ b/testcases/kernel/syscalls/inotify/inotify06.c
> @@ -38,8 +38,11 @@
>  /* Number of files to test (must be > 1) */
>  #define FILES 5
>  
> +#define PROCFILE "/proc/sys/fs/inotify/max_user_instances"
> +
>  static char names[FILES][PATH_MAX];
>  static pid_t pid;
> +static int old_proc_limit;
>  
>  static void setup(void)
>  {
> @@ -47,6 +50,11 @@ static void setup(void)
>  
>  	for (i = 0; i < FILES; i++)
>  		sprintf(names[i], "fname_%d", i);
> +
> +	SAFE_FILE_SCANF(PROCFILE, "%d", &old_proc_limit);
> +
> +	if (old_proc_limit >= 0 && old_proc_limit < TEARDOWNS)
> +		SAFE_FILE_PRINTF(PROCFILE, "%d", TEARDOWNS + 128);
>  }
>  
>  static void verify_inotify(void)
> @@ -95,10 +103,13 @@ static void cleanup(void)
>  		SAFE_KILL(pid, SIGKILL);
>  		SAFE_WAIT(NULL);
>  	}
> +
> +	SAFE_FILE_PRINTF(PROCFILE, "%d", old_proc_limit);
>  }
>  
>  static struct tst_test test = {
>  	.timeout = 600,
> +	.needs_root = 1,
>  	.needs_tmpdir = 1,
>  	.forks_child = 1,
>  	.setup = setup,
> -- 
> 2.31.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
