Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C78DD3F980E
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 12:20:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 678093C2DDA
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 12:20:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CBFD13C28F2
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 12:20:07 +0200 (CEST)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4B8D510011C0
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 12:20:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1630059605; i=@fujitsu.com;
 bh=tVo39ccNJlK8uYLkJYgTtG77bNLFM9IweW6RSOifeMU=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=bZs3aWG5M2X2ZM7Oo8JkNcIEr67Hy829vC+f55zuicASRgqowECq/2OX8CzcEEnfy
 cOPXHdvlieXBAPj0Lvb9D2tgtCXauDVedeD4RTXqqrD4S3oVyxVQrmNx9m0pCHzk87
 8setdyj/iqWwssQdkvlNkbAkMamZ0WrgrE6QOCkq0tojKRJe1Gk4eyRTsP2vnYkkRz
 jKJlEnYnmA45PbNGyNF/Bosm/XhMfW8msZsMZOmkM0/HJqnDgwUDNbDizAhn5nij+u
 KgeRVcBPOIXy6/w4p4lshpe6AfmLhD/2oLHOnjkfJAladBqH+MR4e+nFdbjUayu4jH
 HZBlzjn0Uymtw==
Received: from [100.112.192.137] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-a.eu-west-1.aws.symcld.net id FE/A9-25315-55CB8216;
 Fri, 27 Aug 2021 10:20:05 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxRTdkj0a
 iwb4d1hYrvu9gdGD02Pd7HWsAYxRrZl5SfkUCa8btD1vZC/Y5VFx7spexgXGpeRcjF4eQQAuT
 xPm5bYwQzh5GiYULbgE5nBxsApoSzzoXMIPYIgISEh0Nb9lBbGYBdYnlk34xgdjCAh4S/+58B
 4uzCKhKzH3wjg3E5hXwlHh/5T9YXEJAQWLKw/dgcziB4ofbJ4DVCAH1/ti2mgWiXlDi5MwnLB
 DzJSQOvnjBDNGrKHGp4xsjhF0hMWtWG9MERv5ZSFpmIWlZwMi0itE8qSgzPaMkNzEzR9fQwED
 X0NBI19DSWNfYUi+xSjdRL7VUtzy1uETXUC+xvFivuDI3OSdFLy+1ZBMjMBxTCg6q72D8+PqD
 3iFGSQ4mJVHe8p0aiUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeGfuAMoJFqWmp1akZeYAYwMmL
 cHBoyTC+2kXUJq3uCAxtzgzHSJ1ilFRSpxXYzdQQgAkkVGaB9cGi8dLjLJSwryMDAwMQjwFqU
 W5mSWo8q8YxTkYlYR5D4GM58nMK4Gb/gpoMRPQ4gI+VZDFJYkIKakGpsLwq8lB2w5NfsKgJW0
 65djyoI8Gu6TZ9ZbZBuqe51p7aZsOK+ux7Rl5PIt7ZjpOW7bE+IO60YY1PP8E1/QbxZws/h7w
 6V2pVknifCPxH+9FZmm1sBw6etDjre3G5ZnFE6RS2PgbDpq7VkmHVZy4YGtkzploOdtznZR/a
 SV3CDundEH00S97G8PFlLu+SG6a5jsxZuven4a/s0XM1theCmyeMJOB+bnn1hjeGvkYway9Im
 /PH1k1+6giU7isI8Obt+obt20zmsP76uv52c+WJ+cul102v/lDz83fEpU3YtYtaHeqNpj4y3+
 qwlKz0AuPW4S2fPzDtf2Eh2H+/rRr+q93xCmnf1/jMePf0j0e2UosxRmJhlrMRcWJAJBDPUtC
 AwAA
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-14.tower-267.messagelabs.com!1630059604!151793!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10451 invoked from network); 27 Aug 2021 10:20:04 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
 by server-14.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Aug 2021 10:20:04 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17RAJuPa009506
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 11:20:04 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 27 Aug 2021 11:19:54 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 27 Aug 2021 18:19:59 +0800
Message-ID: <1630059599-13947-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628144855-5924-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <1628144855-5924-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2] testcases: Enable userns in max_user_namespaces
 file
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On old distros ie centos7, the default value of max_user_namespaces is set to 0.
Enable it by increasing this value.

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 testcases/cve/icmp_rate_limit01.c                   | 9 +++++++++
 testcases/kernel/containers/userns/userns08.c       | 9 +++++++++
 testcases/kernel/syscalls/bind/bind06.c             | 9 +++++++++
 testcases/kernel/syscalls/sendto/sendto03.c         | 9 +++++++++
 testcases/kernel/syscalls/setsockopt/setsockopt05.c | 9 +++++++++
 testcases/kernel/syscalls/setsockopt/setsockopt06.c | 9 +++++++++
 testcases/kernel/syscalls/setsockopt/setsockopt07.c | 9 +++++++++
 testcases/kernel/syscalls/setsockopt/setsockopt08.c | 9 +++++++++
 8 files changed, 72 insertions(+)

diff --git a/testcases/cve/icmp_rate_limit01.c b/testcases/cve/icmp_rate_limit01.c
index f24ea5bf9..f5ec77d6f 100644
--- a/testcases/cve/icmp_rate_limit01.c
+++ b/testcases/cve/icmp_rate_limit01.c
@@ -58,6 +58,11 @@ static void setup(void)
 	for (i = 0; i < SRCADDR_COUNT; i++)
 		fds[i] = -1;
 
+	/* The default value of max_user_namespaces is set to 0 on some distros,
+	 * We need to change the default value to call clone().
+	 */
+	SAFE_FILE_PRINTF("/proc/sys/user/max_user_namespaces", "%d", 10);
+
 	SAFE_UNSHARE(CLONE_NEWUSER);
 	SAFE_UNSHARE(CLONE_NEWNET);
 	SAFE_FILE_PRINTF("/proc/self/setgroups", "deny");
@@ -265,6 +270,10 @@ static struct tst_test test = {
 		"CONFIG_NET_NS=y",
 		NULL
 	},
+	.save_restore = (const char * const[]) {
+		"?/proc/sys/user/max_user_namespaces",
+		NULL,
+	},
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "b38e7819cae9"},
 		{"CVE", "2020-25705"},
diff --git a/testcases/kernel/containers/userns/userns08.c b/testcases/kernel/containers/userns/userns08.c
index aedfc6c4e..429fcf235 100644
--- a/testcases/kernel/containers/userns/userns08.c
+++ b/testcases/kernel/containers/userns/userns08.c
@@ -120,6 +120,11 @@ static void setup(void)
 
 	SAFE_WRITE(fd, 1, "\n", 1);
 	SAFE_CLOSE(fd);
+
+	/* The default value of max_user_namespaces is set to 0 on some distros,
+	 * We need to change the default value to call clone().
+	 */
+	SAFE_FILE_PRINTF("/proc/sys/user/max_user_namespaces", "%d", 10);
 }
 
 static struct tst_test test = {
@@ -133,6 +138,10 @@ static struct tst_test test = {
 		"CONFIG_USER_NS",
 		NULL
 	},
+	.save_restore = (const char * const[]) {
+		"?/proc/sys/user/max_user_namespaces",
+		NULL,
+	},
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "d2f007dbe7e4"},
 		{"CVE", "CVE-2018-18955"},
diff --git a/testcases/kernel/syscalls/bind/bind06.c b/testcases/kernel/syscalls/bind/bind06.c
index 017e0fc89..390af76a1 100644
--- a/testcases/kernel/syscalls/bind/bind06.c
+++ b/testcases/kernel/syscalls/bind/bind06.c
@@ -34,6 +34,11 @@ static void setup(void)
 	int real_gid = getgid();
 	struct ifreq ifr;
 
+	/* The default value of max_user_namespaces is set to 0 on some distros,
+	 * We need to change the default value to call clone().
+	 */
+	SAFE_FILE_PRINTF("/proc/sys/user/max_user_namespaces", "%d", 10);
+
 	SAFE_UNSHARE(CLONE_NEWUSER);
 	SAFE_UNSHARE(CLONE_NEWNET);
 	SAFE_FILE_PRINTF("/proc/self/setgroups", "deny");
@@ -107,6 +112,10 @@ static struct tst_test test = {
 		"CONFIG_NET_NS=y",
 		NULL
 	},
+	.save_restore = (const char * const[]) {
+		"?/proc/sys/user/max_user_namespaces",
+		NULL,
+	},
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "15fe076edea7"},
 		{"CVE", "2018-18559"},
diff --git a/testcases/kernel/syscalls/sendto/sendto03.c b/testcases/kernel/syscalls/sendto/sendto03.c
index 3ecb574a1..700ad24ca 100644
--- a/testcases/kernel/syscalls/sendto/sendto03.c
+++ b/testcases/kernel/syscalls/sendto/sendto03.c
@@ -43,6 +43,11 @@ static void setup(void)
 	int real_gid = getgid();
 	struct ifreq ifr;
 
+	/* The default value of max_user_namespaces is set to 0 on some distros,
+	 * We need to change the default value to call clone().
+	 */
+	SAFE_FILE_PRINTF("/proc/sys/user/max_user_namespaces", "%d", 10);
+
 	SAFE_UNSHARE(CLONE_NEWUSER);
 	SAFE_UNSHARE(CLONE_NEWNET);
 	SAFE_FILE_PRINTF("/proc/self/setgroups", "deny");
@@ -215,6 +220,10 @@ static struct tst_test test = {
 		"CONFIG_NET_NS=y",
 		NULL
 	},
+	.save_restore = (const char * const[]) {
+		"?/proc/sys/user/max_user_namespaces",
+		NULL,
+	},
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "bcc5364bdcfe"},
 		{"linux-git", "acf69c946233"},
diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt05.c b/testcases/kernel/syscalls/setsockopt/setsockopt05.c
index 0b7ff39d2..9adb2f0d2 100644
--- a/testcases/kernel/syscalls/setsockopt/setsockopt05.c
+++ b/testcases/kernel/syscalls/setsockopt/setsockopt05.c
@@ -40,6 +40,11 @@ static void setup(void)
 	struct ifreq ifr;
 	socklen_t addrlen = sizeof(addr);
 
+	/* The default value of max_user_namespaces is set to 0 on some distros,
+	 * We need to change the default value to call clone().
+	 */
+	SAFE_FILE_PRINTF("/proc/sys/user/max_user_namespaces", "%d", 10);
+
 	SAFE_UNSHARE(CLONE_NEWUSER);
 	SAFE_UNSHARE(CLONE_NEWNET);
 	SAFE_FILE_PRINTF("/proc/self/setgroups", "deny");
@@ -99,6 +104,10 @@ static struct tst_test test = {
 		"CONFIG_NET_NS=y",
 		NULL
 	},
+	.save_restore = (const char * const[]) {
+		"?/proc/sys/user/max_user_namespaces",
+		NULL,
+	},
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "85f1bd9a7b5a"},
 		{"CVE", "2017-1000112"},
diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt06.c b/testcases/kernel/syscalls/setsockopt/setsockopt06.c
index 33284e5a6..9ea5985ba 100644
--- a/testcases/kernel/syscalls/setsockopt/setsockopt06.c
+++ b/testcases/kernel/syscalls/setsockopt/setsockopt06.c
@@ -35,6 +35,11 @@ static void setup(void)
 	int real_uid = getuid();
 	int real_gid = getgid();
 
+	/* The default value of max_user_namespaces is set to 0 on some distros,
+	 * We need to change the default value to call clone().
+	 */
+	SAFE_FILE_PRINTF("/proc/sys/user/max_user_namespaces", "%d", 10);
+
 	SAFE_UNSHARE(CLONE_NEWUSER);
 	SAFE_UNSHARE(CLONE_NEWNET);
 	SAFE_FILE_PRINTF("/proc/self/setgroups", "deny");
@@ -125,6 +130,10 @@ static struct tst_test test = {
 		"CONFIG_NET_NS=y",
 		NULL
 	},
+	.save_restore = (const char * const[]) {
+		"?/proc/sys/user/max_user_namespaces",
+		NULL,
+	},
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "84ac7260236a"},
 		{"CVE", "2016-8655"},
diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt07.c b/testcases/kernel/syscalls/setsockopt/setsockopt07.c
index b00286989..051b1bb70 100644
--- a/testcases/kernel/syscalls/setsockopt/setsockopt07.c
+++ b/testcases/kernel/syscalls/setsockopt/setsockopt07.c
@@ -38,6 +38,11 @@ static void setup(void)
 	int real_uid = getuid();
 	int real_gid = getgid();
 
+	/* The default value of max_user_namespaces is set to 0 on some distros,
+	 * We need to change the default value to call clone().
+	 */
+	SAFE_FILE_PRINTF("/proc/sys/user/max_user_namespaces", "%d", 10);
+
 	SAFE_UNSHARE(CLONE_NEWUSER);
 	SAFE_UNSHARE(CLONE_NEWNET);
 	SAFE_FILE_PRINTF("/proc/self/setgroups", "deny");
@@ -137,6 +142,10 @@ static struct tst_test test = {
 		"CONFIG_NET_NS=y",
 		NULL
 	},
+	.save_restore = (const char * const[]) {
+		"?/proc/sys/user/max_user_namespaces",
+		NULL,
+	},
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "c27927e372f0"},
 		{"CVE", "2017-1000111"},
diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt08.c b/testcases/kernel/syscalls/setsockopt/setsockopt08.c
index a7c0ace20..aef9bdcb6 100644
--- a/testcases/kernel/syscalls/setsockopt/setsockopt08.c
+++ b/testcases/kernel/syscalls/setsockopt/setsockopt08.c
@@ -95,6 +95,11 @@ void setup(void)
 			"The vulnerability was only present in 32-bit compat mode");
 	}
 
+	/* The default value of max_user_namespaces is set to 0 on some distros,
+	 * We need to change the default value to call clone().
+	 */
+	SAFE_FILE_PRINTF("/proc/sys/user/max_user_namespaces", "%d", 10);
+
 	SAFE_UNSHARE(CLONE_NEWUSER);
 	SAFE_UNSHARE(CLONE_NEWNET);
 }
@@ -156,6 +161,10 @@ static struct tst_test test = {
 		"CONFIG_NET_NS=y",
 		NULL
 	},
+	.save_restore = (const char * const[]) {
+		"?/proc/sys/user/max_user_namespaces",
+		NULL,
+	},
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "b29c457a6511"},
 		{"CVE", "2021-22555"},
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
