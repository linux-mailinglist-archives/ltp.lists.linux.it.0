Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1B8487605
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jan 2022 11:59:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 794B43C7B55
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jan 2022 11:59:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 341873C12CF
 for <ltp@lists.linux.it>; Fri,  7 Jan 2022 11:59:18 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AB4ED600946
 for <ltp@lists.linux.it>; Fri,  7 Jan 2022 11:59:17 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D39431F3A2;
 Fri,  7 Jan 2022 10:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1641553156; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r+cBEutXqWKjhk7iuKCPUjfyEXg9l1xu0R/1OCab/ns=;
 b=ahV5mWNy+/jmeUw+o2DFhUabph+pr2Q+fodetPBStdRW6soAvdNIs5H/u3DEjQquqvoor3
 wj3me9yi4Q+Ndi7mFSgCJWR+NQBoukLstrvx0lLT6s/Z3KY7cIkDEwXKd1+5d/LJ4yanFK
 Hfe4s6qQyjHFNvvsqBE3JpGWdqKL8HU=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ACB9B13CCC;
 Fri,  7 Jan 2022 10:59:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EKkeKAQd2GExFwAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Fri, 07 Jan 2022 10:59:16 +0000
To: ltp@lists.linux.it
Date: Fri,  7 Jan 2022 11:59:04 +0100
Message-Id: <20220107105913.29036-2-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107105913.29036-1-andrea.cervesato@suse.com>
References: <20220107105913.29036-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 01/10] Add lapi/watch_queue.h header fallback
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 include/lapi/watch_queue.h | 112 +++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 include/lapi/watch_queue.h

diff --git a/include/lapi/watch_queue.h b/include/lapi/watch_queue.h
new file mode 100644
index 000000000..438e62239
--- /dev/null
+++ b/include/lapi/watch_queue.h
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2021 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ *
+ * This file is created to resolve conflicts between user space and kernel
+ * space fctnl.h declaration. linux/watch_queue.h is not handled, since
+ * user space fcntl.h redefines kernel space structures.
+ */
+
+#ifndef LAPI_WATCH_QUEUE_H__
+#define LAPI_WATCH_QUEUE_H__
+
+#include <stdint.h>
+#include "lapi/ioctl.h"
+#include "lapi/fcntl.h"
+
+#define O_NOTIFICATION_PIPE	O_EXCL	/* Parameter to pipe2() selecting notification pipe */
+
+#define IOC_WATCH_QUEUE_SET_SIZE	_IO('W', 0x60)	/* Set the size in pages */
+#define IOC_WATCH_QUEUE_SET_FILTER	_IO('W', 0x61)	/* Set the filter */
+
+enum watch_notification_type {
+	WATCH_TYPE_META		= 0,	/* Special record */
+	WATCH_TYPE_KEY_NOTIFY	= 1,	/* Key change event notification */
+	WATCH_TYPE__NR		= 2
+};
+
+enum watch_meta_notification_subtype {
+	WATCH_META_REMOVAL_NOTIFICATION	= 0,	/* Watched object was removed */
+	WATCH_META_LOSS_NOTIFICATION	= 1,	/* Data loss occurred */
+};
+
+/*
+ * Notification record header.  This is aligned to 64-bits so that subclasses
+ * can contain __u64 fields.
+ */
+struct watch_notification {
+	uint32_t			type:24;	/* enum watch_notification_type */
+	uint32_t			subtype:8;	/* Type-specific subtype (filterable) */
+	uint32_t			info;
+#define WATCH_INFO_LENGTH	0x0000007f	/* Length of record */
+#define WATCH_INFO_LENGTH__SHIFT 0
+#define WATCH_INFO_ID		0x0000ff00	/* ID of watchpoint */
+#define WATCH_INFO_ID__SHIFT	8
+#define WATCH_INFO_TYPE_INFO	0xffff0000	/* Type-specific info */
+#define WATCH_INFO_TYPE_INFO__SHIFT 16
+#define WATCH_INFO_FLAG_0	0x00010000	/* Type-specific info, flag bit 0 */
+#define WATCH_INFO_FLAG_1	0x00020000	/* ... */
+#define WATCH_INFO_FLAG_2	0x00040000
+#define WATCH_INFO_FLAG_3	0x00080000
+#define WATCH_INFO_FLAG_4	0x00100000
+#define WATCH_INFO_FLAG_5	0x00200000
+#define WATCH_INFO_FLAG_6	0x00400000
+#define WATCH_INFO_FLAG_7	0x00800000
+};
+
+/*
+ * Notification filtering rules (IOC_WATCH_QUEUE_SET_FILTER).
+ */
+struct watch_notification_type_filter {
+	uint32_t	type;			/* Type to apply filter to */
+	uint32_t	info_filter;		/* Filter on watch_notification::info */
+	uint32_t	info_mask;		/* Mask of relevant bits in info_filter */
+	uint32_t	subtype_filter[8];	/* Bitmask of subtypes to filter on */
+};
+
+struct watch_notification_filter {
+	uint32_t	nr_filters;		/* Number of filters */
+	uint32_t	__reserved;		/* Must be 0 */
+	struct watch_notification_type_filter filters[];
+};
+
+
+/*
+ * Extended watch removal notification.  This is used optionally if the type
+ * wants to indicate an identifier for the object being watched, if there is
+ * such.  This can be distinguished by the length.
+ *
+ * type -> WATCH_TYPE_META
+ * subtype -> WATCH_META_REMOVAL_NOTIFICATION
+ */
+struct watch_notification_removal {
+	struct watch_notification watch;
+	uint64_t	id;		/* Type-dependent identifier */
+};
+
+/*
+ * Type of key/keyring change notification.
+ */
+enum key_notification_subtype {
+	NOTIFY_KEY_INSTANTIATED	= 0, /* Key was instantiated (aux is error code) */
+	NOTIFY_KEY_UPDATED	= 1, /* Key was updated */
+	NOTIFY_KEY_LINKED	= 2, /* Key (aux) was added to watched keyring */
+	NOTIFY_KEY_UNLINKED	= 3, /* Key (aux) was removed from watched keyring */
+	NOTIFY_KEY_CLEARED	= 4, /* Keyring was cleared */
+	NOTIFY_KEY_REVOKED	= 5, /* Key was revoked */
+	NOTIFY_KEY_INVALIDATED	= 6, /* Key was invalidated */
+	NOTIFY_KEY_SETATTR	= 7, /* Key's attributes got changed */
+};
+
+/*
+ * Key/keyring notification record.
+ * - watch.type = WATCH_TYPE_KEY_NOTIFY
+ * - watch.subtype = enum key_notification_type
+ */
+struct key_notification {
+	struct watch_notification watch;
+	uint32_t	key_id;		/* The key/keyring affected */
+	uint32_t	aux;		/* Per-type auxiliary data */
+};
+
+#endif /* LAPI_WATCH_QUEUE_H__ */
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
