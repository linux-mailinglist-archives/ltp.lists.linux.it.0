Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BF01FC1EE
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 00:57:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 69BB33C3215
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 00:57:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id AABD13C02EF
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 00:57:35 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B7078602264
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 00:57:34 +0200 (CEST)
Received: from ip-109-41-2-15.web.vodafone.de ([109.41.2.15]
 helo=localhost.localdomain) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1jlKW1-0007cP-B7; Tue, 16 Jun 2020 22:57:13 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Wed, 17 Jun 2020 00:56:11 +0200
Message-Id: <20200616225612.4068799-1-christian.brauner@ubuntu.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <https://lore.kernel.org/lkml/20200615213843.2ojgm3ob7kp3qq6a@wittgenstein>
References: <https://lore.kernel.org/lkml/20200615213843.2ojgm3ob7kp3qq6a@wittgenstein>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] nsproxy: restore EINVAL for non-namespace file
 descriptor
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
 lkp@lists.01.org, Aleksa Sarai <cyphar@cyphar.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Serge Hallyn <serge@hallyn.com>, ltp@lists.linux.it,
 Michael Kerrisk <mtk.manpages@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The LTP testsuite reported a regression where users would now see EBADF
returned instead of EINVAL when an fd was passed that referred to an open
file but the file was not a nsfd. Fix this by continuing to report EINVAL.

Reported-by: kernel test robot <rong.a.chen@intel.com>
Cc: Jan Stancek <jstancek@redhat.com>
Cc: Cyril Hrubis <chrubis@suse.cz>
Link: https://lore.kernel.org/lkml/20200615085836.GR12456@shao2-debian
Fixes: 303cc571d107 ("nsproxy: attach to namespaces via pidfds")
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
I plan on sending this to Linus once it has sat in for-next for a few
days.
---
 kernel/nsproxy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/nsproxy.c b/kernel/nsproxy.c
index b03df67621d0..cd356630a311 100644
--- a/kernel/nsproxy.c
+++ b/kernel/nsproxy.c
@@ -531,7 +531,7 @@ SYSCALL_DEFINE2(setns, int, fd, int, flags)
 	} else if (!IS_ERR(pidfd_pid(file))) {
 		err = check_setns_flags(flags);
 	} else {
-		err = -EBADF;
+		err = -EINVAL;
 	}
 	if (err)
 		goto out;

base-commit: b3a9e3b9622ae10064826dccb4f7a52bd88c7407
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
