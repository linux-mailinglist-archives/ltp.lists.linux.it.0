Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CFF3F9899
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 13:57:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1032B3C2DDB
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 13:57:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 900333C29EF
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 13:57:28 +0200 (CEST)
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-ty1jpn01olkn0183.outbound.protection.outlook.com [104.47.93.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6302E600F60
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 13:57:27 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwlBi11+daDySWvoj+p4h3aaC/b9ASvsQHCvnOFj/dNxzaBUqqGntnz6IP1HgqBmfhk4qdQnbl5Ts83GPx0DWF80TPDTjSjn7B5bckW0HbXlrdPYW0kSm10WG9bjNY9Is+PftikM28RWJ+WAS99ZoAYd6aPofxBYJjoIjl9Cyl0mdFP4twEIISHQcTohE2h3t+D+eyazmLweICf55sFHZm2FYe/zb2Ca8DAvc3Q3CCQhciWLN4rLyEmQvJ4QyVHizXzWUrf+eVDI3HPgYjAlPxeWWH7MZIVAH6yZg8Gan/B0idq3jYpI0kkVXvrv25C2VMkCSUx7s6TIzA1JwQJGZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgWz+f2AYz2s00zTsRz59KDcIGH+rUTkZH935A1J3gw=;
 b=KuCyPl5t739XLreUV+IfDZmeeh3I7H7gJekhdsff0EIThDg4L+aHChQLilnEfzWROnHdBykEwhnl3K6qpOFqVjCimtahSQQHMiSubOoygHgirk1+WCjdZMKkULS9k07B/nCyWl1zpuh++4DrB9GCs7WE+yCez5kjXF7ZLAUuyOlrvmXlQOMmXX2PTNkIyEXsz5MM+8noISSX76FZ3wLDh9HwW9tepApbylqKVMK377Y2TOniUv8mA2Rt0yW2rqG6DBZZJea8g2emfX1/uBhvdaR5d4pg/Hrlm0Z/Za1DuyyDWuWarv6769hi6TI49V6ayQvvjDbQGUj5pCNsUAUGjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgWz+f2AYz2s00zTsRz59KDcIGH+rUTkZH935A1J3gw=;
 b=Bdfy+QRYn2JvcqR4Ugu4fQ/n6u9T34Vggp7kPwdiwYtyaid/JTyOHFUqYJrj83CwrSkauu6TPgSgblREmHWztpWSgCN60TAeGLPo5h2JgYU8m7k+SLP+nd3ycMLjT+H4yuTXEW6tYjCyhdA2d31UUAjSXfTCFrPgf6KPTXVT23HfZ7mdnpp7Z9CMxSFj3rINosQNkwxfuzoZLHYlAGYtANemQM8gDkQxb7J0G7Vq8rFH6Vwbpc9gRbmG41pwJPat/zFLDwSDCqTCul+r1FtUjSptE3UOmVmtQZ+VaV3/s4lvgF6yWve9IMUrOeUM8+Qup1SVFxbgCvFWcClKh5957A==
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:e9::13)
 by OS0P286MB0356.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Fri, 27 Aug
 2021 11:57:23 +0000
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fc56:5558:8b5e:4209]) by OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fc56:5558:8b5e:4209%5]) with mapi id 15.20.4457.021; Fri, 27 Aug 2021
 11:57:23 +0000
From: Xie Ziyao <ziyaoxie@outlook.com>
To: ltp@lists.linux.it
Date: Fri, 27 Aug 2021 11:57:15 +0000
Message-ID: <OSZP286MB087168E8DE5E0E49C9F90E27CCC89@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
X-TMN: [VQ2zOKNLbYoNGRKgAtypUTsC6i1273Pj]
X-ClientProxiedBy: HK0PR03CA0106.apcprd03.prod.outlook.com
 (2603:1096:203:b0::22) To OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:e9::13)
X-Microsoft-Original-Message-ID: <20210827115715.159302-1-ziyaoxie@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (14.127.249.146) by
 HK0PR03CA0106.apcprd03.prod.outlook.com (2603:1096:203:b0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 11:57:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cefdc30b-c42c-4237-9c05-08d96951d4ce
X-MS-TrafficTypeDiagnostic: OS0P286MB0356:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e+VMy58LdvbdoLYSV9s/OpB57vxVVNVJYuDzcmh5G0OjAGuPRKfwbdntpWdNcpI+U3cbBACU37JXYc/gcx90A41jhj3gXz4N7hRv7mOAIfkPH/91flI1ZBd5yWeblMOhuUYUTGBhSGkor9lVzs6d0zdJyz8kfBa3yoOjRjyyGVe9WLH7NP4+EAhnijVWdmIghkQpZ8qRDyXr/ABdFjrbemE6WHp4ywRUfJ9cEB6VAJqlpVb6btoQALmj2fgKuJLiBP+T5HT9rxI8aNq56exIZkM3YWAcVN4T4pNGACg0GeFeB4jFVU+wUu5awqRyRpWShXSAXOXqffYdqLVcaL8DdL7JU/nNGrbYLWEyvucjAo/0WHyIjtY9N6/4xYd3FRlwoqzbK0NdJ1qgjVDqB6dc0M9zcPWx7CqA1fMWAA+0EYXGpTXhqyY4mPilUy0vDbjc
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LnkxKYYIM4wRMTLUrBKIkHIvJ2mJ5vECP2pimgd89wzALpBaZKoEYA4nN7JfWOs9mt9KvT8RrJ7eKJx3rE9nb0WlzXFTSlM9kNyU9468q6ytDror2h7qmMG0HBJsbi2BrRPjkrXRcgWO0sBNERZkAA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cefdc30b-c42c-4237-9c05-08d96951d4ce
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 11:57:23.5792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0P286MB0356
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MSGID_FROM_MTA_HEADER,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] epoll_creat01: Replace TST_PASS with TST_RET
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
Signed-off-by: Xie Ziyao <ziyaoxie@outlook.com>
---
 testcases/kernel/syscalls/epoll_create/epoll_create01.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/epoll_create/epoll_create01.c b/testcases/kernel/syscalls/epoll_create/epoll_create01.c
index 54fd0810d..29ac3763e 100644
--- a/testcases/kernel/syscalls/epoll_create/epoll_create01.c
+++ b/testcases/kernel/syscalls/epoll_create/epoll_create01.c
@@ -26,9 +26,8 @@ static void run(unsigned int n)
 {
 	TST_EXP_FD(tst_syscall(__NR_epoll_create, tc[n]), "epoll_create(%d)", tc[n]);

-	if (!TST_PASS)
-		return;
-	SAFE_CLOSE(TST_PASS);
+	if (TST_RET)
+		SAFE_CLOSE(TST_RET);
 }

 static struct tst_test test = {
--
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
