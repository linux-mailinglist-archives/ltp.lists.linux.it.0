Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDCA1C3409
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 10:07:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01D643C269A
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 10:07:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 944573C2682
 for <ltp@lists.linux.it>; Mon,  4 May 2020 10:07:17 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CC3AB600C74
 for <ltp@lists.linux.it>; Mon,  4 May 2020 10:07:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ACE82AC52;
 Mon,  4 May 2020 08:07:17 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 372041E0508; Mon,  4 May 2020 10:07:15 +0200 (CEST)
Date: Mon, 4 May 2020 10:07:15 +0200
From: Jan Kara <jack@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20200504080715.GA1741@quack2.suse.cz>
References: <20200502162744.9589-1-amir73il@gmail.com>
 <20200502162744.9589-3-amir73il@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200502162744.9589-3-amir73il@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/4] syscalls/fanotify15: Add a test case for
 inode marks
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Sat 02-05-20 19:27:42, Amir Goldstein wrote:
> Test reporting events with fid also with recusrive inode marks:
> - Test events "on self" (FAN_DELETE_SELF) on file and dir
> - Test events "on child" (FAN_MODIFY) on file
> 
> With recursive inode marks, verify that the FAN_MODIFY event reported
> to parent "on child" is merged with the FAN_MODIFY event reported to
> child.
> 
> The new test case is a regression test for commit f367a62a7cad:
> 
>     fanotify: merge duplicate events on parent and child

The test looks OK but do we want a test for this? I mean: A test like this
seems to imply we promise to merge identical events. Although that is a
good general guideline, I consider it rather an optimization that may or
may not happen but userspace should not rely on it. Thoughts?

								Honza


> Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
> Reviewed-by: Matthew Bobrowski <mbobrowski@mbobrowski.org>
> ---
>  .../kernel/syscalls/fanotify/fanotify15.c     | 81 +++++++++++++++++--
>  1 file changed, 73 insertions(+), 8 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify15.c b/testcases/kernel/syscalls/fanotify/fanotify15.c
> index 2e860edb2..a9ed2ec81 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify15.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify15.c
> @@ -9,6 +9,10 @@
>   *	Test file that has been purposely designed to verify
>   *	FAN_REPORT_FID functionality while using newly defined dirent
>   *	events.
> + *
> + * Test case #1 is a regression test for commit f367a62a7cad:
> + *
> + *      fanotify: merge duplicate events on parent and child
>   */
>  #define _GNU_SOURCE
>  #include "config.h"
> @@ -53,28 +57,49 @@ static int fanotify_fd;
>  static char events_buf[EVENT_BUF_LEN];
>  static struct event_t event_set[EVENT_MAX];
>  
> -static void do_test(void)
> +static struct test_case_t {
> +	const char *tname;
> +	struct fanotify_mark_type mark;
> +	unsigned long mask;
> +} test_cases[] = {
> +	{
> +		"FAN_REPORT_FID on filesystem including FAN_DELETE_SELF",
> +		INIT_FANOTIFY_MARK_TYPE(FILESYSTEM),
> +		FAN_DELETE_SELF,
> +	},
> +	{
> +		"FAN_REPORT_FID on directory with FAN_EVENT_ON_CHILD",
> +		INIT_FANOTIFY_MARK_TYPE(INODE),
> +		FAN_EVENT_ON_CHILD,
> +	},
> +};
> +
> +static void do_test(unsigned int number)
>  {
>  	int i, fd, len, count = 0;
>  
>  	struct file_handle *event_file_handle;
>  	struct fanotify_event_metadata *metadata;
>  	struct fanotify_event_info_fid *event_fid;
> +	struct test_case_t *tc = &test_cases[number];
> +	struct fanotify_mark_type *mark = &tc->mark;
> +
> +	tst_res(TINFO, "Test #%d: %s", number, tc->tname);
>  
> -	if (fanotify_mark(fanotify_fd, FAN_MARK_ADD | FAN_MARK_FILESYSTEM,
> +	if (fanotify_mark(fanotify_fd, FAN_MARK_ADD | mark->flag, tc->mask |
>  				FAN_CREATE | FAN_DELETE | FAN_MOVE |
> -				FAN_MODIFY | FAN_DELETE_SELF | FAN_ONDIR,
> +				FAN_MODIFY | FAN_ONDIR,
>  				AT_FDCWD, TEST_DIR) == -1) {
>  		if (errno == ENODEV)
>  			tst_brk(TCONF,
>  				"FAN_REPORT_FID not supported on %s "
>  				"filesystem", tst_device->fs_type);
>  		tst_brk(TBROK | TERRNO,
> -			"fanotify_mark(%d, FAN_MARK_ADD | FAN_MARK_FILESYSTEM, "
> +			"fanotify_mark(%d, FAN_MARK_ADD | %s, "
>  			"FAN_CREATE | FAN_DELETE | FAN_MOVE | "
> -			"FAN_MODIFY | FAN_DELETE_SELF | FAN_ONDIR, "
> +			"FAN_MODIFY | FAN_ONDIR | 0x%lx, "
>  			"AT_FDCWD, %s) failed",
> -			fanotify_fd, TEST_DIR);
> +			fanotify_fd, mark->name, tc->mask, TEST_DIR);
>  	}
>  
>  	/* All dirent events on testdir are merged */
> @@ -87,8 +112,21 @@ static void do_test(void)
>  	fd = SAFE_CREAT(FILE1, 0644);
>  	SAFE_CLOSE(fd);
>  
> +	/* Recursive watch file for events "on self" */
> +	if (mark->flag == FAN_MARK_INODE &&
> +	    fanotify_mark(fanotify_fd, FAN_MARK_ADD | mark->flag,
> +			  FAN_MODIFY | FAN_DELETE_SELF,
> +			  AT_FDCWD, FILE1) == -1) {
> +		tst_brk(TBROK | TERRNO,
> +			"fanotify_mark(%d, FAN_MARK_ADD | %s, "
> +			"FAN_DELETE_SELF, AT_FDCWD, %s) failed",
> +			fanotify_fd, mark->name, FILE1);
> +	}
> +
>  	/*
>  	 * Event on child file is not merged with dirent events.
> +	 * FAN_MODIFY event reported on file mark should be merged with the
> +	 * FAN_MODIFY event reported on parent directory watch.
>  	 */
>  	event_set[count].mask = FAN_MODIFY;
>  	event_set[count].handle.handle_bytes = MAX_HANDLE_SZ;
> @@ -128,6 +166,17 @@ static void do_test(void)
>  
>  	SAFE_MKDIR(DIR1, 0755);
>  
> +	/* Recursive watch subdir for events "on self" */
> +	if (mark->flag == FAN_MARK_INODE &&
> +	    fanotify_mark(fanotify_fd, FAN_MARK_ADD | mark->flag,
> +			  FAN_DELETE_SELF | FAN_ONDIR,
> +			  AT_FDCWD, DIR1) == -1) {
> +		tst_brk(TBROK | TERRNO,
> +			"fanotify_mark(%d, FAN_MARK_ADD | %s,"
> +			"FAN_DELETE_SELF | FAN_ONDIR, AT_FDCWD, %s) failed",
> +			fanotify_fd, mark->name, DIR1);
> +	}
> +
>  	SAFE_RENAME(DIR1, DIR2);
>  
>  	event_set[count].mask = FAN_ONDIR | FAN_DELETE_SELF;
> @@ -141,6 +190,17 @@ static void do_test(void)
>  	/* Read dir events from the event queue */
>  	len += SAFE_READ(0, fanotify_fd, events_buf + len, EVENT_BUF_LEN - len);
>  
> +	/*
> +	 * Cleanup the mark
> +	 */
> +	if (fanotify_mark(fanotify_fd, FAN_MARK_FLUSH | mark->flag, 0,
> +			  AT_FDCWD, TEST_DIR) < 0) {
> +		tst_brk(TBROK | TERRNO,
> +			"fanotify_mark (%d, FAN_MARK_FLUSH | %s, 0,"
> +			"AT_FDCWD, '"TEST_DIR"') failed",
> +			fanotify_fd, mark->name);
> +	}
> +
>  	/* Process each event in buffer */
>  	for (i = 0, metadata = (struct fanotify_event_metadata *) events_buf;
>  		FAN_EVENT_OK(metadata, len); i++) {
> @@ -259,9 +319,14 @@ static struct tst_test test = {
>  	.mount_device = 1,
>  	.mntpoint = MOUNT_POINT,
>  	.all_filesystems = 1,
> -	.test_all = do_test,
> +	.test = do_test,
> +	.tcnt = ARRAY_SIZE(test_cases),
>  	.setup = do_setup,
> -	.cleanup = do_cleanup
> +	.cleanup = do_cleanup,
> +	.tags = (const struct tst_tag[]) {
> +		{"linux-git", "f367a62a7cad"},
> +		{}
> +	}
>  };
>  
>  #else
> -- 
> 2.17.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
