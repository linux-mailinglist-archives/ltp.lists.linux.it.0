Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 697DF2D0E96
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Dec 2020 12:01:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 316D43C628C
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Dec 2020 12:01:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id BFAC83C627A
 for <ltp@lists.linux.it>; Mon,  7 Dec 2020 12:01:30 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5309560094E
 for <ltp@lists.linux.it>; Mon,  7 Dec 2020 12:01:29 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7CADEAC90;
 Mon,  7 Dec 2020 11:01:29 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 40FC21E1325; Mon,  7 Dec 2020 12:01:29 +0100 (CET)
Date: Mon, 7 Dec 2020 12:01:29 +0100
From: Jan Kara <jack@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20201207110129.GF28106@quack2.suse.cz>
References: <20201204095930.866421-1-amir73il@gmail.com>
 <20201204095930.866421-5-amir73il@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204095930.866421-5-amir73il@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/5] syscalls/fanotify09: Add test case with two
 non-dir children
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

On Fri 04-12-20 11:59:29, Amir Goldstein wrote:
> The existing test cases generate FAN_MODIFY event on a non-dir child
> and FAN_CLOSE_NOWRITE event the parent or sibling subdir.
> 
> Add a test case that generates FAN_CLOSE_NOWRITE on a sibling non-dir
> child.
> 
> Signed-off-by: Amir Goldstein <amir73il@gmail.com>

Looks good. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  .../kernel/syscalls/fanotify/fanotify09.c     | 38 ++++++++++++++-----
>  1 file changed, 28 insertions(+), 10 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify09.c b/testcases/kernel/syscalls/fanotify/fanotify09.c
> index 7bb901cf3..0f1923981 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify09.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify09.c
> @@ -55,13 +55,14 @@ static char event_buf[EVENT_BUF_LEN];
>  
>  #define MOUNT_NAME "mntpoint"
>  #define DIR_NAME "testdir"
> +#define FILE2_NAME "testfile"
>  static int mount_created;
>  
>  static struct tcase {
>  	const char *tname;
>  	struct fanotify_mark_type mark;
>  	unsigned int ondir;
> -	const char *testdir;
> +	const char *close_nowrite;
>  	int nevents;
>  } tcases[] = {
>  	{
> @@ -92,6 +93,13 @@ static struct tcase {
>  		DIR_NAME,
>  		2,
>  	},
> +	{
> +		"Events on non-dir children with both parent and mount marks",
> +		INIT_FANOTIFY_MARK_TYPE(MOUNT),
> +		0,
> +		FILE2_NAME,
> +		2,
> +	},
>  };
>  
>  static void create_fanotify_groups(struct tcase *tc)
> @@ -112,7 +120,7 @@ static void create_fanotify_groups(struct tcase *tc)
>  		SAFE_FANOTIFY_MARK(fd_notify[i],
>  				    FAN_MARK_ADD | mark->flag,
>  				    FAN_CLOSE_NOWRITE | onchild,
> -				    AT_FDCWD, tc->testdir);
> +				    AT_FDCWD, tc->close_nowrite);
>  
>  		/*
>  		 * Add inode mark on parent for each group with MODIFY event,
> @@ -216,9 +224,9 @@ static void test_fanotify(unsigned int n)
>  	 */
>  	SAFE_FILE_PRINTF(fname, "1");
>  	/*
> -	 * generate FAN_CLOSE_NOWRITE event on a testdir (subdir or ".")
> +	 * generate FAN_CLOSE_NOWRITE event on a child, subdir or "."
>  	 */
> -	dirfd = SAFE_OPEN(tc->testdir, O_RDONLY);
> +	dirfd = SAFE_OPEN(tc->close_nowrite, O_RDONLY);
>  	if (dirfd >= 0)
>  		SAFE_CLOSE(dirfd);
>  
> @@ -243,7 +251,7 @@ static void test_fanotify(unsigned int n)
>  	event = (struct fanotify_event_metadata *)event_buf;
>  	verify_event(0, event, FAN_MODIFY, "");
>  	event = FAN_EVENT_NEXT(event, ret);
> -	if (tc->ondir) {
> +	if (tc->nevents > 1) {
>  		verify_event(0, event, FAN_CLOSE_NOWRITE, "");
>  		event = FAN_EVENT_NEXT(event, ret);
>  	}
> @@ -260,14 +268,23 @@ static void test_fanotify(unsigned int n)
>  
>  	/*
>  	 * Then verify the rest of the groups did not get the MODIFY event and
> -	 * did not get the FAN_CLOSE_NOWRITE event on testdir.
> +	 * got the FAN_CLOSE_NOWRITE event only on a non-directory.
>  	 */
>  	for (i = 1; i < NUM_GROUPS; i++) {
> -		ret = read(fd_notify[i], event_buf, FAN_EVENT_METADATA_LEN);
> +		ret = read(fd_notify[i], event_buf, EVENT_BUF_LEN);
>  		if (ret > 0) {
> -			event_res(TFAIL, i, event, "");
> -			if (event->fd != FAN_NOFD)
> -				SAFE_CLOSE(event->fd);
> +			uint32_t expect = 0;
> +
> +			if (tc->nevents > 1 && !tc->ondir)
> +				expect = FAN_CLOSE_NOWRITE;
> +
> +			event = (struct fanotify_event_metadata *)event_buf;
> +			verify_event(i, event, expect, "");
> +
> +			for (; FAN_EVENT_OK(event, ret); FAN_EVENT_NEXT(event, ret)) {
> +				if (event->fd != FAN_NOFD)
> +					SAFE_CLOSE(event->fd);
> +			}
>  			continue;
>  		}
>  
> @@ -295,6 +312,7 @@ static void setup(void)
>  
>  	sprintf(fname, "tfile_%d", getpid());
>  	SAFE_FILE_PRINTF(fname, "1");
> +	SAFE_FILE_PRINTF(FILE2_NAME, "1");
>  }
>  
>  static void cleanup(void)
> -- 
> 2.25.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
