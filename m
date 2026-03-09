Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CC+nNc0Br2lmLgIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 09 Mar 2026 18:22:21 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A719923D94A
	for <lists+linux-ltp@lfdr.de>; Mon, 09 Mar 2026 18:22:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 06D323DF41A
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2026 18:22:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3C1AE3DEAE5
 for <ltp@lists.linux.it>; Mon,  9 Mar 2026 18:21:45 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C958B600852
 for <ltp@lists.linux.it>; Mon,  9 Mar 2026 18:21:43 +0100 (CET)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 629FsNqO1681720; Mon, 9 Mar 2026 17:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=pp1; bh=o6XUzQloE3+/KuzaI
 NX5kbcgj+EO1lMm+csMknBG+6Q=; b=jarAAUEL4I+HpZdi5tc/6M14WgnOkniCt
 CJlDYNfvtYTslvPT0js44tNKR+s6w3n4YeWnfz4ucRRvv8os3NeUWYYwxe+l9FwN
 UYQpDQvYSXkqF6J4vq1Q96Nf7uqoGxxQQ0q1tv+exrbDS10EbJlSSqvGM6DddVgT
 oUoAGBUf8MfwQXBWEBw3KsgcMFJ88diT9HGIFO0sAmdXnzfo0YfqIXt/I8pxrMvL
 7hSGBdAU22epUxrrDqz1eUDQPiWlUjv5W8QPwV9yoNRC7hLgiNRzZBp1JWxAa5L2
 gyA7aJq7yHNZSI/nn/0mpc7HE1F0pKVsgjcC0JQLlaEBaDWsgklaw==
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crcuy7njp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Mar 2026 17:21:41 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 629DjuH0029625;
 Mon, 9 Mar 2026 17:21:40 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4csp6ujh6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Mar 2026 17:21:40 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 629HLcao29426424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Mar 2026 17:21:38 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E88C20043;
 Mon,  9 Mar 2026 17:21:38 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5A2B20040;
 Mon,  9 Mar 2026 17:21:37 +0000 (GMT)
Received: from li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com.com (unknown
 [9.87.155.142]) by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  9 Mar 2026 17:21:37 +0000 (GMT)
From: Jan Polensky <japo@linux.ibm.com>
To: chrubis@suse.cz, pvorel@suse.cz
Date: Mon,  9 Mar 2026 18:20:55 +0100
Message-ID: <20260309172057.272946-2-japo@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309172057.272946-1-japo@linux.ibm.com>
References: <20260309172057.272946-1-japo@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=EK4LElZC c=1 sm=1 tr=0 ts=69af01a5 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8 a=D8qa3E3ZBTQVZeoaTDYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE1MyBTYWx0ZWRfX9mG9/eSARj6+
 5a629Hu1kWceA4MZuaIQ2d2gAhi0Rp/c/8rreK5Nja2A1k1f/ozSowz8m/Y0ZyEFhphGTGp18Zz
 CU9MZDrMC9mPTHn8AwFw+LuNmwUfJSyTIP5EEelDxANMzupUTlyO6MKKBX+Z8TgWIHvcf0ZgkQ6
 7L5lU1MaXwpbHQJ+grtIfvkSdC/RcTQd3f86ZK6Z5WnIZkJHVTgxt2gTfyuNdKfIzb+7YhdoYST
 5HAM5rIKab18AYh+JenaswKKwhbUz07UNVNKxdXANL+jaB4XGdiOHjiUUvEttMEpitcPZxFGelu
 TdpXmC/cdeWzw8h89yg0nDXkq4nOvgPL0oc2za/JxXd2xKGZSaU+QM4cUEEWDrCmCocAANoB3Ap
 vUzJbt2+ZmUG7zvhIVdVzkB62f69pQ5OcHmd5QcOkpjXGS3gChMn0dzf9wxZtMxSWOe2HAXstM6
 Ox+Jp88NcgmZgNn70+A==
X-Proofpoint-GUID: S-F9DEkiSKCdTCHfuPD179sX0RnnGKEh
X-Proofpoint-ORIG-GUID: S-F9DEkiSKCdTCHfuPD179sX0RnnGKEh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090153
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v1 1/3] fsetxattr02: Adapt test for kernel 7.0+ socket
 xattr support
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
Cc: Linux Test Project <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Queue-Id: A719923D94A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[ibm.com:s=pp1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	DMARC_POLICY_SOFTFAIL(0.10)[ibm.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCVD_COUNT_SEVEN(0.00)[11];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[japo@linux.ibm.com,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.659];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:rdns,picard.linux.it:helo,linux.it:url,linux.ibm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:-]
X-Rspamd-Action: no action

Starting with kernel 7.0.0, sockets support extended attributes in the
user.* namespace. This behavior was enabled by dc0876b9846d ("xattr: support
extended attributes on sockets"), which permits user.* xattrs on S_IFSOCK
inodes (previously rejected with -EPERM).

Adapts the test to expect success (exp_err = 0) instead of EPERM when
testing fsetxattr(2) on sockets with kernel 7.0+.

Signed-off-by: Jan Polensky <japo@linux.ibm.com>
---
 testcases/kernel/syscalls/fsetxattr/fsetxattr02.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/testcases/kernel/syscalls/fsetxattr/fsetxattr02.c b/testcases/kernel/syscalls/fsetxattr/fsetxattr02.c
index 18490a865871..ede86b218ee6 100644
--- a/testcases/kernel/syscalls/fsetxattr/fsetxattr02.c
+++ b/testcases/kernel/syscalls/fsetxattr/fsetxattr02.c
@@ -158,6 +158,10 @@ static void verify_fsetxattr(unsigned int i)
 	if (TST_RET == -1 && TST_ERR == EOPNOTSUPP)
 		tst_brk(TCONF, "fsetxattr(2) not supported");
 
+	/* consider newer kernels */
+	if ((tst_kvercmp(7, 0, 0) >= 0) && (strncmp(tc[i].fname, SOCK, strlen(SOCK)) == 0))
+		tc[i].exp_err = 0;
+
 	/* success */
 
 	if (!tc[i].exp_err) {
-- 
2.53.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
