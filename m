Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F243715FA
	for <lists+linux-ltp@lfdr.de>; Mon,  3 May 2021 15:30:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 39FB53C8022
	for <lists+linux-ltp@lfdr.de>; Mon,  3 May 2021 15:30:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 737783C22CA
 for <ltp@lists.linux.it>; Mon,  3 May 2021 15:30:33 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AE61D6007B4
 for <ltp@lists.linux.it>; Mon,  3 May 2021 15:30:32 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C2383B118;
 Mon,  3 May 2021 13:30:31 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  3 May 2021 15:30:25 +0200
Message-Id: <20210503133025.2557-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/1] docparse: Escape backslash,
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

Avoid quoting new line as it's usually expected formatting,
e.g. in .options field.

Tested-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
[ pvorel: keep \n ]
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

I kept \n, it's usually expected formatting in .options:

* \n kept:
p: p_opt -p port Rhost port (mandatory)

r: r_opt -r x Rhost IP (mandatory)

-g, -r IP parameter can contain more IP, separated by CHR2STR ( IP_ADDR_DELIM )

* \n replaced:
p: p_opt -p port Rhost port (mandatory)

r: r_opt -r x Rhost IP (mandatory)\n\n-g, -r IP parameter can contain more IP, separated by CHR2STR ( IP_ADDR_DELIM )

Kind regards,
Petr

 docparse/data_storage.h | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/docparse/data_storage.h b/docparse/data_storage.h
index ef420c08f..5afeba42c 100644
--- a/docparse/data_storage.h
+++ b/docparse/data_storage.h
@@ -256,6 +256,39 @@ static inline void data_fprintf(FILE *f, unsigned int padd, const char *fmt, ...
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
+			/* keep \n, it's usually expected formatting in .options */
+			if (*(str+1) == 'n')
+				putc(*str, f);
+			else
+				fputs("\\\\", f);
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
@@ -263,7 +296,7 @@ static inline void data_to_json_(struct data_node *self, FILE *f, unsigned int p
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
