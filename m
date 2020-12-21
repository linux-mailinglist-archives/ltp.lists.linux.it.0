Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE5F2DFBA5
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Dec 2020 12:51:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1F57D3C574F
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Dec 2020 12:51:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 744C13C23E1
 for <ltp@lists.linux.it>; Mon, 21 Dec 2020 12:51:24 +0100 (CET)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D46981000453
 for <ltp@lists.linux.it>; Mon, 21 Dec 2020 12:51:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1608551483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=32+ly9ym2jJgCzmg5pSEaiCpiX3PcrZirqrX0yHaBiU=;
 b=LUcU/6luW+eeDwK1LMTfcOmk4B4cdveSWHJmpwvLaXFrU5JLdhxdnb9bD/3wO3KcaBFPiu
 Fq++zY2mFf7IwUw/Op3X+DO3lTyWbOyg2Q2kmmxeGxgoRZAx1l7oEiFJpYGNMHvurIRmBy
 OHO05GK1TN2r2QkDg8Us8axTqRGsXLU=
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-Polntki5P_Gjv7p-Vg6C_A-1;
 Mon, 21 Dec 2020 12:51:22 +0100
X-MC-Unique: Polntki5P_Gjv7p-Vg6C_A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFbkGSIiJeSkBDq6eyjFgnKr6BPaSYqvCrqg0K7jpBbsIh/nlXxFMow5V65D5KQ2ULjXwO68XBpncSnJ0KINlpdojruPpvwHOwL1VZCsfBOHYTsIwvBqiinfWN+cxTCAd+c2/bY2x99IEpcRNTQ+27SRaCYarxlHATpUIOnudgBfvxE0XhA2LdrJJKtPUFO8OOKywh0CizTD9OgdBooNNjEDEhd+XEXhgWXjPFEP3Lw31nnG8XVovo8dZK+F0OgGZRm/sMilpwG14bHICQ5zL+9B5u/mn9C0q1vN/9lMvo0RnYPQSMy0lBp8BHQKaSKuG8YWGwumxXYOVZVKUXc1XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULwOKAgUq3QSIlJ17iPC/jJu/3y9uMSu3Rk6XBJHQjs=;
 b=iCTRLLY4ub7pR+Fr+TBJk9MtZY+xJ6jdthR3hpzLQXsM8GZvPtsbSZ1plyhuUxbNNkCxKbec7xHoVV1VqScM1u+b/L3S8UgEJmsS0QVZwUsKO7aOcWorup5nP7xAbufyqblByjm9PPJq/BdqjQHeiduAzaMpEB54kGsKuP+0tPk0AAZyqrrCupc33eEnBPWM7fBq8YmvN6uq5eyfHsXr1c8ojzVg/vv74tWjSjJ+BBUi4n7UzSipC80JF1+O3jI6vJpLrRy96XtVmYX+y2JqFTrkEOG0vv2ZeDGYolZZZq24JRJY0oDm5cpYIc6bz+eox/5ciR6wNM0a84QHMPoiqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24) by VI1PR04MB6830.eurprd04.prod.outlook.com
 (2603:10a6:803:132::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29; Mon, 21 Dec
 2020 11:51:21 +0000
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224]) by VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224%7]) with mapi id 15.20.3654.034; Mon, 21 Dec 2020
 11:51:21 +0000
To: ltp@lists.linux.it
Date: Mon, 21 Dec 2020 13:51:11 +0200
Message-ID: <20201221115111.31982-1-radoslav.kolev@suse.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [85.196.172.93]
X-ClientProxiedBy: AM9P191CA0023.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::28) To VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.suse.de (85.196.172.93) by
 AM9P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21c::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.28 via Frontend Transport; Mon, 21 Dec 2020 11:51:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79866ac1-e063-4e3a-9e13-08d8a5a6bc19
X-MS-TrafficTypeDiagnostic: VI1PR04MB6830:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB68302DEE4CAE5AF8056524F9E0C00@VI1PR04MB6830.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 17PwlcvEIAG77nzUlFQy+AumJT4bUqj7GXXJGoZTAflS/JG1u1DiUK4TWU9tNXmjRqvuOdMtnhh1CfwdyuhkaXR3njktCoN9Gwv7nYpzmqT5MLKQpxFOuuYDBi2DJxxzVYUHKYTeFo7H01JjRenZmnHlcT2s7XGJTALHTcKN5H6UvQB7oT7NI8ioY1P6Wr60DYHEN6JzR4/1ERNYdxj1bz5K4ELvm+TbtkmwGsOia4+Va6GunEe+0Mn34p81/ZepDQCCGw0nP5iQAy3sUTkix8+VLQyY1neBjKKzOyeGsn4s8x/1Zxq+oqvVhQkPF6/Uz7GXiePgxdajPqWu5wCmcbQOIiD3seCMpJDN0eXBP3shUaXlEXJb9l8rLr8m04GS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3663.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(346002)(366004)(376002)(396003)(44832011)(478600001)(186003)(4744005)(86362001)(956004)(6486002)(52116002)(6506007)(2906002)(2616005)(4326008)(26005)(66946007)(66476007)(66556008)(8676002)(6666004)(316002)(36756003)(16526019)(5660300002)(6512007)(107886003)(1076003)(8936002)(6916009)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?85nlpZf1aRALbbUxYmGS496+XgFHWgTDFl4QNAGfMvi/JzU02kTpxinVYfeY?=
 =?us-ascii?Q?lgq0fBEnPhWp2wNUiLymefVkNFyYlEJcOM54MCnlYtXstQWcPJNwmzOnOW5A?=
 =?us-ascii?Q?DKOytLEcobx8x1QK3IesHh/D2EjbGerMd+9u7MpDu2+4KOent/snEBMWLLXn?=
 =?us-ascii?Q?jFsZmyEmVmwz3LMCwSdPa37SO9SJRVrznxOz1KqHjSjRzZwQIjNF8rYCAJuZ?=
 =?us-ascii?Q?HmD7vsHWgdSXOJ/wvPpOwASU1IIdR0mTaB2txjerJhM/vxkEdIZ4yCzxEZpM?=
 =?us-ascii?Q?NB+i6QtCuJIE6bcBBfdol9duMCLh1mc69nE7K5b3fn+hyqzkYjIiUoEaYhXX?=
 =?us-ascii?Q?q1UkHjKzBrjzvBpfI44hnMO9ZltWFyxAT63lkhs8H57HrNeiXy9cpK4Rem0n?=
 =?us-ascii?Q?agsBjhZ8NXwJwDaDeJfQL/rOZfxAGAbwITAcpYYwRfYQpLYkd5Ai2iCLNwC2?=
 =?us-ascii?Q?0YVIVvCEn0rU4RkvBAgV1/waWRjgan2r//CaoDe7GvUQdCAieqev7+8bvYzT?=
 =?us-ascii?Q?JKBt9oDHx3vAt6QQsQy4LdlAvSFdDuM046m53GEE+v+18H5Iqx9gL7jUwV99?=
 =?us-ascii?Q?aot8bkYT5PwP2KO5Y6s4nr7Tasmr+Psp2L+QD/LGSaoSzDpCjMMLEL2xYYrI?=
 =?us-ascii?Q?WAnZ2wRVIlBdmYT5ANOTiZdMdvWF6sixxjKlek7CLnJjdGyJiQ1DphYRrE4v?=
 =?us-ascii?Q?gvYBm0X9lVYOBneX5KIg6HYr0GJbk5y+YT6k8CKrpIv/Rlij9LfwgmhbxZzq?=
 =?us-ascii?Q?L+8jMj3mrUdzyQ5TxaYRGgVu7RvapnijNL1PHAFEp05Inam5b0bc97wZycIN?=
 =?us-ascii?Q?AkLP1JFa3vcXZPN0iojWeJAlS3prY03WZUJX6uSi3Oc5Fn4TiabjN5aQNMhF?=
 =?us-ascii?Q?a8bDggQV2rcxB6wHgY6YuLARLWxUtaTd9jkeMMibZR0ErrGM4oifuXHNVMgl?=
 =?us-ascii?Q?gwdQYv8bS78R1Xn6reKnKN5po/248RciNLFMIPanmFLAWvabbyqeND1vnoMZ?=
 =?us-ascii?Q?+lZq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3663.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 11:51:21.1215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: 79866ac1-e063-4e3a-9e13-08d8a5a6bc19
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1VTvqjvH4rk7ZCh+FfxmsiyRe0p0vetr+I1C6Sj3S0r1M1TclufdgcE/AMmneYjOHztLPs+NhFTqASPiGyOi2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6830
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] lsmod01.sh: Fix failure when CONFIG_MODULE_UNLOAD is
 not set
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

If CONFIG_MODULE_UNLOAD is not set lsmod shows '-2' (-ENOENT) for
the used by column, but /proc/modules has only '-' there.

Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
---
 testcases/commands/lsmod/lsmod01.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/testcases/commands/lsmod/lsmod01.sh b/testcases/commands/lsmod/lsmod01.sh
index c373b2893..2e044c718 100755
--- a/testcases/commands/lsmod/lsmod01.sh
+++ b/testcases/commands/lsmod/lsmod01.sh
@@ -44,7 +44,9 @@ cleanup()
 
 lsmod_matches_proc_modules()
 {
-	lsmod_output=$(lsmod | awk '!/Module/{print $1, $2, $3}' | sort)
+	lsmod_output=$(lsmod \
+			| awk '!/Module/{print $1, $2, ($3==-2) ? "-" : $3}' \
+			| sort)
 	if [ -z "$lsmod_output" ]; then
 		tst_brk TBROK "Failed to parse the output from lsmod"
 	fi
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
