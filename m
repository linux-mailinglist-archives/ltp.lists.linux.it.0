Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9453A2A8E1
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Feb 2025 13:57:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 981863C9296
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Feb 2025 13:57:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DC6823C0277
 for <ltp@lists.linux.it>; Thu,  6 Feb 2025 13:57:27 +0100 (CET)
Authentication-Results: in-3.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1C2C21BD942F
 for <ltp@lists.linux.it>; Thu,  6 Feb 2025 13:57:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738846645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sKPbpyHj/BugsrVSLI/ko+k+o6OrtF/LLttKLF5Ur0g=;
 b=bxIWuvmNUJeLwTlHOTTQRLcPIphAwFt/qAOBKhj803sVZz1YkCNmHLI8o7bvULo2gnXIbG
 mgih4Yx/6NEcDwIQZGkrmHuq9vgZQtZ/lMzRcnN6l5x83w+wGl6tM3qIaeN2FCso7a9Pst
 NXW5PY1UIuvKmlRCbJxXTQGnE3Ofkx4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-638-0oqEOLReN9OklCHqnGPAxg-1; Thu,
 06 Feb 2025 07:57:23 -0500
X-MC-Unique: 0oqEOLReN9OklCHqnGPAxg-1
X-Mimecast-MFC-AGG-ID: 0oqEOLReN9OklCHqnGPAxg
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B8A3E180087B
 for <ltp@lists.linux.it>; Thu,  6 Feb 2025 12:57:22 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.45.224.64])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E8CF41800352
 for <ltp@lists.linux.it>; Thu,  6 Feb 2025 12:57:21 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Thu,  6 Feb 2025 13:56:29 +0100
Message-ID: <89d0fb724ea534419942c2647e1ef7ca98f9e72d.1738846569.git.jstancek@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IsICMzXw44Zl3VDCEEZHGYfe3Rv6pfT6KE1CVUlOI3E_1738846642
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] syscalls/bpf: zero-initialize bpf_attr including
 padding bits
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

gcc 15 stopped zero-initializing padding bits:
  https://gcc.gnu.org/gcc-15/changes.html

However kernel bpf syscall checks that all unused fields for a command
are set to zero in CHECK_ATTR() macro, which causes tests to fail with
EINVAL.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/syscalls/bpf/bpf_common.c | 32 ++++++++++++----------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/testcases/kernel/syscalls/bpf/bpf_common.c b/testcases/kernel/syscalls/bpf/bpf_common.c
index 95b5bc12eaa4..d765c4e32936 100644
--- a/testcases/kernel/syscalls/bpf/bpf_common.c
+++ b/testcases/kernel/syscalls/bpf/bpf_common.c
@@ -49,13 +49,14 @@ int bpf_map_create(union bpf_attr *const attr)
 
 int bpf_map_array_create(const uint32_t max_entries)
 {
-	union bpf_attr map_attr = {
-		.map_type = BPF_MAP_TYPE_ARRAY,
-		.key_size = 4,
-		.value_size = 8,
-		.max_entries = max_entries,
-		.map_flags = 0
-	};
+	/* zero-initialize entire struct including padding bits */
+	union bpf_attr map_attr = {};
+
+	map_attr.map_type = BPF_MAP_TYPE_ARRAY;
+	map_attr.key_size = 4;
+	map_attr.value_size = 8;
+	map_attr.max_entries = max_entries;
+	map_attr.map_flags = 0;
 
 	return bpf_map_create(&map_attr);
 }
@@ -64,13 +65,16 @@ void bpf_map_array_get(const int map_fd,
 		       const uint32_t *const array_indx,
 		       uint64_t *const array_val)
 {
-	union bpf_attr elem_attr = {
-		.map_fd = map_fd,
-		.key = ptr_to_u64(array_indx),
-		.value = ptr_to_u64(array_val),
-		.flags = 0
-	};
-	const int ret = bpf(BPF_MAP_LOOKUP_ELEM, &elem_attr, sizeof(elem_attr));
+	/* zero-initialize entire struct including padding bits */
+	union bpf_attr elem_attr = {};
+	int ret;
+
+	elem_attr.map_fd = map_fd;
+	elem_attr.key = ptr_to_u64(array_indx);
+	elem_attr.value = ptr_to_u64(array_val);
+	elem_attr.flags = 0;
+
+	ret = bpf(BPF_MAP_LOOKUP_ELEM, &elem_attr, sizeof(elem_attr));
 
 	if (ret) {
 		tst_brk(TBROK | TTERRNO,
-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
