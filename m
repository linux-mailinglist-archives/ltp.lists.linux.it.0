Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F176C7C55
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Mar 2023 11:16:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 240C93CC295
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Mar 2023 11:16:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 25A113CAC66
 for <ltp@lists.linux.it>; Fri, 24 Mar 2023 11:16:45 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 39590200254
 for <ltp@lists.linux.it>; Fri, 24 Mar 2023 11:16:43 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 57DC721923;
 Fri, 24 Mar 2023 10:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1679653003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=bCYjYMSZRNo4by2o/GDuHNi30cabtLgwn6rACdEaS+c=;
 b=eGQSM9yR36b48U6b3P+QPprfNd1gywxw9Bp8GRNedjFUbypOcHgk37TJv9FQlWIvGC/ocB
 ccQidGZ0lR+JHR1/GA8xLgVh67Dhh0lJo3QlGfyqAYX2ItzDQZeM6rhuMg+8oBbCFtkX+c
 JShdKUG5rXa5zbVNK3OTVBK83N0iEz4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1679653003;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=bCYjYMSZRNo4by2o/GDuHNi30cabtLgwn6rACdEaS+c=;
 b=torIn8h5SUHPiN/9/r+dzNFs5PYzu9MlIO47HKWAGcA6CTAnndYEmQlw279wcUPajgxhpW
 GyQ4+DUn13css6DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 28738138ED;
 Fri, 24 Mar 2023 10:16:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id w/RMCIt4HWQZOwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 24 Mar 2023 10:16:43 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 24 Mar 2023 11:16:30 +0100
Message-Id: <20230324101630.562727-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] lapi/mmap.h: Add MAP_SHARED_VALIDATE
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
Cc: paulson <lpaulsonraja@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

It will be needed in new mmap20.c test for CentOS 7.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

Fix required for patch:
https://patchwork.ozlabs.org/project/ltp/patch/20230323121330.92244-1-paulson@zilogic.com/

CI shows failures on CentOS 7:

https://github.com/pevik/ltp/actions/runs/4509751194/jobs/7939880067

/__w/ltp/ltp/testcases/kernel/syscalls/mmap/mmap20.c:48:25: error: 'MAP_SHARED_VALIDATE' undeclared (first use in this function)
          INVALID_FLAG | MAP_SHARED_VALIDATE, fd, 0);
/__w/ltp/ltp/testcases/kernel/syscalls/mmap/mmap20.c:48:25: note: each undeclared identifier is reported only once for each function it appears in

More at he patch

 include/lapi/mmap.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/lapi/mmap.h b/include/lapi/mmap.h
index 48795369d..7512e9f81 100644
--- a/include/lapi/mmap.h
+++ b/include/lapi/mmap.h
@@ -10,6 +10,10 @@
 #include "config.h"
 #include <sys/mman.h>
 
+#ifndef MAP_SHARED_VALIDATE
+# define MAP_SHARED_VALIDATE 0x03
+#endif
+
 #ifndef MAP_HUGETLB
 # define MAP_HUGETLB 0x40000
 #endif
-- 
2.40.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
