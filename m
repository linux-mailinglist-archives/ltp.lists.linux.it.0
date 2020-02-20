Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0D6166540
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 18:45:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 12C7F3C25C6
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 18:45:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 01A443C2231
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 18:45:33 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 41A4F1000B70
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 18:43:54 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 84352AC58;
 Thu, 20 Feb 2020 17:45:32 +0000 (UTC)
Date: Thu, 20 Feb 2020 18:34:39 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200220173439.GC15699@gacrux.arch.suse.de>
References: <cover.1582104018.git.viresh.kumar@linaro.org>
 <9706f359006ea409d2f85c111d3e001ca6f6d128.1582104018.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9706f359006ea409d2f85c111d3e001ca6f6d128.1582104018.git.viresh.kumar@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 06/10] syscalls/fsmount: Improve fsmount01 test
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> +static struct tcase {
> +	char *name;
> +	unsigned int flags;
> +	unsigned int mount_attrs;
> +} tcases[] = {
> +	{"Flag 0, attr RDONLY", 0, MOUNT_ATTR_RDONLY},
> +	{"Flag 0, attr NOSUID", 0, MOUNT_ATTR_NOSUID},
> +	{"Flag 0, attr NODEV", 0, MOUNT_ATTR_NODEV},
> +	{"Flag 0, attr NOEXEC", 0, MOUNT_ATTR_NOEXEC},
> +	{"Flag 0, attr RELATIME", 0, MOUNT_ATTR_RELATIME},
> +	{"Flag 0, attr NOATIME", 0, MOUNT_ATTR_NOATIME},
> +	{"Flag 0, attr STRICTATIME", 0, MOUNT_ATTR_STRICTATIME},
> +	{"Flag 0, attr NODIRATIME", 0, MOUNT_ATTR_NODIRATIME},
> +	{"Flag CLOEXEC, attr RDONLY", FSMOUNT_CLOEXEC, MOUNT_ATTR_RDONLY},
> +	{"Flag CLOEXEC, attr NOSUID", FSMOUNT_CLOEXEC, MOUNT_ATTR_NOSUID},
> +	{"Flag CLOEXEC, attr NODEV", FSMOUNT_CLOEXEC, MOUNT_ATTR_NODEV},
> +	{"Flag CLOEXEC, attr NOEXEC", FSMOUNT_CLOEXEC, MOUNT_ATTR_NOEXEC},
> +	{"Flag CLOEXEC, attr RELATIME", FSMOUNT_CLOEXEC, MOUNT_ATTR_RELATIME},
> +	{"Flag CLOEXEC, attr NOATIME", FSMOUNT_CLOEXEC, MOUNT_ATTR_NOATIME},
> +	{"Flag CLOEXEC, attr STRICTATIME", FSMOUNT_CLOEXEC, MOUNT_ATTR_STRICTATIME},
> +	{"Flag CLOEXEC, attr NODIRATIME", FSMOUNT_CLOEXEC, MOUNT_ATTR_NODIRATIME},
> +};
I'd use desc field

#define DESC(x, y) .flags = x, .mount_attrs = y, .desc = #x ", " #y

+static struct tcase {
+	char *desc;
+	unsigned int flags;
+	unsigned int mount_attrs;
+} tcases[] = {
+	{DESC(0, MOUNT_ATTR_RDONLY)},
+	{DESC(0, MOUNT_ATTR_NOSUID)},

(avoid copy paste).

> +static void setup(void)
>  {
> -	if (is_mounted)
> -		SAFE_UMOUNT(MNTPOINT);
> +	fsopen_supported_by_kernel();
again, just .setup = fsopen_supported_by_kernel;
>  }

> -static void test_fsmount(void)
> +static void run(unsigned int n)
>  {
> +	struct tcase *tc = &tcases[n];
> +	int sfd, mfd;
> +
>  	TEST(fsopen(tst_device->fs_type, FSOPEN_CLOEXEC));
> -	if (TST_RET < 0)
> -		tst_brk(TBROK | TTERRNO, "fsopen() on %s failed", tst_device->fs_type);
> +	if (TST_RET == -1) {
> +		tst_brk(TBROK | TTERRNO, "fsopen() on %s failed",
> +			tst_device->fs_type);
Again, tst_brk(TBROK) shouldn't be on tcnt = ARRAY_SIZE(tcases),
it skips all following tests after failure (sometimes needed but IMHO not here).

> +	}
>  	sfd = TST_RET;
> -	tst_res(TPASS, "fsopen() on %s", tst_device->fs_type);

>  	TEST(fsconfig(sfd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
> -	if (TST_RET < 0)
> +	if (TST_RET < 0) {
> +		SAFE_CLOSE(sfd);
>  		tst_brk(TBROK | TTERRNO,
>  			"fsconfig() failed to set source to %s", tst_device->dev);
> -	tst_res(TPASS, "fsconfig() set source to %s", tst_device->dev);
> -
> +	}

>  	TEST(fsconfig(sfd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
> -	if (TST_RET < 0)
> +	if (TST_RET < 0) {
> +		SAFE_CLOSE(sfd);
>  		tst_brk(TBROK | TTERRNO, "fsconfig() created superblock");
As you added more runs of the test (changed .test_all to .test && run =
ARRAY_SIZE(tcases)), you need to change all tst_brk() to tst_res() + return.

I also merged tst_brk(TBROK), I guess TFAIL would be better.

Other than that it looks ok.

I also wonder if it'd be worth to implement in fsmount.h some macros to reduce
code duplicity. e.g. one of similar patterns (just flag is different):

TEST(fsopen(tst_device->fs_type, FLAG));
fd = TST_RET;
if (fd == -1)
		tst_brk(TBROK | TERRNO, "fsopen() failed");

But that's not important.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
