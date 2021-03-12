Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC542338C3F
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 13:02:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B24603C6837
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 13:02:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 09CE03C6828
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 13:02:19 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 9BE2A100134C
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 13:02:18 +0100 (CET)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3As1OYCq6bvx2FmzuhqgPXwCjXdLJzesId70hD?=
 =?us-ascii?q?6mlaTxtJfsuE0/2/hfhz726RtB89elEF3eqBNq6JXG/G+fdOjLU5EL++UGDd1l?=
 =?us-ascii?q?eAA41v4IDryT+lOwCWzIRg/Ih6dawWMrzNJHxbqeq/3wWiCdYnx7C8gcWVrMPT?=
 =?us-ascii?q?1W1kQw0vS4wI1XYbNi+hHkd7RBZLCPMCffLy2uN8uzGidX4LB/7LZEUtYu6rnb?=
 =?us-ascii?q?32vaOjSRsHKjpi0wOWkA6vgYSQLzGomjsYTBNDqI1PzVT4?=
X-IronPort-AV: E=Sophos;i="5.81,243,1610380800"; d="scan'208";a="105549566"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Mar 2021 20:02:16 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 1BE984CEA9A2
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 20:02:12 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 12 Mar 2021 20:02:12 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 12 Mar 2021 20:02:17 +0800
Message-ID: <1615550541-21714-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20201111163114.GB23576@yuki.lan>
References: <20201111163114.GB23576@yuki.lan>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 1BE984CEA9A2.AE330
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.1 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v4 1/5] libs/libltpnewipc/libnewipc.c: Add
 msg_do_reader/msg_do_writer function
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

Copy old libmsgctl.c three functions(doreader,dowriter,verify) into libnewipc.c.
It is prepared for upcoming new api msgstress case. The reason for not using a new
c lib file(ie libnewmsgctl.c) is that current libnewipc is small(only has getipckey,
get_used_queues, probe_free_addr, get_ipc_timestamp function). So put them into libnewipc.c.
Also use tst_brk for failure because we don't want to print many info in stress test when
case fails.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 include/libnewipc.h           | 11 +++++
 libs/libltpnewipc/libnewipc.c | 75 +++++++++++++++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/include/libnewipc.h b/include/libnewipc.h
index 075364f85..0f099c939 100644
--- a/include/libnewipc.h
+++ b/include/libnewipc.h
@@ -45,6 +45,14 @@
 #define INT_SIZE	4
 #define MODE_MASK	0x01FF
 
+struct mbuffer {
+	long type;
+	struct {
+		char len;
+		char pbytes[99];
+	} data;
+};
+
 key_t getipckey(const char *file, const int lineno);
 #define GETIPCKEY() \
 	getipckey(__FILE__, __LINE__)
@@ -59,4 +67,7 @@ void *probe_free_addr(const char *file, const int lineno);
 
 time_t get_ipc_timestamp(void);
 
+void msg_do_reader(long key, int tid, long type, int child, int nreps);
+
+void msg_do_writer(long key, int tid, long type, int child, int nreps);
 #endif /* newlibipc.h */
diff --git a/libs/libltpnewipc/libnewipc.c b/libs/libltpnewipc/libnewipc.c
index d0974bbe0..09871b421 100644
--- a/libs/libltpnewipc/libnewipc.c
+++ b/libs/libltpnewipc/libnewipc.c
@@ -99,3 +99,78 @@ time_t get_ipc_timestamp(void)
 
 	return ts.tv_sec;
 }
+
+static int verify(char *buf, char val, int size, int child)
+{
+	while (size-- > 0) {
+		if (*buf++ != val) {
+			tst_res(TFAIL,
+				"Verify error in child %d, *buf = %x, val = %x, size = %d",
+				child, *buf, val, size);
+			return 1;
+		}
+	}
+	return 0;
+}
+
+void msg_do_reader(long key, int tid, long type, int child, int nreps)
+{
+	int i, size;
+	int id;
+	struct mbuffer buffer;
+
+	id = SAFE_MSGGET(key, 0);
+	if (id != tid) {
+		tst_brk(TFAIL,
+			"Message queue mismatch in the reader of child group %d for message queue id %d ",
+			child, id);
+	}
+	for (i = 0; i < nreps; i++) {
+		memset(&buffer, 0, sizeof(buffer));
+
+		size = SAFE_MSGRCV(id, &buffer, 100, type, 0);
+		if (buffer.type != type) {
+			tst_brk(TFAIL,
+				"Type mismatch in child %d, read #%d, for message got %ld, exected %ld",
+				child, (i + 1), buffer.type, type);
+		}
+		if (buffer.data.len + 1 != size) {
+			tst_brk(TFAIL,
+				"Size mismatch in child %d, read #%d, for message got %d, expected %d",
+				child, (i + 1), buffer.data.len + 1, size);
+		}
+		if (verify(buffer.data.pbytes, (key % 255), size - 1, child)) {
+			tst_brk(TFAIL,
+				"Verify failed in child %d read # = %d, key = %lx",
+				child, (i + 1), key);
+		}
+		key++;
+	}
+}
+
+void msg_do_writer(long key, int tid, long type, int child, int nreps)
+{
+	int i, size;
+	int id;
+	struct mbuffer buffer;
+
+	id = SAFE_MSGGET(key, 0);
+	if (id != tid) {
+		tst_brk(TFAIL,
+			"Message queue mismatch in the writer of child group %d for message queue id %d",
+			child, id);
+	}
+
+	for (i = 0; i < nreps; i++) {
+		memset(&buffer, 0, sizeof(buffer));
+
+		do {
+			size = (lrand48() % 99);
+		} while (size == 0);
+		memset(buffer.data.pbytes, (key % 255), size);
+		buffer.data.len = size;
+		buffer.type = type;
+		SAFE_MSGSND(id, &buffer, size + 1, 0);
+		key++;
+	}
+}
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
