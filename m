Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D9E18CD70
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 13:04:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BAB333C5391
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 13:04:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 36DC23C537D
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 13:04:32 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CF79723B2E4
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 13:04:31 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 47383ABE7;
 Fri, 20 Mar 2020 12:04:31 +0000 (UTC)
Date: Fri, 20 Mar 2020 13:04:29 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200320120429.GA31021@dell5510>
References: <b392569b582f264927f2fea65bf14a89c03faaa5.1584679961.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b392569b582f264927f2fea65bf14a89c03faaa5.1584679961.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/fspick: Call fsconfig with
 FSCONFIG_CMD_RECONFIGURE
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Viresh,

> Make sure mountpoint is reconfigured after all the recent changes by
> calling fsconfig() with FSCONFIG_CMD_RECONFIGURE.

Thanks, merged.

BTW how about print flag on failure? (just to improve readability, although
there are line numbers so not required).

Kind regards,
Petr

diff --git testcases/kernel/syscalls/fspick/fspick01.c testcases/kernel/syscalls/fspick/fspick01.c
index b5a35bf61..c84723805 100644
--- testcases/kernel/syscalls/fspick/fspick01.c
+++ testcases/kernel/syscalls/fspick/fspick01.c
@@ -33,19 +33,19 @@ static void run(unsigned int n)
 
 	TEST(fsconfig(fspick_fd, FSCONFIG_SET_STRING, "sync", "false", 0));
 	if (TST_RET == -1) {
-		tst_res(TFAIL | TTERRNO, "fsconfig() failed");
+		tst_res(TFAIL | TTERRNO, "fsconfig(FSCONFIG_SET_STRING) failed");
 		goto out;
 	}
 
 	TEST(fsconfig(fspick_fd, FSCONFIG_SET_FLAG, "ro", NULL, 0));
 	if (TST_RET == -1) {
-		tst_res(TFAIL | TTERRNO, "fsconfig() failed");
+		tst_res(TFAIL | TTERRNO, "fsconfig(FSCONFIG_SET_FLAG) failed");
 		goto out;
 	}
 
 	TEST(fsconfig(fspick_fd, FSCONFIG_CMD_RECONFIGURE, NULL, NULL, 0));
 	if (TST_RET == -1) {
-		tst_res(TFAIL | TTERRNO, "fsconfig() failed");
+		tst_res(TFAIL | TTERRNO, "fsconfig(FSCONFIG_CMD_RECONFIGURE) failed");
 		goto out;
 	}
 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
