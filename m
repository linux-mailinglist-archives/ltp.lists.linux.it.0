Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E099839707A
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:36:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 817593C586E
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:36:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8874B3C5592
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:36:26 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 118A71400F56
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:36:24 +0200 (CEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1519YElO188241
 for <ltp@lists.linux.it>; Tue, 1 Jun 2021 05:36:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=6fH7dt3S4c+bH5Opn+u/j0iuJLN2rEpjc9VoI0PNB2g=;
 b=X9CNXJWRvtsLa8rtTKXDH2l3YAEB4RnCJFzXofez5Ueju4d18EeuKzCPYEXtZcqGqsU7
 D1AA2DJbkKs8YXrifFrKL5qjoQ6eGB5ELqZ+RMmpZJIjGPY2+8ubbDX9iFvlNIBwVZbm
 bKbfut2wZbF6kXpVMQVVQnFWtbdKRGN/14fKgQe51NiG9vi1tVEuDIRholCsgdxAGDMw
 X0VXOkklnK/+p6EhQxqauJ6FxlWcXkP7wI5TWJ7AJuLGeIJixQZNP6O2EmNr7LWZf/jn
 9lj0pbR5tivjpw62xPyF0KTMUhZHP4J6vga6SQo7BdA9gwQKo1yWAXish03X+s4ny8yR BQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38wgb7brpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Tue, 01 Jun 2021 05:36:22 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1519TfDD000499
 for <ltp@lists.linux.it>; Tue, 1 Jun 2021 09:36:20 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 38ucvh9jsx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Tue, 01 Jun 2021 09:36:20 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1519aHtB25952572
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Jun 2021 09:36:17 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDB21A404D;
 Tue,  1 Jun 2021 09:36:17 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E6B1A4057;
 Tue,  1 Jun 2021 09:36:17 +0000 (GMT)
Received: from oc8242746057.lan (unknown [9.171.63.112])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Jun 2021 09:36:17 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: ltp@lists.linux.it
Date: Tue,  1 Jun 2021 11:36:14 +0200
Message-Id: <20210601093614.245873-2-egorenar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601093614.245873-1-egorenar@linux.ibm.com>
References: <20210601093614.245873-1-egorenar@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QCnJ_XBeJgJOJwoBxd1RCUNllEnpjnH-
X-Proofpoint-ORIG-GUID: QCnJ_XBeJgJOJwoBxd1RCUNllEnpjnH-
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-01_05:2021-05-31,
 2021-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106010064
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] tst_wallclock_restore: fix access time of
 /etc/localtime
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

The test clock_settime03 temporarily changes the wallclock to a date in
the year 2038. This has a negative side-effect of changing the access time
of the time zone file to which /etc/localtime refers.

This causes a nasty issue with glibc-2.33 for applications built with -m32
compiler flag. An access time from the year 2038 leads to an overflow error
in glibc-2.33 in
* https://elixir.bootlin.com/glibc/glibc-2.33/source/time/tzfile.c#L167
* https://elixir.bootlin.com/glibc/glibc-2.33/source/sysdeps/unix/sysv/linux/stat_t64_cp.c#L29
when a call to localtime() is made in 32bit mode.

This issue causes e.g. some of strace 32-bit tests to fail because they use
localtime() in 32-bit mode (reproducible on s390x) when we execute it after
the LTP test suite.

To fix this issue, touch the /etc/localtime after the wallclock was
restored.

Test on x86_64 Fedora 34
------------------------
$ stat /usr/share/zoneinfo/Europe/Berlin
  File: /usr/share/zoneinfo/Europe/Berlin
  Size: 2298            Blocks: 8          IO Block: 4096   regular file
Device: fd01h/64769d    Inode: 2623067     Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Context: system_u:object_r:locale_t:s0
Access: 2021-06-01 11:10:14.341921070 +0200   <---- watch this !!!
Modify: 2021-06-01 11:10:14.192920508 +0200
Change: 2021-06-01 11:10:14.192920508 +0200
 Birth: 2021-04-28 22:06:08.389017197 +0200

$ sudo ./clock_settime03
tst_test.c:1311: TINFO: Timeout per run is 0h 05m 00s
clock_settime03.c:35: TINFO: Testing variant: syscall with old kernel spec
clock_settime03.c:103: TPASS: clock_settime(): Y2038 test passed

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0

$ stat /usr/share/zoneinfo/Europe/Berlin
  File: /usr/share/zoneinfo/Europe/Berlin
  Size: 2298            Blocks: 8          IO Block: 4096   regular file
Device: fd01h/64769d    Inode: 2623067     Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Context: system_u:object_r:locale_t:s0
Access: 2038-01-19 04:14:06.067000237 +0100   <---- watch this !!!
Modify: 2021-06-01 11:10:14.192920508 +0200
Change: 2021-06-01 11:10:14.192920508 +0200
 Birth: 2021-04-28 22:06:08.389017197 +0200

$ ~/test-localtime
2021-06-0109:22:31 +0000  # before this fix %z is wrong, it should be +0200

$ ~/test-localtime
2021-06-0111:24:30 +0200  # after this fix %z is correct

Source of test-localtime:
---------------------------------------------------------

int main(int argc, char *argv[])
{
	time_t t;
	struct tm *tm;
	char buf[256];

	t = time(NULL);
	tm = localtime(&t);
	strftime(buf, sizeof(buf), "%F%T %z", tm);

	fprintf(stdout, "%s\n", buf);

	return 0;
}
---------------------------------------------------------

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 lib/tst_wallclock.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/tst_wallclock.c b/lib/tst_wallclock.c
index 838dde8b3..37d3005ef 100644
--- a/lib/tst_wallclock.c
+++ b/lib/tst_wallclock.c
@@ -60,6 +60,8 @@ void tst_wallclock_restore(void)
 
 	if (tst_clock_settime(CLOCK_REALTIME, &adjust))
 		tst_brk(TBROK | TERRNO, "tst_clock_settime() realtime failed");
+
+	SAFE_TOUCH("/etc/localtime", 0, NULL);
 }
 
 void tst_rtc_clock_save(const char *rtc_dev)
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
