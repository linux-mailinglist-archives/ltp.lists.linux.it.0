Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EF92188B6
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jul 2020 15:15:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A91433C2418
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jul 2020 15:15:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id DCDDE3C07D4
 for <ltp@lists.linux.it>; Wed,  8 Jul 2020 15:15:33 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 23951200D22
 for <ltp@lists.linux.it>; Wed,  8 Jul 2020 15:15:32 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 77EBBAF96;
 Wed,  8 Jul 2020 13:15:32 +0000 (UTC)
Date: Wed, 8 Jul 2020 15:15:51 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200708131551.GA7276@yuki.lan>
References: <1591871716-21250-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1591871716-21250-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1591871716-21250-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 2/4] syscalls/ioctl_loop02: Using
 LOOP_CONFIGURE to set read_only
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
Pushed with a few fixed, thanks.

* Shortened some overly long messages

* Fixed the code not to leak open file descriptors
  - removed useless open of file_fd in setup
  - moved TCONF check in run before fds are opened
  - added close for file_fd at the end of the run

 (this fixes runs with -i N especially on older kernels)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop02.c b/testcases/kernel/syscalls/ioctl/ioctl_loop02.c
index 549154fa1..3a03d052a 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop02.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop02.c
@@ -35,7 +35,7 @@ static struct tcase {
 	char *message;
 } tcases[] = {
 	{O_RDONLY, LOOP_SET_FD, "Using LOOP_SET_FD to setup loopdevice"},
-	{O_RDWR, LOOP_CONFIGURE, "Using LOOP_CONFIGURE with read_only flag to setup loopdevice"},
+	{O_RDWR, LOOP_CONFIGURE, "Using LOOP_CONFIGURE with read_only flag"},
 };
 
 static void verify_ioctl_loop(unsigned int n)
@@ -43,6 +43,11 @@ static void verify_ioctl_loop(unsigned int n)
 	struct tcase *tc = &tcases[n];
 	struct loop_info loopinfoget;
 
+	if (tc->ioctl == LOOP_CONFIGURE && !loop_configure_sup) {
+		tst_res(TCONF, "LOOP_CONFIGURE ioctl not supported");
+		return;
+	}
+
 	tst_res(TINFO, "%s", tc->message);
 	file_fd = SAFE_OPEN("test.img", tc->mode);
 	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
@@ -50,11 +55,6 @@ static void verify_ioctl_loop(unsigned int n)
 	if (tc->ioctl == LOOP_SET_FD) {
 		SAFE_IOCTL(dev_fd, LOOP_SET_FD, file_fd);
 	} else {
-		if (!loop_configure_sup) {
-			tst_res(TCONF,
-				"Current environmet doesn't support LOOP_CONFIGURE ioctl, skip this");
-			return;
-		}
 		loopconfig.fd = file_fd;
 		SAFE_IOCTL(dev_fd, LOOP_CONFIGURE, &loopconfig);
 	}
@@ -98,6 +98,7 @@ static void verify_ioctl_loop(unsigned int n)
 	}
 
 	SAFE_CLOSE(dev_fd);
+	SAFE_CLOSE(file_fd);
 	tst_detach_device(dev_path);
 	attach_flag = 0;
 }
@@ -123,7 +124,6 @@ static void setup(void)
 
 	free(tmpdir);
 
-	file_fd = SAFE_OPEN("test.img", O_RDONLY);
 	file_change_fd = SAFE_OPEN("test1.img", O_RDWR);
 	file_fd_invalid = SAFE_OPEN("test2.img", O_RDWR);
 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
