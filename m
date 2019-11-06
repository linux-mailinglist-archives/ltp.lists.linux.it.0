Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B905F1621
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 13:33:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 53EAF3C23C8
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 13:33:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 1D6FC3C13DC
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 13:33:49 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D1FEB601B6C
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 13:33:47 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7CDD9ACFE
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 12:33:46 +0000 (UTC)
References: <4647b3bced96c66c040078a32c13dab65558816d.1572956488.git.jstancek@redhat.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: ltp@lists.linux.it
In-reply-to: <4647b3bced96c66c040078a32c13dab65558816d.1572956488.git.jstancek@redhat.com>
Date: Wed, 06 Nov 2019 13:33:46 +0100
Message-ID: <87o8xpdw0l.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] read_all: move blacklist to source
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
Reply-To: rpalethorpe@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Jan Stancek <jstancek@redhat.com> writes:

> library doesn't support multiple parameters for same option.
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  runtest/fs                              |  2 +-
>  testcases/kernel/fs/read_all/read_all.c | 28 ++++++++++++++++++++++------
>  2 files changed, 23 insertions(+), 7 deletions(-)
>
> diff --git a/runtest/fs b/runtest/fs
> index 07d6e2b67964..46318575653e 100644
> --- a/runtest/fs
> +++ b/runtest/fs
> @@ -71,7 +71,7 @@ proc01 proc01 -m 128
>
>  read_all_dev read_all -d /dev -p -q -r 10
>  read_all_proc read_all -d /proc -q -r 10
> -read_all_sys read_all -d /sys -q -r 10 -e /sys/power/wakeup_count
> +read_all_sys read_all -d /sys -q -r 10
>
>  #Run the File System Race Condition Check tests as well
>  fs_racer fs_racer.sh -t 5
> diff --git a/testcases/kernel/fs/read_all/read_all.c b/testcases/kernel/fs/read_all/read_all.c
> index 4edccff03a4f..46f88af2270c 100644
> --- a/testcases/kernel/fs/read_all/read_all.c
> +++ b/testcases/kernel/fs/read_all/read_all.c
> @@ -71,7 +71,6 @@ enum dent_action {
>  static char *verbose;
>  static char *quiet;
>  static char *root_dir;
> -static char *exclude;
>  static char *str_reads;
>  static int reads = 1;
>  static char *str_worker_count;
> @@ -81,6 +80,11 @@ static long max_workers = 15;
>  static struct worker *workers;
>  static char *drop_privs;
>
> +static char *blacklist[] = {
> +	NULL, /* reserved for -e parameter */
> +	"/sys/power/wakeup_count",
> +};

The problem with this is that it is only required if we are running as a
privileged user. If -p is specified then it would be a bug if nobody can
read from any of these files.

So I guess we could disable the builtin blacklist if drop_privs (switch
to nobody) is specified and run this test twice on /sys with and without
-p.

> +
>  static struct tst_option options[] = {
>  	{"v", &verbose,
>  	 "-v       Print information about successful reads."},
> @@ -88,7 +92,7 @@ static struct tst_option options[] = {
>  	 "-q       Don't print file read or open errors."},
>  	{"d:", &root_dir,
>  	 "-d path  Path to the directory to read from, defaults to /sys."},
> -	{"e:", &exclude,
> +	{"e:", &blacklist[0],
>  	 "-e pattern Ignore files which match an 'extended' pattern, see fnmatch(3)."},
>  	{"r:", &str_reads,
>  	 "-r count The number of times to schedule a file for reading."},
> @@ -182,17 +186,29 @@ static void sanitize_str(char *buf, ssize_t count)
>  		strcpy(buf + MAX_DISPLAY, "...");
>  }
>
> +static int is_blacklisted(const char *path)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(blacklist); i++) {
> +		if (blacklist[i] && !fnmatch(blacklist[i], path, FNM_EXTMATCH)) {
> +			if (verbose)
> +				tst_res(TINFO, "Ignoring %s", path);
> +			return 1;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static void read_test(const char *path)
>  {
>  	char buf[BUFFER_SIZE];
>  	int fd;
>  	ssize_t count;
>
> -	if (exclude && !fnmatch(exclude, path, FNM_EXTMATCH)) {
> -		if (verbose)
> -			tst_res(TINFO, "Ignoring %s", path);
> +	if (is_blacklisted(path))
>  		return;
> -	}
>
>  	if (verbose)
>  		tst_res(TINFO, "%s(%s)", __func__, path);
> --
> 1.8.3.1


--
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
