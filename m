Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD5C2DB0A1
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Dec 2020 16:57:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C54EC3C5A5D
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Dec 2020 16:57:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 6E2DE3C2C38
 for <ltp@lists.linux.it>; Tue, 15 Dec 2020 16:57:15 +0100 (CET)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [62.140.7.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CF1FF1A00F69
 for <ltp@lists.linux.it>; Tue, 15 Dec 2020 16:57:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1608047834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Yf+WUJaYkUKvGSHilOVjc4LkZHGma6y28GJHuSRAAAE=;
 b=HoH8JO65xrJeJXUzX1HY/JmMvEPQfC2fiZgSZ4YUo3kjeSMdqefg9fyO7Ki7aIvCw8UtGC
 Y5fePwpArAXH9CDVA8u2pUImsCzEVR1ABvphr8HvlT9jZhRx09zeApRrnRCGCT58V1xJnw
 HQbHdkZMcAMhw+c6fOPdSipFkXNNXIs=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-8LmQ2HHMMdq4OQqvPQtIaw-1; Tue, 15 Dec 2020 16:57:12 +0100
X-MC-Unique: 8LmQ2HHMMdq4OQqvPQtIaw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSimp4BpdHjoLHnEVAndLKwLzjwm68zwFQh2LaREITzfHGtXSYdwuPy8laXg8u17SWbI0aK+kzPtRmsulu/OXdQvjXa7lrR0jZmH7p63qQnWkbp3T1UQEPLjL5osUy2CcBfMzlVtLRur05Xdwj6sTsaSONrOZjz/s1LbOcyzQMXx5Po7aqyGLUEFlHAodIMDfPD7fGzpYreg8zvtvf0Vy67/TYXbg6OMnVqqm6de6qEYLdDV1PegwARvcat/ycL00YGh1Bs36Jzp+yeI5V75vc3AerDL5BJzkqPFaH5TQNMNVcYvzvrr0uc/RuXXflkqbb6lwz5f4tyuyBVeCtiNlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VM+DFkJthfTth5zYAD5lgisoY1qreV9Qsc/rbxElXbc=;
 b=St9ajlfQINNLh6e3tXwsoBrdK+S7q9iWJiL0et0PlG9qLIvQX7/gNXdX0V3iqM/ufFu2JSlft5Zp4Px7GmjTQ4UGKPAoXBfNGhnALAmqrdkvw0PxrNBV8tUhYgNLhE+bKaUKzmKm3diPTvGAGCQaHuR8zlf5GW2lbWIN0oFZvrcObB8TEjAvkn5ucw1kkb+Lsqp/1mRJlOa97cPQO0W/KrERD6Gc/pLNC2TlR8wlKrrm5l5jGfrHoBKWTPHsXuPDrBalo7LK1MHo+QE/DV+SBs7BFDH+2c1WVCXVdzLXnwzvqlTvwCogF/DVDpdbtiqesvz3QIbid0LfELDWLSKFOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24) by VI1PR0402MB3664.eurprd04.prod.outlook.com
 (2603:10a6:803:1e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Tue, 15 Dec
 2020 15:57:10 +0000
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224]) by VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224%7]) with mapi id 15.20.3654.024; Tue, 15 Dec 2020
 15:57:09 +0000
To: ltp@lists.linux.it
Date: Tue, 15 Dec 2020 17:56:50 +0200
Message-ID: <20201215155650.6496-1-radoslav.kolev@suse.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [85.196.172.93]
X-ClientProxiedBy: AM0PR10CA0027.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::37) To VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.suse.de (85.196.172.93) by
 AM0PR10CA0027.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Tue, 15 Dec 2020 15:57:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aee1045f-f729-4e54-9e52-08d8a1121493
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3664:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB366459877EE9584FD6B4F124E0C60@VI1PR0402MB3664.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MZlRtPdfdEiGCX4KlqULQHuSEYNt6rRGxSQ4lpacGO9OESNagnRzQyKT+YggI3UZJQFi50n9/VbbLvZJPJvoEWEXiAaq6+y91j5TmrKo+Mi0Dwp1MKbl1nhkh7U9SKw8ZUM/NJnF7tZYm02hdjKJs2Jo+4pg0xZ4t1Io9g/B/z9bguiF+mZKgac5sjEbCbn05kQMvu0nLPs0TFgzRsvNna+XlpJEAtSOMQ7DLoiSHONFPwBcppdIfqWwkUrlIqBU/i+JsUeOnI7MwzdZELG8UYebHNlYE4/LJNYPvVUYHEWdv/8KQdqJZpl+N2H22A4vqee/5JPgn6kwONS3jlzIHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3663.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(2616005)(36756003)(6506007)(498600001)(4326008)(52116002)(83380400001)(6666004)(66476007)(66556008)(4744005)(6916009)(66946007)(1076003)(44832011)(6486002)(956004)(5660300002)(107886003)(2906002)(86362001)(16526019)(186003)(8936002)(8676002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YgmGhClwzIz7dJ3wAiX+m6yECPFsF2DfwQ4ZRjIdZrPmkHb+0NKqiKXPMB7c?=
 =?us-ascii?Q?VTHWUrZmVbjVD85cEHbyTVotl9wwnU1mKJrzOjsRHCFi31hTPRNIWgXcKWsJ?=
 =?us-ascii?Q?4oumbPqbZi1sbJuuOrppR2KJxE+Au7+ebf+lvCCNdxpD736vQlM/vlPd9tKM?=
 =?us-ascii?Q?mEJmsi4AD59sHOFlk6v854gUvxi0CAR581sO9KP3e2icEnhQHrP1Ljv6ysls?=
 =?us-ascii?Q?BC2kCyAGEWnAJnWcou0yzPTGy6xoXTkHnlm9BJSPZeqtKxF5n4dhjSjrjIZr?=
 =?us-ascii?Q?EdEtV0XtPe2AgqvYyTNp6XjS4bV6bmFR3eL31l8GStehheBBqvLUy8zEIWSb?=
 =?us-ascii?Q?rCWRYBIFBw1rNyK09SQCGQNq+0uCP9OTaSkT2egq8r4j+xMq6ENOgOU8NMG8?=
 =?us-ascii?Q?XeN+OQYci1DGzFVfIrlnyr21vplFndJKZ4U52v28IjKLuuG1sfAo5pUNf8TU?=
 =?us-ascii?Q?0Joxq/9oRSriPUGUG2JZPaecj5X9dVYktUWtVHhMVKkvvdaDOIPjbmfLRIY7?=
 =?us-ascii?Q?GrOTQR4Bs81fPbRl0iGMk3bD61Wq4D3SGg/4i53lfO+18sn4g8ajWL39cEUO?=
 =?us-ascii?Q?70P6nCl5vd755x1V7I4SJsbzEKZio5V1OsnwBLiQD/qCk5gErxOK6qHm592s?=
 =?us-ascii?Q?n/2eAHbhwSyATQu2UPLtnyW8rfnmWaJ6/YFOV9RHHV1jYNcF68tmySCi758/?=
 =?us-ascii?Q?cWcqwAGgb0Nb59x45zqo1N6zHyp+ydQrheppO3S1kNY8SCe/y6W/671k4FW0?=
 =?us-ascii?Q?wjKK2OHJTjRfmwPUsyHQo2gsE6UlPhoUGjpSaiz5lXbHahwvq8bU2aSbkjJj?=
 =?us-ascii?Q?drU8zCkcWBfScnI0RkJN5AzJM5KR4VRZMpGqPw5MGY8kAEGpqRg5kEMbCkaZ?=
 =?us-ascii?Q?Sd3RKxo9KKedLDBWCvZCdJZY81lQfAHIr3oR44JDxsY8uhtXkm2u/zMWGGDY?=
 =?us-ascii?Q?ABuS9VCiIVfYoZCj8Jr2ztF77pnBpOBPu8mL9C926KI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3663.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 15:57:09.7978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: aee1045f-f729-4e54-9e52-08d8a1121493
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: asKSkTGNsQYhAC+fltgrUZtyXacwBFr6wxKh6n7oFgeD2FnYUbTAVOiGLJiISj3xPccTS2l67fqkWsgV9wEsNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3664
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/ioctl_loop05.c: skip test on overlay
 filesystem
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
From: Radoslav Kolev via ltp <ltp@lists.linux.it>
Reply-To: Radoslav Kolev <radoslav.kolev@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The undelrying device can't be properly detected and causes failure
when running in an overlay filesystem.

Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
---
 testcases/kernel/syscalls/ioctl/ioctl_loop05.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
index e3c14faab..f8fa413a9 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
@@ -101,6 +101,9 @@ static void setup(void)
 	if (tst_fs_type(".") == TST_TMPFS_MAGIC)
 		tst_brk(TCONF, "tmpfd doesn't support O_DIRECT flag");
 
+	if (tst_fs_type(".") == TST_OVERLAYFS_MAGIC)
+		tst_brk(TCONF, "device isn't properly detected in overlay fs");
+
 	dev_num = tst_find_free_loopdev(dev_path, sizeof(dev_path));
 	if (dev_num < 0)
 		tst_brk(TBROK, "Failed to find free loop device");
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
