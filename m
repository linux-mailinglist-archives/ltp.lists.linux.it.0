Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B435113258E
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jan 2020 13:02:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 51BC53C2365
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jan 2020 13:02:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id E57A53C234E
 for <ltp@lists.linux.it>; Tue,  7 Jan 2020 13:02:31 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2BE3E1A014A2
 for <ltp@lists.linux.it>; Tue,  7 Jan 2020 13:02:30 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6878EB071;
 Tue,  7 Jan 2020 12:02:30 +0000 (UTC)
Date: Tue, 7 Jan 2020 13:02:24 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200107120224.GA26408@rei.lan>
References: <1576049159-14014-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576049159-14014-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/capget01: Cleanup & convert to new
 library
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
Pushed with following changes:

diff --git a/testcases/kernel/syscalls/capget/capget01.c b/testcases/kernel/syscalls/capget/capget01.c
index 743e307c5..bc8bd7ce7 100644
--- a/testcases/kernel/syscalls/capget/capget01.c
+++ b/testcases/kernel/syscalls/capget/capget01.c
@@ -31,18 +31,18 @@ static void verify_capget(unsigned int n)
                .pid = pid,
        };
 
-       struct __user_cap_data_struct data;
+       struct __user_cap_data_struct data[2];
 
        tst_res(TINFO, "%s", tc->message);
 
-       TEST(tst_syscall(__NR_capget, &hdr, &data));
+       TEST(tst_syscall(__NR_capget, &hdr, data));
        if (TST_RET == 0)
                tst_res(TPASS, "capget() returned %ld", TST_RET);
        else
                tst_res(TFAIL | TTERRNO, "Test Failed, capget() returned %ld",
                                TST_RET);
 
-       if (data.effective & 1 << CAP_NET_RAW)
+       if (data[0].effective & 1 << CAP_NET_RAW)
                tst_res(TFAIL, "capget() gets CAP_NET_RAW unexpectedly in pE");
        else
                tst_res(TPASS, "capget() doesn't get CAP_NET_RAW as expected in PE");


The version 2 and 3 are 64 bit capabilities, hence we have to pass array of cap_struct_data instead.

Otherwise this is a nice improvement on the testcase, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
