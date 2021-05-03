Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 970943712C2
	for <lists+linux-ltp@lfdr.de>; Mon,  3 May 2021 10:57:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 149C23C58FB
	for <lists+linux-ltp@lfdr.de>; Mon,  3 May 2021 10:57:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9D67B3C22CA
 for <ltp@lists.linux.it>; Mon,  3 May 2021 10:57:39 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 907CF600157
 for <ltp@lists.linux.it>; Mon,  3 May 2021 10:57:38 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A1BA3AEE6;
 Mon,  3 May 2021 08:57:37 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  3 May 2021 10:57:32 +0200
Message-Id: <20210503085732.9637-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] docparse: Escape backslash,
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

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

not sure if I should escape more, e.g.:
\b  Backspace (ascii code 08)
\f  Form feed (ascii code 0C)
\n  New line
\r  Carriage return

Tested on Richard's BPF patchset [1], which got affected on " + previous
problems on CAN tests, which contained \t in testcases/network/can/filter-tests/can_filter.c
(i.e. with reverted 1cdf8ce8b).

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/list/?series=240772&state=*
[2] https://patchwork.ozlabs.org/project/ltp/patch/20210426120107.6632-2-rpalethorpe@suse.com/

 docparse/data_storage.h | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/docparse/data_storage.h b/docparse/data_storage.h
index ef420c08f..08cdc009d 100644
--- a/docparse/data_storage.h
+++ b/docparse/data_storage.h
@@ -256,14 +256,46 @@ static inline void data_fprintf(FILE *f, unsigned int padd, const char *fmt, ...
 	va_end(va);
 }
 
-static inline void data_to_json_(struct data_node *self, FILE *f, unsigned int padd, int do_padd)
+static inline void json_escape_(char str[], char search, char replace[])
+{
+	char *tmp;
+	char *p = str;
+	size_t i, str_len, tmp_len, replace_len, shift;
+
+	while ((tmp = strchr(p, search))) {
+		str_len = strlen(str);
+		tmp_len = strlen(tmp);
+		replace_len = strlen(replace);
+		shift = str_len - tmp_len;
+
+		memmove(str + shift + replace_len - 1, str + shift, tmp_len);
+
+		for (i = 0; i < replace_len; i++)
+			str[shift++] = replace[i];
+
+		str[str_len + replace_len - 1] = '\0';
+		p = tmp + replace_len;
+	}
+}
+
+static inline const char *json_escape(char *input)
+{
+	json_escape_(input, '\\', "\\\\");
+	json_escape_(input, '"', "\\\"");
+	json_escape_(input, '\t', "\\t");
+
+	return input;
+}
+
+static inline void data_to_json_(struct data_node *self, FILE *f, unsigned int
+				 padd, int do_padd)
 {
 	unsigned int i;
 
 	switch (self->type) {
 	case DATA_STRING:
 		padd = do_padd ? padd : 0;
-		data_fprintf(f, padd, "\"%s\"", self->string.val);
+		data_fprintf(f, padd, "\"%s\"", json_escape((self->string.val)));
 	break;
 	case DATA_HASH:
 		for (i = 0; i < self->hash.elems_used; i++) {
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
