Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C832F7E49
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 15:33:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B7C5C3C6A11
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 15:33:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 5E2883C6A06
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 15:33:28 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 61790601492
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 15:33:26 +0100 (CET)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10FE3U62168985
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 09:33:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=MYBe2OAJ5nQhMNPl6Y3GJ7zGgEKxvfYKmt+A84pX/U8=;
 b=hvp3JTniziDH6ka9Sq5rgww38lLO6mHBcfos6i3/ZBTHq7s4CRTU4iIg7UnCyVYMXn6D
 pOMMxNmUtDcrJkwnyhkcXsHMmRHCxIsr2POwjfcN8MZ6iXwL6ZrBp+eK4hu2J3OyowTi
 XbYeZcAwcRBHc14csUlLRMayNm5nI75wsgoxSIjOwxZWpUQj8CCYlhw/ZMKT/Gn70TjA
 w+37YFRuYbew5Prd/YYQBF8a4tBYfx8PETfdZdJ5sshZFkP7e4FsF9qsOLHRkEoofR3f
 cUQLBZGZERIDiVTP4KAnEDyD6w1M+qtVw1+OxbI+9CyI52Dwwl12hzeOcrrq0C6VKzmZ /w== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 363behjp99-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 09:33:24 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10FERJe6013217
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 14:33:09 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3604h9bakm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 14:33:09 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 10FEX1Ci28705276
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 14:33:01 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6BCEAE055;
 Fri, 15 Jan 2021 14:33:06 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECD9BAE045;
 Fri, 15 Jan 2021 14:33:05 +0000 (GMT)
Received: from oc8242746057.ibm.com.com (unknown [9.171.20.24])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 15 Jan 2021 14:33:05 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: ltp@lists.linux.it
Date: Fri, 15 Jan 2021 15:32:46 +0100
Message-Id: <20210115143246.369676-1-egorenar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-15_08:2021-01-15,
 2021-01-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0 mlxlogscore=808
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101150088
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] swapping01: make test more robust
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

Increase time waiting for swap memory to settle before
performing checks with occupied swap memory. This decreases the chance
of the test to fail in the case of the swap memory taking longer
than expected to settle.

This fixes sporadic failures observed on IBM s390x systems such as this:

swapping01.c:149: TPASS: no heavy swapping detected, 4534 MB swapped.
swapping01.c:106: TINFO: available physical memory: 7348 MB
swapping01.c:109: TINFO: try to allocate: 9552 MB
swapping01.c:112: TINFO: memory allocated: 9552 MB
swapping01.c:140: TINFO: swap free init: 25019 MB
swapping01.c:141: TINFO: swap free now: 20484 MB
swapping01.c:149: TPASS: no heavy swapping detected, 4534 MB swapped.
swapping01.c:106: TINFO: available physical memory: 7348 MB
swapping01.c:109: TINFO: try to allocate: 9553 MB
swapping01.c:112: TINFO: memory allocated: 9553 MB
swapping01.c:140: TINFO: swap free init: 25018 MB
swapping01.c:141: TINFO: swap free now: 17694 MB
swapping01.c:149: TPASS: no heavy swapping detected, 7323 MB swapped.
swapping01.c:106: TINFO: available physical memory: 7318 MB
swapping01.c:109: TINFO: try to allocate: 9514 MB
swapping01.c:112: TINFO: memory allocated: 9514 MB
swapping01.c:140: TINFO: swap free init: 25019 MB
swapping01.c:141: TINFO: swap free now: 17697 MB
swapping01.c:145: TFAIL: heavy swapping detected: 7322 MB swapped.

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 testcases/kernel/mem/swapping/swapping01.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/mem/swapping/swapping01.c b/testcases/kernel/mem/swapping/swapping01.c
index 24b8313f3..befb52e91 100644
--- a/testcases/kernel/mem/swapping/swapping01.c
+++ b/testcases/kernel/mem/swapping/swapping01.c
@@ -127,10 +127,10 @@ static void check_swapping(void)
 
 	/* Still occupying memory, loop for a while */
 	i = 0;
-	while (i < 10) {
+	while (i < 30) {
 		swap_free_now = SAFE_READ_MEMINFO("SwapFree:");
 		sleep(1);
-		if (labs(swap_free_now - SAFE_READ_MEMINFO("SwapFree:")) < 512)
+		if (labs(swap_free_now - SAFE_READ_MEMINFO("SwapFree:")) < 10)
 			break;
 
 		i++;
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
