Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFD3372A7F
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 14:57:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 70BA43C5834
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 14:57:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8B84F3C57EB
 for <ltp@lists.linux.it>; Tue,  4 May 2021 14:57:38 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BA6AE1000DBD
 for <ltp@lists.linux.it>; Tue,  4 May 2021 14:57:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 035EAAF21;
 Tue,  4 May 2021 12:57:37 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  4 May 2021 14:57:29 +0200
Message-Id: <20210504125729.18781-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/1] docparse: Escape backslash,
 tab and double quote in JSON
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Cyril Hrubis <chrubis@suse.cz>

NOTE: quoting new line require to transform .options from array to
array of arrays.

Tested-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

changes v2-v3:
* remove *not* quoting new line (asked by Cyril

Patch is now exactly the same Cyril suggested on ML.
Changing .options is my TODO.

Kind regards,
Petr

 docparse/data_storage.h | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/docparse/data_storage.h b/docparse/data_storage.h
index ef420c08f..24381334b 100644
--- a/docparse/data_storage.h
+++ b/docparse/data_storage.h
@@ -256,6 +256,35 @@ static inline void data_fprintf(FILE *f, unsigned int padd, const char *fmt, ...
 	va_end(va);
 }
 
+
+static inline void data_fprintf_esc(FILE *f, unsigned int padd, const char *str)
+{
+	while (padd-- > 0)
+		fputc(' ', f);
+
+	fputc('"', f);
+
+	while (*str) {
+		switch (*str) {
+		case '\\':
+			fputs("\\\\", f);
+			break;
+		case '"':
+			fputs("\\\"", f);
+			break;
+		case '\t':
+			fputs("\\t", f);
+			break;
+		default:
+			putc(*str, f);
+			break;
+		}
+		str++;
+	}
+
+	fputc('"', f);
+}
+
 static inline void data_to_json_(struct data_node *self, FILE *f, unsigned int padd, int do_padd)
 {
 	unsigned int i;
@@ -263,7 +292,7 @@ static inline void data_to_json_(struct data_node *self, FILE *f, unsigned int p
 	switch (self->type) {
 	case DATA_STRING:
 		padd = do_padd ? padd : 0;
-		data_fprintf(f, padd, "\"%s\"", self->string.val);
+		data_fprintf_esc(f, padd, self->string.val);
 	break;
 	case DATA_HASH:
 		for (i = 0; i < self->hash.elems_used; i++) {
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
