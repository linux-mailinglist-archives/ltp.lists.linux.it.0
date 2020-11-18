Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD492B7B74
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 11:37:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4FC8B3C30B2
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 11:37:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 07C593C25D2
 for <ltp@lists.linux.it>; Wed, 18 Nov 2020 11:37:21 +0100 (CET)
Received: from de-smtp-delivery-52.mimecast.com
 (de-smtp-delivery-52.mimecast.com [62.140.7.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 799D01000DBA
 for <ltp@lists.linux.it>; Wed, 18 Nov 2020 11:37:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1605695840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=flGG13tGE9/1Rrjy7gSLTtmyKbm74GcOdObT7hy6d1M=;
 b=Ahc7HWem81j/PWsJ/dTG8bET77560qPV0A3QrviU1NwjSfUyV8O8PXFrlHdnABzTRmh5cA
 WrPDBQ42QL+oodnuhgxLj+NHGIZBx/Orl+uyv7cIMdPnavhZvjx0u31PJBaK6sCWGb6CDx
 gtMQxOY3yMikJ4nXVA6Zdj4GVx2nvpk=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-uGprRb5VN1ePYjjfyztWxQ-1; Wed, 18 Nov 2020 11:37:19 +0100
X-MC-Unique: uGprRb5VN1ePYjjfyztWxQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmzz2fl/jT3dC51xWP2nAlBLSmu3p3Cv/c2jWgOgOhL12OJ8TS0VnyfuQ4+5V4bhJRLIr+4yGpV4JpvqgWsgjPL59DMPy4sFN9nFJf/jY/9SkvDDgEufSD/WUCBgvC04nsrW8NNy8TGX2uuHMQNvMM19sGmrmaEvxZp84XWtcdceOXdigGN2rKXqwQDs3fMb+j8TpIvWLeOB8l6yohH3QceIzr3nTdEgUO4tqJQEg4RfrP8ZKbarkibu5i+AWqUSDUABIX3IcDvBo1se2VBxLy/NScfLcWcrHDNGK3WgWvb1GXKZ2D9KqCoEq7IGYP4gFXGgFb4J1UxiPpqqepIyTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5zZkNqFE56h6jzvwoUJYZK6Gif8e2KK7bXYvYE181M=;
 b=IngEPWqS4/9hGaXO8fSLXvY5PrGMrbRHHxLac/OTgY4nvHdMmKWRVbBiPqPsTD0heVMgNJHClv0aT+SPIACxph27A0rg/FV+hkd0qMwFL2cAAFu6Lh7ZVyy4hWeHnX+JpjyUZ9L46BcDZHExqLJQuRXMDTUqQdGcyPV9GJSVLonAyV8kcJp2+mbKugJ2x5B7+4VvrrOggJAUhZC4Tuk/DyrG/JGKeGlokfg4Ygq7ozmrrg2V/2nKWOX2Gew1qafroiK7lGx8tsPw5NClsKSy5qhns/YI21V44JTUNWSwJ7wHotKGY/JZb/TZdYk6IcgdFU12T1UF53WOUKesBN7+BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB6370.eurprd04.prod.outlook.com (2603:10a6:208:16a::25)
 by AM8PR04MB7922.eurprd04.prod.outlook.com (2603:10a6:20b:249::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Wed, 18 Nov
 2020 10:37:18 +0000
Received: from AM0PR04MB6370.eurprd04.prod.outlook.com
 ([fe80::1599:fda8:4fff:1155]) by AM0PR04MB6370.eurprd04.prod.outlook.com
 ([fe80::1599:fda8:4fff:1155%6]) with mapi id 15.20.3589.021; Wed, 18 Nov 2020
 10:37:18 +0000
To: ltp@lists.linux.it
Date: Wed, 18 Nov 2020 11:37:05 +0100
Message-ID: <20201118103705.19876-1-pcervinka@suse.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [91.219.240.2]
X-ClientProxiedBy: VI1PR0501CA0005.eurprd05.prod.outlook.com
 (2603:10a6:800:92::15) To AM0PR04MB6370.eurprd04.prod.outlook.com
 (2603:10a6:208:16a::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from headcleaner.suse.cz (91.219.240.2) by
 VI1PR0501CA0005.eurprd05.prod.outlook.com (2603:10a6:800:92::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 10:37:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5209197a-e291-46ea-533d-08d88badec1f
X-MS-TrafficTypeDiagnostic: AM8PR04MB7922:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8PR04MB792293A2473481C76956D54EDAE10@AM8PR04MB7922.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 84Jp/R1eNoA2d2/AWVrnPRPP7YNm7m6FkJj7/3uCcx+PQZaPcO1zxKqHhmApnHMNwZ2IHhmFj5d2PBmhHTV9BHfDk7yQvk62HIH8lUZfd3X3o7FDz5nxepsvBy22gAzj368Fn+AIBbJvy5t2qq0p+CmIvKfPTTt5BF8paaY2sZrX1PaxARh3ay9hmHWUvcV7AjbR1PT1//dF3iPBRARk6U/whqzUHzQh+nGkgd0KINfGmWo9NgBZxu8TI5pkYovaRHJCFAXfXcY8EoCgZYaS9Yde8l7O4ZBFAt+/Mh4feCx+XCjTVlGtIRb+8nzr/ybO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB6370.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(366004)(376002)(346002)(396003)(5660300002)(6512007)(52116002)(8676002)(6916009)(83380400001)(66946007)(66476007)(66556008)(6506007)(16526019)(186003)(26005)(478600001)(36756003)(8936002)(86362001)(6486002)(4326008)(107886003)(2906002)(1076003)(316002)(956004)(6666004)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: vYsNxPo0sQBIVkSxZQGF9m6v5neLTs5AG+sD/pw2BE0012unZtlYnYbSJTBvGlSaLkzinyzRoFxGoTyMp6IrqFdjBdiScZHB5B6jQOYeMo6qik/Dk1x7JIQ3j7Yuj98k+HuyjWBvksaBAVlH63NxJ0K4yFW4Ij4FqH148+0OKoUY13swCUj1xOl2xP8l58hHwBCceteZGafhcA4E1DRQZ33OELiaThi4AB0BANF7QMSwYxrQIBDEesv/CpPIBeRtVjweb3eG2J+1Qe3s9vKnQiAh5EeBAkv1ZJKpWBiiWXq+5rB0txPWj1q31y6ZgunyESPeaNjD6T1w7MWX8hOUi7/Md+/2amEAabbtIgNJNgZaepVlvmlMCFuQwQcXchaBXx+REhq1mqa2jxYxF8rVV20Aho8MvnW/uMF5GBAT8AMIkZhZVp373g7LMFk17V+n3KvbX4uMDMKy6IzpfON8Xe2XHBNYVqmZR11ghr/L1co7iDqtUrHqbHn+dKw2BvGEmTyPA6J4PTKf6K3cFKKay20IhM8iWdNDHrnemVB1pRldRXGgEOfAJJxn1zXlEVrdQXXHQ/uvgpY3Fn7VF6nYnJGF87lc/YVr1AAN0SHk3zj8efkbbN9EDylSeB45twMzWg8H3dRYPGzUdFNAUqHcVA==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5209197a-e291-46ea-533d-08d88badec1f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6370.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 10:37:18.1113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZsOzOhkWFhs/lrvt+7uSiT6eMn/AUoydL+PiSA2KwFtmjXY1+M0XRSl7iHGOR28yGCk+d9w62TsLK5eTNZS3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7922
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v1] Fix SPDX License GPL-2.0-or-later identifier
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
From: Petr Cervinka via ltp <ltp@lists.linux.it>
Reply-To: Petr Cervinka <pcervinka@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Petr Cervinka <pcervinka@suse.com>
---
 testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c | 2 +-
 testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget05.c | 2 +-
 testcases/kernel/syscalls/pipe2/pipe2_01.c             | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c
index 226985d5..43bc732f 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0-or-late
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) International Business Machines  Corp., 2004
  * Copyright (c) Linux Test Project, 2004-2017
diff --git a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget05.c b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget05.c
index 506d1df0..1f88166d 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget05.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget05.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0-or-late
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) International Business Machines  Corp., 2004
  * Copyright (c) Linux Test Project, 2004-2017
diff --git a/testcases/kernel/syscalls/pipe2/pipe2_01.c b/testcases/kernel/syscalls/pipe2/pipe2_01.c
index efb82af4..6597162e 100644
--- a/testcases/kernel/syscalls/pipe2/pipe2_01.c
+++ b/testcases/kernel/syscalls/pipe2/pipe2_01.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0-or-late
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) Ulrich Drepper <drepper@redhat.com>
  * Copyright (c) International Business Machines  Corp., 2009
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
