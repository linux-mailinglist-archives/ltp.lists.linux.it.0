Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E86F3245CE
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 22:31:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A2A393C5A8F
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 22:31:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id B96A73C5A67
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 22:31:32 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E07E91A01187
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 22:31:31 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11OLO1Hr107919
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 21:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=qxbPxsixg1I2GkzPPOkyq0m0YiVtZxm8Neiy6jcgN2o=;
 b=YZFkcBd0BISAzKVVKmo0XwnhZf74TXWhXkwIT1QiFa/ZzFvwES0XHB6saCTP8V7OX+x0
 lAC4rwRk75AyiFmMUa5PVKqKfHufQn1SaOfxkE8+GbHs2KyjtK4vz1bM1uTxI9VoWmMQ
 LXPs66IRp5iGOoMTV9jbeGo3MuvTUsF53QS/YQXRjTdDVxKyfInkhCzuIAxVhneln3wW
 c0doY5keJZaaHGZKfi5TF8kDqT3+DzKvW3lN8UhPpIjPMG/kwRdyft4+lkdsbcrpcr4x
 xyva5rOp/UDVPsYL4cHYE2yrU8gMowjj7dJUjhNyT+rgEH53FggIG2ByEAAtaHw4+tKl sA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 36ttcmceqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 21:31:27 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11OLQCjl052783
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 21:31:26 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by userp3020.oracle.com with ESMTP id 36uc6tnjvu-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 21:31:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2UrXLM4NKRG3FSkrQvpNczdyxE3tNzaM2BNOeIdwsxWaWW//6HSZC9uLlv+yktu2o6PFuY67LJ+GnYQhvesij6LPJlViKxgecqfV+R8URNzMwxWnfmToUUckEz/kelK3loy/U54fWqraoXcsF2xeECSUDsKDjwKwxICxcIPK73am0G4943+2g0wZly3o6ua0RIaCjhKVF3QE0LlTY5U4q8q9SW8hblhbCwvMQ1sH7cucJKiz5Y7/AbNKd7gQKEJn0gDFKeKJQQdzLkUQYfZxBm2+kJMsi0g1oa5snZX9nhQlyp5war8PeygxLAsJGerhqv29+e5XlqOEnzn133R7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxbPxsixg1I2GkzPPOkyq0m0YiVtZxm8Neiy6jcgN2o=;
 b=Cb4i9NXGWtJQFIVmmq9lutFlfUNB8wG44m3huecABDc5EIjaLKXY+AAKTfPQug5N71lrDqPgQRmUJowE4BZXlHBvbPRcH15ivEq8t3z0I7tfSW6y0hZxTpn+YuEI0X3EA7YAQYLqk3ts8dfDB23h5of+ZrChxYWkfE8vsKudw3moVP7J0f4vodL9tlIa4EaZM5BRTsLE6s66HOh5q/u9nbWgNQJDNj9TWdr+TKcxjocVR46+pMbWotrVJE6KHiG1T1bv2mncI5asN30AXkY/UeDKmLUx24g966JU0obKa6EqtrnoKVNOrdIkwYqf2D1XsgUVjtfqtzxJQRgelvj0Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxbPxsixg1I2GkzPPOkyq0m0YiVtZxm8Neiy6jcgN2o=;
 b=lZklx6pPLj5TmHePISBYzCUzpyRpv5SNLt5AVziZr7a/ERW1tw5zf8x82xICXbwQpHX8Q27TGosTQxRDi7ZMb1jn5IAkq6z6jmb4K0Ya6NDHwKwjFDTn1kKZZYotw6VKo0e5PPMcPiekOTwaEz4BK7/kn8NAL9+kLdWpNWIWF/k=
Received: from MWHPR10MB1582.namprd10.prod.outlook.com (2603:10b6:300:22::8)
 by MWHPR10MB1791.namprd10.prod.outlook.com (2603:10b6:301:9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.30; Wed, 24 Feb
 2021 21:31:24 +0000
Received: from MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::ac3f:8441:8f0c:2c89]) by MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::ac3f:8441:8f0c:2c89%11]) with mapi id 15.20.3890.020; Wed, 24 Feb
 2021 21:31:24 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: [PATCH v2 1/1] brk02: Add test for removing more than one VMA
Thread-Index: AQHXCvRm2LPXqQYmf0Wq1gEM3bkluQ==
Date: Wed, 24 Feb 2021 21:31:24 +0000
Message-ID: <20210224213114.2976705-2-Liam.Howlett@Oracle.com>
References: <20210224213114.2976705-1-Liam.Howlett@Oracle.com>
In-Reply-To: <20210224213114.2976705-1-Liam.Howlett@Oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.30.0
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [23.233.25.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c9c7e81-9a68-4cd1-a70e-08d8d90b896e
x-ms-traffictypediagnostic: MWHPR10MB1791:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR10MB1791B806033A776EF4491DF8FD9F9@MWHPR10MB1791.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D0FkXeHpVGygqy9O42UV6up5O/XaOCR/E4XblK8nSRYz6RaGFo+e/F9pX62PPk+/5+6rlbKMGRaIkX0njLcgGMZZm7r5/mqCO2NuVsh7zQcFCy0PNqqnYzVJ6wCwlHY/12y2CoIsAJ5PxY6N7O2ymQIlkGZo2+Nix2OwLzaO/2FL3M+8d9Yz+2IKCS9/SYiOAEBcNsfk/rd6verjTDF7ubh6K+J/RD4591zMbMha07PnDU8CFbJj5yB6a6aZow0xdc9aWoxcZVUMse7mARjRTzHEhRDaP3FcNg63ALvf1amhgznNKjpAQHkjZpbK/ZvVeKyaCmgLd2bYM2Ihq2/ByeCiCqWJuhjszdmL2Nnd5zjEmBFVs484qZ55tuCS8w3DrKg6bJzQZLgd3iXalgLouKud3z1BTYGWWDbnuT3DCz6f3hZDKlyowpauoczNyXqBMi3oaFMHyUAp8du0z5uqBAKv13PNUTsuG2oVa8MuRSt/IOFFwaTZjm+7NR5S14Mw9+Mv27WhXzIcUKvCSPn1IQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR10MB1582.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(136003)(396003)(39860400002)(366004)(4326008)(36756003)(71200400001)(44832011)(6512007)(1076003)(107886003)(6506007)(2616005)(478600001)(66446008)(76116006)(5660300002)(66946007)(91956017)(8676002)(86362001)(83380400001)(186003)(64756008)(2906002)(6486002)(66476007)(6916009)(8936002)(26005)(316002)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?QcyWD2gXQ2htYQ+3p/AUbh20za57aSf9L41ylCs9vEZ/pZyafuXBollz3U?=
 =?iso-8859-1?Q?DS6i1vQROdDNdIUbmqUyxApZ8/HXe21f/ig2qiQPSSp3TC62dqPXRGvrB5?=
 =?iso-8859-1?Q?H8jm3xWpRS9DbByhaUZN3x+aYhHP2ScadWgMV2LgnEkDhcVv9Ms+uPVbpz?=
 =?iso-8859-1?Q?4Rc1HZsFmp3FfI+sb6WfKTUHAxPKOw66lq9n1p4IMcKA7dByAcbn2Dpw5Y?=
 =?iso-8859-1?Q?YQ3amGqg17lP6VqFRTaq0eeUA+tJnFm2+Cg5tV6pBS3qxj9oxK6/JbbM5Z?=
 =?iso-8859-1?Q?+n0MO9sHju/2iCVxbRbZFtnm3G2GkO/HV97V+Uc4UQ6MMgeY0bbuq6+Cjz?=
 =?iso-8859-1?Q?brHRVykRNCBJoNJwkmZkp9FQR9p6hm9tZgA5HozV4uf5HAoGeRaEw1OIKe?=
 =?iso-8859-1?Q?ecIJQKMASF84eY+bkiX0QWT2WxgBCO5IETdlfq4ql2Orvh0yOMZg/vWQVG?=
 =?iso-8859-1?Q?/fBb146v8sCMIaezZi64n7gmagwaKCUF/+ACv+xpFye3OjDY2WimFtAdI9?=
 =?iso-8859-1?Q?GziVwGMgrE+kmNc02zv9GYbedq6MqxVHInWaomj8MGQzgNOkXWxiJcHjAH?=
 =?iso-8859-1?Q?ZhnIhvIbx+CBKt9KCQnTnmleUuAR1nrXJPwDriI/VvZu+KPFTeNBPYW0iC?=
 =?iso-8859-1?Q?tAJNONBQR10yq11JqDXrqvpeViyajz3OxB/byPQOfE2FNBt4+L2SdDpOJa?=
 =?iso-8859-1?Q?x9Qb87L/suurN68gnT0fogpK2RWLBGVD5c2nGjFOwuUOztgmxsV50+lwCu?=
 =?iso-8859-1?Q?5tzuByw26iUOxMHHH2HlmoWbHp3XqYqom42t24BhI+TGM9QafFg06ONcKi?=
 =?iso-8859-1?Q?nf4E+odiWM3kaXHUVV11Th0290ybqmxCcxXeSOPMQp1/LwiP4Ae6tFSsJ/?=
 =?iso-8859-1?Q?rkxitKtLpBqLCKDDLthTOVJ2mQNq+FE3+Ff+LLLncJKo5G+mJZxkJNYKKf?=
 =?iso-8859-1?Q?boRTYOIqkRL2FGlY+KVb4P2lWQWFQu7Nq+QtrZ1HTZZMGRv4r2mR5hVC8J?=
 =?iso-8859-1?Q?kVDCYcLgtlInNjmMFsKBuasWRileY3WLPtannIXi+O4HtGzItPX4OzsJwI?=
 =?iso-8859-1?Q?QrvbUj9zZicDwD2TVxrPybm0ItZFmNOD6EDCkGoX+Geh/y6iKdXIGBMDvO?=
 =?iso-8859-1?Q?Z5OP3vkvGaPpzYqgYXFyrnbawLrskZeY6H7C9CzFc0mmM+G5fTM4ODciUq?=
 =?iso-8859-1?Q?fBdyg/EtFsgEKiyh3zSG5nYrqcTVN1Vho2rs6nE2t1HT759gVEW5EIxhhR?=
 =?iso-8859-1?Q?I3PKPYuIrXMvp+vuWedU7zsBdB7iZvninmoo8V27jnnGqMQpug9flAS1xV?=
 =?iso-8859-1?Q?ZSTWWug2QvqQO14LELRqd9srC3BjuZfY9/X+5f/fuTZeJn9kE1BNItPLpd?=
 =?iso-8859-1?Q?eicoBbFZKQ?=
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR10MB1582.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9c7e81-9a68-4cd1-a70e-08d8d90b896e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 21:31:24.2454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0X201G/bSKtZi8wFzqYgU3nEgpuSY658RV9n3cAMnJpJzG3Lm4CVd5E2Qm3wZ6lLXpRiByAuZKQGKzo8C9unyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1791
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9905
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 spamscore=0
 mlxlogscore=983 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102240166
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9905
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102240166
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/1] brk02: Add test for removing more than one VMA
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
Cc: Liam Howlett <liam.howlett@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

When brk expands, it attempts to expand a VMA.  This expansion will
succeed depending on the anonymous VMA chain and if the vma flags are
compatible.  This test expands brk() then calls mprotect to ensure the
next brk call will create a new VMA, then it calls brk a final time to
restore the first brk address.  The test is the final brk call which
will remove more than an entire VMA from the vm area.

Signed-off-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
---
 testcases/kernel/syscalls/brk/brk02.c | 54 +++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 testcases/kernel/syscalls/brk/brk02.c

diff --git a/testcases/kernel/syscalls/brk/brk02.c b/testcases/kernel/syscalls/brk/brk02.c
new file mode 100644
index 000000000..ef84fb440
--- /dev/null
+++ b/testcases/kernel/syscalls/brk/brk02.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 Liam R. Howlett <liam.howlett@oracle.com>
+ *
+ *  Expand the brk by at least 2 pages to ensure there is a newly created VMA
+ *  and not expanding the original due to multiple anon pages.  mprotect that
+ *  new VMA then brk back to the original address therefore causing a munmap of
+ *  at least one full VMA.
+ */
+
+#include <unistd.h>
+#include <sys/mman.h>
+#include "tst_test.h"
+
+void brk_down_vmas(void)
+{
+	void *brk_addr = sbrk(0);
+	unsigned long page_size = getpagesize();
+	void *addr = brk_addr + page_size;
+
+	if (brk(addr)) {
+		tst_res(TFAIL, "Cannot expand brk by page size.");
+		return;
+	}
+
+	addr += page_size;
+	if (brk(addr)) {
+		tst_res(TFAIL, "Cannot expand brk by 2x page size.");
+		return;
+	}
+
+	if (mprotect(addr - page_size, page_size,
+		     PROT_READ|PROT_WRITE|PROT_EXEC)) {
+		tst_res(TFAIL, "Cannot mprotect new VMA.");
+		return;
+	}
+
+	addr += page_size;
+	if (brk(addr)) {
+		tst_res(TFAIL, "Cannot expand brk after mprotect.");
+		return;
+	}
+
+	if (brk(brk_addr)) {
+		tst_res(TFAIL, "Cannot restore brk to start address.");
+		return;
+	}
+
+	tst_res(TPASS, "munmap at least two VMAs of brk() passed.");
+}
+
+static struct tst_test test = {
+	.test_all = brk_down_vmas,
+};
-- 
2.30.0

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
