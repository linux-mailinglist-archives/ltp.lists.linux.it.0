Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 368DB2D2F68
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Dec 2020 17:25:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01B593C4B8A
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Dec 2020 17:25:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id A065D3C2BDC
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 17:25:09 +0100 (CET)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4C3A22003A6
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 17:25:08 +0100 (CET)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B8GJNJM145534
 for <ltp@lists.linux.it>; Tue, 8 Dec 2020 16:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=g+Pg5PvnGe+c4LLu+DdcAVZhXSHaz0SiN/H6/cJ9H+Y=;
 b=Yr/AzTeMcrZThcGj6ek04rCs2GS/BhdGB6/8epd72fJ7dbh/PANgFeZuSH4e38HVgnGC
 N5nXd9oSAm5RatnnrEC7CrFx2D/oy6yUsJZmXwjexUVAwEsyJMP5EapBz/QnVbJPf+Ng
 1k1VROjZAgIC2WLqxhuIg0XHaU0dxsRc49BHe5yB2QA/YQ1g5PTcdYE8qDP1ZgZn5aTK
 JnLclMTOyGgQcvJ6j2dg3Mv0Mfwkfm76Nr9biy4X+VImdKe2/PRU1u+TlzGkMmZWBweX
 QoiGQulr9ajwtG38FjwSdmyZcOQiWT/vLHRVoRNFVxMUvc0qkI6rS8l4ZcZUjSFM5M3D Ew== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 357yqbus5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Tue, 08 Dec 2020 16:25:04 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B8GFo4q138247
 for <ltp@lists.linux.it>; Tue, 8 Dec 2020 16:25:03 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 358m4y3ehv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Tue, 08 Dec 2020 16:25:03 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B8GP0Ul022146
 for <ltp@lists.linux.it>; Tue, 8 Dec 2020 16:25:02 GMT
Received: from gyrotron.nl.oracle.com (/10.175.28.120)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 08 Dec 2020 08:25:00 -0800
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Tue,  8 Dec 2020 19:24:40 +0300
Message-Id: <20201208162440.14538-2-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208162440.14538-1-alexey.kodanev@oracle.com>
References: <20201208162440.14538-1-alexey.kodanev@oracle.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=1
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012080098
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 mlxlogscore=999
 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080099
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] network/ping02: use tst_ping() from the library
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

Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
---
 testcases/network/tcp_cmds/ping/ping02.sh | 30 ++---------------------
 1 file changed, 2 insertions(+), 28 deletions(-)

diff --git a/testcases/network/tcp_cmds/ping/ping02.sh b/testcases/network/tcp_cmds/ping/ping02.sh
index d4290c873..07a713531 100755
--- a/testcases/network/tcp_cmds/ping/ping02.sh
+++ b/testcases/network/tcp_cmds/ping/ping02.sh
@@ -2,41 +2,15 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (c) 2016-2019 Oracle and/or its affiliates. All Rights Reserved.
 
-TST_SETUP="do_setup"
 TST_TESTFUNC="do_test"
 TST_NEEDS_ROOT=1
 
 . tst_net.sh
 
-do_setup()
-{
-	COUNT=${COUNT:-3}
-	PACKETSIZES=${PACKETSIZES:-"8 16 32 64 128 256 512 1024 2048 4064"}
-
-	PING=ping${TST_IPV6}
-
-	tst_require_cmds $PING
-
-	ping_opts="-f -p 000102030405060708090a0b0c0d0e0f"
-	ipaddr=$(tst_ipaddr rhost)
-
-	if ! $PING -c 1 -f $ipaddr >/dev/null 2>&1; then
-		ping_opts="-i 0.01 -p aa"
-		if $PING -i 2>&1 | grep -q "invalid option"; then
-			tst_brk TCONF "unsupported ping version (old busybox?)"
-		fi
-	fi
-}
-
 do_test()
 {
-	local s
-
-	tst_res TINFO "flood $PING: ICMP packets with options '$ping_opts'"
-
-	for s in $PACKETSIZES; do
-		EXPECT_PASS $PING -c $COUNT -s $s $ipaddr $ping_opts \>/dev/null
-	done
+	tst_ping -s "${PACKETSIZES:-8 16 32 64 128 256 512 1024 2048 4064}" \
+		 -p "000102030405060708090a0b0c0d0e0f" -c "${COUNT:-3}"
 }
 
 tst_run
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
