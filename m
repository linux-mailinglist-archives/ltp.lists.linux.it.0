Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B28522DBE41
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 11:09:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D46D3C3356
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 11:09:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 298B83C2B2B
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 11:09:16 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 408C21A00CA0
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 11:09:16 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DCDD0AC91
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 10:09:15 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 16 Dec 2020 11:10:08 +0100
Message-Id: <20201216101012.14644-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201216101012.14644-1-chrubis@suse.cz>
References: <20201216101012.14644-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/5] docparse/docparse: Warn on truncated docstring
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

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 docparse/docparse.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/docparse/docparse.c b/docparse/docparse.c
index 22c5c6f2c..702820757 100644
--- a/docparse/docparse.c
+++ b/docparse/docparse.c
@@ -12,6 +12,8 @@
 
 #include "data_storage.h"
 
+#define WARN(str) fprintf(stderr, "WARNING: " str "\n")
+
 static void oneline_comment(FILE *f)
 {
 	int c;
@@ -52,7 +54,8 @@ static void multiline_comment(FILE *f, struct data_node *doc)
 				struct data_node *line;
 				buf[bufp] = 0;
 				line = data_node_string(eat_asterisk_space(buf));
-				data_node_array_add(doc, line);
+				if (data_node_array_add(doc, line))
+					WARN("doc string comment truncated");
 				bufp = 0;
 				continue;
 			}
@@ -194,8 +197,6 @@ exit:
 	return buf;
 }
 
-#define WARN(str) fprintf(stderr, str "\n")
-
 static int parse_array(FILE *f, struct data_node *node)
 {
 	const char *token;
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
