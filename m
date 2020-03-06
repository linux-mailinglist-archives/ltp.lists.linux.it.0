Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F8D17BD06
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 13:45:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2BDAC3C63AA
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 13:45:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 034233C176C
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 13:45:48 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 52355601EB2
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 13:45:47 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7DE3CAE19;
 Fri,  6 Mar 2020 12:45:47 +0000 (UTC)
Date: Fri, 6 Mar 2020 13:45:46 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200306124546.GA3375@rei.lan>
References: <cover.1582779464.git.viresh.kumar@linaro.org>
 <2071e47d7d8cb3e7f8bc6558e86999eddd9c3762.1582779464.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2071e47d7d8cb3e7f8bc6558e86999eddd9c3762.1582779464.git.viresh.kumar@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V5 01/10] tst_device: Add tst_is_mounted() helper
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> This patch moves the ismount() helper added to the fsmount syscall tests
> to the standard library and renames it to tst_is_mounted(). The helper
> can be used across different files now.
> 
> Minor modifications are also done to the helper.
> 
> Acked-by: Li Wang <liwang@redhat.com>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  include/tst_device.h                          |  6 +++++
>  lib/tst_device.c                              | 14 +++++++++++
>  testcases/kernel/syscalls/fsmount/fsmount01.c | 25 +------------------
>  3 files changed, 21 insertions(+), 24 deletions(-)
> 
> diff --git a/include/tst_device.h b/include/tst_device.h
> index f5609f5986bb..bd6910672d2f 100644
> --- a/include/tst_device.h
> +++ b/include/tst_device.h
> @@ -36,6 +36,12 @@ extern struct tst_device *tst_device;
>   */
>  int tst_umount(const char *path);
>  
> +/*
> + * Verifies if an earlier mount is successful or not.
> + * @path: Mount path to verify
> + */
> +int tst_is_mounted(const char *path);
> +
>  /*
>   * Clears a first few blocks of the device. This is needed when device has
>   * already been formatted with a filesystems, subset of mkfs.foo utils aborts
> diff --git a/lib/tst_device.c b/lib/tst_device.c
> index 8b5459def1cb..8bf6dacf5973 100644
> --- a/lib/tst_device.c
> +++ b/lib/tst_device.c
> @@ -386,6 +386,20 @@ int tst_umount(const char *path)
>  	return -1;
>  }
>  
> +int tst_is_mounted(const char *path)
> +{
> +	char cmd[PATH_MAX];
> +	int ret;
> +
> +	snprintf(cmd, sizeof(cmd), "mountpoint -q %s", path);
> +	ret = tst_system(cmd);

I'm not sure that depending on mountpoint command is right choice, there
are all kinds of embedded systems out there that may be missing it.

Also this does not even handle the case that the command is missing.

Looking at the v4 version, all we need is to correctly parse each line
from from /proc/mounts. I would just use strsep() with space as a
delimited and took first token that starts with a slash i.e. '/', then
we can just strcmp() it against the path. Or do I miss something?

> +	if (ret)
> +		tst_resm(TINFO, "No device is mounted at %s", path);
> +
> +	return !ret;
> +}
> +
>  int find_stat_file(const char *dev, char *path, size_t path_len)
>  {
>  	const char *devname = strrchr(dev, '/') + 1;
> diff --git a/testcases/kernel/syscalls/fsmount/fsmount01.c b/testcases/kernel/syscalls/fsmount/fsmount01.c
> index 83185b48aedd..8e29a1537334 100644
> --- a/testcases/kernel/syscalls/fsmount/fsmount01.c
> +++ b/testcases/kernel/syscalls/fsmount/fsmount01.c
> @@ -12,30 +12,10 @@
>  #include "tst_test.h"
>  #include "lapi/fcntl.h"
>  #include "lapi/fsmount.h"
> -#include "tst_safe_stdio.h"
>  
> -#define LINELENGTH 256
>  #define MNTPOINT "newmount_point"
>  static int sfd, mfd, is_mounted;
>  
> -static int ismount(char *mntpoint)
> -{
> -	int ret = 0;
> -	FILE *file;
> -	char line[LINELENGTH];
> -
> -	file = SAFE_FOPEN("/proc/mounts", "r");
> -
> -	while (fgets(line, sizeof(line), file)) {
> -		if (strstr(line, mntpoint) != NULL) {
> -			ret = 1;
> -			break;
> -		}
> -	}
> -	SAFE_FCLOSE(file);
> -	return ret;
> -}
> -
>  static void cleanup(void)
>  {
>  	if (is_mounted)
> @@ -76,12 +56,9 @@ static void test_fsmount(void)
>  	tst_res(TPASS, "move_mount() attached to the mount point");
>  	SAFE_CLOSE(mfd);
>  
> -	if (ismount(MNTPOINT)) {
> -		tst_res(TPASS, "device mounted");
> +	if (tst_is_mounted(MNTPOINT)) {
>  		SAFE_UMOUNT(MNTPOINT);
>  		is_mounted = 0;
> -	} else {
> -		tst_res(TFAIL, "device not mounted");
>  	}
>  }
>  
> -- 
> 2.21.0.rc0.269.g1a574e7a288b
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
