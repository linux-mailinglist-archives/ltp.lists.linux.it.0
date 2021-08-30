Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F35083FB46C
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 13:17:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A70CD3C2C6B
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 13:17:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9454B3C8DA7
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 13:16:53 +0200 (CEST)
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-os2jpn01olkn0175.outbound.protection.outlook.com [104.47.92.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E46EA1400437
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 13:16:52 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0xjT1VGJpH0RctYt+/GUxteG2XDI+Vujuqx1O5hsAsgp0UX22BZjgMIcOLZb2NaB8bBxRv3//+zlBI2UArAgzOU9LGpEolLGZfI22R1bW5TRWutNkomnpss2qXcGIOJUTNAJM7tmqOt42ThnDU4Tzl52+mar6wckZZQakihH/Qbuy4O3COGboQd2LN+GhvVdHFS9E3xOtMHGqoQTikRtx65DwP5gGjB0BxubeajWOjST52bjSjCn9OAjFztBZC81orXD3rJergasp5BV5nk+T0UQ7DPm5siBOfrYvCGm4kOaM5+a/sXD3afZ1owpdNuKyeuZosaYq8IUsKrrbRtAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnuQRKsI/p3UC015Ecd+VLJECUZD9zwSpQ1HPtpOCS4=;
 b=nHnHx+6gra0mN3QmMtsTyKDeSs1FbCF7QMIGKB0KRkPAA+MvqDIILpfNeipcqzr+2gnz/ihiGy5fSKzE9GSs9GmzTBhrnT0GtRDxFdk0eGs81jmGfadAtFPHkDI4Fs5yIyof23m9MQwlSWQu2cfe7rfnoQP8pFqkRMk3G+iI0iczcTTA3MHJf/DAmo/uKOWyyHDhTOlunw4lB/Zi96m1iQ1+i+17XkYgU9K3nQIBqT/w7PySC3InuktI/fDWEy3j5ZZmSz2d1miJML/pkihKWiF6I2jVdB7VWT3zYVA4S/aXLydf74V2H7zhPp4aTE4c3ehyvAvTpJevtNddpu/YUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnuQRKsI/p3UC015Ecd+VLJECUZD9zwSpQ1HPtpOCS4=;
 b=HeE4jY42CprCqCQzWc+fPfMhDfjM4nteRT+zf0/rOWcYzvs5St3OT0bKMWOx4B1d4ZXbX18NVxYzpQt90k8YF64YIdRVMj+NK9YXtV5n1G8HESJKXRfZOW0pTnJ+FUJf/DQPFg/sX4bZIAo1ZWTMuWNWlrALDuFCSwK69QlpfAlcxcGtPQSCy3/PnON91t1Nax/1Usc42vekpR+TXdLHBgL1NTHWmpYyljO9PHReSiRqS3UMgx5h8IC3ootcn7X5WsdVnSbWWzIMwX/ZiYPPt6ba8ayQosnuti3XrUbmSwPHiydNCqC1oYD78l5epeeYYq/np+gg8sD/Xi+AYhUChw==
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:e9::13)
 by OSZP286MB0888.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:eb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Mon, 30 Aug
 2021 11:16:48 +0000
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fc56:5558:8b5e:4209]) by OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fc56:5558:8b5e:4209%5]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 11:16:48 +0000
From: Xie Ziyao <ziyaoxie@outlook.com>
To: ltp@lists.linux.it
Date: Mon, 30 Aug 2021 19:16:38 +0800
Message-ID: <OSZP286MB0871D15C101A02A134430703CCCB9@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830111638.66371-1-ziyaoxie@outlook.com>
References: <20210830111638.66371-1-ziyaoxie@outlook.com>
X-TMN: [v0RO/sfi8qmLAqKcRlUHs/cPej8hDPns]
X-ClientProxiedBy: HK2PR04CA0078.apcprd04.prod.outlook.com
 (2603:1096:202:15::22) To OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:e9::13)
X-Microsoft-Original-Message-ID: <20210830111638.66371-4-ziyaoxie@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (14.127.251.239) by
 HK2PR04CA0078.apcprd04.prod.outlook.com (2603:1096:202:15::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 11:16:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f77f793-d9bb-4a53-7404-08d96ba7a89c
X-MS-TrafficTypeDiagnostic: OSZP286MB0888:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dYM40MrJjvBcmAj25ew3Cs9JKUdVYqls7W+QpySwtQlkiJIyEiUCaCr6Gxg8lQa44Idi+KYfx12cj+jDipvo6CCBiS9hD+jSVg8I3waMFt1Tg1rM93mQfiroy8bHQr4K+98GdrK3deOhF+9RXRuN5OH8cMRuxekQCucV6axhgEDZil92x5gBnW9xBsBiOWBUL9afvdZLwzB/14vukuLhiEUJegQEnQTHfQijhTQbDmsiG35Slpb+TBk2Qccd3evUbz1a55zlh6MqAwX62mJ/PEO0lEhXXefq4sbUtrVEMHNOU9XJIw4JLlyTL7ZhSALtdGElq6CHPDhwhx35edxebxXk7xN7xyqRdBau/3WZ1fVfMBz47koSw7H+Fwi8Xzd2xAvONW4y4LXkNPpwFvm7MH4kFOx0qHxfD9pHpgPp4e59ZSZyCTZhOVoIM5yK2Del
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aghGL1cbmXGuJXB15pazn4iv122/77RNVAJAxb81JHyintMlmD1kKH0/fRYCu8apu1aMBgyu2EqOuGOoj423lW9tIbq9g/l8o+0V9m8WaWIR3n8SuaRO8ckdf0ottB1iFi/ivyJEexh3D8whKWu0rQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f77f793-d9bb-4a53-7404-08d96ba7a89c
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 11:16:48.3725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB0888
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MSGID_FROM_MTA_HEADER,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] epoll_ctl02: Add test for fd not supporting epoll
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

Verify that epoll_ctl() fails with EPERM if fd does not support epoll.
This error can occur if fd refers to, for example, a regular file or a
directory.

Signed-off-by: Xie Ziyao <ziyaoxie@outlook.com>
---
 testcases/kernel/syscalls/epoll_ctl/epoll_ctl02.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/epoll_ctl/epoll_ctl02.c b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl02.c
index 4872fcacb..fe16ad1cb 100644
--- a/testcases/kernel/syscalls/epoll_ctl/epoll_ctl02.c
+++ b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl02.c
@@ -7,9 +7,10 @@
 /*\
  * [Description]
  *
- * Verify that epoll_cnt() fails with:
+ * Verify that epoll_ctl() fails with:
  *
  * - EBADF if epfd is an invalid fd.
+ * - EPERM if fd does not support epoll.
  * - EBADF if fd is an invalid fd.
  * - EINVAL if op is not supported.
  * - EINVAL if fd is the same as epfd.
@@ -25,7 +26,7 @@
 #include "tst_test.h"

 static int epfd;
-static int fd[2];
+static int fd[2], unsupported_fd;
 static int inv = -1;

 static struct epoll_event events[2] = {
@@ -42,6 +43,7 @@ static struct testcase {
 	const char *desc;
 } tc[] = {
 	{&inv, EPOLL_CTL_ADD, &fd[1], &events[1], EBADF, "epfd is an invalid fd"},
+	{&epfd, EPOLL_CTL_ADD, &unsupported_fd, &events[1], EPERM, "fd does not support epoll"},
 	{&epfd, EPOLL_CTL_ADD, &inv, &events[1], EBADF, "fd is an invalid fd"},
 	{&epfd, -1, &fd[1], &events[1], EINVAL, "op is not supported"},
 	{&epfd, EPOLL_CTL_ADD, &epfd, &events[1], EINVAL, "fd is the same as epfd"},
@@ -53,6 +55,8 @@ static struct testcase {

 static void setup(void)
 {
+	unsupported_fd = SAFE_OPEN(".", O_RDONLY|O_DIRECTORY, 0);
+
 	epfd = epoll_create(2);
 	if (epfd == -1)
 		tst_brk(TBROK | TERRNO, "fail to create epoll instance");
--
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
