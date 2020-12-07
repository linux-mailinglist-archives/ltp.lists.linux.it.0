Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 444392D0E71
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Dec 2020 11:52:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 065843C6290
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Dec 2020 11:52:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C01103C2ACA
 for <ltp@lists.linux.it>; Mon,  7 Dec 2020 11:52:39 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 25B9C20098A
 for <ltp@lists.linux.it>; Mon,  7 Dec 2020 11:52:38 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 668E8AC90;
 Mon,  7 Dec 2020 10:52:38 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 3526C1E1325; Mon,  7 Dec 2020 11:52:38 +0100 (CET)
Date: Mon, 7 Dec 2020 11:52:38 +0100
From: Jan Kara <jack@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20201207105238.GD28106@quack2.suse.cz>
References: <20201204095930.866421-1-amir73il@gmail.com>
 <20201204095930.866421-3-amir73il@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204095930.866421-3-amir73il@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/5] syscalls/fanotify: Use generic checks for
 fanotify_init flags
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

On Fri 04-12-20 11:59:27, Amir Goldstein wrote:
> Convert remaining tests to SAFE_FANOTIFY_INIT and use the generic
> helpers to check requires kernel/fs support for fanotify_init flags
> in advance.
> 
> Signed-off-by: Amir Goldstein <amir73il@gmail.com>

Looks good. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  .../kernel/syscalls/fanotify/fanotify10.c     | 26 ++++++++-----------
>  .../kernel/syscalls/fanotify/fanotify11.c     | 21 ++++++---------
>  .../kernel/syscalls/fanotify/fanotify16.c     | 14 ++--------
>  3 files changed, 21 insertions(+), 40 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify10.c b/testcases/kernel/syscalls/fanotify/fanotify10.c
> index 404e57daa..cc164359f 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify10.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify10.c
> @@ -57,6 +57,7 @@ static unsigned int fanotify_class[] = {
>  	FAN_REPORT_DFID_NAME_FID,
>  };
>  #define NUM_CLASSES ARRAY_SIZE(fanotify_class)
> +#define NUM_PRIORITIES 3
>  
>  #define GROUPS_PER_PRIO 3
>  
> @@ -64,6 +65,7 @@ static int fd_notify[NUM_CLASSES][GROUPS_PER_PRIO];
>  
>  static char event_buf[EVENT_BUF_LEN];
>  static int exec_events_unsupported;
> +static int fan_report_dfid_unsupported;
>  static int filesystem_mark_unsupported;
>  
>  #define MOUNT_PATH "fs_mnt"
> @@ -294,21 +296,8 @@ static int create_fanotify_groups(unsigned int n)
>  
>  	for (p = 0; p < num_classes; p++) {
>  		for (i = 0; i < GROUPS_PER_PRIO; i++) {
> -			fd_notify[p][i] = fanotify_init(fanotify_class[p] |
> -							FAN_NONBLOCK, O_RDONLY);
> -			if (fd_notify[p][i] == -1) {
> -				if (errno == EINVAL &&
> -				    fanotify_class[p] & FAN_REPORT_NAME) {
> -					tst_res(TCONF,
> -						"FAN_REPORT_NAME not supported by kernel?");
> -					/* Do not try creating this group again */
> -					num_classes--;
> -					return -1;
> -				}
> -
> -				tst_brk(TBROK | TERRNO,
> -					"fanotify_init(%x, 0) failed", fanotify_class[p]);
> -			}
> +			fd_notify[p][i] = SAFE_FANOTIFY_INIT(fanotify_class[p] |
> +							     FAN_NONBLOCK, O_RDONLY);
>  
>  			/*
>  			 * Add mark for each group.
> @@ -518,6 +507,13 @@ static void setup(void)
>  {
>  	exec_events_unsupported = fanotify_events_supported_by_kernel(FAN_OPEN_EXEC);
>  	filesystem_mark_unsupported = fanotify_mark_supported_by_kernel(FAN_MARK_FILESYSTEM);
> +	fan_report_dfid_unsupported = fanotify_init_flags_supported_on_fs(FAN_REPORT_DFID_NAME,
> +									  MOUNT_PATH);
> +	if (fan_report_dfid_unsupported) {
> +		FANOTIFY_INIT_FLAGS_ERR_MSG(FAN_REPORT_DFID_NAME, fan_report_dfid_unsupported);
> +		/* Limit tests to legacy priority classes */
> +		num_classes = NUM_PRIORITIES;
> +	}
>  
>  	/* Create another bind mount at another path for generating events */
>  	SAFE_MKDIR(MNT2_PATH, 0755);
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify11.c b/testcases/kernel/syscalls/fanotify/fanotify11.c
> index 785b5c5a5..f3b60cecb 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify11.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify11.c
> @@ -36,6 +36,8 @@
>  #define gettid() syscall(SYS_gettid)
>  static int tid;
>  
> +static int fan_report_tid_unsupported;
> +
>  void *thread_create_file(void *arg LTP_ATTRIBUTE_UNUSED)
>  {
>  	char tid_file[64] = {0};
> @@ -63,17 +65,13 @@ void test01(unsigned int i)
>  			i, (tcases[i] & FAN_REPORT_TID) ? "with" : "without",
>  			tgid, tid, event.pid);
>  
> -	fd_notify = fanotify_init(tcases[i], 0);
> -	if (fd_notify < 0) {
> -		if (errno == EINVAL && (tcases[i] & FAN_REPORT_TID)) {
> -			tst_res(TCONF,
> -				"FAN_REPORT_TID not supported in kernel?");
> -			return;
> -		}
> -		tst_brk(TBROK | TERRNO, "fanotify_init(0x%x, 0) failed",
> -				tcases[i]);
> +	if (fan_report_tid_unsupported && (tcases[i] & FAN_REPORT_TID)) {
> +		FANOTIFY_INIT_FLAGS_ERR_MSG(FAN_REPORT_TID, fan_report_tid_unsupported);
> +		return;
>  	}
>  
> +	fd_notify = SAFE_FANOTIFY_INIT(tcases[i], 0);
> +
>  	SAFE_FANOTIFY_MARK(fd_notify, FAN_MARK_ADD,
>  			FAN_ALL_EVENTS | FAN_EVENT_ON_CHILD, AT_FDCWD, ".");
>  
> @@ -96,10 +94,7 @@ void test01(unsigned int i)
>  
>  static void setup(void)
>  {
> -	int fd;
> -
> -	fd = SAFE_FANOTIFY_INIT(FAN_CLASS_NOTIF, O_RDONLY);
> -	SAFE_CLOSE(fd);
> +	fan_report_tid_unsupported = fanotify_init_flags_supported_by_kernel(FAN_REPORT_TID);
>  }
>  
>  static struct tst_test test = {
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify16.c b/testcases/kernel/syscalls/fanotify/fanotify16.c
> index a4409df14..5ffaec92f 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify16.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify16.c
> @@ -158,17 +158,7 @@ static void do_test(unsigned int number)
>  
>  	tst_res(TINFO, "Test #%d: %s", number, tc->tname);
>  
> -	fd_notify = fanotify_init(group->flag, 0);
> -	if (fd_notify == -1) {
> -		if (errno == EINVAL) {
> -			tst_res(TCONF,
> -				"%s not supported by kernel", group->name);
> -			return;
> -		}
> -
> -		tst_brk(TBROK | TERRNO,
> -			"fanotify_init(%s, 0) failed", group->name);
> -	}
> +	fd_notify = SAFE_FANOTIFY_INIT(group->flag, 0);
>  
>  	/*
>  	 * Watch dir modify events with name in filesystem/dir
> @@ -551,7 +541,7 @@ check_match:
>  
>  static void setup(void)
>  {
> -	REQUIRE_FANOTIFY_INIT_FLAGS_SUPPORTED_ON_FS(FAN_REPORT_FID, MOUNT_PATH);
> +	REQUIRE_FANOTIFY_INIT_FLAGS_SUPPORTED_ON_FS(FAN_REPORT_DIR_FID, MOUNT_PATH);
>  
>  	sprintf(dname1, "%s/%s", MOUNT_PATH, DIR_NAME1);
>  	sprintf(dname2, "%s/%s", MOUNT_PATH, DIR_NAME2);
> -- 
> 2.25.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
