Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D59F92DFB4B
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Dec 2020 12:01:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 792693C32FE
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Dec 2020 12:01:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 428F73C23E1
 for <ltp@lists.linux.it>; Mon, 21 Dec 2020 12:01:35 +0100 (CET)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 839BE1A00EF6
 for <ltp@lists.linux.it>; Mon, 21 Dec 2020 12:01:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1608548493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nRlyNjIve0ti87VJpSzW4XCsxw4uaNVyLc3A7QzRZwg=;
 b=mzFVXbydKgEzIFlymSoeYaMA40h5BLHqqqVsgluxC/ACej6Zhxqx2o+9qqpajwqzr7ShXI
 rvnuL6c8Rco9JxpjtU85bFAgrBrrdLkKvgHr4h1osVz6hp+G1zP0nmElbuMzAo/ntziWNp
 8doZ80AUMqRHOZYE0x98H4IZA+KELeM=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-hhKiMUIeOE-wKyFQwGeydA-1; Mon, 21 Dec 2020 12:01:31 +0100
X-MC-Unique: hhKiMUIeOE-wKyFQwGeydA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ggaw2lNoi68YlcPBhvFPR+KYj/PE2ssxPaDrPar1+pxN3celp+gDJD06Kxz1VW+rATdldYebxGDoQcniO9R7VJ0tVOpZDCZ+1i2iv7PM22q4G+83kIA4h9HqINAG439b4K5dWiAVeACrNrpCeWUXj2GiUHftHFtgTZZxoF13F4s8o9CzpOy7sL38uyvTUVHDFtrUfQC7bFaip0faISf2+UcYK5KYaUp+5KfEChDfnRN/A4WOZo66jVTQehwtm4nQb616Szvn90DohFWFqlL34ONlri40TrjZtyIoaNuVq9MS4v59gN+TjZ0LCT+MEC9KuYtqzhPNfT4ngKDbhyT6YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqaReWIm0YUCG77W75QhAbD25Utfjrj7vj3jHn4AZvM=;
 b=cqYCPXyMWQMwxuCbOqUwELqkQ5BMK/rZvfRM3QdmkMFpVfg3RFl6FVy0Ki/UPZOZIlpVta0mQC59iWac3mDyp/KEEDCLm0MZelEIRZQMlNk1VZ9Lm8ArsVYxuQMk0DyGse03PhT/AmAdRtxSeFtDSwAKycTHhK1U3kIDP2oY229blpooPmz/WJf/UeeK3t8BdSr1YdU8eOcu/hNmSAwKgUCwOm0Pk8JguGGhVcGca8w5ZE+ZSB7MOkGV5cKLFAO0noUU7DMicLY+LWPEY2tF/p+kL9Alxejoy9tOE1nnfzKX19trhSN/O9R1pUKytn5KLrnTFYtrRSs5V3dxMMiycg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24) by VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Mon, 21 Dec
 2020 11:01:30 +0000
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224]) by VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224%7]) with mapi id 15.20.3654.034; Mon, 21 Dec 2020
 11:01:30 +0000
To: ltp@lists.linux.it
Date: Mon, 21 Dec 2020 13:01:20 +0200
Message-ID: <20201221110120.26165-1-radoslav.kolev@suse.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [85.196.172.93]
X-ClientProxiedBy: ZR0P278CA0015.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::25) To VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.suse.de (85.196.172.93) by
 ZR0P278CA0015.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.28 via Frontend Transport; Mon, 21 Dec 2020 11:01:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f85de459-8a60-425f-40c8-08d8a59fc5a0
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB70558AF4CEA7CDB2FAF6B6CBE0C00@VI1PR04MB7055.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IyB1QdyiIXFtZZboAE0GzMmtVGGpm7p8GWHcE4nHK622EWV0xw1uhd7UJkgKNM4iUlGYoXJ/f2O9AdcJyw04Rh8KGl7o+6Uy0THp3sbikvXv4F2WqEKy9xf6lQ+hqXvVYbzg2YSkgtQZfiCHnHoApMdb39EV3nx7yN7XiXjIRfgqvzFe0Tb4Ipy9tgJnvT61Hxkr1BrJkTn2UvceZD3XVewtIh1FQKIyD4eWWljmrrvEQzRsP2AmPGhqCXo9y/K76Mwqd94FklpEFK7K6pYZZlVD5n8LRKaJ5Y7F5hA/cmdz69oRP3HJMsRqwbQPzGuPaaDg6fk0gWYfhUsnk8IVU0YhsoJF94MVUS6HvPSaBtT9iAVWOIfGC5rzMyocYi+MyyGmLs6gntxfmdWBtYTtlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3663.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(366004)(39860400002)(346002)(136003)(36756003)(186003)(6512007)(107886003)(52116002)(66476007)(6916009)(16526019)(316002)(86362001)(8676002)(6506007)(6486002)(26005)(2616005)(44832011)(956004)(4326008)(2906002)(6666004)(1076003)(8936002)(478600001)(4744005)(66946007)(5660300002)(83380400001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+wOxsxc3V8jmTSCOKCqBmxym0BS2RE9CvocjZt94hvLM4UyMxsKYPNWkDjEA?=
 =?us-ascii?Q?ddPUl/8nvCT0qY9uytVykvekrctGD78AkXn+0MKnkp8GAtKan/+1daUqrVfz?=
 =?us-ascii?Q?NZiAifXcF+gU/QhbkWiroAbuc9nN/smzosqO+M7Y9tVp/Fny+LuPp6Iz6vYE?=
 =?us-ascii?Q?4YRsGO940JLs8qiIElFPoJ4Lx3rdYeP8ZPFhisqAxZVRhSLfeTwQAQZl1Xn/?=
 =?us-ascii?Q?DT1FSuN3EcvAmiryLAaqfeC9dTc2dW2y8DZleOw8ODbxLn5Zvb5mADOJ5TNz?=
 =?us-ascii?Q?T/3a8f7sbIuIcK45KCOKwrZn3j2frkPXOZ/SKs+0NS09kvDJk1A7b8GBFLak?=
 =?us-ascii?Q?5YpbF7aVA+qqw9FkafSi/xKYXNWr2LJRUl6zzGEkBlr8f7YDS0yxAx5DBVha?=
 =?us-ascii?Q?a61b6BsDYD2g0oDbByU/TqUOfwCkKZ5qKlT4PMOcXGCV15bFVnTQSDJ59Gml?=
 =?us-ascii?Q?c1UBIN7bbe6YL7F0N679as5BvX+STkr23n2NK2N/0XPwQWew2KSBPm8FlctJ?=
 =?us-ascii?Q?9v4cAR5OK3Xy79YnhuGqHYJ2exTA9BozgbVWJcUmVmT/y0kYFUPw4aCUBb+c?=
 =?us-ascii?Q?1Tl4FH/8ZWfhZHVYDTLgG7ePtzoqIgdxPWJDuEHsnQTjbyosfNZ24pZ2mEFr?=
 =?us-ascii?Q?sOWa1OSaasHZFfv10i8uT2vluCsoEXtUutwqe3NFvqylxdn4qRLKQ+ChvtTl?=
 =?us-ascii?Q?gpmb5crTavYbWD2hp0erCQUyYGxjhXuBmSpVgAorntg6KMrBW1FW6u49O4PF?=
 =?us-ascii?Q?rSVJUqrYwKAaxLNnaC58749IHozULGl/FH9+PRyI/XdqrUvZzxEO71Y6aD5d?=
 =?us-ascii?Q?Rx20fpI2yDbO7yOt6TMCamBepfbq3FTXiktFZ3C2t1Mgj2pBGSWw7QCICerR?=
 =?us-ascii?Q?6WKMobjuDIiFlbe7exijBAquiL2bPAFXRIVhoi0nzJzoApAXvzrPXaXfBsFB?=
 =?us-ascii?Q?JPpsmCJepbl/TVF+OU7tE+gCNpyq3556WVT1jOD0Qr00DvAkSjBnlo3tpWpW?=
 =?us-ascii?Q?wc2j?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3663.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 11:01:30.6202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: f85de459-8a60-425f-40c8-08d8a59fc5a0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jTE7/k87k18y6pH232IIII77U8fSCMCkM/ewkmkvlUxjXe51MOmToghocA4SG4x4wHffPbqa60bKZsMpTrEslg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7055
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] cpio_tests.sh: Fix failure with BusyBox cpio
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

A very limited BusyBox cpio requires the archive format to be
explicitly set to newc when creating an archive.

Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
---
 testcases/commands/cpio/cpio_tests.sh | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/testcases/commands/cpio/cpio_tests.sh b/testcases/commands/cpio/cpio_tests.sh
index a1469d873..57b6d983c 100755
--- a/testcases/commands/cpio/cpio_tests.sh
+++ b/testcases/commands/cpio/cpio_tests.sh
@@ -8,6 +8,12 @@ TST_NEEDS_TMPDIR=1
 TST_NEEDS_CMDS="cpio"
 . tst_test.sh
 
+ARCHIVE_FORMAT=""
+
+if cpio 2>&1 | grep -q '\-o\sCreate (requires -H newc)'; then
+	ARCHIVE_FORMAT="-H newc"
+fi
+
 cpio_test()
 {
 	ROD mkdir "dir"
@@ -16,7 +22,7 @@ cpio_test()
 	done
 
 	ROD find dir -type f > filelist
-	EXPECT_PASS cpio -o \> cpio.out \< filelist
+	EXPECT_PASS cpio -o $ARCHIVE_FORMAT \> cpio.out \< filelist
 	ROD mv "dir" "dir_orig"
 	ROD mkdir "dir"
 	EXPECT_PASS cpio -i \< cpio.out
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
