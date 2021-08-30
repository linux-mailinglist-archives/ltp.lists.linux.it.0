Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 704913FB6D5
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 15:17:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 269A43C2B6E
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 15:17:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 78AE93C2AD2
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 15:17:32 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F08B4600812
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 15:17:31 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 273D0200AC
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 13:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630329451; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MV+YCKh1CNvkcwi97PumSMhUPi2TSImtFZZ2R2lXXJw=;
 b=wATQH14Ow3w/dsVrxFDmitiZGdZDAuHVrSx1T6snjXLMFEZjiUIiFLBON8Wro4uQqs8lM5
 Ulz1n2IhwS9SfcmA29YNMNN3uKMk1xUROJvkHCr9oxX0drlpmVXjCUlu3F0bp6k3KdZPYx
 HQ7fSUr/YTaVULTsyw3xneCHrLgAOAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630329451;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MV+YCKh1CNvkcwi97PumSMhUPi2TSImtFZZ2R2lXXJw=;
 b=hyawLU7OR4zCqUHLHhLK3AuPVB7JhyFPmRjAx0y17eT0FGECALbstD9CivsXgaLvfwBDwV
 WoMp+uxDhygwK2Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0B5D413A98
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 13:17:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UAfAAWvaLGGCIAAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 13:17:31 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 30 Aug 2021 15:17:30 +0200
Message-Id: <20210830131730.31935-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210830131730.31935-1-mdoucha@suse.cz>
References: <20210830131730.31935-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] tst_get_free_gid(): Skip GID 0
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

tst_get_free_gid() may return GID 0 on systems where /etc/group (or another
database of user groups) does not exist. But GID 0 exists implicitly and
it may stay after setgid() as a supplemental group of the test process if it
was executed with root privileges. Skip GID 0 to avoid unexpected test
failures.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 lib/tst_uid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tst_uid.c b/lib/tst_uid.c
index 2163b1494..dd719d312 100644
--- a/lib/tst_uid.c
+++ b/lib/tst_uid.c
@@ -19,7 +19,7 @@ gid_t tst_get_free_gid_(const char *file, const int lineno, gid_t skip)
 
 	errno = 0;
 
-	for (ret = 0; ret < MAX_GID; ret++) {
+	for (ret = 1; ret < MAX_GID; ret++) {
 		if (ret == skip || getgrgid(ret))
 			continue;
 
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
