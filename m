Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 624143742EB
	for <lists+linux-ltp@lfdr.de>; Wed,  5 May 2021 18:49:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 137953C57A6
	for <lists+linux-ltp@lfdr.de>; Wed,  5 May 2021 18:49:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A73A43C576F
 for <ltp@lists.linux.it>; Wed,  5 May 2021 18:48:58 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 44429200E1C
 for <ltp@lists.linux.it>; Wed,  5 May 2021 18:48:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A28D5AF0E
 for <ltp@lists.linux.it>; Wed,  5 May 2021 16:48:57 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 630DB1F2B59; Wed,  5 May 2021 18:48:57 +0200 (CEST)
Date: Wed, 5 May 2021 18:48:57 +0200
From: Jan Kara <jack@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20210505164857.GD9615@quack2.suse.cz>
References: <20210505153847.6106-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210505153847.6106-1-mdoucha@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/inotify06: Terminate child process
 on test error
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

On Wed 05-05-21 17:38:46, Martin Doucha wrote:
> If the main test process exits early, the child would keep running and
> interfere with tmpdir cleanup.
> 
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
>  testcases/kernel/syscalls/inotify/inotify06.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)

Thanks for the patch. It looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> 
> diff --git a/testcases/kernel/syscalls/inotify/inotify06.c b/testcases/kernel/syscalls/inotify/inotify06.c
> index 96189b082..f39ab46a1 100644
> --- a/testcases/kernel/syscalls/inotify/inotify06.c
> +++ b/testcases/kernel/syscalls/inotify/inotify06.c
> @@ -38,7 +38,8 @@
>  /* Number of files to test (must be > 1) */
>  #define FILES 5
>  
> -char names[FILES][PATH_MAX];
> +static char names[FILES][PATH_MAX];
> +static pid_t pid;
>  
>  static void setup(void)
>  {
> @@ -51,7 +52,6 @@ static void setup(void)
>  static void verify_inotify(void)
>  {
>  	int inotify_fd, fd;
> -	pid_t pid;
>  	int i, tests;
>  
>  	pid = SAFE_FORK();
> @@ -85,14 +85,24 @@ static void verify_inotify(void)
>  
>  	/* Kill the child creating / deleting files and wait for it */
>  	SAFE_KILL(pid, SIGKILL);
> +	pid = 0;
>  	SAFE_WAIT(NULL);
>  }
>  
> +static void cleanup(void)
> +{
> +	if (pid) {
> +		SAFE_KILL(pid, SIGKILL);
> +		SAFE_WAIT(NULL);
> +	}
> +}
> +
>  static struct tst_test test = {
>  	.timeout = 600,
>  	.needs_tmpdir = 1,
>  	.forks_child = 1,
>  	.setup = setup,
> +	.cleanup = cleanup,
>  	.test_all = verify_inotify,
>  };
>  
> -- 
> 2.31.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
