Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DDD1FC1EF
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 00:57:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 266CF3C2C27
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 00:57:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id BBF003C2330
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 00:57:35 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 25A351A00EEE
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 00:57:35 +0200 (CEST)
Received: from ip-109-41-2-15.web.vodafone.de ([109.41.2.15]
 helo=localhost.localdomain) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1jlKW6-0007cP-FA; Tue, 16 Jun 2020 22:57:18 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Wed, 17 Jun 2020 00:56:12 +0200
Message-Id: <20200616225612.4068799-2-christian.brauner@ubuntu.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200616225612.4068799-1-christian.brauner@ubuntu.com>
References: <https://lore.kernel.org/lkml/20200615213843.2ojgm3ob7kp3qq6a@wittgenstein>
 <20200616225612.4068799-1-christian.brauner@ubuntu.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] tests: test for setns() EINVAL regression
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

Verify that setns() reports EINVAL when an fd is passed that refers to an
open file but the file is not a file descriptor useable to interact with
namespaces.

Cc: Jan Stancek <jstancek@redhat.com>
Cc: Cyril Hrubis <chrubis@suse.cz>
Link: https://lore.kernel.org/lkml/20200615085836.GR12456@shao2-debian
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 tools/testing/selftests/pidfd/pidfd.h            |  5 +++++
 tools/testing/selftests/pidfd/pidfd_getfd_test.c |  5 -----
 tools/testing/selftests/pidfd/pidfd_setns_test.c | 12 ++++++++++++
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/pidfd/pidfd.h b/tools/testing/selftests/pidfd/pidfd.h
index c1921a53dbed..8d728eda783d 100644
--- a/tools/testing/selftests/pidfd/pidfd.h
+++ b/tools/testing/selftests/pidfd/pidfd.h
@@ -95,4 +95,9 @@ static inline int sys_pidfd_getfd(int pidfd, int fd, int flags)
 	return syscall(__NR_pidfd_getfd, pidfd, fd, flags);
 }
 
+static inline int sys_memfd_create(const char *name, unsigned int flags)
+{
+	return syscall(__NR_memfd_create, name, flags);
+}
+
 #endif /* __PIDFD_H */
diff --git a/tools/testing/selftests/pidfd/pidfd_getfd_test.c b/tools/testing/selftests/pidfd/pidfd_getfd_test.c
index 401a7c1d0312..84b65ecccb04 100644
--- a/tools/testing/selftests/pidfd/pidfd_getfd_test.c
+++ b/tools/testing/selftests/pidfd/pidfd_getfd_test.c
@@ -34,11 +34,6 @@ static int sys_kcmp(pid_t pid1, pid_t pid2, int type, unsigned long idx1,
 	return syscall(__NR_kcmp, pid1, pid2, type, idx1, idx2);
 }
 
-static int sys_memfd_create(const char *name, unsigned int flags)
-{
-	return syscall(__NR_memfd_create, name, flags);
-}
-
 static int __child(int sk, int memfd)
 {
 	int ret;
diff --git a/tools/testing/selftests/pidfd/pidfd_setns_test.c b/tools/testing/selftests/pidfd/pidfd_setns_test.c
index 133ec5b6cda8..9418108eae13 100644
--- a/tools/testing/selftests/pidfd/pidfd_setns_test.c
+++ b/tools/testing/selftests/pidfd/pidfd_setns_test.c
@@ -470,4 +470,16 @@ TEST_F(current_nsset, no_foul_play)
 	}
 }
 
+TEST(setns_einval)
+{
+	int fd;
+
+	fd = sys_memfd_create("rostock", 0);
+	EXPECT_GT(fd, 0);
+
+	ASSERT_NE(setns(fd, 0), 0);
+	EXPECT_EQ(errno, EINVAL);
+	close(fd);
+}
+
 TEST_HARNESS_MAIN
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
