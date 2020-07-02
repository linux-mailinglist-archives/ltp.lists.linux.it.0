Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E64C6213688
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 10:37:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8CC4C3C2A33
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 10:37:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E61D93C0781
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 12:34:11 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4E8181000AEB
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 12:34:10 +0200 (CEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 062AUqZe051654
 for <ltp@lists.linux.it>; Thu, 2 Jul 2020 06:34:09 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 320wmp8pqx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Thu, 02 Jul 2020 06:34:09 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 062AV4ZV052433
 for <ltp@lists.linux.it>; Thu, 2 Jul 2020 06:34:08 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 320wmp8ppq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 06:34:08 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 062AThk7022248;
 Thu, 2 Jul 2020 10:34:07 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 31wwr8e0h6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 10:34:06 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 062AY4rV45088992
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Jul 2020 10:34:04 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1A82AE045;
 Thu,  2 Jul 2020 10:34:04 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BD4CAE04D;
 Thu,  2 Jul 2020 10:34:03 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.74.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  2 Jul 2020 10:34:03 +0000 (GMT)
From: Harish <harish@linux.ibm.com>
To: ltp@lists.linux.it
Date: Thu,  2 Jul 2020 16:03:58 +0530
Message-Id: <20200702103358.38892-1-harish@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_04:2020-07-01,
 2020-07-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 adultscore=0 cotscore=-2147483648 suspectscore=1
 phishscore=0 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007020074
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 03 Jul 2020 10:37:40 +0200
Subject: [LTP] [PATCH v2] numa01.sh: Fix parsing numastat for given node
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

Fixes: 702
Signed-off-by: Harish <harish@linux.ibm.com>
---
Changes from v1:
* Rebased on top of http://lists.linux.it/pipermail/ltp/2020-July/017893.html
* Added Fixes tag

---
 testcases/kernel/numa/numa01.sh | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/numa/numa01.sh b/testcases/kernel/numa/numa01.sh
index a217db033..0521794e9 100755
--- a/testcases/kernel/numa/numa01.sh
+++ b/testcases/kernel/numa/numa01.sh
@@ -25,6 +25,17 @@ TST_NEEDS_CMDS="awk bc numactl numastat"
 
 . tst_test.sh
 
+# Awk the field matching the node value for numastat
+# $1 - Pid number
+# $2 - Node number
+get_node_index()
+{
+       local pid=$1
+       local nid="Node $2"
+       echo $(numastat -p $pid | sed '3q;d' | awk -F '[[:space:]][[:space:]]+' \
+               -v node="$nid" '{ for (i = 1; i <= NF; ++i) if($i==node) print i; exit }')
+}
+
 # Convert the value of given numa node from the `numastat -p` output,
 # multiply by size.
 # $1 - Pid number
@@ -33,9 +44,9 @@ TST_NEEDS_CMDS="awk bc numactl numastat"
 get_mem_cur()
 {
 	local pid=$1
-	local node=$(($2 + 2))
+	local index=$(echo "$(get_node_index $pid $2)")
 	local size=$3
-	local numstat=$(numastat -p $pid |awk '/^Total/ {print $'$node'}')
+	local numstat=$(numastat -p $pid |awk '/^Total/ {print $'$index'}')
 
 	if [ -z "$numstat" ]; then
 		echo 0
@@ -350,7 +361,8 @@ test9()
 		pid=$!
 		TST_RETRY_FUNC "check_for_support_numa $pid" 0
 
-		Mem_huge=$(echo $(numastat -p $pid |awk '/^Huge/ {print $'$((node+2))'}'))
+		local index=$(echo "$(get_node_index $pid $node)")
+		Mem_huge=$(echo $(numastat -p $pid |awk '/^Huge/ {print $'$index'}'))
 		Mem_huge=$((${Mem_huge%.*} * 1024))
 
 		if [ "$Mem_huge" -lt "$HPAGE_SIZE" ]; then
-- 
2.25.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
