Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AB82D7246
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Dec 2020 09:54:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0DDC33C61AA
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Dec 2020 09:54:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id B84063C2B05
 for <ltp@lists.linux.it>; Thu, 10 Dec 2020 17:51:38 +0100 (CET)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [62.140.7.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 327A81A0090C
 for <ltp@lists.linux.it>; Thu, 10 Dec 2020 17:51:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1607619097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zd0T8Jjs0WInsTJ/3Tp7+m9nXjLIQ471YdH9m/RcEXU=;
 b=CWyVB6fuDFXREIZLCyx8uW5EYwAM6TAYgQcUYCKVRLEHOXM9a3rfbP7CbysMo5RjTGyIGx
 GwC/AF3g2mRAxPOMGJ0PWT5nicq1a66oIIprpGMzciGy9by4ALvkb5mpEDNXuNV1GS2Dx7
 NqG/ZYkOVsx5g2p8PvOmTy8XBYImb0k=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-rxu8fZ4nPTejVAC5CsNC5g-1; Thu, 10 Dec 2020 17:51:36 +0100
X-MC-Unique: rxu8fZ4nPTejVAC5CsNC5g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqsv7KBmM4h6Vks39bpjKkGT0mIJQC30jIj1cZwil6/BGn03TGc3kdxLB1QHw4Kw61FUJNkMJK0VNqPfbO0EGydQkLGmyJb7roaajCsIN+IsBQUtKo7bY4u4HQYMcyoCZobYFwS1IaGiy5seSZEatGGjGc80smpBA90ik4MaxzE40WHOW5rim8xMIso7M83MeXfIkNAIXf5A/LNakjYH5W+CZS0cXuBYTqakU+QdQAaowJ1iBF+thv5Im1lxx4Y8AbaMlBWmacGdPWhzsRVEdhg4rpWYZQvhUgzXzq/ykwdZ0UMSIFpgIU453u/g1fCSFGtn3WNli48rbmwKUmobUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7YA7y2KomqMhjcYnXJDX7Cu02DVHM45Eei1tjJwrWE=;
 b=cNgZX7PvK7ihSSZyRxfG98oBEM/2V1ExseiDOGysmJPBuzOmSDMR4Nd8Lp5cnmWuTkk31XU3gqeimaI2UP8x3Kya5cmxFol6RfgzXGyN8HyjFxyt0qJCSgA6DTA53HobFr9MeeNruINI2So1/BYd2fV6ByaZnZuXMgfBRRs9D6Bzfc86oM//2nAqzVz5WC0/0zVlzVg6qrJdLPqit97+28KPhmi8Z4UU7HLxDW2qXZQ74oGNZGFRiFjap8aBACUxCOHFfaqJxH4qXPbKtgSeT0NMr/jYn6gAkM1FRkJ36A9ZIkz9xvhgx3l7zqM+kpVMIsBUTZzb02FzcQoVn9LQ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB4958.eurprd04.prod.outlook.com (2603:10a6:803:60::23)
 by VI1PR04MB3278.eurprd04.prod.outlook.com (2603:10a6:802:4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.15; Thu, 10 Dec
 2020 16:51:34 +0000
Received: from VI1PR04MB4958.eurprd04.prod.outlook.com
 ([fe80::f8d9:6b9:eb2:bcde]) by VI1PR04MB4958.eurprd04.prod.outlook.com
 ([fe80::f8d9:6b9:eb2:bcde%7]) with mapi id 15.20.3654.012; Thu, 10 Dec 2020
 16:51:34 +0000
To: ltp@lists.linux.it
Date: Thu, 10 Dec 2020 18:51:16 +0200
Message-ID: <20201210165116.5052-1-bogdan.lezhepekov@suse.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [77.70.99.251]
X-ClientProxiedBy: FRYP281CA0016.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::26)
 To VI1PR04MB4958.eurprd04.prod.outlook.com
 (2603:10a6:803:60::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.suse.de (77.70.99.251) by
 FRYP281CA0016.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.5 via Frontend Transport; Thu, 10 Dec 2020 16:51:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e13e49e-3196-4575-0b0c-08d89d2bda1c
X-MS-TrafficTypeDiagnostic: VI1PR04MB3278:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB327889DC729A2CD3B6E29B5293CB0@VI1PR04MB3278.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9739Jk69yW278VYLtpfCjK31FmdjhwLlndteCU6745/yyYWXcbaz27t3owzlEhEvjde/GJGF6GuSxz9FtZzbDLwyz2qtlI49BRKjwIyBFsVQQKYzcjL/ZmlrTgwaYcrc5cdDirmIPtA0O9P3vIyVk6nhPZ3yCx4f9C1dduy4AQ9DdsoXFhnWYzLuJTpPgpg+jNt432b3x0lc4EBz7EcDvaiIPVzHscpJQNBwaOK6UgpJmwGT14GqoB7KQia165XGh6tcjSbJwgUSXLJvAwlhJI4KalfYjxw7je753iXF/pXEE1WalavvJeksqvyseMFe5azjqU3gezRvwPxhutZt5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB4958.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(376002)(39840400004)(396003)(366004)(52116002)(6512007)(44832011)(4744005)(66476007)(107886003)(6506007)(1076003)(478600001)(66556008)(6486002)(36756003)(66946007)(2906002)(26005)(6666004)(4326008)(2616005)(5660300002)(956004)(316002)(16526019)(6916009)(186003)(86362001)(83380400001)(8676002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?kOvtv0X/7AbrnsHe5j3eIPTupuo54Krcl+toRJa8FhtaTAKrIhONLIqJq9Mv?=
 =?us-ascii?Q?kh5RgLdlgbcbMtnVQS3oXkwo3YD3SMgfvFICODjO+U/l9MVbBH3JQbLxb0XL?=
 =?us-ascii?Q?3ZlUOElJ/GP4l1duzeHQFy3BOaKWv5s32dkJjW55dzludyzz+xZAdtGr47OT?=
 =?us-ascii?Q?UZXPiGMlF8GczcQrqWkVsmik8cG3ZGbHI7esPpLj7013KvhNFpJwkm9nDz2v?=
 =?us-ascii?Q?sg85kKnhYUx4FC2UeKXn/W167bPQF5KRwFwAYH8n+u8yTDhgSNeDa2rJ1CvW?=
 =?us-ascii?Q?jYW1oGxn6ADOLlzTyfjBP9QvZoMEj3onwPWTPBivNeNya53rqV0qUAcDAgyf?=
 =?us-ascii?Q?KqjtccgTQNbY0aDH89o5GTXNVlmb9mxqLspVXLlYqkPomkkewuYK9EFeKH5R?=
 =?us-ascii?Q?AGSx8eRRN+Ymh+m+yeRu1AgR8ydCokXKQaddCRoQ2dUrz6Xv8l6AVRPgMtk5?=
 =?us-ascii?Q?G5Mh4BnfLdiUjnqqNiDtF9xnKh5wnp041k2SEg4b+2xGPPW3OsjXs3wE8ZWB?=
 =?us-ascii?Q?YAus76KK+2d5yG8QUFIxPAaMiRWMumrA+A3PIDgUvPPKDZzB7kQrYBZrDqv5?=
 =?us-ascii?Q?3dcnkQHpfc824ozfdXToX1gfM6vXVz14oWU6o+K5FI/N+8GOTaolNcfKUs06?=
 =?us-ascii?Q?LWTqjT9gm3ovZ9iE16W8bTnrlTjWMCFv5FMkthS4bh2ssaw+8GTfweUR/keT?=
 =?us-ascii?Q?bkKjB8HfpZTVeldGNr21FPv/vczZLZ5vJM7UmHk42Urda+J4Z4BJ3cxnCFvX?=
 =?us-ascii?Q?+zPM3qaJeuC9CB/YvE7FO7gNVzEdCrjv3u7mVlttWnrVPRz8xOIRFJb9Kues?=
 =?us-ascii?Q?X3aJkm9smkpC9nzqxPtFxT4Vopz1nmdMZ/frLOcmjvuNzOMAv8HRZr2jqCLz?=
 =?us-ascii?Q?Ueb1jvcrp6DAdpOrALADr0qAcgdNNAQq+QMEOEO2aljQriNhuY+paEvVYplq?=
 =?us-ascii?Q?aXVgDRk8QwCsgICkspqR3h8xi71eOYwqwrSysjs1Dow=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4958.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 16:51:34.0820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e13e49e-3196-4575-0b0c-08d89d2bda1c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S5MuCEHG1H9OCApS4B2dxXvhfihikU4Hd38PMMuC3aslsYY2U6E0iM7dE63q0vwAKc0nVWEHGKQGso+RpJySoSYCRc/d1TmxL4r5yBeseOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3278
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 11 Dec 2020 09:54:03 +0100
Subject: [LTP] [PATCH v1] openposix/fork/7-1.c: A bug fix
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
From: Bogdan Lezhepekov via ltp <ltp@lists.linux.it>
Reply-To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The function output interferes with the variable errno, that leads to
the false positive result on limited test setups. The issue fixed.

Signed-off-by: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
---
 .../open_posix_testsuite/conformance/interfaces/fork/7-1.c    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/fork/7-1.c b/testcases/open_posix_testsuite/conformance/interfaces/fork/7-1.c
index c3db90c00..4249d713d 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/fork/7-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/fork/7-1.c
@@ -53,12 +53,14 @@ static void read_catalog(nl_catd cat, char *who)
 {
 	char *msg = NULL;
 	int i, j;
-	errno = 0;
 
 #if VERBOSE > 0
 	output("Reading the message catalog from %s...\n", who);
 #endif
 
+	/* the output function interferes with errno */ 
+	errno = 0;
+
 	for (i = 1; i <= 2; i++) {
 		for (j = 1; j <= 2; j++) {
 
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
