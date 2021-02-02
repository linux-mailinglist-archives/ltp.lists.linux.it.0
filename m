Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 087F830BF9E
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 14:37:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CBB203C7454
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 14:37:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 1523F3C741C
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 14:37:33 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8D6A81000A57
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 14:37:32 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 112DTTd9054403
 for <ltp@lists.linux.it>; Tue, 2 Feb 2021 13:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=UwuLiGoK6yTDwQ+bNLFo/Zn9IVpLHAMXyDCjq/iRAUI=;
 b=YJ4uYzLX9PkLt8ZPNwxUKjVErQZeAAQjnuoaEj97BxhGhJfDhUk7PFJXfTayDQMnkIhl
 vXSXq3sRpsDohiQWO8MqcUOnCAVj/vexjnanGpoNcnJveT/fF3ucxKvgQnByR2Xa/C4A
 bYSuUPXdh5D+WrTJHEQXmenVRchP/iU4ZTaD0f6BIq3iMr3b8hUHt1ceVnqSqLN80lyv
 w0mLgse4m+1/zJAgb9Qwe79b2hqmOqHF4gbh9sq/xH+dUpnx4ngjSScqArB5DV5BNCm7
 YYuqFQSswOJHggdvi7a/EiuWdrbwzNygKtw7NbmUhjmESGep9e01dUBuybYmr8lB4ACL nA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 36cydktrcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Tue, 02 Feb 2021 13:37:30 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 112DUCWG028841;
 Tue, 2 Feb 2021 13:35:28 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 36dh7rgam2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Feb 2021 13:35:28 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 112DZRDc011174;
 Tue, 2 Feb 2021 13:35:27 GMT
Received: from gyrotron.nl.oracle.com (/10.175.12.115)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 02 Feb 2021 05:35:27 -0800
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Tue,  2 Feb 2021 16:34:54 +0300
Message-Id: <20210202133454.59224-4-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210202133454.59224-1-alexey.kodanev@oracle.com>
References: <20210202133454.59224-1-alexey.kodanev@oracle.com>
MIME-Version: 1.0
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9882
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102020092
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9882
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102020092
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] lib/tst_net.sh: calc median instead of mean in
 tst_netload()
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

Sometimes the tests can get the following results on a test network:

gre01   1 TINFO: run server 'netstress -D ltp_v0...
gre01   1 TINFO: run client 'netstress -l -D ltp_v0... 5 times
gre01   1 TPASS: netstress passed, mean time 4633 ms, data: 128 22627 134 142 137
...
vxlan03 1 TINFO: run server 'netstress -D ltp_v0...
vxlan03 1 TINFO: run client 'netstress -l -D ltp_v0... 5 times
vxlan03 1 TPASS: netstress passed, mean time 4584 ms, data: 142 140 146 145 22350

One unsuccessful run can have a huge impact on the final result,
when using the mean time with such data.

A more suitable solution for short runs would be to obtain a median
time that can remove all outliers. This will lead to more consistent
performance test results. For example, instead of the above runs, we
would get this:

gre01   1 TPASS: netstress passed, median time 137 ms, data: 128 22627 134 142 137
vxlan03 1 TPASS: netstress passed, median time 145 ms, data: 142 140 146 145 22350

Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
---
 testcases/lib/tst_net.sh | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index f1a498306..ca21fe326 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -761,14 +761,10 @@ tst_netload()
 		tst_netload_brk TFAIL "expected '$expect_res' but ret: '$ret'"
 	fi
 
-	local mean res_sum
-	for r in $results; do
-		res_sum="$((res_sum + r))"
-	done
-	mean=$((res_sum / passed))
-	echo "$mean" > $rfile
+	local median=$(tst_get_median $results)
+	echo "$median" > $rfile
 
-	tst_res_ TPASS "netstress passed, mean time $mean ms, data:$results"
+	tst_res_ TPASS "netstress passed, median time $median ms, data:$results"
 
 	return $ret
 }
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
