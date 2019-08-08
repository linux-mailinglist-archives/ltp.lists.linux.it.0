Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 253F48586E
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 05:12:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C6F1A3C1D00
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 05:12:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 6F0903C1773
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 05:12:15 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id CDE93100074D
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 05:12:07 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,358,1559491200"; d="scan'208";a="73187039"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 Aug 2019 11:12:01 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id C4D614CDFCE8;
 Thu,  8 Aug 2019 11:12:01 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Thu, 8 Aug 2019 11:12:00 +0800
Message-ID: <5D4B92EF.4090800@cn.fujitsu.com>
Date: Thu, 8 Aug 2019 11:11:43 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Murphy Zhou <jencce.kernel@gmail.com>
References: <20190730110555.GB7528@rei.lan>
 <1564569629-2358-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1564569629-2358-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190805065832.ti6vpoviykfaxcj7@XZHOUW.usersys.redhat.com>
 <5D47D6B9.9090306@cn.fujitsu.com>
 <20190805102211.pvyufepn6xywi7vm@XZHOUW.usersys.redhat.com>
 <20190806162703.GA1333@dell5510>
 <20190807101742.mt6tgowsh4xw5hyt@XZHOUW.usersys.redhat.com>
In-Reply-To: <20190807101742.mt6tgowsh4xw5hyt@XZHOUW.usersys.redhat.com>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: C4D614CDFCE8.AF30B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v7 3/3] syscalls/copy_file_range02: increase
 coverage and remove EXDEV test
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
Cc: linux-xfs@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

on 2019/08/07 18:17, Murphy Zhou wrote:

> And I have a question about LTP itself.
>
> If we run the testcase directly like:
> 	 ./testcases/kernel/syscalls/copy_file_range/copy_file_range02
>
> to test all_filesystems, for every filesystem, we mkfs and mount it in
> .mntpoint, but we do not chdir to .mntpoint. So we are running tests in 
> the same tmpdir, fs type of which does not change while looping
> all_filesystems.  Only the .mntpoint in tmpdir has different fs type in
> each loop.
>
> Now we are using this to test cross-device copy in copy_file_range01.c,
> but in copy_file_range02.c, we are not using .mntpint at all, all the
> tests in the all_filesystems loop are running in the same tmpdir. In other
> words, we are NOT testing all filesystems.
>
> Is this expected?
 I removed the mnted test for cross-device copy_file_range in copy_file_range02.c.
And I ignore the non-used mntpoint. IMO, we can directly use the FILE_MNTED to test EFBIG on all filesystems, 

as below:
diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
index 26bfa008a..67974ffa2 100644
--- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
@@ -49,6 +49,7 @@ static int fd_blkdev;
 static int fd_chrdev;
 static int fd_fifo;
 static int fd_copy;
+static int fd_mnted;

 static int chattr_i_nsup;
 static int swap_nsup;

@@ -73,7 +74,7 @@ static struct tcase {
        {&fd_chrdev,    0,   EINVAL,     0,     CONTSIZE},
        {&fd_fifo,      0,   EINVAL,     0,     CONTSIZE},
        {&fd_copy,      0,   EOVERFLOW,  MAX_OFF, ULLONG_MAX},
-       {&fd_copy,      0,   EFBIG,      MAX_OFF, MIN_OFF},
+       {&fd_mnted,      0,   EFBIG,      MAX_OFF, MIN_OFF},
 };

 static int run_command(char *command, char *option, char *file)
@@ -117,7 +118,10 @@ static void verify_copy_file_range(unsigned int n)
                        tst_res(TPASS | TTERRNO,
                                        "copy_file_range failed as expected");
                } else {
-                       tst_res(TFAIL | TTERRNO,
+                       if (tc->exp_err == EFBIG && TST_ERR == EXDEV)
+                               tst_res(TCONF, "copy_file_range doesn't support cross-device,skip it");
+                       else
+                               tst_res(TFAIL | TTERRNO,
                                "copy_file_range failed unexpectedly; expected %s, but got",
                                tst_strerrno(tc->exp_err));
                        return;

@@ -152,6 +156,8 @@ static void cleanup(void)
                SAFE_CLOSE(fd_dup);
        if (fd_copy > 0)
                SAFE_CLOSE(fd_copy);
+       if (fd_mnted > 0)
+               SAFE_CLOSE(fd_mnted);
        SAFE_UNLINK(FILE_FIFO);
 }

@@ -194,6 +200,7 @@ static void setup(void)

        fd_copy = SAFE_OPEN(FILE_COPY_PATH, O_RDWR | O_CREAT | O_TRUNC, 0664);
        chattr_i_nsup = run_command("chattr", "+i", FILE_IMMUTABLE_PATH);
+       fd_mnted  = SAFE_OPEN(FILE_MNTED_PATH, O_RDWR | O_CREAT, 0664);

        if (!tst_fs_has_free(".", sysconf(_SC_PAGESIZE) * 10, TST_BYTES)) {
                tst_res(TCONF, "Insufficient disk space to create swap file");
                swap_nsup = 3;

test12) succeed on extN, failed on both btrfs and xfs, we need to detect filesystem type to handle. Or, I think we 
can set a limit on filesize because this kind of user scene is a bit more than the first one , the EFBIG error can be 
received easily (Also, we don't need  mnt_device mntpoint all_filesystem if so).
What do you think about it?

> I commented out testcases in copy_file_range02.c other then #12, and add
> some nasty debug info:




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
