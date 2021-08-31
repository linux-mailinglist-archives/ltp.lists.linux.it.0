Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C1F3FC1B1
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 05:51:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5BBFB3C9B65
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 05:51:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8A8323C2ABC
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 05:51:15 +0200 (CEST)
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-os2jpn01olkn0158.outbound.protection.outlook.com [104.47.92.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6BC816005F9
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 05:51:14 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6WKd1DgsV1WzYXFZ+qkpzrF83v9PgzLzGLFwuLjn/1axYB3ChsPv4QdxGBraxBlaYQWKzJhYHg47eXXo8PYWjhH2NBhXmRxXAJhemidPNUsjKqVoM4bgH5Y+A7SnUCvM8KXHv4HKVoOdVquMils00vlFqtr0c51hF2o/aFbgjQwlnbqiGZUN4psQKYG86faclBCuiy7R20Ciz7/wjszXKb9Iqv4e3aJhVbcDocD8funXNO9saY0kQ2XTByGCqPVrC43jInxQbFHvX9+NVh6Il+PQmOOu5e7ENijRBflFj5ULwX/rRdfb9gxsCuRkbnlZGNYqkI+kJ3kGmZ5Jylslw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBrGgV1ebVdMkHOj4ikYOzq6tQ6ZC1yZOVxIEm9+R68=;
 b=jYowtG+LtcCCNUVNaPvoIwAtdiJnQLa5palbktv4jrXDHy6fBmM/0ndjzMLYPxrIAsWm7Z4zQERNEfwdb3+j4wtiCEijCU7scGIXwADzhmi/xb0mSXyko2jEC1kmUrLE8pHYQJZQpJ5V1m96+bdQOo64WdOR5EQs3V5YtMqe1+Dff2EJQLfAh0yzzYieYUZRdQnjIDfVAqLM/stnUkn25JRV/s6CEGSrPePkNS3I3FPt5bMyofIRxnakORtxF88gVqo+JTB1KocmCY384owu07QSw/tQd9FJFjdZUoLP6NyQvx14Utf9vWvfqw69Ro37dIR0L6OsXaU458F4PuqKXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBrGgV1ebVdMkHOj4ikYOzq6tQ6ZC1yZOVxIEm9+R68=;
 b=EkWfiXackw1S3A18nmO8rai/rIfYXNgx/1ipsXdqjlVyQDkgVPX1D8BUOtxeI4l0xky/yoPVKuk8iB67HjCkznYDNNOJRZCc+YvFWCc5uiGAfpY5jSruD1U6ZSDPkkXtLI2Q9BP0iC3LnzvCpa2kjZXAXvZsUAockpm4qtbWiu5Xx9PLa3wTmBu+OJv6rID6cKt4woSUvcw1+6LCnwmdux6FEvpZybVwD7SWjwUtERMlNEgyzmU47KaV8LAbEhOEf/zdYst22LqwsPW1VGYZCYtPNkZoeBoaY5gNla8wvSs6hxrx7F/D1IU1U8msdj1hfmD9xMttcsKtFfIcPMZP8g==
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:e9::13)
 by OSYP286MB0056.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:83::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Tue, 31 Aug
 2021 03:51:10 +0000
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fc56:5558:8b5e:4209]) by OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fc56:5558:8b5e:4209%5]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 03:51:10 +0000
From: Xie Ziyao <ziyaoxie@outlook.com>
To: ltp@lists.linux.it
Date: Tue, 31 Aug 2021 11:51:02 +0800
Message-ID: <OSZP286MB0871620CFE5F9AB0D6F33BD9CCCC9@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
X-TMN: [NHlkoH5J0POhfR/rGHiivg4zeb0DKVgx]
X-ClientProxiedBy: HK0PR03CA0107.apcprd03.prod.outlook.com
 (2603:1096:203:b0::23) To OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:e9::13)
X-Microsoft-Original-Message-ID: <20210831035102.93379-1-ziyaoxie@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (14.127.251.239) by
 HK0PR03CA0107.apcprd03.prod.outlook.com (2603:1096:203:b0::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Tue, 31 Aug 2021 03:51:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dac55c79-cf18-4834-7a03-08d96c32920c
X-MS-TrafficTypeDiagnostic: OSYP286MB0056:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OukBSRbhtJMSF+Ro4AS7TM41hYpXBqUnghjy7pVo+w3O8OkVcu4csrhRdcOQHjNdtKBJuX1LHYz98jhyBEVD/aFFXWFudpRivGpCOad6N7QJshaiInL4j23KeXdVLMUaCJ1DZ6ETjFm0VTRWqGPlKKFCXcqGwFuEpENaTuS7JpJQKL2a9jLsOx8X+a3cqzS0B2kurbFqQjWWPR8j6ePPd6xqs3i9+lcybX7iXgSBo20A6vuUjZ6B4aoEOfPFIZv2FOZr5bgoIRu7fRWa4NkrdUzkMBxHbNaYBMgZoGq8dYF1biGe2v2d1apZULuHUAuo2qwGYK4iMsjgfWAH4J4jgZ6edxzOavRg7plZilaEGZivr81CrERHs7eLQP/bIm3B8mnBV4R80Ss74MYPpfKRzOHWAv5+u32sk8bx6qvvG04hoWgx3GG/4GhJzxj91aGm
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 36n1tg2GMFjeicrYG1cZBt4oeVU3+6Sj0c3r2XD4peL2wYsyI+tIZiW+Uu3zcnS1jPMHjYh0RKD7JN0SmyoySsTuSTm4B2Xo85bCcx2SjVyjLAbGuuT38LMBzlPhzi2tMXtuQ3PolHMIwJ59ZNKZtQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dac55c79-cf18-4834-7a03-08d96c32920c
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 03:51:10.8253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYP286MB0056
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MSGID_FROM_MTA_HEADER,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2] epoll_creat01: Replace TST_PASS with TST_RET
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

In TST_EXP_FD(), the value of TST_RET is the returned fd, not TST_PASS.

Fixes: 081f940b2df00 ("epoll_create: Add test for epoll_create01")
Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Xie Ziyao <ziyaoxie@outlook.com>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/epoll_create/epoll_create01.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/epoll_create/epoll_create01.c b/testcases/kernel/syscalls/epoll_create/epoll_create01.c
index 54fd0810d..3ef5b5cac 100644
--- a/testcases/kernel/syscalls/epoll_create/epoll_create01.c
+++ b/testcases/kernel/syscalls/epoll_create/epoll_create01.c
@@ -28,7 +28,7 @@ static void run(unsigned int n)

 	if (!TST_PASS)
 		return;
-	SAFE_CLOSE(TST_PASS);
+	SAFE_CLOSE(TST_RET);
 }

 static struct tst_test test = {
--
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
