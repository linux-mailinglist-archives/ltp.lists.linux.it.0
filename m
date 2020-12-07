Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AE92D0EB0
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Dec 2020 12:11:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 482903C627F
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Dec 2020 12:11:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id EEED33C2CB7
 for <ltp@lists.linux.it>; Mon,  7 Dec 2020 12:11:13 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 55F466005EA
 for <ltp@lists.linux.it>; Mon,  7 Dec 2020 12:11:13 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9950FAC90;
 Mon,  7 Dec 2020 11:11:12 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 55F941E1325; Mon,  7 Dec 2020 12:11:12 +0100 (CET)
Date: Mon, 7 Dec 2020 12:11:12 +0100
From: Jan Kara <jack@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20201207111112.GG28106@quack2.suse.cz>
References: <20201204095930.866421-1-amir73il@gmail.com>
 <20201204095930.866421-6-amir73il@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204095930.866421-6-amir73il@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5/5] syscalls/fanotify09: Add test case for events
 with filename info
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

On Fri 04-12-20 11:59:30, Amir Goldstein wrote:
> Kernel v5.9 has a bug when there is a mark on filesystem or mount
> interested in events with filename AND there is an additional
> mark on a parent watching children.
> 
> In some situations the event is reported to filesystem or mount mark
> without the filename info.
> 
> This bug is fixed by kernel commit 7372e79c9eb9:
>   fanotify: fix logic of reporting name info with watched parent
> 
> The test case requires a blockdev filesystem.
> 
> Signed-off-by: Amir Goldstein <amir73il@gmail.com>

Looks good. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  .../kernel/syscalls/fanotify/fanotify09.c     | 49 ++++++++++++++++---
>  1 file changed, 42 insertions(+), 7 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify09.c b/testcases/kernel/syscalls/fanotify/fanotify09.c
> index 0f1923981..25b6b8be1 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify09.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify09.c
> @@ -19,6 +19,10 @@
>   * Test case #2 is a regression test for commit 55bf882c7f13:
>   *
>   *      fanotify: fix merging marks masks with FAN_ONDIR
> + *
> + * Test case #5 is a regression test for commit 7372e79c9eb9:
> + *
> + *      fanotify: fix logic of reporting name info with watched parent
>   */
>  #define _GNU_SOURCE
>  #include "config.h"
> @@ -53,15 +57,19 @@ static int fd_notify[NUM_GROUPS];
>  
>  static char event_buf[EVENT_BUF_LEN];
>  
> +#define MOUNT_PATH "fs_mnt"
>  #define MOUNT_NAME "mntpoint"
>  #define DIR_NAME "testdir"
>  #define FILE2_NAME "testfile"
>  static int mount_created;
>  
> +static int fan_report_dfid_unsupported;
> +
>  static struct tcase {
>  	const char *tname;
>  	struct fanotify_mark_type mark;
>  	unsigned int ondir;
> +	unsigned int report_name;
>  	const char *close_nowrite;
>  	int nevents;
>  } tcases[] = {
> @@ -69,6 +77,7 @@ static struct tcase {
>  		"Events on non-dir child with both parent and mount marks",
>  		INIT_FANOTIFY_MARK_TYPE(MOUNT),
>  		0,
> +		0,
>  		DIR_NAME,
>  		1,
>  	},
> @@ -76,6 +85,7 @@ static struct tcase {
>  		"Events on non-dir child and subdir with both parent and mount marks",
>  		INIT_FANOTIFY_MARK_TYPE(MOUNT),
>  		FAN_ONDIR,
> +		0,
>  		DIR_NAME,
>  		2,
>  	},
> @@ -83,6 +93,7 @@ static struct tcase {
>  		"Events on non-dir child and parent with both parent and mount marks",
>  		INIT_FANOTIFY_MARK_TYPE(MOUNT),
>  		FAN_ONDIR,
> +		0,
>  		".",
>  		2,
>  	},
> @@ -90,6 +101,7 @@ static struct tcase {
>  		"Events on non-dir child and subdir with both parent and subdir marks",
>  		INIT_FANOTIFY_MARK_TYPE(INODE),
>  		FAN_ONDIR,
> +		0,
>  		DIR_NAME,
>  		2,
>  	},
> @@ -97,6 +109,15 @@ static struct tcase {
>  		"Events on non-dir children with both parent and mount marks",
>  		INIT_FANOTIFY_MARK_TYPE(MOUNT),
>  		0,
> +		0,
> +		FILE2_NAME,
> +		2,
> +	},
> +	{
> +		"Events on non-dir child with both parent and mount marks and filename info",
> +		INIT_FANOTIFY_MARK_TYPE(MOUNT),
> +		0,
> +		FAN_REPORT_DFID_NAME,
>  		FILE2_NAME,
>  		2,
>  	},
> @@ -105,12 +126,15 @@ static struct tcase {
>  static void create_fanotify_groups(struct tcase *tc)
>  {
>  	struct fanotify_mark_type *mark = &tc->mark;
> -	unsigned int i, onchild, ondir = tc->ondir;
> +	unsigned int i, onchild, report_name, ondir = tc->ondir;
>  
>  	for (i = 0; i < NUM_GROUPS; i++) {
> -		fd_notify[i] = SAFE_FANOTIFY_INIT(FAN_CLASS_NOTIF |
> -						  FAN_NONBLOCK,
> -						  O_RDONLY);
> +		/*
> +		 * The first group may request events with filename info.
> +		 */
> +		report_name = (i == 0) ? tc->report_name : 0;
> +		fd_notify[i] = SAFE_FANOTIFY_INIT(FAN_CLASS_NOTIF | report_name |
> +						  FAN_NONBLOCK, O_RDONLY);
>  
>  		/*
>  		 * Add subdir or mount mark for each group with CLOSE event,
> @@ -217,6 +241,11 @@ static void test_fanotify(unsigned int n)
>  
>  	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
>  
> +	if (fan_report_dfid_unsupported && tc->report_name) {
> +		FANOTIFY_INIT_FLAGS_ERR_MSG(FAN_REPORT_DFID_NAME, fan_report_dfid_unsupported);
> +		return;
> +	}
> +
>  	create_fanotify_groups(tc);
>  
>  	/*
> @@ -249,10 +278,11 @@ static void test_fanotify(unsigned int n)
>  			ret, tc->nevents * (int)FAN_EVENT_METADATA_LEN);
>  	}
>  	event = (struct fanotify_event_metadata *)event_buf;
> -	verify_event(0, event, FAN_MODIFY, "");
> +	verify_event(0, event, FAN_MODIFY, tc->report_name ? fname : "");
>  	event = FAN_EVENT_NEXT(event, ret);
>  	if (tc->nevents > 1) {
> -		verify_event(0, event, FAN_CLOSE_NOWRITE, "");
> +		verify_event(0, event, FAN_CLOSE_NOWRITE,
> +			     tc->report_name ? (tc->ondir ? "." : tc->close_nowrite) : "");
>  		event = FAN_EVENT_NEXT(event, ret);
>  	}
>  	if (ret > 0) {
> @@ -304,8 +334,11 @@ static void test_fanotify(unsigned int n)
>  
>  static void setup(void)
>  {
> +	fan_report_dfid_unsupported = fanotify_init_flags_supported_on_fs(FAN_REPORT_DFID_NAME,
> +									  MOUNT_PATH);
> +
>  	SAFE_MKDIR(MOUNT_NAME, 0755);
> -	SAFE_MOUNT(MOUNT_NAME, MOUNT_NAME, "none", MS_BIND, NULL);
> +	SAFE_MOUNT(MOUNT_PATH, MOUNT_NAME, "none", MS_BIND, NULL);
>  	mount_created = 1;
>  	SAFE_CHDIR(MOUNT_NAME);
>  	SAFE_MKDIR(DIR_NAME, 0755);
> @@ -330,6 +363,8 @@ static struct tst_test test = {
>  	.tcnt = ARRAY_SIZE(tcases),
>  	.setup = setup,
>  	.cleanup = cleanup,
> +	.mount_device = 1,
> +	.mntpoint = MOUNT_PATH,
>  	.needs_tmpdir = 1,
>  	.needs_root = 1,
>  	.tags = (const struct tst_tag[]) {
> -- 
> 2.25.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
