Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D5A16F6BB
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 06:03:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C53863C137A
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 06:03:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 3E7163C07D0
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 06:03:48 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 5C50C200C17
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 06:03:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582693425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M2ochHrjJr2So+YpN/WSbNdxMyQWxWvDmRDlievrFZs=;
 b=YuMd8zd6QgnrSWnbgO50SpmYZe2PFn2r5icUHBJdjbPSeQ+IKYGmWwHcvS5Q4gcZss9oLe
 LBJXuLXMCF8WcFAhCjyhtmfl0gyLoAR1z9Id31hFlpANm90njn0T9r06Ci/egTYKWzq88c
 AVTgpOjw9KCf1ah9NOwOlSKtYPm6pN8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-TfvuEGJtOvuMvvj9fPiAjA-1; Wed, 26 Feb 2020 00:03:38 -0500
X-MC-Unique: TfvuEGJtOvuMvvj9fPiAjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84C0D18CA278;
 Wed, 26 Feb 2020 05:03:36 +0000 (UTC)
Received: from localhost (dhcp-12-102.nay.redhat.com [10.66.12.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9D91100164D;
 Wed, 26 Feb 2020 05:03:32 +0000 (UTC)
Date: Wed, 26 Feb 2020 13:14:07 +0800
From: Zorro Lang <zlang@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200226051407.GP14282@dhcp-12-102.nay.redhat.com>
Mail-Followup-To: Viresh Kumar <viresh.kumar@linaro.org>,
 ltp@lists.linux.it, Vincent Guittot <vincent.guittot@linaro.org>,
 anmar.oueja@linaro.org, Cyril Hrubis <chrubis@suse.cz>,
 Vikas.Kumar2@arm.com, Li Wang <liwang@redhat.com>,
 Petr Vorel <pvorel@suse.cz>
References: <7c0899c42b8d8434c1cf9ca6b261993a1c09031f.1582612624.git.viresh.kumar@linaro.org>
 <305330ad290ce4802d832e02765b8723a976d4a7.1582627066.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
In-Reply-To: <305330ad290ce4802d832e02765b8723a976d4a7.1582627066.git.viresh.kumar@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4 1/10] tst_device: Add tst_is_mounted() helper
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

On Tue, Feb 25, 2020 at 04:09:31PM +0530, Viresh Kumar wrote:
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
> V3->V4:
> - s/TWARN/TINFO
> - Fix commit log.
> 
>  include/tst_device.h                          |  6 +++++
>  lib/tst_device.c                              | 23 +++++++++++++++++
>  testcases/kernel/syscalls/fsmount/fsmount01.c | 25 +------------------
>  3 files changed, 30 insertions(+), 24 deletions(-)
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
> index 8b5459def1cb..d99fb8bc554a 100644
> --- a/lib/tst_device.c
> +++ b/lib/tst_device.c
> @@ -386,6 +386,29 @@ int tst_umount(const char *path)
>  	return -1;
>  }
>  
> +int tst_is_mounted(const char *path)
> +{
> +	char line[256];
> +	FILE *file;
> +	int ret = 0;
> +
> +	file = SAFE_FOPEN(NULL, "/proc/mounts", "r");
> +
> +	while (fgets(line, sizeof(line), file)) {
> +		if (strstr(line, path) != NULL) {

This code moving is fine. But if we'd like to make this function to be common
function, we'd better think more about that. I think the current code logic
isn't so well.

For example, if path is "/mnt/test", and we get a line as "/mnt/test/mnt1 ..."
or "/mnt/mnt/test", Then this function thinks "/mnt/test" is a mountpoint.

We can refer to util-linux/sys-utils/mountpoint.c a little, but it's complicated,
or we can call mountpoint command directly?

> +			ret = 1;
> +			break;
> +		}
> +	}
> +
> +	SAFE_FCLOSE(NULL, file);
> +
> +	if (!ret)
> +		tst_resm(TINFO, "No device is mounted at %s", path);
> +
> +	return ret;
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
Mailing list info: https://lists.linux.it/listinfo/ltp
