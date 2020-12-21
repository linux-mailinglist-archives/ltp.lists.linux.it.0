Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0004A2DFB75
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Dec 2020 12:23:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 302673C573C
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Dec 2020 12:23:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 6D98F3C23E1
 for <ltp@lists.linux.it>; Mon, 21 Dec 2020 12:23:04 +0100 (CET)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [62.140.7.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B6C346005FC
 for <ltp@lists.linux.it>; Mon, 21 Dec 2020 12:23:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1608549783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0JpFzlG95NRQrtsrWa2atnmzpIZX+3oL+sRBROaHjFY=;
 b=hDawBPt4WZLoEzEVf1Cn8tAdYLNM0BcwwuP/7bd8nXK0qevHArYrR882yxDYEIgaT+2TGq
 +dMvCkG3eJo/rnWqElWCqxlEvg2hzPkRcYZGYVPPB4k8fMJThyrfGk9bwQpDQ0kKCX4N2P
 8QtKyStdxpX1oB9H4KFIE6uhra1QhCc=
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2057.outbound.protection.outlook.com [104.47.8.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-_rEpKH1CPlmxr2TwNvMtyw-1; Mon, 21 Dec 2020 12:23:01 +0100
X-MC-Unique: _rEpKH1CPlmxr2TwNvMtyw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWjDc+Q7ztT/8zhhJvDtlKAVDyG8zpZvlNvtNLG1+GlTZ+HY6b7K+tJMasTBiiDc06MWqmflMECL8a8sOGB/e9vNO0M5z3Mu+rLc7vkuP1c/UsrJeg0YOfwH21jmUVg9y48bVaoa4u4hQSrhYaegVtadvH79XS742Mvp/rMJldt86PL1Hae1SEgqljEUj6mx99GNf+DsMa/uDXzUaI9S/YT8KoSHZrIBANPvrJU/uWC4JMnsITscuV5LRHIetyq52gx+w+L0A8YSS+4ZoGgNrSyl01rUn1Lg/Pws3WYKQXUbvRatJ5XFv08r2mpn6vU0buOyOIB7r5BzqZLl0gnF1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkjEVHy5rz0fcWy8TiLimbZRuqP2HK/gfcH2O+4cLYc=;
 b=JieA3XJNrLFqyBWlj0CI760P7ujPZXumvMhS70LQvEoC3Ar6FzLGFZspOPRr6ly2/VObuNAtWYGoteGMh16k0FxlLwlSGj10lI5M23hFioYEn4xwli+RKt8QfGLBYG2oeooEfS7RqJxM31jtQVInz0fPHfg5nCvwjpV9yf3/eZxa+Y1qhuy4kbU2Lx/UzjAy2RtTBzmQpYCOJaMoK4thdNG1089hZBok5xjc6Y3BNk5M1eJmusGg52qoHAw/c9GonLNR5+OcEwa26AhQD6tItuBfcYU/iD6xLNLtTij0M8nvnYnFV+t3QyRAcQ3FYQBnz9Mwok361NZMYk0ZTr4daQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24) by VE1PR04MB7213.eurprd04.prod.outlook.com
 (2603:10a6:800:1b3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Mon, 21 Dec
 2020 11:23:00 +0000
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224]) by VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224%7]) with mapi id 15.20.3654.034; Mon, 21 Dec 2020
 11:23:00 +0000
To: ltp@lists.linux.it
Date: Mon, 21 Dec 2020 13:22:50 +0200
Message-ID: <20201221112250.27944-1-radoslav.kolev@suse.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [85.196.172.93]
X-ClientProxiedBy: ZR0P278CA0008.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::18) To VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.suse.de (85.196.172.93) by
 ZR0P278CA0008.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.28 via Frontend Transport; Mon, 21 Dec 2020 11:22:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1812e79-347f-4d4c-4795-08d8a5a2c635
X-MS-TrafficTypeDiagnostic: VE1PR04MB7213:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7213B58267E9A0D6AC2AC172E0C00@VE1PR04MB7213.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RxwBzwzMOs29gfcqyc+AzprlwgSp3hmlyi2yAVmB8DJQoX+/d8K0cJenX+Qfg2/M6xH/9V7Jo+4loREgC28gi5YWctnrk1JfE5XlYO1kyFlE37qiXz7gYE3icuU+OoH3eDyFC9vlcEmxZc658tZzaE2I8ybWt40rUcRW6Mp/+AsouFwv9jzosgHIvQWhj8NydY9+4ED+V2Gb38J43w+ho4xC54oWTH/mdQ245h3/rYB9nKJaW2vT8IzE7ToISdjFAwR6sbCfbW8+2iRwQz/eQwVANGPoykgB+ycdANksi+EP+we7/MS/mgif00vL5SJeyNxq00wIM8pVWGcFqg6GQag34jbslyCmDUR/JPPFXxRS78PtDDkXdAC29ij6WYhOzvy3lIxwPyQXGG1s2o3sHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3663.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(376002)(346002)(396003)(366004)(4326008)(5660300002)(316002)(8676002)(2906002)(6512007)(1076003)(83380400001)(6916009)(44832011)(16526019)(66556008)(478600001)(186003)(956004)(6666004)(2616005)(66946007)(8936002)(66476007)(52116002)(6486002)(36756003)(86362001)(107886003)(26005)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GTjmO3NKm8R4ANhk975rCK1eQqly4/wwvyHhVl3DNhz89DQfqWRLz90x++0+?=
 =?us-ascii?Q?X353FBD6R/s+yFHWuHaA8b8eslsyaHXgYjpOfoGA115jvetskL0PMEgbU3p2?=
 =?us-ascii?Q?2tMxaDsgc9gyPKpG6pCFJeOEgemkrMo5+LvVk0dL04SBn8IUCycU+cx3AyHt?=
 =?us-ascii?Q?uRvhI89mUlsqd7tjuovTyeVy1fiBxL1Q5boS92HdOIQ6Fs+5fBBsH4Bn5hbJ?=
 =?us-ascii?Q?A0SXivXuDpnTCqSCn/xD1y6cOw4NatvgdBl2RWGz2uddxHrNelGEjR+xjUjw?=
 =?us-ascii?Q?ySzhFPSyqaOCEfEz1ZIwRlr2VfHMF+rtdY46IGuOfeKAXr2OezezIdDpKVEO?=
 =?us-ascii?Q?/7lvLqOXolneRHa3LEm+CqP5G981lIc3BLrNX60fyHwcD2KjvZ3FdJqTZxmG?=
 =?us-ascii?Q?EUaCWR08DgTDLxma+2/M4Vt0HS6D82KAp2fFKoV2BVSb+gkWT0dPS6W91VcE?=
 =?us-ascii?Q?eoaDd2K6WCVjOz5RC4x0heqCmFzk3U7u04P+kMKkcJisXyLYch4Z5U/Zog5o?=
 =?us-ascii?Q?H/aRKLfXIzszw+spihdIyJq0wQwbXp/vosLiTcnj+8BMnNjYyAvQZHguJfKz?=
 =?us-ascii?Q?7jhHnLnsE+BRRPjSbGNhNl7IZG9hd2fxdUoSeE4K3nPdg4YZryjlE6vtABVO?=
 =?us-ascii?Q?Si7uQsDwiydc7/yS0IWdAE4Z6nBkHopNIdWIPqqLBWyJjb8xHz4ruOUcqUUv?=
 =?us-ascii?Q?m1xeqTWQHmg5ozQRfIAjJkDfEtv45+CT595NAVstdcuO1+/plTX0Adco/NB1?=
 =?us-ascii?Q?0exbeDTCqqHqN3OwfI9+cd23PCfG05tYPvXZ6D87GUtgRxaHTTRI8EMSJdDZ?=
 =?us-ascii?Q?qihqhKTQHdkEoAbnbycwUv2r1hcRXJa87ryPK4IQHk2hJnKAMcv8b+ckCIDb?=
 =?us-ascii?Q?5XUHuf01Bon4kwnrWNblbo1d02Vg8oOnTaIgdl/q7ScTJmCUFoe4VhC+IR+t?=
 =?us-ascii?Q?zbJPLCXpbtZGrIF0z9zt/cfZlF1El+e4nReb74jp4h7TLp24hNX3+v0p1kFk?=
 =?us-ascii?Q?RjPH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3663.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 11:23:00.0321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: e1812e79-347f-4d4c-4795-08d8a5a2c635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Si1tsrh0RMJWrQUf51l8MhKI0O43itiLXTEbitDLQx++gk25qbysixf+Ujk5CtaXnMH3Q03hLcBwbY/JqgxKlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7213
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] unzip01.sh: Fix failure with BusyBox unzip
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

BusyBox unzip uses the word 'inflating' instead of 'extracting'.
Detect it and check for the correct match in the output.

Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
---
 testcases/commands/unzip/unzip01.sh | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/testcases/commands/unzip/unzip01.sh b/testcases/commands/unzip/unzip01.sh
index 750718de4..1b9a1665f 100755
--- a/testcases/commands/unzip/unzip01.sh
+++ b/testcases/commands/unzip/unzip01.sh
@@ -12,6 +12,14 @@ TST_NEEDS_TMPDIR=1
 TST_NEEDS_CMDS="unzip"
 . tst_test.sh
 
+EXTRACT_MATCH=""
+
+if unzip 2>&1 | grep -q 'BusyBox'; then
+	EXTRACT_MATCH="inflating"
+else
+	EXTRACT_MATCH="extracting"
+fi
+
 setup()
 {
 	cat > unzip_exp.out <<EOF
@@ -21,15 +29,15 @@ Archive:  $TST_DATAROOT/test.zip
    creating: dir/d2/
    creating: dir/d3/
    creating: dir/d4/
- extracting: dir/d1/f1
- extracting: dir/d1/f2
- extracting: dir/d1/f3
+ $EXTRACT_MATCH: dir/d1/f1
+ $EXTRACT_MATCH: dir/d1/f2
+ $EXTRACT_MATCH: dir/d1/f3
    creating: dir/d2/d1/
    creating: dir/d2/d2/
    creating: dir/d2/d3/
- extracting: dir/d2/f1
- extracting: dir/d2/f2
- extracting: dir/d2/f3
+ $EXTRACT_MATCH: dir/d2/f1
+ $EXTRACT_MATCH: dir/d2/f2
+ $EXTRACT_MATCH: dir/d2/f3
    creating: dir/d3/d1/
    creating: dir/d3/d2/
    creating: dir/d3/d3/
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
