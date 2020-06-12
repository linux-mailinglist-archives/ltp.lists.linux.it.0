Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F2C1F79BB
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jun 2020 16:24:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5AE9A3C68C9
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jun 2020 16:24:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id A0B253C60F9
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 16:24:41 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 132C4601EA0
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 16:24:40 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C296FB03D;
 Fri, 12 Jun 2020 14:24:43 +0000 (UTC)
Date: Fri, 12 Jun 2020 16:24:55 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200612142455.GA2310@yuki.lan>
References: <20200430085742.1663-1-yangx.jy@cn.fujitsu.com>
 <20200504050937.oassdcfg4x5zh4nm@vireshk-i7>
 <e666a91d-1ffd-0f5f-131e-966ff763b14e@163.com>
 <20200505032803.s6axol3sfyyzl6ag@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505032803.s6axol3sfyyzl6ag@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/pidfd_open01.c: Add check for
 close-on-exec flag
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
> > > > +
> > > > +	pidfd = pidfd_open(getpid(), 0);
> > > > +	if (pidfd == -1)
> > > > +		tst_brk(TFAIL | TERRNO, "pidfd_open(getpid(), 0) failed");
> > > This could have been written as:
> > >          TEST(pidfd = pidfd_open(getpid(), 0));
> > 
> > Why do you want to keep TEST()? I don't think it is necessary:
> > 
> > 1) pidfd and TERRNO are enough to check return value and errno.
> > 
> > 2) It is OK for testcase to not use TEST().
> 
> As far as I have understood, that is the preferred way of doing it
> from LTP maintainers.
> 
> Over that it was already there, why remove it now ? Just fix the
> problems you are trying to fix and that should be good.

I do not care that much if the test uses the macro or not, but you should
really keep changes separate from the removal of the kernel minimal version.

Also I guess that we can supress the warning by a cast in the SAFE_FCNTL()
macro so that we can pass long there.

This should do:

diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index c39d8768b..c153f163c 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -215,14 +215,14 @@ pid_t safe_getpgid(const char *file, const int lineno, pid_t pid);
        ({int tst_ret_ = ioctl(fd, request, ##__VA_ARGS__);  \
          tst_ret_ < 0 ?                                     \
           tst_brk(TBROK | TERRNO,                           \
-                   "ioctl(%i,%s,...) failed", fd, #request), 0 \
+                   "ioctl(%i,%s,...) failed", (int)fd, #request), 0 \
         : tst_ret_;})
 
 #define SAFE_FCNTL(fd, cmd, ...)                            \
        ({int tst_ret_ = fcntl(fd, cmd, ##__VA_ARGS__);     \
          tst_ret_ == -1 ?                                  \
           tst_brk(TBROK | TERRNO,                          \
-                   "fcntl(%i,%s,...) failed", fd, #cmd), 0 \
+                   "fcntl(%i,%s,...) failed", (int)fd, #cmd), 0 \
         : tst_ret_;})


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
