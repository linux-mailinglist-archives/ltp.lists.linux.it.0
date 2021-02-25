Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B79B3324272
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 17:49:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 299613C5A8C
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 17:49:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id A11A33C4E27
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 17:49:23 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9D9D51A0117F
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 17:49:22 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 387ADAF33;
 Wed, 24 Feb 2021 16:49:22 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 24 Feb 2021 17:50:42 +0100
Message-Id: <20210224165045.17738-3-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210224165045.17738-1-chrubis@suse.cz>
References: <20210224165045.17738-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/5] lib: Add minimalistic json parser
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
Cc: Michal Simek <michals@xilinx.com>, Carlos Hernandez <ceh@ti.com>,
 automated-testing@yoctoproject.org, Orson Zhai <orsonzhai@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/tst_json.h | 177 ++++++++++++
 lib/tst_json.c     | 679 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 856 insertions(+)
 create mode 100644 include/tst_json.h
 create mode 100644 lib/tst_json.c

diff --git a/include/tst_json.h b/include/tst_json.h
new file mode 100644
index 000000000..4b3669824
--- /dev/null
+++ b/include/tst_json.h
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+/*
+ * Copyright (C) 2021 Cyril Hrubis <metan@ucw.cz>
+ */
+
+#ifndef TST_JSON_H
+#define TST_JSON_H
+
+#include <stdio.h>
+
+#define TST_JSON_ERR_MAX 128
+#define TST_JSON_ID_MAX 64
+
+enum tst_json_type {
+	TST_JSON_VOID = 0,
+	TST_JSON_INT,
+	TST_JSON_STR,
+	TST_JSON_OBJ,
+	TST_JSON_ARR,
+};
+
+struct tst_json_buf {
+	/** Pointer to a null terminated JSON string */
+	const char *json;
+	/** A length of the JSON string */
+	size_t len;
+	/** A current offset into the JSON string */
+	size_t off;
+	/** An offset to the start of the last array or object */
+	size_t sub_off;
+
+	char err[TST_JSON_ERR_MAX];
+	char buf[];
+};
+
+struct tst_json_val {
+	enum tst_json_type type;
+
+	/** An user supplied buffer and size to store a string values to. */
+	char *buf;
+	size_t buf_size;
+
+	/** An union to store the parsed value into. */
+	union {
+		long val_int;
+		const char *val_str;
+	};
+
+	/** An ID for object values */
+	char id[TST_JSON_ID_MAX];
+};
+
+/*
+ * @brief Resets the parser.
+ *
+ * Resets the parse offset and clears errors.
+ *
+ * @buf An tst_json buffer
+ */
+static inline void tst_json_reset(struct tst_json_buf *buf)
+{
+	buf->off = 0;
+	buf->err[0] = 0;
+}
+
+/*
+ * @brief Fills the buffer error.
+ *
+ * Once buffer error is set all parsing functions return immediatelly with type
+ * set to TST_JSON_VOID.
+ *
+ * @buf An tst_json buffer
+ * @fmt A printf like format string
+ * @... A printf like parameters
+ */
+void tst_json_err(struct tst_json_buf *buf, const char *fmt, ...)
+               __attribute__((format (printf, 2, 3)));
+
+/*
+ * @brief Prints error into a file.
+ *
+ * The error takes into consideration the current offset in the buffer and
+ * prints a few preceding lines along with the exact position of the error.
+ *
+ * @f A file to print the error to.
+ * @buf An tst_json buffer.
+ */
+void tst_json_err_print(FILE *f, struct tst_json_buf *buf);
+
+/*
+ * @brief Returns true if error was encountered.
+ *
+ * @bfu An tst_json buffer.
+ * @return True if error was encountered false otherwise.
+ */
+static inline int tst_json_is_err(struct tst_json_buf *buf)
+{
+	return !!buf->err[0];
+}
+
+/*
+ * @brief Checks is result has valid type.
+ *
+ * @res An tst_json value.
+ * @return Zero if result is not valid, non-zero otherwise.
+ */
+static inline int tst_json_valid(struct tst_json_val *res)
+{
+	return !!res->type;
+}
+
+/*
+ * @brief Returns the type of next element in buffer.
+ *
+ * @buf An tst_json buffer.
+ * @return A type of next element in the buffer.
+ */
+enum tst_json_type tst_json_next_type(struct tst_json_buf *buf);
+
+/*
+ * @brief Returns if first element in JSON is object or array.
+ *
+ * @buf An tst_json buffer.
+ * @return On success returns TST_JSON_OBJ or TST_JSON_ARR. On failure TST_JSON_VOID.
+ */
+enum tst_json_type tst_json_start(struct tst_json_buf *buf);
+
+/*
+ * @brief Starts parsing of an JSON object.
+ *
+ * @buf An tst_json buffer.
+ * @res An tst_json result.
+ */
+int tst_json_obj_first(struct tst_json_buf *buf, struct tst_json_val *res);
+int tst_json_obj_next(struct tst_json_buf *buf, struct tst_json_val *res);
+
+#define TST_JSON_OBJ_FOREACH(buf, res) \
+	for (tst_json_obj_first(buf, res); tst_json_valid(res); tst_json_obj_next(buf, res))
+
+/*
+ * @brief Skips parsing of an JSON object.
+ *
+ * @buf An tst_json buffer.
+ * @return Zero on success, non-zero otherwise.
+ */
+int tst_json_obj_skip(struct tst_json_buf *buf);
+
+int tst_json_arr_first(struct tst_json_buf *buf, struct tst_json_val *res);
+int tst_json_arr_next(struct tst_json_buf *buf, struct tst_json_val *res);
+
+#define TST_JSON_ARR_FOREACH(buf, res) \
+	for (tst_json_arr_first(buf, res); tst_json_valid(res); tst_json_arr_next(buf, res))
+
+/*
+ * @brief Skips parsing of an JSON array.
+ *
+ * @buf An tst_json buffer.
+ * @return Zero on success, non-zero otherwise.
+ */
+int tst_json_arr_skip(struct tst_json_buf *buf);
+
+/*
+ * @brief Loads a file into an tst_json buffer.
+ *
+ * @path A path to a file.
+ * @return An tst_json buffer or NULL in a case of a failure.
+ */
+struct tst_json_buf *tst_json_load(const char *path);
+
+/*
+ * @brief Frees an tst_json buffer.
+ *
+ * @buf An tst_json buffer allcated by tst_json_load() function.
+ */
+void tst_json_free(struct tst_json_buf *buf);
+
+#endif /* TST_JSON_H */
diff --git a/lib/tst_json.c b/lib/tst_json.c
new file mode 100644
index 000000000..3a4cb9d0b
--- /dev/null
+++ b/lib/tst_json.c
@@ -0,0 +1,679 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+/*
+ * Copyright (C) 2021 Cyril Hrubis <metan@ucw.cz>
+ */
+
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <stdlib.h>
+#include <string.h>
+#include <stdarg.h>
+#include <stdint.h>
+#include "tst_json.h"
+
+static inline int buf_empty(struct tst_json_buf *buf)
+{
+	return buf->off >= buf->len;
+}
+
+static int eatws(struct tst_json_buf *buf)
+{
+	while (!buf_empty(buf)) {
+		switch (buf->json[buf->off]) {
+		case ' ':
+		case '\t':
+		case '\n':
+		case '\f':
+		break;
+		default:
+			goto ret;
+		}
+
+		buf->off += 1;
+	}
+ret:
+	return buf_empty(buf);
+}
+
+static char getb(struct tst_json_buf *buf)
+{
+	if (buf_empty(buf))
+		return 0;
+
+	return buf->json[buf->off++];
+}
+
+static char peekb(struct tst_json_buf *buf)
+{
+	if (buf_empty(buf))
+		return 0;
+
+	return buf->json[buf->off];
+}
+
+static int eatb(struct tst_json_buf *buf, char ch)
+{
+	if (peekb(buf) != ch)
+		return 0;
+
+	getb(buf);
+	return 1;
+}
+
+static int hex2val(unsigned char b)
+{
+	switch (b) {
+	case '0' ... '9':
+		return b - '0';
+	case 'a' ... 'f':
+		return b - 'a' + 10;
+	case 'A' ... 'F':
+		return b - 'A' + 10;
+	default:
+		return -1;
+	}
+}
+
+static int32_t parse_ucode_cp(struct tst_json_buf *buf)
+{
+	int ret = 0, v, i;
+
+	for (i = 0; i < 4; i++) {
+		if ((v = hex2val(getb(buf))) < 0)
+			goto err;
+		ret *= 16;
+		ret += v;
+	}
+
+	return ret;
+err:
+	tst_json_err(buf, "Expected four hexadecimal digits");
+	return -1;
+}
+
+static unsigned int utf8_bytes(uint32_t ucode_cp)
+{
+	if (ucode_cp < 0x0080)
+		return 1;
+
+	if (ucode_cp < 0x0800)
+		return 2;
+
+	if (ucode_cp < 0x10000)
+		return 3;
+
+	return 4;
+}
+
+static int to_utf8(uint32_t ucode_cp, char *buf)
+{
+	if (ucode_cp < 0x0080) {
+		buf[0] = ucode_cp & 0x00f7;
+		return 1;
+	}
+
+	if (ucode_cp < 0x0800) {
+		buf[0] = 0xc0 | (0x1f & (ucode_cp>>6));
+		buf[1] = 0x80 | (0x3f & ucode_cp);
+		return 2;
+	}
+
+	if (ucode_cp < 0x10000) {
+		buf[0] = 0xe0 | (0x0f & (ucode_cp>>12));
+		buf[1] = 0x80 | (0x3f & (ucode_cp>>6));
+		buf[2] = 0x80 | (0x3f & ucode_cp);
+		return 3;
+	}
+
+	buf[0] = 0xf0 | (0x07 & (ucode_cp>>18));
+	buf[1] = 0x80 | (0x3f & (ucode_cp>>12));
+	buf[2] = 0x80 | (0x3f & (ucode_cp>>6));
+	buf[3] = 0x80 | (0x3f & ucode_cp);
+	return 4;
+}
+
+static unsigned int parse_ucode_esc(struct tst_json_buf *buf, char *str,
+                                    size_t off, size_t len)
+{
+	int32_t ucode = parse_ucode_cp(buf);
+
+	if (ucode < 0)
+		return 0;
+
+	if (!str)
+		return ucode;
+
+	if (utf8_bytes(ucode) + 1 >= len - off) {
+		tst_json_err(buf, "String buffer too short!");
+		return 0;
+	}
+
+	return to_utf8(ucode, str+off);
+}
+
+static int copy_str(struct tst_json_buf *buf, char *str, size_t len)
+{
+	size_t pos = 0;
+	int esc = 0;
+	unsigned int l;
+
+	eatb(buf, '"');
+
+	for (;;) {
+		if (buf_empty(buf)) {
+			tst_json_err(buf, "Unterminated string");
+			return 1;
+		}
+
+		if (!esc && eatb(buf, '"')) {
+			if (str)
+				str[pos] = 0;
+			return 0;
+		}
+
+		char b = getb(buf);
+
+		if (!esc && b == '\\') {
+			esc = 1;
+			continue;
+		}
+
+		if (esc) {
+			switch (b) {
+			case '"':
+			case '\\':
+			case '/':
+			break;
+			case 'b':
+				b = '\b';
+			break;
+			case 'f':
+				b = '\f';
+			break;
+			case 'n':
+				b = '\n';
+			break;
+			case 'r':
+				b = '\r';
+			break;
+			case 't':
+				b = '\t';
+			break;
+			case 'u':
+				if (!(l = parse_ucode_esc(buf, str, pos, len)))
+					return 1;
+				pos += l;
+				b = 0;
+			break;
+			default:
+				tst_json_err(buf, "Invalid escape \\%c", b);
+				return 1;
+			}
+			esc = 0;
+		}
+
+		if (str && b) {
+			if (pos + 1 >= len) {
+				tst_json_err(buf, "String buffer too short!");
+				return 1;
+			}
+
+			str[pos++] = b;
+		}
+	}
+
+	return 1;
+}
+
+static int copy_id_str(struct tst_json_buf *buf, char *str, size_t len)
+{
+	size_t pos = 0;
+
+	if (eatws(buf))
+		goto err0;
+
+	if (!eatb(buf, '"'))
+		goto err0;
+
+	for (;;) {
+		if (buf_empty(buf)) {
+			tst_json_err(buf, "Unterminated ID string");
+			return 1;
+		}
+
+		if (eatb(buf, '"')) {
+			str[pos] = 0;
+			break;
+		}
+
+		if (pos >= len-1) {
+			tst_json_err(buf, "ID string too long");
+			return 1;
+		}
+
+		str[pos++] = getb(buf);
+	}
+
+	if (eatws(buf))
+		goto err1;
+
+	if (!eatb(buf, ':'))
+		goto err1;
+
+	return 0;
+err0:
+	tst_json_err(buf, "Expected ID string");
+	return 1;
+err1:
+	tst_json_err(buf, "Expected ':' after ID string");
+	return 1;
+}
+
+static int is_digit(char b)
+{
+	switch (b) {
+	case '0' ... '9':
+		return 1;
+	default:
+		return 0;
+	}
+}
+
+static int get_number(struct tst_json_buf *buf, struct tst_json_val *res)
+{
+	long val = 0;
+	int neg = 0;
+
+	if (peekb(buf) == '-') {
+		neg = 1;
+		getb(buf);
+		if (!is_digit(peekb(buf))) {
+			tst_json_err(buf, "Expected digits after '-'");
+			return 1;
+		}
+	}
+
+	while (is_digit(peekb(buf))) {
+		val *= 10;
+		val += getb(buf) - '0';
+		//TODO: overflow?
+	}
+
+	if (neg)
+		val = -val;
+
+	res->val_int = val;
+
+	return 0;
+}
+
+int tst_json_obj_skip(struct tst_json_buf *buf)
+{
+	struct tst_json_val res = {};
+
+	TST_JSON_OBJ_FOREACH(buf, &res) {
+		switch (res.type) {
+		case TST_JSON_OBJ:
+			if (tst_json_obj_skip(buf))
+				return 1;
+		break;
+		case TST_JSON_ARR:
+			if (tst_json_arr_skip(buf))
+				return 1;
+		break;
+		default:
+		break;
+		}
+	}
+
+	return 0;
+}
+
+int tst_json_arr_skip(struct tst_json_buf *buf)
+{
+	struct tst_json_val res = {};
+
+	TST_JSON_ARR_FOREACH(buf, &res) {
+		switch (res.type) {
+		case TST_JSON_OBJ:
+			if (tst_json_obj_skip(buf))
+				return 1;
+		break;
+		case TST_JSON_ARR:
+			if (tst_json_arr_skip(buf))
+				return 1;
+		break;
+		default:
+		break;
+		}
+	}
+
+	return 0;
+}
+
+enum tst_json_type tst_json_next_type(struct tst_json_buf *buf)
+{
+	if (eatws(buf)) {
+		tst_json_err(buf, "Unexpected end");
+		return TST_JSON_VOID;
+	}
+
+	char b = peekb(buf);
+
+	switch (b) {
+	case '{':
+		return TST_JSON_OBJ;
+	case '[':
+		return TST_JSON_ARR;
+	case '"':
+		return TST_JSON_STR;
+	case '-':
+	case '0' ... '9':
+		return TST_JSON_INT;
+	default:
+		tst_json_err(buf, "Expected object, array, number or string");
+		return TST_JSON_VOID;
+	}
+}
+
+enum tst_json_type tst_json_start(struct tst_json_buf *buf)
+{
+	enum tst_json_type type = tst_json_next_type(buf);
+
+	switch (type) {
+	case TST_JSON_ARR:
+	case TST_JSON_OBJ:
+	case TST_JSON_VOID:
+	break;
+	case TST_JSON_INT:
+	case TST_JSON_STR:
+		tst_json_err(buf, "JSON can start only with array or object");
+		type = TST_JSON_VOID;
+	break;
+	}
+
+	return type;
+}
+
+static int get_value(struct tst_json_buf *buf, struct tst_json_val *res)
+{
+	res->type = tst_json_next_type(buf);
+
+	switch (res->type) {
+	case TST_JSON_STR:
+		if (copy_str(buf, res->buf, res->buf_size)) {
+			res->type = TST_JSON_VOID;
+			return 0;
+		}
+		res->val_str = res->buf;
+		return 1;
+	case TST_JSON_INT:
+		return !get_number(buf, res);
+	case TST_JSON_VOID:
+		//tst_json_err(buf, "Unexpected character");
+		return 0;
+	case TST_JSON_ARR:
+	case TST_JSON_OBJ:
+		buf->sub_off = buf->off;
+		return 1;
+	}
+
+	return 1;
+}
+
+static int pre_next(struct tst_json_buf *buf, struct tst_json_val *res)
+{
+	if (!eatb(buf, ',')) {
+		tst_json_err(buf, "Expected ','");
+		res->type = TST_JSON_VOID;
+		return 1;
+	}
+
+	if (eatws(buf)) {
+		tst_json_err(buf, "Unexpected end");
+		res->type = TST_JSON_VOID;
+		return 1;
+	}
+
+	return 0;
+}
+
+static int check_end(struct tst_json_buf *buf, struct tst_json_val *res, char b)
+{
+	if (eatws(buf)) {
+		tst_json_err(buf, "Unexpected end");
+		return 1;
+	}
+
+	if (eatb(buf, b)) {
+		res->type = TST_JSON_VOID;
+		return 1;
+	}
+
+	return 0;
+}
+
+static int obj_next(struct tst_json_buf *buf, struct tst_json_val *res)
+{
+	if (copy_id_str(buf, res->id, sizeof(res->id)))
+		return 0;
+
+	return get_value(buf, res);
+}
+
+static int check_err(struct tst_json_buf *buf, struct tst_json_val *res)
+{
+	if (tst_json_is_err(buf)) {
+		res->type = TST_JSON_VOID;
+		return 1;
+	}
+
+	return 0;
+}
+
+int tst_json_obj_next(struct tst_json_buf *buf, struct tst_json_val *res)
+{
+	if (check_err(buf, res))
+		return 0;
+
+	if (check_end(buf, res, '}'))
+		return 0;
+
+	if (pre_next(buf, res))
+		return 0;
+
+	return obj_next(buf, res);
+}
+
+static int any_first(struct tst_json_buf *buf, char b)
+{
+	if (eatws(buf)) {
+		tst_json_err(buf, "Unexpected end");
+		return 1;
+	}
+
+	if (!eatb(buf, b)) {
+		tst_json_err(buf, "Expected '%c'", b);
+		return 1;
+	}
+
+	return 0;
+}
+
+int tst_json_obj_first(struct tst_json_buf *buf, struct tst_json_val *res)
+{
+	if (check_err(buf, res))
+		return 0;
+
+	if (any_first(buf, '{'))
+		return 1;
+
+	if (check_end(buf, res, '}'))
+		return 0;
+
+	return obj_next(buf, res);
+}
+
+static int arr_next(struct tst_json_buf *buf, struct tst_json_val *res)
+{
+	return get_value(buf, res);
+}
+
+int tst_json_arr_first(struct tst_json_buf *buf, struct tst_json_val *res)
+{
+	if (check_err(buf, res))
+		return 0;
+
+	if (any_first(buf, '['))
+		return 1;
+
+	if (check_end(buf, res, ']'))
+		return 0;
+
+	return arr_next(buf, res);
+}
+
+int tst_json_arr_next(struct tst_json_buf *buf, struct tst_json_val *res)
+{
+	if (check_err(buf, res))
+		return 0;
+
+	if (check_end(buf, res, ']'))
+		return 0;
+
+	if (pre_next(buf, res))
+		return 0;
+
+	return arr_next(buf, res);
+}
+
+void tst_json_err(struct tst_json_buf *buf, const char *fmt, ...)
+{
+	va_list va;
+
+	va_start(va, fmt);
+	vsnprintf(buf->err, TST_JSON_ERR_MAX, fmt, va);
+	va_end(va);
+}
+
+static void print_line(FILE *f, const char *line)
+{
+	while (*line && *line != '\n')
+		fputc(*(line++), f);
+}
+
+static void print_spaces(FILE *f, size_t count)
+{
+	while (count--)
+		fputc(' ', f);
+}
+
+static void print_spaceline(FILE *f, const char *line, size_t count)
+{
+	size_t i;
+
+	for (i = 0; i < count; i++)
+		fputc(line[i] == '\t' ? '\t' : ' ', f);
+}
+
+#define ERR_LINES 10
+
+#define MIN(A, B) ((A < B) ? (A) : (B))
+
+void tst_json_err_print(FILE *f, struct tst_json_buf *buf)
+{
+	ssize_t i;
+	const char *lines[ERR_LINES] = {};
+	size_t cur_line = 0;
+	size_t cur_off = 0;
+	size_t last_off = buf->off;
+
+	for (;;) {
+		lines[(cur_line++) % ERR_LINES] = buf->json + cur_off;
+
+		while (cur_off < buf->len && buf->json[cur_off] != '\n')
+			cur_off++;
+
+		if (cur_off >= buf->off)
+			break;
+
+		cur_off++;
+		last_off = buf->off - cur_off;
+	}
+
+	fprintf(f, "Parse error at line %zu\n\n", cur_line);
+
+	size_t idx = 0;
+
+	for (i = MIN(ERR_LINES, cur_line); i > 0; i--) {
+		idx = (cur_line - i) % ERR_LINES;
+		fprintf(f, "%03zu: ", cur_line - i + 1);
+		print_line(f, lines[idx]);
+		fputc('\n', f);
+	}
+
+	print_spaces(f, 5);
+	print_spaceline(f, lines[idx], last_off);
+	fprintf(f, "^\n");
+	fprintf(f, "%s\n", buf->err);
+}
+
+struct tst_json_buf *tst_json_load(const char *path)
+{
+	int fd = open(path, O_RDONLY);
+	struct tst_json_buf *ret;
+	ssize_t res;
+	off_t len, off = 0;
+
+	if (fd < 0)
+		return NULL;
+
+	len = lseek(fd, 0, SEEK_END);
+	if (len == (off_t)-1) {
+		fprintf(stderr, "lseek() failed\n");
+		goto err0;
+	}
+
+	if (lseek(fd, 0, SEEK_SET) == (off_t)-1) {
+		fprintf(stderr, "lseek() failed\n");
+		goto err0;
+	}
+
+	ret = malloc(sizeof(struct tst_json_buf) + len + 1);
+	if (!ret) {
+		fprintf(stderr, "malloc() failed\n");
+		goto err0;
+	}
+
+	memset(ret, 0, sizeof(*ret));
+
+	ret->buf[len] = 0;
+	ret->len = len;
+	ret->json = ret->buf;
+
+	while (off < len) {
+		res = read(fd, ret->buf + off, len - off);
+		if (res < 0) {
+			fprintf(stderr, "read() failed\n");
+			goto err1;
+		}
+
+		off += res;
+	}
+
+	close(fd);
+
+	return ret;
+err1:
+	free(ret);
+err0:
+	close(fd);
+	return NULL;
+}
+
+void tst_json_free(struct tst_json_buf *buf)
+{
+	free(buf);
+}
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
