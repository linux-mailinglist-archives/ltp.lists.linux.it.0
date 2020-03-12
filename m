Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2920018393F
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 20:10:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EBC623C5EA8
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 20:10:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 950FE3C5E95
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 20:10:27 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3688F1A00E6E
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 20:10:26 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 92BBDAF8C;
 Thu, 12 Mar 2020 19:10:26 +0000 (UTC)
Date: Thu, 12 Mar 2020 20:10:25 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200312191025.GD3803@rei.lan>
References: <cover.1584014172.git.viresh.kumar@linaro.org>
 <824c287cd06190cf0a489535fd4617aff8742b03.1584014172.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <824c287cd06190cf0a489535fd4617aff8742b03.1584014172.git.viresh.kumar@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V6 05/10] syscalls/fsconfig: New tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Pushed with two minor changes:

diff --git a/testcases/kernel/syscalls/fsconfig/fsconfig01.c b/testcases/kernel/syscalls/fsconfig/fsconfig01.c
index d05350ce2..aea6db822 100644
--- a/testcases/kernel/syscalls/fsconfig/fsconfig01.c
+++ b/testcases/kernel/syscalls/fsconfig/fsconfig01.c
@@ -77,6 +77,8 @@ static void run(void)
                SAFE_UMOUNT(MNTPOINT);
                tst_res(TPASS, "fsconfig() passed");
        }
+
+       SAFE_CLOSE(fd);
 }

We need to close the fd here, because the test will run out of file
descriptors for large enough -i parameter, since cleanup is executed
only at the test end. Also note that SAFE_CLOSE() sets the fd to -1 so
that cleanup is no-op unless we trigger some of the tst_brk()
statements.

 static struct tst_test test = {
diff --git a/testcases/kernel/syscalls/fsconfig/fsconfig02.c b/testcases/kernel/syscalls/fsconfig/fsconfig02.c
index b07a5f3ab..586524f14 100644
--- a/testcases/kernel/syscalls/fsconfig/fsconfig02.c
+++ b/testcases/kernel/syscalls/fsconfig/fsconfig02.c
@@ -94,6 +94,7 @@ static struct tst_test test = {
        .test = run,
        .setup = setup,
        .cleanup = cleanup,
+       .needs_tmpdir = 1,
        .needs_root = 1,
        .needs_device = 1,
 };

The test creates a file hence it has to request temporary directory.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
