Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B22F5248E21
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Aug 2020 20:48:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 639993C587A
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Aug 2020 20:48:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 51DED3C2FDA
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 20:48:24 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2126.outbound.protection.outlook.com [40.107.20.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 90BC71000537
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 20:48:24 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVc2zE0pIBKc/U1e0LC2w1lMhk5SW9z2fEBJSWwS4YjWwI/ry+XzJwvULaNAXOxwEgFzFLlwikVtM1VK/RSm8Od531zgNR8KkoiPToPdCHuKVpltT6UIX8mEVC1bdAcjTP+pSnXY8grrF41Ru5KywuxMI0svyXxLVv+MyyDDp+hyOPM2Fahq0euRoeRXdVet9OkRuN8Wtak893c/BCVWQ1Y63lo57gD3BYat770Zu8vJPgYdKaV1Og5ApaDe8vUFor5BWpSTuUqiGGy2wE0ek5M2dtBIah81pW1T/xQearwweonDhxWu3byaA5dIw/MWJTe7jil+evbj96cXONZPbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3c+p+uqMmG7yiPS7sMUJWhcrEZdALY4UEOsZqF3iaI=;
 b=ds1kqRUhUqiqjUuTRBfHdgjEa3Ku99rWscPhALxT0a8rE+pNAE34dBKmRfaRacSLYzUtoGUvQ58AmYqF52mtqkudn8HyA16vTVkHeBk/T0ph3NRB+7pM9IYU4+vPNoGurxsr56OY5o6I0LGW95NSu0CaP6grmL0du5LRhO2Zds84rgJ9RKl70ONwNeB10qG3MCWSnmftSWVoeWChXHb9ScNnJ54vWX1iCVofOPhwXW7GVkff+UJOU+h0cE2EyUMTADqvMTg0z6+rliOFqxR55M33Y+Ww9PMk+ZYcjPrvayJTwg5b5POMWlazPl+jfuLpZREhpbJAaXI1z+NLDKMmLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3c+p+uqMmG7yiPS7sMUJWhcrEZdALY4UEOsZqF3iaI=;
 b=k18RbeALXbXuU+owAbt4oYDjpDaPBBoPvDqc1KHIQc+XlYNvfO+QOwfA2bvIMmD7m84P2AuF6JgJVlGTmnxhRBbQImj25S4m7/LmtMGM63XDy0QEad5/88M6JNt6IApqwj7orEURaa5fR9VfI9LgyeJ17ZnaBZMt6TOanyBgd64=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB5246.eurprd03.prod.outlook.com (2603:10a6:802:a1::22)
 by VE1PR03MB5710.eurprd03.prod.outlook.com (2603:10a6:803:123::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Tue, 18 Aug
 2020 18:48:23 +0000
Received: from VE1PR03MB5246.eurprd03.prod.outlook.com
 ([fe80::3568:5b4f:ab6b:e362]) by VE1PR03MB5246.eurprd03.prod.outlook.com
 ([fe80::3568:5b4f:ab6b:e362%6]) with mapi id 15.20.3261.026; Tue, 18 Aug 2020
 18:48:23 +0000
From: Filip Bozuta <Filip.Bozuta@syrmia.com>
To: ltp@lists.linux.it
Date: Tue, 18 Aug 2020 20:48:09 +0200
Message-Id: <20200818184809.45961-1-Filip.Bozuta@syrmia.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: GV0P278CA0009.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:26::19) To VE1PR03MB5246.eurprd03.prod.outlook.com
 (2603:10a6:802:a1::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (147.91.217.240) by
 GV0P278CA0009.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:26::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Tue, 18 Aug 2020 18:48:22 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [147.91.217.240]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df3ba2a0-7ccd-4e71-ba44-08d843a74877
X-MS-TrafficTypeDiagnostic: VE1PR03MB5710:
X-Microsoft-Antispam-PRVS: <VE1PR03MB5710F276AAD03A61EB8E728DEB5C0@VE1PR03MB5710.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rro3brbkq+WHD8pTARr1Gxar6kBTI1IJae35LX+8j2PuLCNUG38pwJEB5GCwzXLXvzxwSyumPQcvewCrPHmQtGRVz+cR7nrdPyZ5HCdnz3PdN3+4bWm5BywLqpIWN50Fe1wVF4kRkHMxfblQklfEFhigQlKBly6OxCbJhPUHMsAWG1NvfsoB2jP2netfwy+Ys+1DmWsmCqqvMfpoYMzYj4KaN2K1CaUkeA8d+Xd8KC9QtFidVHEwPBKUeogyrecKg8/aLXRfV0soVBCo3W6km2Z3g7AtPRwGQ/PaRRaiSUelh9ZIQhCY90JVkEwkJaICVNQu4ZraD6jENIoHy4ewXdNXtXY4jtqqIOIfsjAdznR9/kyIl3AHIEi6FzAPLgKW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB5246.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(39830400003)(366004)(376002)(346002)(6512007)(1076003)(16526019)(2616005)(956004)(6486002)(8936002)(26005)(8676002)(6666004)(186003)(4326008)(52116002)(86362001)(6506007)(316002)(2906002)(5660300002)(66556008)(66476007)(36756003)(478600001)(69590400007)(66946007)(83380400001)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: DWVbpRe4ewprLfolDb8vk3xpVzkR10ilkPNxkzuALaABHkTAenmRE2F0Qh9cMxq7MLJ7iCvSSQsW4I036brHvC0s+GA8DnwN/PFGxjOCmAntbkvBis/adpUqRGNrhe0Otl2BDmyVBbWuIwWLPMX7CYSMnd3j+HlL7wHbsxXkmLm1Lmx7J2xrfR4uDMPIx7FvbTtUZ0Y8LkZPZiBGWM07dZyOa2bx0nwgG3/Vmq4w5f4NmqC669I2tcGT+PDh/gW3WuEAls0YQDVlCxFjm9PNQqGFoop7trRS0X3HS9Ci9SEWdgMRzWTclDTQ7gv0SGaAY2FI48iAK+V+gfP/+n8bbFOoyR2xSqGr53xN6qoGQH1xMDr2PGoloN6/3+VxX5MBICcuPFOJLe2DtLgqCkZ4rFimitNSIJKl6+FfkR5Nqei4J1QKI81EM/QttA4k5UBJPeP/uAanv8eAC5IRfFvUYVTFJRUJzzrSZ93Bq1VhzAHq9UX8BBey+SYUVIYEZ4TYHaHX+5nvWkhIlJ/81/FQ5VcuBZMgNRBslWwlpZNwDPW0Xuf7FG3yTHcSo75SSlunr4LpJkhklVZ/9hrRnflUvTG198fcZEucE/xPPex2l7LU5K/Ndl0m2e8soGoaZ6lR3Fn02T5/zWBrqSKK58MxSw==
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df3ba2a0-7ccd-4e71-ba44-08d843a74877
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB5246.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 18:48:22.9179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4XTcP0Jlv0GJ4OmdaAicLSpsNuwuX3N7qqmBKBpXPjUkRayy335wjTmIV1BOCegcGtY+SGBe4SOwSAbPsojRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5710
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] lib/tst_clocks.c: fix 'tst_clock_gettime()' and
 'tst_clock_settime()'
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
Cc: laurent@vivier.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The type of 'struct tst_ts' has to be kept between function calls
because a function can be called with the wrong timespec type.
For that reason, a 'static' identifier is added for 'tts'
in 'tst_clock_gettime()' and 'tst_clock_settime()' as to make sure
the right timespec type is passed in 'clock_gettime()' and
'clock_settime()'.

Signed-off-by: Filip Bozuta <Filip.Bozuta@syrmia.com>
---
 lib/tst_clocks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
index 7b465b1f6..cdcb9fc4f 100644
--- a/lib/tst_clocks.c
+++ b/lib/tst_clocks.c
@@ -57,7 +57,7 @@ int tst_clock_getres(clockid_t clk_id, struct timespec *res)
 
 int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
 {
-	struct tst_ts tts = { 0, };
+	static struct tst_ts tts = { 0, };
 	static mysyscall func;
 	int ret;
 
@@ -87,7 +87,7 @@ int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
 
 int tst_clock_settime(clockid_t clk_id, struct timespec *ts)
 {
-	struct tst_ts tts = { 0, };
+	static struct tst_ts tts = { 0, };
 	static mysyscall func;
 
 #if (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
