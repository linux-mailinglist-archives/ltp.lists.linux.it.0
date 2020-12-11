Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 377132D7301
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Dec 2020 10:44:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B656E3C61C6
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Dec 2020 10:44:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E97D43C2AB3
 for <ltp@lists.linux.it>; Fri, 11 Dec 2020 10:44:35 +0100 (CET)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [51.163.158.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4DB281000CDD
 for <ltp@lists.linux.it>; Fri, 11 Dec 2020 10:44:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1607679874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zd0T8Jjs0WInsTJ/3Tp7+m9nXjLIQ471YdH9m/RcEXU=;
 b=I6ht24Lq4btPWUWhYJhKDq+7W5qH4GgnIgWhnZxU1VzFt8Pe5vQr4hvSppX5lFb43LO6+n
 d0/YZ0Us+BWeWMhQMmPoBm5w9PzzsrXGvXlFTSQjZZ9/TAYSLkNv5G7NDdOzbxad2MV7hs
 MHsEe9kVsXYOOlKRDVeQJP5xJoPMSro=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-6OaKdLOAMrmNn4RwvjQXfg-1; Fri, 11 Dec 2020 10:44:33 +0100
X-MC-Unique: 6OaKdLOAMrmNn4RwvjQXfg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqIF5khYB2j5/ACkshSa/YrvCNPG7JuEqN+Imo0Zy4uCDu6PFhcEcGSR2XV6WJZ4XxwU4iqjtmwWFzNtukxF+j1Ta5aNueid0b1ocuw1XdqmFXkCkYs9XmX6CX45hQDm0B/ykEk5mgaaQXNk+aCJsl+iItT4klLR37gPF3Er83FN4hq1R/3oNnOlwhE9yoKP96+1vasIzbvTCkfEKXETHJtC6dtapsXbE7qRBiNgYUB9u+Ff7854/VFC+otON87CCBmLbaS2/BcuWVUsePgJWcHMwZYPetyx4+YQLkyUv/8oG1ouU9curwcyaV05m/Yga4NZzretn3Yt46DWs0T2kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7YA7y2KomqMhjcYnXJDX7Cu02DVHM45Eei1tjJwrWE=;
 b=fou24/GQAyKFl1rP9wIY3aFenzzwHX8L1rP6CQAxGwxE32vHIHe41A4Nq8EHre4HpD/g0dQMbTYDxYBzEY/HWZ319T7ztexVZ1tLrrq50M2QR5yo07aGog5ncwEuMmJoYpUwGood8shdtw9e1J4GolpjhJekZhcVksph1ac/YX4eifcesmXOXbhBX/iphm0IdZCckqu8myN7V8B1kTrkyeHdabWZ5ZRwICTQgdbjx4ZhkjznZoRmmd8SmCfMqbaKYz3vE53X+SDyBzggs5XdxgDZhxGdSgKGa5iaemX2WLnxo7THnojYW2QqFMGIsA6Brq0EuGRaAh7AmktcXw+tRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB4958.eurprd04.prod.outlook.com (2603:10a6:803:60::23)
 by VE1PR04MB6656.eurprd04.prod.outlook.com (2603:10a6:803:126::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 09:44:32 +0000
Received: from VI1PR04MB4958.eurprd04.prod.outlook.com
 ([fe80::f8d9:6b9:eb2:bcde]) by VI1PR04MB4958.eurprd04.prod.outlook.com
 ([fe80::f8d9:6b9:eb2:bcde%7]) with mapi id 15.20.3654.012; Fri, 11 Dec 2020
 09:44:32 +0000
To: ltp@lists.linux.it
Date: Fri, 11 Dec 2020 11:44:16 +0200
Message-ID: <20201211094416.26616-1-bogdan.lezhepekov@suse.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [77.70.99.251]
X-ClientProxiedBy: AM0PR02CA0155.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::22) To VI1PR04MB4958.eurprd04.prod.outlook.com
 (2603:10a6:803:60::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.suse.de (77.70.99.251) by
 AM0PR02CA0155.eurprd02.prod.outlook.com (2603:10a6:20b:28d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Fri, 11 Dec 2020 09:44:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c78b551-9e13-46b7-e67d-08d89db95cd5
X-MS-TrafficTypeDiagnostic: VE1PR04MB6656:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6656EAE9F424C2F43B1E1CA993CA0@VE1PR04MB6656.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dWNXhER/MpSJ65Sm5/Fo/nzi7bDwb6zK9C6hLuhpLcXSPUCQjohiWrSey8d7pqW9JF6jsfP4175L9FO6B5hE2cgZhsT4PiLgdtdvdZGZ4TNH7KIUDHF7REperQJeJa5bIWp9uFZKf5ficfqmKS9HbYc3MTLE8IHNoa0fV7ybvBfKshb4GCBVgwvwfeZqB+CrQr1Nc6rAQtiglQcYMK2d2Yi/nK1zn2P1Z8/GiKfyb2/mskrNmxiOENTSyIw3tfJX1Cc2bj0dMeh1c9HI5slVPe3JSSWJOiqnqDXerV04swU295WfNwsKCGtAIfh/NcC1u0vLu7tmtvkR2a9YsN6KVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB4958.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(39860400002)(136003)(366004)(396003)(36756003)(16526019)(44832011)(8676002)(26005)(4326008)(5660300002)(6486002)(316002)(186003)(6512007)(66556008)(2616005)(8936002)(956004)(66946007)(4744005)(478600001)(6916009)(6506007)(6666004)(66476007)(2906002)(107886003)(83380400001)(52116002)(86362001)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?aodokdJvQ2UJclwHqvmHBaP66YWPO97zmU1rNgLNm1Rgsk3MPfcSxBA/cZcP?=
 =?us-ascii?Q?lRab2SJJ1HEg93/miNWVCJSZeNhceG/mB9j4w3BBe1UfH55hGUxz0HoYH8hz?=
 =?us-ascii?Q?7+5cxZvmNpzIcu1dnQk2MoGIoK0ZRMuwBUIxK0SGJHoCsp8GuuCGEFC9TOuT?=
 =?us-ascii?Q?9vRAcsaFPLCS060vYy3wO3FJA3fA0sVr5WX+M5VOoKaYSJzfZb9FAdamhT5p?=
 =?us-ascii?Q?y4/flyXe3K7mHkZSGFkn1qGPUk1fBU0nauddQtEQuE3sk1YvuQRgASdYv2zW?=
 =?us-ascii?Q?PkQ4DAjPffpwWdoNdHcTPmgTQYffSK+lwxCqCgbamSXnWZKBSg/TNOXksblL?=
 =?us-ascii?Q?+pWibpMpjethkMGDrGScqZmaDcuFpp4IAJ/iqAvQAOzFb+Elp0aAwq5SP+xO?=
 =?us-ascii?Q?cgl0C9mUbo1bF4RlnJYRpoHubmeSsIcWGw0w2iE89P/jmYHmp7tDpxA8AK94?=
 =?us-ascii?Q?hECkZEQSQFNq0sFMRqSapavJ7a7q1x3zuN+qvQjhLASQcoZbbEwexYicRg7x?=
 =?us-ascii?Q?vi3SA9W5pIwv8oYKU4EcL7ZAlMkA4atoi1z+JEpA8W1dNYqb+sT40/t95RKF?=
 =?us-ascii?Q?oNV+xMeUGuxNFhezt9vfVHFB+5e2XdxaB93Sf/cCaerxpA5vMVkmTQruMyq5?=
 =?us-ascii?Q?v79/mKMlTy17lqokZTb0jnjAKRPJ+/aJbIAj6UIpRmavfrgof4U5NcwDvRnn?=
 =?us-ascii?Q?pkXZ+/UhFsNu8gQiKS2HD8J6ngFamGKQkBkv2wJ5uJ5KOPFH4+dGnBS5IRJC?=
 =?us-ascii?Q?VWnWWSoTAKBnJqYgreHodOyIsEyKXSSkJOESWBdPMWzaDpGyv69Yyv+Nfc/R?=
 =?us-ascii?Q?vSvAiELJWDUCwxM9FtRCzsAu0HtJ75Coq1AAC4PuDqA75MKM8apOaCeyOggp?=
 =?us-ascii?Q?x0S46wo/bp4wmxum2Zny8Eh0FlpxoYqpiEIZgC3dKtGTPGginSbE9a+aDaO6?=
 =?us-ascii?Q?RHk7omLBDN6URyVkSq5ZZ5pfF3sqT/N/Ls5Ku+lom6I=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4958.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 09:44:32.3508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c78b551-9e13-46b7-e67d-08d89db95cd5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZ7Br37qbF8WuKDVM/XHm7M3xStEVoXtMILfPzr1qcoQ4WvsMytzDNVcYRivQKJCgYSYN9yaIA9n1npEicMsqlcUG0ghg1GL5iUCziBx1tE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6656
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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
