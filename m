Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1B763CD48
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Nov 2022 03:22:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A6B63CC631
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Nov 2022 03:22:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5337A3C85AE
 for <ltp@lists.linux.it>; Wed, 30 Nov 2022 03:22:15 +0100 (CET)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9B8CA6008F9
 for <ltp@lists.linux.it>; Wed, 30 Nov 2022 03:22:14 +0100 (CET)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NMNHc1mLMz15N2r
 for <ltp@lists.linux.it>; Wed, 30 Nov 2022 10:21:32 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 canpemm500005.china.huawei.com (7.192.104.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 30 Nov 2022 10:22:11 +0800
To: <ltp@lists.linux.it>
Date: Wed, 30 Nov 2022 10:19:01 +0800
Message-ID: <20221130021901.33143-3-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221130021901.33143-1-zhaogongyi@huawei.com>
References: <20221130021901.33143-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] lib: Replace atoi/atof with
 SAFE_STRTOL/SAFE_STRTOF
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
From: Zhao Gongyi via ltp <ltp@lists.linux.it>
Reply-To: Zhao Gongyi <zhaogongyi@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Replace atoi/atof with SAFE_STRTOL/SAFE_STRTOF in parse_opts(),
it is hoped to deal with the abnormal input.

Modify the requirement iterations range from '>= 0' to '> 0',
when iterations' value equal to 0, the test will not run.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 lib/tst_test.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index b62559d75..254229d96 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -677,15 +677,13 @@ static void parse_opts(int argc, char *argv[])
 			print_test_tags();
 			exit(0);
 		case 'i':
-			iterations = atoi(optarg);
-			if (iterations < 0)
-				tst_brk(TBROK, "Number of iterations (-i) must be >= 0");
+			iterations = SAFE_STRTOL(optarg, 1, INT_MAX);
 		break;
 		case 'I':
 			if (tst_test->max_runtime > 0)
-				tst_test->max_runtime = atoi(optarg);
+				tst_test->max_runtime = SAFE_STRTOL(optarg, 1, INT_MAX);
 			else
-				duration = atof(optarg);
+				duration = SAFE_STRTOF(optarg);
 		break;
 		case 'C':
 #ifdef UCLINUX
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
