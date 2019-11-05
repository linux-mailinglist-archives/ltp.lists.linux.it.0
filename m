Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C8688EFBEF
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 11:59:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 77C803C22D4
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 11:59:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 7AD4A3C22BB
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 11:59:47 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5391E601517
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 11:59:45 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 69174ACFA;
 Tue,  5 Nov 2019 10:59:45 +0000 (UTC)
Date: Tue, 5 Nov 2019 11:59:44 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191105105944.GA7190@rei.lan>
References: <2086f9d5a3ce152780833993e6e21d3fbd074441.1572887015.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2086f9d5a3ce152780833993e6e21d3fbd074441.1572887015.git.jstancek@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] read_all: move blacklist to source
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
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  runtest/fs                              |  2 +-
>  testcases/kernel/fs/read_all/read_all.c | 28 ++++++++++++++++++++++++----
>  2 files changed, 25 insertions(+), 5 deletions(-)
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
> index 4edccff03a4f..cef55e20d671 100644
> --- a/testcases/kernel/fs/read_all/read_all.c
> +++ b/testcases/kernel/fs/read_all/read_all.c
> @@ -81,6 +81,11 @@ static long max_workers = 15;
>  static struct worker *workers;
>  static char *drop_privs;
>  
> +static char *blacklist[] = {
> +	"/sys/power/wakeup_count",
> +};

Can't we just put a dummy NULL element as a first entry in the blacklist
and then pass the &blacklist pointer in the options structure?

That would simplify the loop in is_blacklisted a bit...

> +static unsigned int blacklist_sz = ARRAY_SIZE(blacklist);
> +
>  static struct tst_option options[] = {
>  	{"v", &verbose,
>  	 "-v       Print information about successful reads."},
> @@ -182,17 +187,32 @@ static void sanitize_str(char *buf, ssize_t count)
>  		strcpy(buf + MAX_DISPLAY, "...");
>  }
>  
> +static int is_blacklisted(const char *path)
> +{
> +	unsigned int i;
> +	char *bstr;
> +
> +	for (i = 0; i < blacklist_sz + 1; i++) {
> +		bstr = i < blacklist_sz ? blacklist[i] : exclude;
> +
> +		if (bstr && !fnmatch(bstr, path, FNM_EXTMATCH)) {
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
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
