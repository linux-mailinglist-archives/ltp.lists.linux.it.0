Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C0B3B6EBC
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 09:28:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 820743C6C67
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 09:28:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CE8A83C6C50
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 09:27:51 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0FEC720011A
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 09:27:51 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id B81E920398;
 Tue, 29 Jun 2021 07:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1624951670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r16Yb6uth6RflTHpKwOra9VNWuFdLuuTdZd8Vr6JRSI=;
 b=a4yKV4YC3cOZdNkVZtfQVNFqHRtqc1eTyo8YAbuPq1ysCODG/5qwqCOTp32c4MUKoBaWEa
 U6EGax5eUETkXmZel5962KU8nOvmb+uJZapd+8GEq7V+MiTsFTocyvAt9FyqiSqvCQwUer
 lIBW7oP7+AHcgCnMZ/y+eYKkwKubcK0=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 87A9BA3B8A;
 Tue, 29 Jun 2021 07:27:50 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 29 Jun 2021 08:27:07 +0100
Message-Id: <20210629072710.23800-5-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210629072710.23800-1-rpalethorpe@suse.com>
References: <20210629072710.23800-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 4/7] doc: Add rules and recommendations list
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

Create a list of rules which are feasible to check automatically. The
file is a table of tab separated values. It's intended to be machine
readable.

For now there is just an ID column, with IDs that look similar to CWE
IDs or CVEs. For now these can just be used with 'git grep'. Also
there is a description column.

Clearly this is not an exhaustive list. It just contains a library
rule already stated in the guide and the issue Sparse checks for.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 doc/rules.tsv                   | 3 +++
 doc/test-writing-guidelines.txt | 5 +++++
 2 files changed, 8 insertions(+)
 create mode 100644 doc/rules.tsv

diff --git a/doc/rules.tsv b/doc/rules.tsv
new file mode 100644
index 000000000..d4081ce0f
--- /dev/null
+++ b/doc/rules.tsv
@@ -0,0 +1,3 @@
+ID	DESCRIPTION
+LTP-001	Library source files have tst_ prefix
+LTP-002	TST_RET and TST_ERR are never modified by test library functions
diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 37624eb7f..1bf00fdf7 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -10,6 +10,11 @@ NOTE: See also
       https://github.com/linux-test-project/ltp/wiki/Shell-Test-API[Shell Test API],
       https://github.com/linux-test-project/ltp/wiki/LTP-Library-API-Writing-Guidelines[LTP Library API Writing Guidelines].
 
+Rules and recommendations which are "machine checkable" should be
+tagged with an ID like +LTP-XXX+. There will be a corresponding entry
+in 'doc/rules.tsv'. When you run 'make check' or 'make check-test' it
+will display these IDs as a reference.
+
 1. Guide to clean and understandable code
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
