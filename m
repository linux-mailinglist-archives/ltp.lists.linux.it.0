Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B5C94879E
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2024 04:31:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E9CAB3D1FD5
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2024 04:31:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7B4B83D1DDD
 for <ltp@lists.linux.it>; Tue,  6 Aug 2024 04:31:22 +0200 (CEST)
Authentication-Results: in-5.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=liwang@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BE85F60081A
 for <ltp@lists.linux.it>; Tue,  6 Aug 2024 04:31:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722911479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UqE/s5Gvom7afcv97mTe2eOCXxwpQ3gyNPB5hQNQfPE=;
 b=cynWqjhxLbZMuCOPDtTwzpE+gmj+Mo3gdcH7MoXItUKrGatn7LjUzX4pEp3llXBWAPB3P6
 bPPMDnwb+dTi3Kri/6zvxjjzVUgwYdotgV6k1RICTSBlzUFSR6tsM0UoyVub6VXLZQOprK
 mdKco2TSA5RHj9nWEQwHYvbURSYF3Ps=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-8Se-rnHpOlm8uEAc0NLP2w-1; Mon,
 05 Aug 2024 22:31:14 -0400
X-MC-Unique: 8Se-rnHpOlm8uEAc0NLP2w-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 947FC19560A3; Tue,  6 Aug 2024 02:31:13 +0000 (UTC)
Received: from dell-per7425-02.rhts.eng.pek2.redhat.com
 (dell-per7425-02.rhts.eng.pek2.redhat.com [10.73.116.18])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B923A1955D42; Tue,  6 Aug 2024 02:31:11 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Tue,  6 Aug 2024 10:31:05 +0800
Message-ID: <20240806023105.20509-1-liwang@redhat.com>
In-Reply-To: <CAEemH2eF3B41E2nv1+-oMrCUTw7zfVrgCULRBaBe=Pk9roBUiQ@mail.gmail.com>
References: <CAEemH2eF3B41E2nv1+-oMrCUTw7zfVrgCULRBaBe=Pk9roBUiQ@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] pkey: remove the ltp_ prefix from pkey functions
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

Suggested-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Li Wang <liwang@redhat.com>
---
 include/lapi/pkey.h                       | 14 +++++---------
 testcases/kernel/syscalls/mseal/mseal01.c |  6 +++---
 testcases/kernel/syscalls/pkeys/pkey01.c  |  8 ++++----
 3 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/include/lapi/pkey.h b/include/lapi/pkey.h
index e0dc20dce..933dff34a 100644
--- a/include/lapi/pkey.h
+++ b/include/lapi/pkey.h
@@ -17,29 +17,25 @@
 #endif
 
 #ifndef HAVE_PKEY_MPROTECT
-inline int ltp_pkey_mprotect(void *addr, size_t len, int prot, int pkey)
+inline int pkey_mprotect(void *addr, size_t len, int prot, int pkey)
 {
 	return tst_syscall(__NR_pkey_mprotect, addr, len, prot, pkey);
 }
 
-inline int ltp_pkey_alloc(unsigned int flags, unsigned int access_rights)
+inline int pkey_alloc(unsigned int flags, unsigned int access_rights)
 {
 	return tst_syscall(__NR_pkey_alloc, flags, access_rights);
 }
 
-inline int ltp_pkey_free(int pkey)
+inline int pkey_free(int pkey)
 {
 	return tst_syscall(__NR_pkey_free, pkey);
 }
-#else
-#define ltp_pkey_alloc pkey_alloc
-#define ltp_pkey_free pkey_free
-#define ltp_pkey_mprotect pkey_mprotect
 #endif /* HAVE_PKEY_MPROTECT */
 
 static inline void check_pkey_support(void)
 {
-	int pkey = ltp_pkey_alloc(0, 0);
+	int pkey = tst_syscall(__NR_pkey_alloc, 0, 0);
 
 	if (pkey == -1) {
 		if (errno == ENOSYS)
@@ -50,7 +46,7 @@ static inline void check_pkey_support(void)
 			tst_brk(TCONF, "pkeys are not available for test");
 	}
 
-	ltp_pkey_free(pkey);
+	tst_syscall(__NR_pkey_free, pkey);
 }
 
 #endif /* PKEYS_H__ */
diff --git a/testcases/kernel/syscalls/mseal/mseal01.c b/testcases/kernel/syscalls/mseal/mseal01.c
index 1de9fb723..94e3e4b23 100644
--- a/testcases/kernel/syscalls/mseal/mseal01.c
+++ b/testcases/kernel/syscalls/mseal/mseal01.c
@@ -51,17 +51,17 @@ static void test_pkey_mprotect(void)
 
 	check_pkey_support();
 
-	pkey = ltp_pkey_alloc(0, 0);
+	pkey = pkey_alloc(0, 0);
 	if (pkey == -1)
 		tst_brk(TBROK | TERRNO, "pkey_alloc failed");
 
-	TST_EXP_FAIL(ltp_pkey_mprotect(
+	TST_EXP_FAIL(pkey_mprotect(
 		mem_addr, mem_size,
 		PROT_NONE,
 		pkey),
 		EPERM);
 
-	if (ltp_pkey_free(pkey) == -1)
+	if (pkey_free(pkey) == -1)
 		tst_brk(TBROK | TERRNO, "pkey_free() error");
 }
 
diff --git a/testcases/kernel/syscalls/pkeys/pkey01.c b/testcases/kernel/syscalls/pkeys/pkey01.c
index a6a739668..60f36706c 100644
--- a/testcases/kernel/syscalls/pkeys/pkey01.c
+++ b/testcases/kernel/syscalls/pkeys/pkey01.c
@@ -142,12 +142,12 @@ static void pkey_test(struct tcase *tc, struct mmap_param *mpa)
 
 	buffer = SAFE_MMAP(NULL, size, mpa->prot, mpa->flags, fd, 0);
 
-	pkey = ltp_pkey_alloc(tc->flags, tc->access_rights);
+	pkey = pkey_alloc(tc->flags, tc->access_rights);
 	if (pkey == -1)
 		tst_brk(TBROK | TERRNO, "pkey_alloc failed");
 
 	tst_res(TINFO, "Set %s on (%s) buffer", tc->name, flag_to_str(mpa->flags));
-	if (ltp_pkey_mprotect(buffer, size, mpa->prot, pkey) == -1)
+	if (pkey_mprotect(buffer, size, mpa->prot, pkey) == -1)
 		tst_brk(TBROK | TERRNO, "pkey_mprotect failed");
 
 	pid = SAFE_FORK();
@@ -176,7 +176,7 @@ static void pkey_test(struct tcase *tc, struct mmap_param *mpa)
                 tst_res(TFAIL, "Child: %s", tst_strstatus(status));
 
 	tst_res(TINFO, "Remove %s from the buffer", tc->name);
-	if (ltp_pkey_mprotect(buffer, size, mpa->prot, 0x0) == -1)
+	if (pkey_mprotect(buffer, size, mpa->prot, 0x0) == -1)
 		tst_brk(TBROK | TERRNO, "pkey_mprotect failed");
 
 	switch (mpa->prot) {
@@ -199,7 +199,7 @@ static void pkey_test(struct tcase *tc, struct mmap_param *mpa)
 
 	SAFE_MUNMAP(buffer, size);
 
-	if (ltp_pkey_free(pkey) == -1)
+	if (pkey_free(pkey) == -1)
 		tst_brk(TBROK | TERRNO, "pkey_free failed");
 }
 
-- 
2.45.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
