Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFA43FB469
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 13:17:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C7BE93C2B78
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 13:16:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5A3203C2AE0
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 13:16:51 +0200 (CEST)
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-os2jpn01olkn0175.outbound.protection.outlook.com [104.47.92.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6CFA31400276
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 13:16:50 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPHrWbXOJNky0TzkiApf/N7zjUxN0U4MybMH1UM+6XF80aVpISN/HNYjY4D78TdSPHBTeybtmOvOLMmNXxX//ILfhVK5LA91y8eyAVQSS5eJ9Q29tdspFXu5dlehcjrq3woAYKJQs0xla39E+tAN6M9NnEGdmA9SwGt34cDmyTIndHMTxcwjh6xGeqbejELgL81PlGXfOSkfntY+NsdRTJyN7tNSUmYUt0DWgiYhUUsHODUw7/JwxKhkAq6OSiBdHtO4D+m2RHaHxZI5cV4pPtnA6WhNNhAj4DOBfccyn2DAln3pfF11izhNZPjBnS/xNL9jTXD8EJDXsaHMNLO42A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/ssGvmfJeNUYF6FjZKGOiAHt23I1ASSGlg1RDYDMqM=;
 b=ocRNSPMZ1xdRvtbA9uAKeM1pqV/LKsvVUudenwmuDcSffX1d18t6PJG9zm1kFH5vkfRSLm+itg3B0DEi0e3FOE+yHWdHw/UcU5XdxYyQaiAFE2BUwt8gml/pW7VgLg5xYuDsZRx5Lwhr/9GHbikXl2Z+7uv/tU4/18u8sjVdqf4CvNeWXO4TwW134cy9djN3znETr4lIe0mcP8VptNKpxL6s9QTd26l0bXCq+1jtLulueWXsG/udNV4Wye62RIR70SouZwHfmBwhs2dGhYjU9Mefol7tDWwQc5CvglSIaPRICeP2BAo6RdDws9kQdIsohiIZMiLI9gmSbHXg5CITGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/ssGvmfJeNUYF6FjZKGOiAHt23I1ASSGlg1RDYDMqM=;
 b=daszR7ISpqyrXj5LHtu8TcH3F83/tYuGuwjQOx8MHTQOD3KLrHt3gwrU3N3Hm+sSAf8ns0iSzOztMp8kf2/HLhObIPgcXBFuuJ4lAAetjhRHoYN/4lHn0QuzGz9Jof2iX9KKnvlWWNitYfmxBv4gt8AIDdyOyUztvCSFjIYGeKfD5/K3YNjdKZ8ItpZn9bDKGNbKRDCyvC8lckUKHNu1gvqg3C8twsCnLuqa7jLDah0FK3GLzaYNmf3wTr53vLJjXdf6XDXQnhsETFw7bGeKlrEWWZUpytymumeV7wzUabjFj/PkuUzGQuvWKlmZ9DO+tKQdnnAxIp49gGPfbOhIlQ==
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:e9::13)
 by OSZP286MB0888.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:eb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Mon, 30 Aug
 2021 11:16:46 +0000
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fc56:5558:8b5e:4209]) by OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fc56:5558:8b5e:4209%5]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 11:16:46 +0000
From: Xie Ziyao <ziyaoxie@outlook.com>
To: ltp@lists.linux.it
Date: Mon, 30 Aug 2021 19:16:35 +0800
Message-ID: <OSZP286MB0871850A0D09CD5926C0C55FCCCB9@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
X-TMN: [WI3oW/IVnc8/gIkmXcn69DTpAnUn41pB]
X-ClientProxiedBy: HK2PR04CA0078.apcprd04.prod.outlook.com
 (2603:1096:202:15::22) To OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:e9::13)
X-Microsoft-Original-Message-ID: <20210830111638.66371-1-ziyaoxie@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (14.127.251.239) by
 HK2PR04CA0078.apcprd04.prod.outlook.com (2603:1096:202:15::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 11:16:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a2102c0-f43e-4518-73c8-08d96ba7a78b
X-MS-TrafficTypeDiagnostic: OSZP286MB0888:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TC446vt9zovAkKxnllV++dCp8xQyVVHWmBIf/9VkqsVyItq6SOQ49qEU4OXcAeVW9oqs3+U2ZGLuQrVo0UUE0qZ2FgmymEMAFQLLqyui8xdNWy4sMkd80szRC60Jr7/4lmDvt8OdCzknYOmWCbIq8r1rR/y5l6vAMqOW1EJP+tH84JQnxgAVte2C5vakpozI6JHQlWABwma6FuK3Ub87OavgXhFgTuLIGjqYGyLL2T0ozA84uKupyHNDIzWQUOLG1ARfwldXJWIiGshY0Ycpe9myp7QTa+/9SXPyDnSALgEwLYmcRx+n/Z6P/Mlgqvo1I741ZogqY/HhBW/Cq7e4xR17xA0nR0Rxr21FTUcJJ2hTh+ch0oLywwFz36z51/xe2OMw4A0+zLOGAXTvNRx9LKHmYOqwL8RLBy9aVRFEksA8WrTfXLxavuAMwvVp0jT6
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vVhbxh5AYR4+Mx6gmJq1xgqOZyh1jffqUIfTD+4wtvpjXNM7vH5azmG4VmvhjPpXWZSvuFXet3wSKcp4C1jm/eq11meYNsei453JHnsKUUJ7FhbR74FagCxsfGIHj9+Ak+pdsRLXRWmcyh7kmoy92g==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2102c0-f43e-4518-73c8-08d96ba7a78b
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 11:16:46.7566 (UTC)
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
Subject: [LTP] [PATCH 0/3] epoll: Add new testcases for epoll_ctl
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

Xie Ziyao (3):
  epoll_ctl: Add test for epoll_ctl04
  epoll_ctl: Add test for epoll_ctl05
  epoll_ctl02: Add test for fd not supporting epoll

 runtest/syscalls                              |  2 +
 .../kernel/syscalls/epoll_ctl/.gitignore      |  2 +
 .../kernel/syscalls/epoll_ctl/epoll_ctl02.c   |  8 ++-
 .../kernel/syscalls/epoll_ctl/epoll_ctl04.c   | 69 ++++++++++++++++++
 .../kernel/syscalls/epoll_ctl/epoll_ctl05.c   | 71 +++++++++++++++++++
 5 files changed, 150 insertions(+), 2 deletions(-)
 create mode 100644 testcases/kernel/syscalls/epoll_ctl/epoll_ctl04.c
 create mode 100644 testcases/kernel/syscalls/epoll_ctl/epoll_ctl05.c

--
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
