Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 728363C95AA
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 03:39:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 272643C8758
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 03:39:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 04FB93C1B12
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 03:39:10 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A55F2200987
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 03:39:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1626313148; i=@fujitsu.com;
 bh=apWj1sRytAoDUlvHscRyQzQyc82m3/cqu1zegzfb1f0=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=KhwHP0zfFC5QT1KD1tvqye3fnG2cPRLLRl7CiVin7FKbVN/P0nISshJ5votnQC+k5
 35EN3eqzPlpzAp2LRlfbwxaSDVaZACPZdIzIdjTGbDDWFw3Hvy+jNzqJleizZQdugG
 KNeuoYv3/RA3hc8+W5cLTVZaxZpCe/3NR4ULuVY9ASwsgFKVTSqVYVc+yQNyzPx10M
 ak20V3v0GIv2YN6RhAtRXkRQBEnqFXOCKYnd4RMFSBFqiOR5Ef+d5PIBQMRJdb4igm
 4nhHbw7MTYWWaw4jR0oBwTNLH+ONIUL2f+0HGmqekSC/y6NeEoeimHzHvpe4Pf4QSx
 3b3cBj3XRU2tA==
Received: from [100.113.2.110] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-a.eu-central-1.aws.symcld.net id D4/85-07211-CB19FE06;
 Thu, 15 Jul 2021 01:39:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MRort74vs
 Eg4XXhC1WfN/BaNH7dgaTA5PHhEUHGD32/V7HGsAUxZqZl5RfkcCasfTgGuaC+dwVLzouMTcw
 /uDsYuTiEBJoY5K4+H0DC4Szl1HiyP8Z7F2MnBxsApoSzzoXMIPYIgISEh0Nb8HizAIOEnsWr
 mcCsYUFrCWu7lnHBmKzCKhKHP66mxHE5hXwlDjVsgHMlhBQkJjy8D0zRFxQ4uTMJywQcyQkDr
 54wQxRoyhxqeMbVH2lxJ5Z/UwTGHlnIWmZhaRlASPTKkbLpKLM9IyS3MTMHF1DAwNdQ0NjXUN
 dIyMzvcQq3US91FLd5NS8kqJEoKxeYnmxXnFlbnJOil5easkmRmDYpRQyPtrBePr1B71DjJIc
 TEqivJta3ycI8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuDV6gfKCRalpqdWpGXmAGMAJi3BwaMkw
 hsKjAMh3uKCxNzizHSI1ClGRSlxXosJQAkBkERGaR5cGyzuLjHKSgnzMjIwMAjxFKQW5WaWoM
 q/YhTnYFQS5g0BGc+TmVcCN/0V0GImoMXaa96CLC5JREhJNTBlJgg/+vEmVechX2FFhOjqbOV
 V3lWNmWduWKjV8KRea034V+YygytQ2N487+W/ObWCVlF3ql8ffa/yXtF6Ux1v79Fn0cu164//
 cujz6lWbKHVxgeT8urp5PsrhVvcPff8QXhD7jYdpa/PM1bJf527vXb/uhWPDM6XyKb8nLp2+T
 OPq36Vb53hoqXcf49gxb+eUh+6edlPW7n5Rseh58L/V6fYNa2s/Fs7LCBdXDHxQe2/2Qy7Lmw
 vUOG/+9bprtjcuf1Xn/wUt2//+6FVjs2QtdN56WopjklVIUh5n4TZJjit70vZEX3XckZ2jq+e
 9hGGT+yvmp2HZ3/iPev+qlcyeu/tbt3X+7huz7FgKlXyUWIozEg21mIuKEwGr41C7NgMAAA==
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-17.tower-228.messagelabs.com!1626313146!173432!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22516 invoked from network); 15 Jul 2021 01:39:07 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
 by server-17.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Jul 2021 01:39:07 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com
 [10.182.185.121])
 by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16F1d0YV002181
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Thu, 15 Jul 2021 02:39:00 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 15 Jul 2021 02:38:58 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 15 Jul 2021 09:39:29 +0800
Message-ID: <1626313169-30611-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/ioctl_ns05,6: Fix buffer overflow
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
Cc: mhillen@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Since pid's max value is 2147483647, the child_namespace maybe not
enough to store "/proc/%s/ns/user" string when using a large pid.
Fix it by improving the length to 30.

Fixes: #847
Reported-by: Marius Hillenbrand <mhillen@linux.ibm.com>
Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 testcases/kernel/syscalls/ioctl/ioctl_ns05.c | 2 +-
 testcases/kernel/syscalls/ioctl/ioctl_ns06.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns05.c b/testcases/kernel/syscalls/ioctl/ioctl_ns05.c
index a67ddbe2c..488c48d8e 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_ns05.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_ns05.c
@@ -59,7 +59,7 @@ static void run(void)
 	if (pid == -1)
 		tst_brk(TBROK | TERRNO, "ltp_clone failed");
 
-	char child_namespace[20];
+	char child_namespace[30];
 	int my_fd, child_fd, parent_fd;
 
 	sprintf(child_namespace, "/proc/%i/ns/pid", pid);
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns06.c b/testcases/kernel/syscalls/ioctl/ioctl_ns06.c
index b6ac80208..77ec04edc 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_ns06.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_ns06.c
@@ -51,7 +51,7 @@ static int child(void *arg LTP_ATTRIBUTE_UNUSED)
 
 static void run(void)
 {
-	char child_namespace[20];
+	char child_namespace[30];
 
 	pid_t pid = ltp_clone(CLONE_NEWUSER | SIGCHLD, &child, 0,
 		STACK_SIZE, child_stack);
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
