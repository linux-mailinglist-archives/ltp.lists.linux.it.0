Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C567824C532
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 20:21:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7DD303C2FAC
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 20:21:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 6D3343C12A1
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 20:21:21 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 69C7C1000676
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 20:21:20 +0200 (CEST)
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ECDD9208B3;
 Thu, 20 Aug 2020 18:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597947678;
 bh=FehLwW5sI54Lc7Xmb4zRBemrPAV6i19xSX0gM5Td5Hg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KcyK7O86zC0+FofuAU7uT6N7cI/auU2W47KNPjVscQnD84mzyNpEgwdh5UOqEAtHj
 MpSGKSh9uOUpznMF8MlFK5MOCkCPqSNm1DvJH8FOE4R/oYbbo5NlmTPh9gEblFTEFh
 3hqaGyQ37tWPpeGtAnSFBrA9jaaazo0l7iHIyxms=
From: Eric Biggers <ebiggers@kernel.org>
To: ltp@lists.linux.it
Date: Thu, 20 Aug 2020 11:19:17 -0700
Message-Id: <20200820181918.404758-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820181918.404758-1-ebiggers@kernel.org>
References: <20200820181918.404758-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [LTP PATCH 1/2] lib/tst_af_alg: add tst_alg_sendmsg()
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
Cc: linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Eric Biggers <ebiggers@google.com>

Add a helper function which sends data to an AF_ALG request socket,
including control data.  This is needed by af_alg02, but it may also be
useful for other AF_ALG tests in the future.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/tst_af_alg.h | 32 ++++++++++++++++++++++
 lib/tst_af_alg.c     | 64 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/include/tst_af_alg.h b/include/tst_af_alg.h
index fc4b1989a..fd2ff0647 100644
--- a/include/tst_af_alg.h
+++ b/include/tst_af_alg.h
@@ -133,4 +133,36 @@ int tst_alg_setup(const char *algtype, const char *algname,
 int tst_alg_setup_reqfd(const char *algtype, const char *algname,
 			const uint8_t *key, unsigned int keylen);
 
+/** Specification of control data to send to an AF_ALG request socket */
+struct tst_alg_sendmsg_params {
+
+	/** If true, send ALG_SET_OP with ALG_OP_ENCRYPT */
+	bool encrypt;
+
+	/** If true, send ALG_SET_OP with ALG_OP_DECRYPT */
+	bool decrypt;
+
+	/** If ivlen != 0, send ALG_SET_IV */
+	const uint8_t *iv;
+	unsigned int ivlen;
+
+	/** If assoclen != 0, send ALG_SET_AEAD_ASSOCLEN */
+	unsigned int assoclen;
+
+	/* Value to use as msghdr::msg_flags */
+	uint32_t msg_flags;
+};
+
+/**
+ * Send some data to an AF_ALG request socket, including control data.
+ * @param reqfd An AF_ALG request socket
+ * @param data The data to send
+ * @param datalen The length of data in bytes
+ * @param params Specification of the control data to send
+ *
+ * On failure, tst_brk() is called with TBROK.
+ */
+void tst_alg_sendmsg(int reqfd, const void *data, size_t datalen,
+		     const struct tst_alg_sendmsg_params *params);
+
 #endif /* TST_AF_ALG_H */
diff --git a/lib/tst_af_alg.c b/lib/tst_af_alg.c
index 97be548b4..d3895a83d 100644
--- a/lib/tst_af_alg.c
+++ b/lib/tst_af_alg.c
@@ -146,3 +146,67 @@ int tst_alg_setup_reqfd(const char *algtype, const char *algname,
 	close(algfd);
 	return reqfd;
 }
+
+void tst_alg_sendmsg(int reqfd, const void *data, size_t datalen,
+		     const struct tst_alg_sendmsg_params *params)
+{
+	struct iovec iov = {
+		.iov_base = (void *)data,
+		.iov_len = datalen,
+	};
+	struct msghdr msg = {
+		.msg_iov = &iov,
+		.msg_iovlen = 1,
+		.msg_flags = params->msg_flags,
+	};
+	size_t controllen;
+	uint8_t *control;
+	struct cmsghdr *cmsg;
+	struct af_alg_iv *alg_iv;
+
+	if (params->encrypt && params->decrypt)
+		tst_brk(TBROK, "Both encrypt and decrypt are specified");
+
+	controllen = 0;
+	if (params->encrypt || params->decrypt)
+		controllen += CMSG_SPACE(sizeof(uint32_t));
+	if (params->ivlen)
+		controllen += CMSG_SPACE(sizeof(struct af_alg_iv) +
+					 params->ivlen);
+	if (params->assoclen)
+		controllen += CMSG_SPACE(sizeof(uint32_t));
+
+	control = SAFE_MALLOC(controllen);
+	memset(control, 0, controllen);
+	msg.msg_control = control;
+	msg.msg_controllen = controllen;
+	cmsg = CMSG_FIRSTHDR(&msg);
+
+	if (params->encrypt || params->decrypt) {
+		cmsg->cmsg_level = SOL_ALG;
+		cmsg->cmsg_type = ALG_SET_OP;
+		cmsg->cmsg_len = CMSG_LEN(sizeof(uint32_t));
+		*(uint32_t *)CMSG_DATA(cmsg) =
+			params->encrypt ? ALG_OP_ENCRYPT : ALG_OP_DECRYPT;
+		cmsg = CMSG_NXTHDR(&msg, cmsg);
+	}
+	if (params->ivlen) {
+		cmsg->cmsg_level = SOL_ALG;
+		cmsg->cmsg_type = ALG_SET_IV;
+		cmsg->cmsg_len = CMSG_LEN(sizeof(struct af_alg_iv) +
+					  params->ivlen);
+		alg_iv = (struct af_alg_iv *)CMSG_DATA(cmsg);
+		alg_iv->ivlen = params->ivlen;
+		memcpy(alg_iv->iv, params->iv, params->ivlen);
+		cmsg = CMSG_NXTHDR(&msg, cmsg);
+	}
+	if (params->assoclen) {
+		cmsg->cmsg_level = SOL_ALG;
+		cmsg->cmsg_type = ALG_SET_AEAD_ASSOCLEN;
+		cmsg->cmsg_len = CMSG_LEN(sizeof(uint32_t));
+		*(uint32_t *)CMSG_DATA(cmsg) = params->assoclen;
+		cmsg = CMSG_NXTHDR(&msg, cmsg);
+	}
+
+	SAFE_SENDMSG(datalen, reqfd, &msg, 0);
+}
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
