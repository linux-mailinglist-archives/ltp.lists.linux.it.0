Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7D31FA2F3
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jun 2020 23:39:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 37BAF3C5FFB
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jun 2020 23:39:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id AA8903C072E
 for <ltp@lists.linux.it>; Mon, 15 Jun 2020 23:39:10 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7FD2C1249260
 for <ltp@lists.linux.it>; Mon, 15 Jun 2020 23:39:09 +0200 (CEST)
Received: from ip-109-41-2-3.web.vodafone.de ([109.41.2.3] helo=wittgenstein)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1jkwoY-00087y-2Y; Mon, 15 Jun 2020 21:38:46 +0000
Date: Mon, 15 Jun 2020 23:38:43 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200615213843.2ojgm3ob7kp3qq6a@wittgenstein>
References: <20200615085836.GR12456@shao2-debian>
 <20200615091850.GA3373@yuki.lan>
 <1101600340.15989438.1592229781375.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1101600340.15989438.1592229781375.JavaMail.zimbra@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] 303cc571d1: ltp.setns01.fail
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
Cc: Jann Horn <jannh@google.com>, kernel test robot <rong.a.chen@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, lkp@lists.01.org,
 Aleksa Sarai <cyphar@cyphar.com>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Serge Hallyn <serge@hallyn.com>, ltp@lists.linux.it,
 Michael Kerrisk <mtk.manpages@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Jun 15, 2020 at 10:03:01AM -0400, Jan Stancek wrote:
> 
> 
> ----- Original Message -----
> > Hi!
> > > setns01     6  TFAIL  :  setns01.c:176: regular file fd exp_errno=22:
> > > errno=EBADF(9): Bad file descriptor
> > > setns01     0  TINFO  :  setns(12, 0x20000)
> > > setns01     7  TFAIL  :  setns01.c:176: regular file fd exp_errno=22:
> > > errno=EBADF(9): Bad file descriptor
> > > setns01     0  TINFO  :  setns(12, 0x40000000)
> > > setns01     8  TFAIL  :  setns01.c:176: regular file fd exp_errno=22:
> > > errno=EBADF(9): Bad file descriptor
> > > setns01     0  TINFO  :  setns(12, 0x20000000)
> > > setns01     9  TFAIL  :  setns01.c:176: regular file fd exp_errno=22:
> > > errno=EBADF(9): Bad file descriptor
> > > setns01     0  TINFO  :  setns(12, 0x4000000)
> > > setns01    10  TFAIL  :  setns01.c:176: regular file fd exp_errno=22:
> > > errno=EBADF(9): Bad file descriptor
> > 
> > The messages here are a bit cryptic, I will fix that later on, but what
> > it means here is that the errno has changed from EINVAL to EBADF in a
> > case we pass file descriptor to a regular file to setns().
> 
> I posted a series that accepts both errnos about week ago:
>   https://lists.linux.it/pipermail/ltp/2020-June/017467.html

When you used to pass an fd that referred to an open file but the file
was not a nsfd the kernel would report EINVAL. Since the pidfd support
this now reports EBADF. While that is a user visible change it is not a
particular worrying one but something we should still fix. Here's the
patch that fixes this:

diff --git a/kernel/nsproxy.c b/kernel/nsproxy.c
index b03df67621d0..cd356630a311 100644
--- a/kernel/nsproxy.c
+++ b/kernel/nsproxy.c
@@ -531,7 +531,7 @@ SYSCALL_DEFINE2(setns, int, fd, int, flags)
        } else if (!IS_ERR(pidfd_pid(file))) {
                err = check_setns_flags(flags);
        } else {
-               err = -EBADF;
+               err = -EINVAL;
        }
        if (err)
                goto out;

I'll send a pr for this to Linus this week (or next since I'm on
vacation this week) and get this fixed. Thanks for spotting this. What's
the Reported-by: line format that LTP uses?

Christian

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
