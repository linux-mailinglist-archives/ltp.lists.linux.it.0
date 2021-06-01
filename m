Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7021F3972DE
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 13:55:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 24B3D3C8017
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 13:55:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B4DCC3C5E22
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 13:55:06 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8FE2F6012D8
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 13:55:04 +0200 (CEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 151BY2Nr172636; Tue, 1 Jun 2021 07:55:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=74nl9YCQQjbpntw3ciX/UG/WLHx3ErXr10TQZpOezAA=;
 b=no1NOQ1sPTmny2jL2wt933AXpV2qMjhJsvRsmlrlQnKs8OTeoYTfNSRInWwX0eHcTeB2
 Mci9dQVo5vR+aleUZKgFdQV0KPMeg2GEbyXjR3R0NfBgwPffr2P6/ysXha62Y6lQdccR
 P9QiK7QIiUX9LSesRg1z9eL4ElDKJ0UTKd7OlETYZBafMiUJBam/FpNZJ0+wwmVgKlZR
 nXvhGCxyw+QzkcL6OBuG0DdyzucX2bPK28s/3zocXdyPH06lIeHo6jfRQIMHPB814Rop
 M++xtPedgkFr0GSqwJj1tY1S1jpcVHhh+irv2j0LuiD4pu7FKNFM3EMGvucUqmof3Gnk MA== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38whgm52j5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 07:55:03 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 151BmJht025727;
 Tue, 1 Jun 2021 11:55:01 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 38ud87rwsw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 11:55:01 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 151Bsw1J25952584
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Jun 2021 11:54:58 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5232711C04C;
 Tue,  1 Jun 2021 11:54:58 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 139C611C050;
 Tue,  1 Jun 2021 11:54:58 +0000 (GMT)
Received: from oc8242746057.lan (unknown [9.171.63.112])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Jun 2021 11:54:57 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: ltp@lists.linux.it
Date: Tue,  1 Jun 2021 13:54:53 +0200
Message-Id: <20210601115453.458069-1-egorenar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wioxdvyEhoBzlOBtESWphX-0fu0AyEsF
X-Proofpoint-ORIG-GUID: wioxdvyEhoBzlOBtESWphX-0fu0AyEsF
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-01_06:2021-05-31,
 2021-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106010078
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/1] tst_wallclock_restore: fix access time of
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

v1 -> v2:
 * Check for existance of /etc/localtime before touching it
 * Add comment explaingning why opening and/or reading /etc/localtime might not be enough

 lib/tst_wallclock.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/lib/tst_wallclock.c b/lib/tst_wallclock.c
index 838dde8b3..1244ea26b 100644
--- a/lib/tst_wallclock.c
+++ b/lib/tst_wallclock.c
@@ -42,7 +42,9 @@ void tst_wallclock_save(void)
 
 void tst_wallclock_restore(void)
 {
+	static const char *localtime = "/etc/localtime";
 	static struct timespec mono_end, elapsed, adjust;
+	int ret;
 
 	if (!clock_saved)
 		return;
@@ -60,6 +62,19 @@ void tst_wallclock_restore(void)
 
 	if (tst_clock_settime(CLOCK_REALTIME, &adjust))
 		tst_brk(TBROK | TERRNO, "tst_clock_settime() realtime failed");
+
+	/*
+	 * Fix access time of /etc/localtime because adjusting the wallclock
+	 * might have changed it to a time value which lies far ahead
+	 * in the future.
+	 * The access time of a file only changes if the new one is past
+	 * the current one, therefore, just opening a file and reading it
+	 * might not be enough because the current access time might be far
+	 * in the future.
+	 */
+	ret = access(localtime, F_OK);
+	if (!ret)
+		SAFE_TOUCH(localtime, 0, NULL);
 }
 
 void tst_rtc_clock_save(const char *rtc_dev)
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
