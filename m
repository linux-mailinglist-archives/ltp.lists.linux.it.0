Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 070DB213687
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 10:37:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AD0CF3C2A2A
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 10:37:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id A2FB43C1360
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 11:51:22 +0200 (CEST)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 006071001754
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 11:51:21 +0200 (CEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0629WiD2054845
 for <ltp@lists.linux.it>; Thu, 2 Jul 2020 05:51:19 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32041fsb94-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Thu, 02 Jul 2020 05:51:18 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0629Wp1E055084
 for <ltp@lists.linux.it>; Thu, 2 Jul 2020 05:51:17 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32041fsaky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 05:51:16 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0629kiQW001363;
 Thu, 2 Jul 2020 09:50:38 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 31wwch5h7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 09:50:38 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0629nGcK57410030
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Jul 2020 09:49:16 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EF3BA4060;
 Thu,  2 Jul 2020 09:50:36 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BB10A405C;
 Thu,  2 Jul 2020 09:50:35 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.74.29])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  2 Jul 2020 09:50:35 +0000 (GMT)
From: Harish <harish@linux.ibm.com>
To: ltp@lists.linux.it
Date: Thu,  2 Jul 2020 15:20:29 +0530
Message-Id: <20200702095029.35220-1-harish@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_04:2020-07-01,
 2020-07-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 suspectscore=1 adultscore=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 mlxlogscore=991
 malwarescore=0 impostorscore=0 cotscore=-2147483648 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007020070
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 03 Jul 2020 10:37:40 +0200
Subject: [LTP] [PATCH] numa01.sh: Fix parsing numastat for given node
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
Cc: Harish <harish@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

In few systems, the node numbering is not necessarily ordered.
E.g.

Per-node process memory usage (in MBs) for PID 2069 (systemd-udevd)
                           Node 0          Node 8           Total
                  --------------- --------------- ---------------
...
...
----------------  --------------- --------------- ---------------
Total                       17.50            0.00           17.50

Patch fixes parsing numastat for given node by finding its awk
index so that proper value is utilized in the test.

Signed-off-by: Harish <harish@linux.ibm.com>
---
 testcases/kernel/numa/numa01.sh | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/numa/numa01.sh b/testcases/kernel/numa/numa01.sh
index 1d626327d..fd437cd15 100755
--- a/testcases/kernel/numa/numa01.sh
+++ b/testcases/kernel/numa/numa01.sh
@@ -25,15 +25,26 @@ TST_NEEDS_CMDS="awk bc numactl numastat"
 
 . tst_test.sh
 
+# Awk the field matching the node value for numastat
+# $1 - Pid number
+# $2 - Node number
+get_node_index()
+{
+	local pid=$1
+	local nid="Node $2"
+	echo $(numastat -p $pid | sed '3q;d' | awk -F '[[:space:]][[:space:]]+' \
+		-v node="$nid" '{ for (i = 1; i <= NF; ++i) if($i==node) print i; exit }')
+}
+
 # Extracts the value of given numa node from the `numastat -p` output.
 # $1 - Pid number.
 # $2 - Node number.
 extract_numastat_p()
 {
 	local pid=$1
-	local node=$(($2 + 2))
+	local index=$(echo "$(get_node_index $pid $2)")
 
-	echo $(numastat -p $pid |awk '/^Total/ {print $'$node'}')
+	echo $(numastat -p $pid |awk '/^Total/ {print $'$index'}')
 }
 
 check_for_support_numa()
@@ -341,8 +352,8 @@ test9()
 		numactl --cpunodebind=$node --membind=$node support_numa alloc_1huge_page &
 		pid=$!
 		TST_RETRY_FUNC "check_for_support_numa $pid" 0
-
-		Mem_huge=$(echo $(numastat -p $pid |awk '/^Huge/ {print $'$((node+2))'}'))
+		local index=$(echo "$(get_node_index $pid $node)")
+		Mem_huge=$(echo $(numastat -p $pid |awk '/^Huge/ {print $'$index'}'))
 		Mem_huge=$((${Mem_huge%.*} * 1024))
 
 		if [ "$Mem_huge" -lt "$HPAGE_SIZE" ]; then
-- 
2.25.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
