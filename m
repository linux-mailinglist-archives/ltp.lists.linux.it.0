Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E21D3ACB6DA
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Jun 2025 17:22:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9598D3C8F7F
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Jun 2025 17:22:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9BC213C9AA8
 for <ltp@lists.linux.it>; Mon,  2 Jun 2025 03:38:03 +0200 (CEST)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id EFD681A0092B
 for <ltp@lists.linux.it>; Mon,  2 Jun 2025 03:38:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=zV
 dVKQUCrA+ckUSYVZaAnanDPCbVp0/SV3/gQyedqOo=; b=lDZqr8A2osQc34y9ma
 Jz+0J9lxNnQELaE/U28JdIyIqCj5j3VGEkz9B3S5x+l4FWYwlyaEP3uEvl+gibqv
 crk46WiQEQJccnIokRljRt/muR9NO4u4zartc1cep4Q1bNv2vCN84v4yFfH//lZG
 5QVmkvPO4aaSx3gwk7pjZJrwg=
Received: from zhangyang.mshome.net (unknown [])
 by gzsmtp1 (Coremail) with SMTP id PCgvCgCHMgF1AD1ohvvhAQ--.48569S2;
 Mon, 02 Jun 2025 09:37:57 +0800 (CST)
From: "yang.zhang" <gaoshanliukou@163.com>
To: ltp@lists.linux.it
Date: Mon,  2 Jun 2025 09:37:56 +0800
Message-Id: <20250602013756.136453-1-gaoshanliukou@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: PCgvCgCHMgF1AD1ohvvhAQ--.48569S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw17tw4fCFWkZr4UXFyDGFg_yoW8ZF1Dp3
 yakw1jkrZ3CF4UA3srKF97Ar15twnrXa1rKr92ya4xZ3Wvv3y3tr4xK3W2qF1kGrWj93Wr
 u3Z8Za1Fqr1DZa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UXTmhUUUUU=
X-Originating-IP: [123.150.8.43]
X-CM-SenderInfo: pjdr2x5dqox3xnrxqiywtou0bp/1tbiUQdc8mg4iK+t+gABsZ
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Mailman-Approved-At: Mon, 02 Jun 2025 17:21:55 +0200
Subject: [LTP] [PATCH LTP] open_posix: fix send_rev_2.c testcase
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
Cc: "yang.zhang" <zhangyang01@kylinos.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: "yang.zhang" <zhangyang01@kylinos.cn>

1. After fork, using correct switch branch for parent and child.
2. Fix array out-of-bounds issue when calling mq_send.

Signed-off-by: yang.zhang <zhangyang01@kylinos.cn>
---
 .../functional/mqueues/send_rev_1.c           | 35 +++++++++----------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/testcases/open_posix_testsuite/functional/mqueues/send_rev_1.c b/testcases/open_posix_testsuite/functional/mqueues/send_rev_1.c
index 46eef837a..7c7d2f761 100644
--- a/testcases/open_posix_testsuite/functional/mqueues/send_rev_1.c
+++ b/testcases/open_posix_testsuite/functional/mqueues/send_rev_1.c
@@ -57,23 +57,6 @@ int main(void)
 		ret_code = PTS_UNRESOLVED;
 		break;
 	case 0:
-		mq_getattr(mq, &attr);
-		for (i = 0; i < MAX_MSG && ret_code == PTS_PASS; i++) {
-			printf("[%d] s_msg_ptr is '%s' \n", i + 1,
-			       s_msg_ptr[i]);
-			printf("Prepare to send message...\n");
-			if (-1 == mq_send(mq, s_msg_ptr[i], attr.mq_msgsize, 1)) {
-				perror("mq_send doesn't return success \n");
-				ret_code = PTS_UNRESOLVED;
-			} else {
-				printf("Process %ld send message '%s' to "
-				       "process %ld \n",
-				       (long)getpid(), s_msg_ptr[i], (long)pid);
-			}
-		}
-		(void)wait(NULL);
-		break;
-	default:
 		printf("Enter into child process...\n");
 		mq_getattr(mq, &attr);
 		for (i = 0; i < MAX_MSG && ret_code == PTS_PASS; i++) {
@@ -91,7 +74,23 @@ int main(void)
 			}
 		}
 		exit(ret_code);
-
+		break;
+	default:
+		mq_getattr(mq, &attr);
+		for (i = 0; i < MAX_MSG && ret_code == PTS_PASS; i++) {
+			printf("[%d] s_msg_ptr is '%s' \n", i + 1,
+			       s_msg_ptr[i]);
+			printf("Prepare to send message...\n");
+			if (-1 == mq_send(mq, s_msg_ptr[i], strlen(s_msg_ptr[i]) + 1, 1)) {
+				perror("mq_send doesn't return success \n");
+				ret_code = PTS_UNRESOLVED;
+			} else {
+				printf("Process %ld send message '%s' to "
+				       "process %ld \n",
+				       (long)getpid(), s_msg_ptr[i], (long)pid);
+			}
+		}
+		(void)wait(NULL);
 		break;
 	}
 
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
