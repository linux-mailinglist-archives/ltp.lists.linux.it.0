Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 575AD5654D0
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Jul 2022 14:18:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D38673C189A
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Jul 2022 14:18:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CDA013C089F
 for <ltp@lists.linux.it>; Mon,  4 Jul 2022 14:17:58 +0200 (CEST)
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 0513314002BC
 for <ltp@lists.linux.it>; Mon,  4 Jul 2022 14:17:56 +0200 (CEST)
Received: from localhost.localdomain.localdomain (unknown [10.2.5.46])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxKeFu2sJiwpMIAA--.25917S2; 
 Mon, 04 Jul 2022 20:17:54 +0800 (CST)
From: Hongchen Zhang <zhanghongchen@loongson.cn>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Mon,  4 Jul 2022 20:17:49 +0800
Message-Id: <1656937069-17098-1-git-send-email-zhanghongchen@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9AxKeFu2sJiwpMIAA--.25917S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF17tFW8KFyDXFWDCrWrGrg_yoW8ury3pF
 4S9FWUCrWvgr15Ar4UArZ5Wr4YyF93Xr1j9rWrAwn7ur9FkryrXa10vFWvq3WYkrW7GryU
 Zr45Gan5u3WDAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUka14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVCm-wCF04k2
 0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
 8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41l
 IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
 AIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvE
 x4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU9189UUUUU=
X-CM-SenderInfo: x2kd0w5krqwupkhqwqxorr0wxvrqhubq/
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] rpc01: fix variable not initialized
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
Cc: ltp@lists.linux.it, Hongchen Zhang <zhanghongchen@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

when error occurred in function callrpc/clnt_call, return_buffer may
be leaved not initialized.So initialize return_buffer to NULL,and
retrieve the return_buffer->data when return_buffer is really assigned.

Signed-off-by: Hongchen Zhang <zhanghongchen@loongson.cn>
---
 testcases/network/rpc/basic_tests/rpc01/rpc1.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/testcases/network/rpc/basic_tests/rpc01/rpc1.c b/testcases/network/rpc/basic_tests/rpc01/rpc1.c
index bc9f35b..5691c06 100644
--- a/testcases/network/rpc/basic_tests/rpc01/rpc1.c
+++ b/testcases/network/rpc/basic_tests/rpc01/rpc1.c
@@ -24,7 +24,7 @@ void usage_error(char *program_name);
 int main(int argc, char *argv[])
 {
 	struct hostent *hp;
-	struct data buffer, *return_buffer;
+	struct data buffer, *return_buffer = NULL;
 	int i, n, rc;
 	FILE *fp;
 	struct stat stat_buffer;
@@ -128,7 +128,8 @@ int main(int argc, char *argv[])
 	rc = callrpc(server, program, version, 1, (xdrproc_t)xdr_send_data,
 			(char *)&buffer, (xdrproc_t)xdr_receive_data,
 			(char *)&return_buffer);
-	do_compare(rc, "callrpc", &buffer, return_buffer->data);
+	do_compare(rc, "callrpc", &buffer,
+				return_buffer ? return_buffer->data : NULL);
 
 	server_sin.sin_port = 0;
 	sock = RPC_ANYSOCK;
@@ -145,7 +146,8 @@ int main(int argc, char *argv[])
 				(char *)&buffer, (xdrproc_t)xdr_receive_data,
 				(char *)&return_buffer, timeout);
 	clnt_destroy(clnt);
-	do_compare(rc, "udp transport", &buffer, return_buffer->data);
+	do_compare(rc, "udp transport", &buffer,
+				return_buffer ? return_buffer->data : NULL);
 
 	server_sin.sin_port = 0;
 	sock = RPC_ANYSOCK;
@@ -160,7 +162,8 @@ int main(int argc, char *argv[])
 				(char *)&buffer, (xdrproc_t)xdr_receive_data,
 				(char *)&return_buffer, timeout);
 	clnt_destroy(clnt);
-	do_compare(rc, "tcp transport", &buffer, return_buffer->data);
+	do_compare(rc, "tcp transport", &buffer,
+				return_buffer ? return_buffer->data : NULL);
 
 	exit(0);
 }
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
