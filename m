Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E883B02DF
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 13:36:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D31293C7011
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 13:36:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DA0643C7002
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 13:35:41 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 45A6E1A00695
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 13:35:41 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id EBC151FD5F;
 Tue, 22 Jun 2021 11:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1624361740; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DKdVgZ8oyLmmhek/HLld7iV6g8tLfsfpL9j8aSC+eXA=;
 b=O7XA3EWGkYIU0oRC7EGVNLxPQcahxa3bGwsZ4NwNL5l6ZAAlTUXBNJd4Wy0kN5jDANRCZJ
 rwVks7z1lgDNzPPzSDGYVocu48F256jEALLELpyuC9ITcoWPavnJE011AEC4DiqjksMBPd
 kncIvJtpeG0TvKrhjPJXN7q9C4HNgy0=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id BE23AA3B84;
 Tue, 22 Jun 2021 11:35:40 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 22 Jun 2021 12:35:10 +0100
Message-Id: <20210622113514.22284-5-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622113514.22284-1-rpalethorpe@suse.com>
References: <20210622113514.22284-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 4/8] dio: Fix uninitialized var error
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The compiler does not know that we will return if posix_memalign fails
to set bufptr.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/io/ltp-aiodio/dio_append.c   | 2 +-
 testcases/kernel/io/ltp-aiodio/dio_sparse.c   | 2 +-
 testcases/kernel/io/ltp-aiodio/dio_truncate.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/io/ltp-aiodio/dio_append.c b/testcases/kernel/io/ltp-aiodio/dio_append.c
index 3f0ed29d5..b1b4dc039 100644
--- a/testcases/kernel/io/ltp-aiodio/dio_append.c
+++ b/testcases/kernel/io/ltp-aiodio/dio_append.c
@@ -78,7 +78,7 @@ int read_eof(char *filename)
 void dio_append(char *filename)
 {
 	int fd;
-	void *bufptr;
+	void *bufptr = NULL;
 	int i;
 	int w;
 
diff --git a/testcases/kernel/io/ltp-aiodio/dio_sparse.c b/testcases/kernel/io/ltp-aiodio/dio_sparse.c
index 67b338b3f..3f44e92ea 100644
--- a/testcases/kernel/io/ltp-aiodio/dio_sparse.c
+++ b/testcases/kernel/io/ltp-aiodio/dio_sparse.c
@@ -57,7 +57,7 @@ int TST_TOTAL = 1;
  */
 int dio_sparse(int fd, int align, int writesize, int filesize, int offset)
 {
-	void *bufptr;
+	void *bufptr = NULL;
 	int i, w;
 
 	TEST(posix_memalign(&bufptr, align, writesize));
diff --git a/testcases/kernel/io/ltp-aiodio/dio_truncate.c b/testcases/kernel/io/ltp-aiodio/dio_truncate.c
index 7d466dc20..27cf01525 100644
--- a/testcases/kernel/io/ltp-aiodio/dio_truncate.c
+++ b/testcases/kernel/io/ltp-aiodio/dio_truncate.c
@@ -69,7 +69,7 @@ int dio_read(char *filename)
 {
 	int fd;
 	int r;
-	void *bufptr;
+	void *bufptr = NULL;
 
 	TEST(posix_memalign(&bufptr, 4096, 64 * 1024));
 	if (TEST_RETURN) {
@@ -105,7 +105,7 @@ int dio_read(char *filename)
 void dio_append(char *filename, int fill)
 {
 	int fd;
-	void *bufptr;
+	void *bufptr = NULL;
 	int i;
 	int w;
 
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
