Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 819683186C2
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Feb 2021 10:19:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2BE383C6CC2
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Feb 2021 10:19:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 633283C0304
 for <ltp@lists.linux.it>; Tue,  9 Feb 2021 15:37:14 +0100 (CET)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4BD271000AF8
 for <ltp@lists.linux.it>; Tue,  9 Feb 2021 15:37:13 +0100 (CET)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 119EUY85030343
 for <ltp@lists.linux.it>; Tue, 9 Feb 2021 14:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=NIKhj5bK45t3QYz5w0X2nsXT3zYR3/kd/acwXeCzLXo=;
 b=B9247v+RCjG11PFj015/SMb3oK/jVl3Gw5UyYUL0MSTCq6l3vH7sdwarXcpdsXwDh4lE
 n91IYH7c71e2q6ZEmiGX5uz2F9A+BvSZ+gGa2cPAbCS9yQjWMYSv9SeZzL/BUKIFTU7n
 74y9WE64UIpLcbsu62T7uEfEL28BYasOM9zcAEV5xd4vRsaucSnUe8r+AjvHy9mEhHnO
 lo6Qvd7YGT7/x8520XP/gfr80+kbAZhIYlUlzNZ92WWYPezpUIM5/32mzL09LpXy8+5s
 0bZ8k3HrzWNbLJ76Y6xnj9gUJ+XDR7oBnGmYGc36GGDq4/HBxFp/5D93yYwj5OzEoare qg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 36hjhqqpdt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Tue, 09 Feb 2021 14:37:10 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 119EUhmP010965
 for <ltp@lists.linux.it>; Tue, 9 Feb 2021 14:37:10 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by userp3020.oracle.com with ESMTP id 36j4vrd76u-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Tue, 09 Feb 2021 14:37:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCGOAhSD0fDTMvEwEdrvjl72jsU0yHmfvAblfO8d1KiiDP1ofbanF3bjbGkv/WjQLOd5DnPf99IPCcaOR2GSp3SPYTMyvOqfngVYM4ZEhj/I3CFqmUiaIbteKFWN8XlERi64gG9ewHhqbM9tUoabQAJ1CySxYiEdWi/V4fomQ1wZUP3hmnojjQ3UIlKdeXinJXcyK2TDdBHzX0JJ8CCwmLsWMLvGQT4GFrXv5pHngSyHbEIS5oYP8a5Wg4sdAxDzrNRrPVFGLmGdj/h+SXJ+mkObTYJitlM2fCmeYJXcnjUNB7wUH8cVflq6wH+YBQYflmk/PoeY4HY+Bx7uWethRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIKhj5bK45t3QYz5w0X2nsXT3zYR3/kd/acwXeCzLXo=;
 b=CSb0PQsE5bqNn7t2YCRe4sZyhLpogmMjZU+8OJYMdHYaTAlPPJWA/uriyJZofofd2U/3rQpaKpN4URpRepR6scPeZYUT6OG/6PY7nDmioFOvVW5Owv5iHQq4wdvGrT/lxqO1WdP2SEKTb/ENs/A4folKAPMwJ0qkm6LXrztbC/UHKvh18fwT1/XFGuBnghVvwkr+lxA2IU7ZjVo2tCQKGm+lkC0W27cSLEyvOcTjYnOTr2CpLc8VxrX3WShtUXlnM76icGJVp40zOE0zIQH150/1SXFQKaXPCZp5+VTuTi+ZHHq5o7uiGMJ2Kh0sPkNcFUaDNKCCZbb2Z3s5OLSXrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIKhj5bK45t3QYz5w0X2nsXT3zYR3/kd/acwXeCzLXo=;
 b=fSfdb2rOc+OfQbd7rmPwnQmzTeohHFj27qbNmVvqBCymOxC//KUkUcVzXVNvgTOH3tjydMYkQFn4JsTgofKXiZA0XR3Bp27oE1tletth28ed27ebrutK1EUpWZj0lKGwyfIXFN2EUPUvmFpLDVYUzwYeeoLvKLagwSROCsuYbOY=
Received: from MWHPR10MB1582.namprd10.prod.outlook.com (2603:10b6:300:22::8)
 by MWHPR1001MB2126.namprd10.prod.outlook.com (2603:10b6:301:30::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Tue, 9 Feb
 2021 14:37:05 +0000
Received: from MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::cd32:6bce:ab18:83a]) by MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::cd32:6bce:ab18:83a%8]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 14:37:05 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: [PATCH 1/1] brk02: Add test for removing more than one VMA
Thread-Index: AQHW/vEJ2ahBvo0RJE6dlD0EKJ56KQ==
Date: Tue, 9 Feb 2021 14:37:05 +0000
Message-ID: <20210209143702.2003038-2-Liam.Howlett@Oracle.com>
References: <20210209143702.2003038-1-Liam.Howlett@Oracle.com>
In-Reply-To: <20210209143702.2003038-1-Liam.Howlett@Oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [23.233.25.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff55671f-d9a4-4167-df63-08d8cd082c38
x-ms-traffictypediagnostic: MWHPR1001MB2126:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1001MB21260C4A8EC340BE74C8405AFD8E9@MWHPR1001MB2126.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TIMC9t4DW3geocEuuFYNT2wV4knAeWDQzF8jobP2EmieaVqvqk2JW56i2k9E4kvX5DQZ+skFLiDSiDs5Qb0AvIcEzWVTeKbgPpn5cn7r/rVmhr35WG6jdMZMFFJQ4Q4nd+XANpb9H1dINjmm1b32t/9+Y1+gNT+tpqI/qGdbTdNxIfDdIsuDor4QSruOnBnUXJWqujhzb2KkoBxi/pMpGC4YEfBMus2ET/opqKBEWy1d2THlLjv2SU909fL29Gu5OutDcp4oKnVVcMnpO14L+zVkZl3DT2ZCsIb/s373bibXPVWIid9GqhjOa5cefufopY9QsugyQ4vW3zU4Mf+mXj5EPs5Zg5UGEr9dUVMZOmCdRV+w9eeq/1FjsBVgC99fhT4M7ynLHB9IEf34yIGJc+XJnGszbnJEILWh9OSk7FQOfJUZ3xoIN+214Nztd97DZ5yH/qnyvfDhjvOTzkNE1UunkSN06NegT58IzZtl6fMg91j/BYSJ3ix1q1GNsVzCZN8J5P9BIpOfAMHXpY1GtA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR10MB1582.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(366004)(346002)(39860400002)(396003)(478600001)(2616005)(83380400001)(6486002)(316002)(6916009)(4326008)(186003)(36756003)(66476007)(2906002)(64756008)(66556008)(66446008)(6512007)(66946007)(76116006)(91956017)(71200400001)(44832011)(1076003)(107886003)(8936002)(86362001)(6506007)(5660300002)(8676002)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?NfodCH8ohyVGd1cSpV6LJJdMil+6PgBSLvC0BP7oMTTS5ljATy2k7ZE6sx?=
 =?iso-8859-1?Q?c2yrCjzUguJn10onuEIF7xXG2Otrihgi5YmQrX7weh6ss+wLGKpolvdzgh?=
 =?iso-8859-1?Q?GQbBNzoYYsCzJxSOyxxX0T52Zd19wJzphyL6CpcD8lbH60OLxuvg1DfAwj?=
 =?iso-8859-1?Q?b7vwx/GQkTUiPEIkbG6lStCxJdTpoFItv4TsFK0unjuEqBM3NYT4DKtd5/?=
 =?iso-8859-1?Q?DUS7cbsrYLeQKINwlJZjD1aQd74EXPlQEkPdqEMwdvp87MnAOXq07PAfil?=
 =?iso-8859-1?Q?zygRxFkUJ3xzjsLzIbBdovZH3mZVnopE3fV9y7mMvnSwuedS2cAxgLYdjW?=
 =?iso-8859-1?Q?joDCH9C2knhXKaWsnpKzRtsa0u3zmghMt32wsnP74Ba3zUEPUlQVPi5Eus?=
 =?iso-8859-1?Q?4sVVvayE2lucUuml4zjuPnei7XDAswKjui+B98lGFKjdeR3AZ35eP8JwFm?=
 =?iso-8859-1?Q?5YTpAW1qqnwL5ERMI8UF/Z57Wvre8ea4Y2GI/Lozr35LOwT6BtZHCVc3B9?=
 =?iso-8859-1?Q?v3DmucExfCOfD3s7fPLSayWpuXZrmSurpMNOsXTWGJMh6DQOhEbI/Aw6rV?=
 =?iso-8859-1?Q?pK6pbaEbKyqTxsVe+0bzSkHm/gStdypLTO9EIcHF+cWd3AEZySqFIRG1gM?=
 =?iso-8859-1?Q?mypR35ouWVXZuLZgqEwvgkd4uLkCq+Jeuf7EXwjjPoBjrAEHi6RQ/7hlYg?=
 =?iso-8859-1?Q?fhbS4N9m5Oi1ucGNPpq26zUL9dsN9Xkak+JQ0JWknS5m9eN+kSta996wDO?=
 =?iso-8859-1?Q?ckGXQH92cUu/w/Rb7X6d3h7jDoVL2SGvcn0ZPvRbVjUjyqWPyHiHbGkv6V?=
 =?iso-8859-1?Q?3H1K2DgUtJYJv1MHsB8o/KyO4ZK3WrwxW+RbJrbg7caJXvLApopwYiYzP0?=
 =?iso-8859-1?Q?FzvHeF9+o/djPYjQwlpXT7NetlCl9DK3EeSEG0El25N4nllYNffEcB9eja?=
 =?iso-8859-1?Q?yrEr8EYFl1aPd/KTeD9FOKgWrDHiKs0a+Jp5jFwDAJy3Stn0Sildd3nkEg?=
 =?iso-8859-1?Q?h0VxcUDSc0++A/qcwms8Ro3FLNvdvZN8sQ6So5Ug6LQyFD3TPeTMvneUPn?=
 =?iso-8859-1?Q?VdRmuCZWQj5uu8wFNJf/xAwWnDjQ6Yca7EgBelpT8C5JdNzx4vsR+wIAoW?=
 =?iso-8859-1?Q?zSe2wNGa8/U8ZCwc26W50qZR1bazVPTdHVxZGp83J6AH0iDSjbmKEUUntN?=
 =?iso-8859-1?Q?DpyF0rw992lmjxGlFXPCnIt2n0qOA5q4id7OUOccn1r/g0fGOOzVIqF2n/?=
 =?iso-8859-1?Q?y6H0EL6/WhI3j/tGoaRSpA7UuT5FErJRoNRBjWOntzebXLgaUo5L1T3XkW?=
 =?iso-8859-1?Q?LVSTnbJZLRE1iNJOvoRC0iCxGFguXrKW+oUQd/zEG85aV7cidHuDbU4DkV?=
 =?iso-8859-1?Q?yuQaF3NiT4?=
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR10MB1582.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff55671f-d9a4-4167-df63-08d8cd082c38
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2021 14:37:05.2155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ABh10sT2+JpC3dNRiEta8XmT1vuaGxfc98bgwgpctEbtexA+Ot6BFMIm3WQIelYpot75A6/4HSIs4AZenZ9dog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2126
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 mlxlogscore=967 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090075
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102090075
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 11 Feb 2021 10:19:10 +0100
Subject: [LTP] [PATCH 1/1] brk02: Add test for removing more than one VMA
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
 testcases/kernel/syscalls/brk/brk02.c | 49 +++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 testcases/kernel/syscalls/brk/brk02.c

diff --git a/testcases/kernel/syscalls/brk/brk02.c b/testcases/kernel/syscalls/brk/brk02.c
new file mode 100644
index 000000000..834fe9f2f
--- /dev/null
+++ b/testcases/kernel/syscalls/brk/brk02.c
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 Liam R. Howlett <liam.howlett@oracle.com>
+ *
+ *  
+ *  Expand the brk by 2 pages to ensure there is a newly created VMA and not
+ *  expanding the original due to multiple anon pages.  mprotect that new VMA
+ *  then brk back to the original address therefore causing a munmap of at
+ *  least one full VMA.
+ */
+
+#include <unistd.h>
+#include <stdint.h>
+#include <sys/mman.h>
+
+#include "tst_test.h"
+
+void brk_down_vmas(void)
+{
+	void *brk_addr = sbrk(0);
+	unsigned long page_size = getpagesize();
+	void *addr = brk_addr + page_size;
+
+	if (brk(addr))
+		return;
+
+	addr += page_size;
+	if (brk(addr))
+		return;
+
+	if (mprotect(addr - page_size, page_size,
+			PROT_READ|PROT_WRITE|PROT_EXEC))
+		return;
+
+	addr += page_size;
+	if (brk(addr))
+		return;
+
+	if (brk(brk_addr))
+		return;
+
+
+
+	tst_res(TPASS, "munmap two VMAs of brk() passed.");
+}
+
+static struct tst_test test = {
+	.test_all = brk_down_vmas,
+};
-- 
2.28.0

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
