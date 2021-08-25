Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 701F43F7934
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 17:40:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1522E3C8DCA
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 17:40:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3FB633C2F77
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 17:39:48 +0200 (CEST)
Received: from JPN01-TY1-obe.outbound.protection.outlook.com (unknown
 [104.47.93.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 81AE06007B8
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 17:39:47 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g99uQUvq+MKrV5c//f6QTRF/oYaEpEb3xH0ydWoHjG9et6k6p9UWE4e8HhWwl5MvKpXefYVePPt0iGqLj1r9NnuO8RhIBoreP/5K2LFcfV7sBvtxP9I9Doxvn9quOYFthx/4ZmkBaP5xqxTavNC2Ci1vNuo+HFocDy7TIy+4yLtTphyW3zIyCYLxlYZiWDAV3dzdJLFbmyzIxm8z5YIDvT9alyVRTW3dWfMaTV+MF2Amg7e+KZTNe9baVg9d3OqX//TFEtndAcH8bDj4eW2q42bmZGsaX6Gj6l4Q8VcCmRAiWhBFeRh+kSESgSPOzangqxVRgf990ABUdwOTcdlI8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hifV+fcWlu5b7GuhBGRUwFPQ7XnGduabiIw7tteNGr8=;
 b=FKePEAHvvxRZwEuTDfXdnrm0EtepK4qTPKazqCrMvcoQ505fhbYvniUnnFzGTfIStslCOSEgGG/arxgurZc9AaevZqka1fF59FDgOulVY1dZKdFju7pIRNTIUW3OMbIDS4tu0aOX1/xJnxWjzmDblSMvx1jqrsfZdvFfYaCiuNRUoyf7WqApeQ7zCTU/k2L/C5IbWNkOQaDP11DxrBkKj/ayjMk86F+A1U66zQro0+sGBEzG+1HALwDzSFUOX79gP8YDd/RuiPskvhXz2ut3OOSAO8z59MpdIV7uyBeGcCnro5bg4VzE9qaCsAF+sMUTD7gSWIlwKSVREPsL0jrWnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hifV+fcWlu5b7GuhBGRUwFPQ7XnGduabiIw7tteNGr8=;
 b=BrcbhpAWyJU0uYcGFMnMO6Z+65cqThxqfBsU2ZJ6h7+9MKgkaPPkSxk4oofJFuQpJEfJyT1Zi48CTr6Bc4jdnvsd9aK6xK4GomebjOhlHqU0TTuHnCZZcVwwYf4w+305j4j+Y77U15XkycUyN7OtD7pQ8RjBtPkhV1QIykKh9D/Pl+/cj7CavEvy6oGNlRMpuztQig//f83jc2r47MOQJ7JknsjFxbf2PIOsNZfQkjBucQP3sIclbDHbzVqbNs0weJAuRVLy1zlrHjvSDqQh1E8rYJPkzuM1GzHKKNcdCoqPCcCoc6Fagu5bcHCH+SQ2m2ZlMzMWWtoiyBIxHZ6BGw==
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:e9::13)
 by OSZP286MB0757.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:f7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 15:39:42 +0000
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::e800:1330:57ca:8cd0]) by OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::e800:1330:57ca:8cd0%5]) with mapi id 15.20.4436.025; Wed, 25 Aug 2021
 15:39:42 +0000
From: Xie Ziyao <ziyaoxie@outlook.com>
To: ltp@lists.linux.it
Date: Wed, 25 Aug 2021 15:39:30 +0000
Message-ID: <OSZP286MB08712608A50835393F85FF90CCC69@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825153932.138396-1-ziyaoxie@outlook.com>
References: <20210825153932.138396-1-ziyaoxie@outlook.com>
X-TMN: [/K2Y45iiU+x0+LG3wf8TGiY0AQahC+T6]
X-ClientProxiedBy: HK2PR02CA0160.apcprd02.prod.outlook.com
 (2603:1096:201:1f::20) To OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:e9::13)
X-Microsoft-Original-Message-ID: <20210825153932.138396-3-ziyaoxie@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (14.127.251.10) by
 HK2PR02CA0160.apcprd02.prod.outlook.com (2603:1096:201:1f::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Wed, 25 Aug 2021 15:39:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f4a2a88-485f-4e28-e4a3-08d967de8ea3
X-MS-Exchange-SLBlob-MailProps: mBy7Mai7yE514amIrhlNzVd+FmdWxeo8b/RX6flO/A1mRNDlHjpah9QX1yAhEasmvNGP07EfBgS5y4X1+zc2k/snZ5GsQO7K++jle8M41bDpYzdK69NSDlKejLyUBJMSz3XIA5UDZBHSyw29Nq9k5AbbZNMGl0zkvbIM52IxfcUfldzmNPFyER6LybkE2BNh3PN6lJiMDMb8GqgN9qkBokjXYClJPZRwkGxeJOG4hCxCBQK+p1YIRhbeGUbDX79wwWpHtkLhJK8X6kAgYCEXWRX2qvDSiwegZJ0skDbcMaX+VLAQQtyxV7sf0Yy8pSv1VCaiN4QU1uJ8I7FbW+VTyA2T1PYtz1igBMDhamc0HqU7z3tNGJtnQfTDwDQMcUnXQ6o6suJRj8r2892JPR3hCeLkrnVSggfoNPFekCRlpPK6wzcq4C8cNuH2Yt/uu9fOUKU5rnAnejrIPLPzs+jC0pYfktmQX1LS8fv2F0EzZDKUxPmUZPgw6mt/pKg2xg2vmEQi1f+Hnw8VfO0NDJNQBcP3BVRJgQkoaJC0sXui8FTWL2hqM+i/jcPHCCbJyOBXbw8LkaEKYMGoFYEe9ob25zGtdmgQ0PZqTpULSyvlI1A+UcRY0rvwblCSU1kn0JNbjl3TBlXf8HxhmSiGaO3inbXJyWnrRPWzKjT6gxh5V2vAqht2S5tKxrcEq5bb2kTYCj8jV9BPhV9I3UsQgWHG96TNV/R5j1Sq
X-MS-TrafficTypeDiagnostic: OSZP286MB0757:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7JS+ioVWctAOpa1APt0aE00mzv5541GNovgpNa8r+AhlLrU12ZnVQDr/1XTyneciKC7G8dE93BnRf/FMnNeceuBVsjdBCtFV+ZJMWaiNYeTAOuDwAR3OCzI7tJR8BhI1oop5XVFgQw5ydGtjkV+IT6vi0TnMvM/bTNM+h2BI6Yz7Vte2ItK99caTqK8iRSYOBEoVxXqS1tu31jARbf/ZdNlU8ti1hb6cQMa7Wi6LOmBXaZAu6r3RTvTJdjF08yLQ8dfYazhRHWtaczmb3ToKImncZPJrBaCyK8LO+o/CfXi3ozLnAXGvrRPbiXFIrMe/BNp7nFYWTZUTEFqcbv52uGgYSkBiPlMyLlI+h4xaSUI83x6D+dkmTJrdhzy7apoAxwqC0bpzIA/8DVF6Zx1D/KxjrOPqQPnDE/Nr5zJRW/Nvozm0RYbU3p188iOPJX1N
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: M/hHhjFtUioMrLX2Z8XsAyKCBFrBEo79oe7UyrpAwH1zMG4OFfzNzMXhrG15a76NJQjDgtXePFL7jt8iBUpbFB3/kHBmu1EDFwN7pAZmEaHsWKaA5hDCDsYOftLrIet7D8HVYzoqcZyBfzWWzBcMSg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4a2a88-485f-4e28-e4a3-08d967de8ea3
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 15:39:42.4605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB0757
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MSGID_FROM_MTA_HEADER,
 SPF_PASS,T_SPF_HELO_TEMPERROR autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/4 v2] epoll_ctl: Add test for epoll_ctl03
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

From: "Xie Ziyao" <ziyaoxie@outlook.com>

Check that epoll_ctl returns zero with different combinations of events on
success.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Xie Ziyao <ziyaoxie@outlook.com>
---
v1->v2:
1. Use IS_BIT_SET() macro to check whether the n-th bit of val is set.

 runtest/syscalls                              |  1 +
 .../kernel/syscalls/epoll_ctl/.gitignore      |  5 +-
 .../kernel/syscalls/epoll_ctl/epoll_ctl03.c   | 78 +++++++++++++++++++
 3 files changed, 82 insertions(+), 2 deletions(-)
 create mode 100644 testcases/kernel/syscalls/epoll_ctl/epoll_ctl03.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 6762a234c..f6fe140b2 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -161,6 +161,7 @@ epoll_create1_02 epoll_create1_02
 epoll01 epoll-ltp
 epoll_ctl01 epoll_ctl01
 epoll_ctl02 epoll_ctl02
+epoll_ctl03 epoll_ctl03
 epoll_wait01 epoll_wait01
 epoll_wait02 epoll_wait02
 epoll_wait03 epoll_wait03
diff --git a/testcases/kernel/syscalls/epoll_ctl/.gitignore b/testcases/kernel/syscalls/epoll_ctl/.gitignore
index 634470a06..2b50d924c 100644
--- a/testcases/kernel/syscalls/epoll_ctl/.gitignore
+++ b/testcases/kernel/syscalls/epoll_ctl/.gitignore
@@ -1,2 +1,3 @@
-/epoll_ctl01
-/epoll_ctl02
+epoll_ctl01
+epoll_ctl02
+epoll_ctl03
diff --git a/testcases/kernel/syscalls/epoll_ctl/epoll_ctl03.c b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl03.c
new file mode 100644
index 000000000..df065c7c6
--- /dev/null
+++ b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl03.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Linux Test Project, 2021
+ * Author: Xie Ziyao <ziyaoxie@outlook.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Check that epoll_ctl returns zero with different combinations of events on
+ * success.
+ */
+
+#include <poll.h>
+#include <sys/epoll.h>
+
+#include "tst_test.h"
+#include "tst_bitmap.h"
+
+#define NUM_EPOLL_EVENTS 8
+#define WIDTH_EPOLL_EVENTS 256
+
+static int epfd, fds[2];
+static struct epoll_event events = {.events = EPOLLIN};
+
+static unsigned int events_type[NUM_EPOLL_EVENTS] = {
+		EPOLLIN, EPOLLOUT, EPOLLPRI, EPOLLERR,
+		EPOLLHUP, EPOLLET, EPOLLONESHOT, EPOLLRDHUP
+};
+
+static void run_all(void)
+{
+	unsigned int i, j, events_bitmap;
+
+	for (i = 0; i < WIDTH_EPOLL_EVENTS; i++) {
+		events_bitmap = 0;
+
+		for (j = 0; j < NUM_EPOLL_EVENTS; j++)
+			events_bitmap |= (events_type[j] * IS_BIT_SET(i, j));
+
+		events.events = events_bitmap;
+		TST_EXP_PASS(epoll_ctl(epfd, EPOLL_CTL_MOD, fds[0], &events),
+			     "epoll_ctl(..., EPOLL_CTL_MOD, ...) with events.events=%x",
+			     events.events);
+	}
+}
+
+static void setup(void)
+{
+	epfd = epoll_create(1);
+	if (epfd == -1)
+		tst_brk(TBROK | TERRNO, "fail to create epoll instance");
+
+	SAFE_PIPE(fds);
+	events.data.fd = fds[0];
+
+	if (epoll_ctl(epfd, EPOLL_CTL_ADD, fds[0], &events))
+		tst_brk(TBROK | TERRNO, "epoll_clt(..., EPOLL_CTL_ADD, ...)");
+}
+
+static void cleanup(void)
+{
+	if (epfd)
+		SAFE_CLOSE(epfd);
+
+	if (fds[0])
+		SAFE_CLOSE(fds[0]);
+
+	if (fds[1])
+		SAFE_CLOSE(fds[1]);
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = run_all,
+	.min_kver = "2.6.17",
+};
--
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
