Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F9E173C7E
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 17:01:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 51AF83C6ABE
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 17:01:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id EB2113C2457
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 17:01:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5261B1402021
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 17:01:52 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7A940AF4D;
 Fri, 28 Feb 2020 16:01:51 +0000 (UTC)
Date: Fri, 28 Feb 2020 17:01:49 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200228160149.GA5312@dell5510>
References: <cover.1582779464.git.viresh.kumar@linaro.org>
 <01949a4ba3d2c125a9be8422ec27c8436a53f6a8.1582779464.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01949a4ba3d2c125a9be8422ec27c8436a53f6a8.1582779464.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V5 05/10] syscalls/fsconfig: New tests
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

> Add tests to check working of fsconfig() syscall.

...
> +++ b/testcases/kernel/syscalls/fsconfig/fsconfig01.c
...
> +static void run(void)
> +{
> +	int fd, fsmfd;
> +
> +	TEST(fd = fsopen(tst_device->fs_type, 0));
> +	if (fd == -1)
> +		tst_brk(TBROK | TERRNO, "fsopen() failed");
> +
> +	TEST(fsconfig(fd, FSCONFIG_SET_FLAG, "rw", NULL, 0));
> +	if (TST_RET == -1) {
> +		tst_res(TFAIL | TERRNO, "fsconfig() failed");
> +		goto out;
Because there is .test_all (single run), although which is called N times for
each filesystem (.all_filesystems = 1), but cleanup is called for each of them
it's I'll move SAFE_CLOSE(fd) to cleanup function and use here (and on the rest
of calls) return (trying to avoid goto when possible).
I'll change it before merge.

> +
> +	TEST(fsmfd = fsmount(fd, 0, 0));
> +	if (fsmfd == -1) {
> +		tst_res(TBROK | TERRNO, "fsmount() failed");
> +		goto out;
BTW This needs to be now tst_res(TFAIL) (this patchset now does not compile).

> +	TEST(fsconfig(fd, FSCONFIG_SET_FD, "sync", NULL, 0));
> +	if (TST_RET == -1) {
> +		if (TST_ERR == EOPNOTSUPP) {
> +			tst_res(TCONF, "fsconfig(): FSCONFIG_SET_FD not supported");
> +		} else {
> +			tst_res(TFAIL | TERRNO, "fsconfig() failed");
> +			goto out;
> +		}
> +	}

I get TCONF for all fsconfig01 results, while I'm using 5.5.5-1-default:

tst_test.c:1290: INFO: Testing on ext2
tst_mkfs.c:89: INFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
mke2fs 1.45.5 (07-Jan-2020)
tst_test.c:1227: INFO: Timeout per run is 0h 05m 00s
fsconfig01.c:43: CONF: fsconfig(): FSCONFIG_SET_PATH not supported
fsconfig01.c:53: CONF: fsconfig(): FSCONFIG_SET_PATH_EMPTY not supported
fsconfig01.c:63: CONF: fsconfig(): FSCONFIG_SET_FD not supported
fsconfig01.c:92: PASS: fsconfig() passed
tst_test.c:1290: INFO: Testing on ext3
tst_mkfs.c:89: INFO: Formatting /dev/loop0 with ext3 opts='' extra opts=''
mke2fs 1.45.5 (07-Jan-2020)
tst_test.c:1227: INFO: Timeout per run is 0h 05m 00s
fsconfig01.c:43: CONF: fsconfig(): FSCONFIG_SET_PATH not supported
fsconfig01.c:53: CONF: fsconfig(): FSCONFIG_SET_PATH_EMPTY not supported
fsconfig01.c:63: CONF: fsconfig(): FSCONFIG_SET_FD not supported
fsconfig01.c:92: PASS: fsconfig() passed
tst_test.c:1290: INFO: Testing on ext4
tst_mkfs.c:89: INFO: Formatting /dev/loop0 with ext4 opts='' extra opts=''
mke2fs 1.45.5 (07-Jan-2020)
tst_test.c:1227: INFO: Timeout per run is 0h 05m 00s
fsconfig01.c:43: CONF: fsconfig(): FSCONFIG_SET_PATH not supported
fsconfig01.c:53: CONF: fsconfig(): FSCONFIG_SET_PATH_EMPTY not supported
fsconfig01.c:63: CONF: fsconfig(): FSCONFIG_SET_FD not supported
fsconfig01.c:92: PASS: fsconfig() passed
tst_test.c:1290: INFO: Testing on xfs
tst_mkfs.c:89: INFO: Formatting /dev/loop0 with xfs opts='' extra opts=''
tst_test.c:1227: INFO: Timeout per run is 0h 05m 00s
fsconfig01.c:92: PASS: fsconfig() passed
tst_test.c:1290: INFO: Testing on btrfs
tst_mkfs.c:89: INFO: Formatting /dev/loop0 with btrfs opts='' extra opts=''
tst_test.c:1227: INFO: Timeout per run is 0h 05m 00s
fsconfig01.c:43: CONF: fsconfig(): FSCONFIG_SET_PATH not supported
fsconfig01.c:53: CONF: fsconfig(): FSCONFIG_SET_PATH_EMPTY not supported
fsconfig01.c:63: CONF: fsconfig(): FSCONFIG_SET_FD not supported
fsconfig01.c:92: PASS: fsconfig() passed
tst_test.c:1290: INFO: Testing on vfat
tst_mkfs.c:89: INFO: Formatting /dev/loop0 with vfat opts='' extra opts=''
tst_test.c:1227: INFO: Timeout per run is 0h 05m 00s
fsconfig01.c:43: CONF: fsconfig(): FSCONFIG_SET_PATH not supported
fsconfig01.c:53: CONF: fsconfig(): FSCONFIG_SET_PATH_EMPTY not supported
fsconfig01.c:63: CONF: fsconfig(): FSCONFIG_SET_FD not supported
fsconfig01.c:92: PASS: fsconfig() passed

Not yet merged man page [1] (I reposted David Howells commit) there is
explanation for EOPNOTSUPP: The command given by cmd was not valid.

First, I suspected "sync" option is wrong. But looking at kernel sources it's
really not implemented:

fs/fsopen.c
	if (fc->ops == &legacy_fs_context_ops) {
		switch (cmd) {
		case FSCONFIG_SET_BINARY:
		case FSCONFIG_SET_PATH:
		case FSCONFIG_SET_PATH_EMPTY:
		case FSCONFIG_SET_FD:
			ret = -EOPNOTSUPP;
			goto out_f;
		}
	}

fs/fs_context.c
	/* TODO: Make all filesystems support this unconditionally */
	init_fs_context = fc->fs_type->init_fs_context;
	if (!init_fs_context)
		init_fs_context = legacy_init_fs_context;
...
/*
 * Initialise a legacy context for a filesystem that doesn't support
 * fs_context.
 */
static int legacy_init_fs_context(struct fs_context *fc)
{
	fc->fs_private = kzalloc(sizeof(struct legacy_fs_context), GFP_KERNEL);
	if (!fc->fs_private)
		return -ENOMEM;
	fc->ops = &legacy_fs_context_ops;
	return 0;
}

Code coming from v5.1-rc1 f3a09c92018a91ad0981146a4ac59414f814d801 introduce
fs_context methods [2]. Other patchsets here [3] shows there is some support for
fs_context in VFS. So I wonder how to achieve not end up with legacy context.

> +++ b/testcases/kernel/syscalls/fsconfig/fsconfig02.c
> +  {"set-path-key", &fd, FSCONFIG_SET_PATH, NULL, "/dev/sda1", &aux_fdcwd, EINVAL},
...
> +  {"set-path-aux", &fd, FSCONFIG_SET_PATH, "sync", "/dev/sda1", &aux_minus1, EINVAL},
/dev/sda1 is valid on some hosts, but invalid on others. Shouldn't we use
/dev/foo instead?

...
> +	temp_fd = open("testfile", O_RDWR | O_CREAT, 01444);
> +	if (temp_fd == -1)
> +		tst_res(TBROK, "Can't obtain temp_fd, open() failed");
Here needs to be now tst_brk(TBROK).
Again I'll change it before merge.

...

Kind regards,
Petr

[1] https://marc.info/?l=linux-man&m=158109737907972&w=2
[2] https://patchwork.kernel.org/patch/10820207/
[3] https://patchwork.kernel.org/project/linux-security-module/list/?series=82377

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
