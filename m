Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F13B62DBE40
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 11:09:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA82E3C2B52
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 11:09:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 036F93C2B2B
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 11:09:17 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BC3C41A00CB8
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 11:09:16 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5B650AC7F
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 10:09:16 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 16 Dec 2020 11:10:09 +0100
Message-Id: <20201216101012.14644-3-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201216101012.14644-1-chrubis@suse.cz>
References: <20201216101012.14644-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/5] doc_parse/data_storage: Bump the array max size
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

Bump the array size to 100 from 20 for now. I will rewrite the code to
reallocate the array if needed later on.

At least now we won't have longer description comments cut in half.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 docparse/data_storage.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docparse/data_storage.h b/docparse/data_storage.h
index 1a9265f92..ef420c08f 100644
--- a/docparse/data_storage.h
+++ b/docparse/data_storage.h
@@ -64,7 +64,7 @@ static inline struct data_node *data_node_string(const char *string)
 	return node;
 }
 
-#define MAX_ELEMS 20
+#define MAX_ELEMS 100
 
 static inline struct data_node *data_node_hash(void)
 {
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
