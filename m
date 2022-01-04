Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAD3484196
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jan 2022 13:20:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD7923C9223
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jan 2022 13:20:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C3A1D3C2A4D
 for <ltp@lists.linux.it>; Tue,  4 Jan 2022 13:20:36 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3FBDA600719
 for <ltp@lists.linux.it>; Tue,  4 Jan 2022 13:20:36 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id A0B0B1F386;
 Tue,  4 Jan 2022 12:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1641298835; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5S1FgmQ9mneDCVT/iDxC0ZjS8ZTHl7NT9l6Eadyonlg=;
 b=Saedmxb7hENQJ5QHKjmhDD7l7n2oL7MmyURH/dG7+P/o0NTpwftBIyLLNHuraoGqoHfftu
 qwFwGoaHlPS/0hEp9W2k7FAkWfugO29D7fdHlzgKEkWjQBf0qOi6PXkwqAi+X7TgXraNth
 cRxDpc1VEXLMHPiKpfQX6o1fJ+jyQBc=
Received: from g78.suse.de (unknown [10.163.24.42])
 by relay2.suse.de (Postfix) with ESMTP id 5AE4EA3B83;
 Tue,  4 Jan 2022 12:20:35 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue,  4 Jan 2022 12:20:07 +0000
Message-Id: <20220104122010.23069-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220104122010.23069-1-rpalethorpe@suse.com>
References: <20220104122010.23069-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/5] API/cgroup: Add memory.stat
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
---
 lib/tst_cgroup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
index c78f28112..2ef599d9e 100644
--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -153,6 +153,7 @@ static const struct cgroup_file cgroup_ctrl_files[] = {
 static const struct cgroup_file memory_ctrl_files[] = {
 	{ "memory.current", "memory.usage_in_bytes", CTRL_MEMORY },
 	{ "memory.max", "memory.limit_in_bytes", CTRL_MEMORY },
+	{ "memory.stat", "memory.stat", CTRL_MEMORY },
 	{ "memory.swappiness", "memory.swappiness", CTRL_MEMORY },
 	{ "memory.swap.current", "memory.memsw.usage_in_bytes", CTRL_MEMORY },
 	{ "memory.swap.max", "memory.memsw.limit_in_bytes", CTRL_MEMORY },
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
