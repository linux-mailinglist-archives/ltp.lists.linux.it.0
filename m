Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA9E6D5EFB
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Apr 2023 13:29:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F10953CA256
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Apr 2023 13:29:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4A9233C990E
 for <ltp@lists.linux.it>; Tue,  4 Apr 2023 13:28:57 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C0EBA1400977
 for <ltp@lists.linux.it>; Tue,  4 Apr 2023 13:28:56 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0F93422996;
 Tue,  4 Apr 2023 11:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1680607736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=WlqqjpNx1Rqk+x83t570+vNH1izvipoDdfaVMlAbZRg=;
 b=eEsLSnX8A1gfBxB8FOn8/tZDcpcym5y9ngONNqyQ+6AKimSY7eGPua/XEIqrN4G4LXb1cg
 yeISEIkKndlZZ8u9dAs1nBpBkv5S9oDeu9E9NXSH/q7YwFcCkNtPhKYKgOqazhHAXzh+HM
 CXpsjP97N/t4bLZaCWXRWjBVnE0UkaI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1680607736;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=WlqqjpNx1Rqk+x83t570+vNH1izvipoDdfaVMlAbZRg=;
 b=J7+CJeRTgJIkNRIhnYCZAX3Vf0zQMQjLm3PmUzEYqzEpygveXOU5mw09EuUIv0AEpKQ/xv
 KuOr1vvpfjUmf/Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D02AC1391A;
 Tue,  4 Apr 2023 11:28:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eS9pMfcJLGQefgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 04 Apr 2023 11:28:55 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  4 Apr 2023 13:28:52 +0200
Message-Id: <20230404112852.1271969-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] mmap20: Fix invalid address
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
Cc: Paulson Raja L <paulson@zilogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

1 << 7 (0x80) is defined as MAP_LOCKED on ppc64le and mips.
Use 1 << 9 (0x200), which looks to be unused on all archs.

Fixes: 2764e9e6a ("mmap20: New test for mmap() with MAP_SHARED_VALIDATE")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
NOTE: (1 << 10) would work as well.

 testcases/kernel/syscalls/mmap/mmap20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/mmap/mmap20.c b/testcases/kernel/syscalls/mmap/mmap20.c
index c346df5d1..5269179e5 100644
--- a/testcases/kernel/syscalls/mmap/mmap20.c
+++ b/testcases/kernel/syscalls/mmap/mmap20.c
@@ -20,7 +20,7 @@
 
 #define TEST_FILE "file_to_mmap"
 #define TEST_FILE_SIZE 1024
-#define INVALID_FLAG (1 << 7)
+#define INVALID_FLAG (1 << 9)
 
 static int fd = -1;
 static void *addr;
-- 
2.40.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
