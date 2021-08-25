Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9903F7933
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 17:40:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CA46D3C30A8
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 17:40:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C1D823C2FE9
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 17:39:46 +0200 (CEST)
Received: from JPN01-TY1-obe.outbound.protection.outlook.com (unknown
 [104.47.93.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 57401600774
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 17:39:44 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khltzvTYLQ0SDq5ES1ZkUvBkN7jYgrWwOFuETcYBvTmVMgQED41M5AVc1lSaRC4sw0qaB+6RIEogwEpjlalP22pTkmxB4DRQzQv3otDR74ulVEeHrzw/L72Li2EMBu6yPySagTsPxJIsLf+S+nnsrvqeLtKydFnkhVQeniQRjR3t1yqvIuAGfcX2o7B3iQYIr9tBMz4p5y2nldjikax2aFdIOmSv8BiJeJEgO2GCWb0o5UauaVT6QB75+lFicCweJQDiO9XGDBCsQzLFn8+BZd5xxFC5xoPbTU3R8MLROHIZJ0KgN7TnaZ3ag/QkOGnrkJeH44ZVGIv3AwI8+6tmbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uxO1j1XxvHTnqy6aQLF15FzyR6Mevb6uF+oE/eQm2M=;
 b=Vqy1hMHi5V6XSxyqg9LSfUwYm+hAuhAyodTH0VDuo89Mtl5WtLrdIJ98R/22Q7Sg6JVUAdKquyeb5Hn0ebID+H6rGZNw4AyFZ3yEVSSGPGNv5qZlaYMzptacZvsFW0nzfF9AjJ+bVfrxw78GLRVDl/fE8ifShnvMSBtsxqQ8YnGK/lmYRuW7yFzZi5Lmb9a4QwVFzoR6a5tz8BuwXbGI06BpM49/KATWFG4sdevVMvp/lFWwNccpIktFM+pXx3NPpvvTX0/RoVVD7+otlkWQJNVWtiP7U66jCmQ4IPMXiCGBVIINGpR250FKyMqUdf2u3dO8LFXdVKjCawX2bMdkhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uxO1j1XxvHTnqy6aQLF15FzyR6Mevb6uF+oE/eQm2M=;
 b=NtasEvzuMQ0NWUv1tTTZMODV/9790uu+cef3JbHoT3PZxcUrbVmyLgWHqbT6LRv/B2EYS544XQLDf6ZrrLXzn12cOsxrFRLTQxr7IU5KD0RtWwRwDHR1gmZyEmM7WOqaoYOCULfY8RNhFHAy0Kbn7JS2aoX7n5ZWotm5OiQv68G0nWc4Rdgpc+RaZZIqreM6GgwOuYnQxUmMyecae55to0lMPZeieKh2qVOUF1tWNkzIjEULcQ2iaAvAgZbIkcORSQ7oWx9eAo+Rgr+d7VZ5md3/Aq4MI/1ehiuKtdcxnZXNF0N35qFqjfQ35Q+3lHbuEzIJoXMnGkdVZaq+V/dzVw==
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:e9::13)
 by OSZP286MB0757.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:f7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 15:39:40 +0000
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::e800:1330:57ca:8cd0]) by OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::e800:1330:57ca:8cd0%5]) with mapi id 15.20.4436.025; Wed, 25 Aug 2021
 15:39:40 +0000
From: Xie Ziyao <ziyaoxie@outlook.com>
To: ltp@lists.linux.it
Date: Wed, 25 Aug 2021 15:39:28 +0000
Message-ID: <OSZP286MB08710D473C99D3B97231379ECCC69@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
X-TMN: [wp16cdiIWZii3Vlmzc7lqd13j+WJkzqj]
X-ClientProxiedBy: HK2PR02CA0160.apcprd02.prod.outlook.com
 (2603:1096:201:1f::20) To OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:e9::13)
X-Microsoft-Original-Message-ID: <20210825153932.138396-1-ziyaoxie@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (14.127.251.10) by
 HK2PR02CA0160.apcprd02.prod.outlook.com (2603:1096:201:1f::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Wed, 25 Aug 2021 15:39:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d3144dc-e1f8-49a7-eaba-08d967de8d90
X-MS-Exchange-SLBlob-MailProps: mBy7Mai7yE514amIrhlNzVd+FmdWxeo8KJNKRY/CJafeSVjJfbnbrChEmaP2Myw91sclAdikQS/gixv31fC6jQDFu0JUSE0fEzydvJRSX8uH2HGjZo0GjMEAhBJK5ScgJ2xUTooBKUlNvxm+1OPJNPO6BSxrosmNla9/2ixeo+ZfVKs6MwEKM2OtNTf0sl67IvvH7zbh2yTsOqcO0XID/AOCNU/giVSaCH5Py0QBbthq+4r99NMYmS99yqFpFH0gWkP5gx+o5mLlREFBqDmVrIt0VGOgG624/i63FGncuVawBAERESsoiOblsUGHfrlzSkntSZ79CfxVh6ENixMCwB5JFKPt2cKy1D/dQvH9+ee8WyQP1tTuGEjrRmxxO9ISBOJSPh0v7bimFACGfp+AkbieAwOgylA2jQvELjdJhDMLAv4djWJ9ptE2oQdMy0HV2DTsqXOF7yeEUVaqDk4jTX/nmKSBVFHKBBTF0RIOkgR8r0WwMNHVmdfOClNQx7RGrDaWzepYpuK+u/eRnkL2sTkXJKArLcjHi6MlgyL5G37kfbP15S0Lp1tTvnC6z5Uikdbcc6kM6+yAbNPmoBeC8zscvCgN+JG5zvqXsoaxYQpxdXSazeWFTSc0zaXH5K10JU7yhT6uMeFbfnFtgPES1IAnUHJ3HS1y23t822jMv+KJADjAEuwDmdbPNJzPnFGn10uHgdyIcWvjB+P9Ki0CHsIYsooarALq
X-MS-TrafficTypeDiagnostic: OSZP286MB0757:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5nrqD+sar8pV9Xe74FFmQOIX+MmMkbimhN/A6li5W6bnm+9Y2KeFD6jehT6BAJeuDSKbUqbxPtVI+iyQG7MWiYmX0uMBp22TBmRtnU0qA2r2nERsphtj2oAJgiBog6nIRRkOctmD5Yc2sXKm4nD34gdSiF+hi7xrVc+t7zhJ7xmBNDon/ZN+zDzaDZVu0VgrTMcddAtRYaE6G96p+K7LYW6/cLbJQ8nE6UH9hhbxd2YkGLi7obaFHv/5ktN7u5y4itFtSmn1Sxy5F4cojsabLqQFw6p8JZkNk1RbJMJ7ovkTH3cIpnk8FcHnEHnkIPa7M1T8ifzdPcwAS5Uvo7n9FYOOmDC5jiuZiNdb8Tn/oUIdjXCjlV3uJ+8nXgFfWruQJkyb5NZOabKcpmFwLHvTmesil7eF9wzZviQgnzBuBxf9XAz0lVvWAy+2GNewrMsY
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sFju7rpHqswCUbccbexmkOZXjhDiyCe/PlOhh4e6KMPcijgrew4XL/oeE9xXlYVM2TdCcGXYJCrtHRiKDxByMunNwF1+k8YA18loCZd1j0IRiN8/kOGladbaANXsqdWwBgd72MKNh2A56OV3rApGlQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3144dc-e1f8-49a7-eaba-08d967de8d90
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 15:39:40.7381 (UTC)
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
Subject: [LTP] [PATCH 0/4 v2] epoll: Add tests for epoll_{create, ctl}
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

v1->v2:
1. Add a IS_BIT_SET() macro to check whether the n-th bit of val is set.
2. Use TST_EXP_FD() to check whether fd is valid in epoll_create01.

"Xie Ziyao" (4):
  api: Add a IS_BIT_SET() macro in tst_bitmap.h
  epoll_ctl: Add test for epoll_ctl03
  epoll_create: Add test for epoll_create01
  epoll_create: Add test for epoll_create02

 include/tst_bitmap.h                          | 15 ++++
 runtest/syscalls                              |  3 +
 .../kernel/syscalls/epoll_create/.gitignore   |  2 +
 .../kernel/syscalls/epoll_create/Makefile     |  9 +++
 .../syscalls/epoll_create/epoll_create01.c    | 37 +++++++++
 .../syscalls/epoll_create/epoll_create02.c    | 37 +++++++++
 .../kernel/syscalls/epoll_ctl/.gitignore      |  5 +-
 .../kernel/syscalls/epoll_ctl/epoll_ctl03.c   | 78 +++++++++++++++++++
 8 files changed, 184 insertions(+), 2 deletions(-)
 create mode 100644 include/tst_bitmap.h
 create mode 100644 testcases/kernel/syscalls/epoll_create/.gitignore
 create mode 100644 testcases/kernel/syscalls/epoll_create/Makefile
 create mode 100644 testcases/kernel/syscalls/epoll_create/epoll_create01.c
 create mode 100644 testcases/kernel/syscalls/epoll_create/epoll_create02.c
 create mode 100644 testcases/kernel/syscalls/epoll_ctl/epoll_ctl03.c

--
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
