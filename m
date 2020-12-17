Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 393792DCF14
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 11:08:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE4203C57C9
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 11:08:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 41B583C299B
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 11:08:29 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CD7E1601320
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 11:08:28 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 23F9AAC7B;
 Thu, 17 Dec 2020 10:08:28 +0000 (UTC)
Date: Thu, 17 Dec 2020 11:09:26 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <X9suVu55wgMPiOxC@yuki.lan>
References: <b48115a8d6dc3036f08e0166332035fab078b34a.1608189944.git.viresh.kumar@linaro.org>
 <0279beda4660ab1b401164e369c79475633bd067.1608189944.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0279beda4660ab1b401164e369c79475633bd067.1608189944.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 3/3] syscalls: finit_module: Add tests
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
This finit_module02 fails for me:

tst_test.c:1261: TINFO: Timeout per run is 0h 05m 00s
finit_module02.c:66: TPASS: finit_module(*tc->fd, tc->param, tc->flags): EINVAL (22)
finit_module02.c:66: TFAIL: finit_module(*tc->fd, tc->param, tc->flags) expected ENOEXEC: EBADF (9)
finit_module02.c:66: TPASS: finit_module(*tc->fd, tc->param, tc->flags): EFAULT (14)
finit_module02.c:66: TPASS: finit_module(*tc->fd, tc->param, tc->flags): EINVAL (22)
finit_module02.c:66: TPASS: finit_module(*tc->fd, tc->param, tc->flags): EINVAL (22)
tst_capability.c:29: TINFO: Dropping CAP_SYS_MODULE(16)
finit_module02.c:66: TPASS: finit_module(*tc->fd, tc->param, tc->flags): EPERM (1)
tst_capability.c:41: TINFO: Permitting CAP_SYS_MODULE(16)
finit_module02.c:59: TPASS: finit_module(*tc->fd, tc->param, tc->flags) passed
finit_module02.c:63: TPASS: finit_module(*tc->fd, tc->param, tc->flags): EEXIST (17)
finit_module02.c:66: TFAIL: finit_module(*tc->fd, tc->param, tc->flags) expected EBADF: ETXTBSY (26)

Linux 5.9.12

Also it looks to me like EBADF is more reasonable error for fd set to -1
also ETXTBSY sounds more reasonable for a file opened for writing.

I guess that someone cleaned up the kernel implementation but forget to
update the manual pages?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
