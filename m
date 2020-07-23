Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE63622ABBA
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 11:26:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F48D3C2651
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 11:26:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 297A63C13D8
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 11:26:12 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2A07320135A
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 11:26:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 823A4ACA9;
 Thu, 23 Jul 2020 09:26:19 +0000 (UTC)
Date: Thu, 23 Jul 2020 11:26:34 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200723092634.GB9768@yuki.lan>
References: <1595493001-15724-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1595493001-15724-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595493001-15724-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 2/2] syscalls/ioctl: Use
 tst_detach_device_by_fd api
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
Pushed with fix for ioctl_loop04, thanks.

I've fixed the -i 2 case for ioctl_loop04 with:

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop04.c b/testcases/kernel/syscalls/ioctl/ioctl_loop04.c
index af3e90ddc..b4ab44a74 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop04.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop04.c
@@ -42,6 +42,8 @@ static void verify_ioctl_loop(void)
 	SAFE_TRUNCATE("test.img", NEW_SIZE);
 	SAFE_IOCTL(dev_fd, LOOP_SET_CAPACITY);
 
+	SAFE_LSEEK(dev_fd, 0, SEEK_SET);
+
 	/*check that we can't write data beyond 5K into loop device*/
 	TEST(write(dev_fd, wrbuf, OLD_SIZE));
 	if (TST_RET == NEW_SIZE) {

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
