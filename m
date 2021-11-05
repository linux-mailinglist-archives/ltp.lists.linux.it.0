Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6D5446493
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Nov 2021 15:03:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 30E103C7641
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Nov 2021 15:03:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7064B3C559D
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 15:03:29 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 19D11201131
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 15:03:28 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 637D31FD36
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 14:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1636121008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8AfklPGPJM4Di+D72ukjNzhDsyAj9tCkVnyScg6Vxew=;
 b=DnYhNITyvV3061MukS8OxxXiRvETKQUyu7ujNV35Z60n7IFbxtFghswcK0AxTLy8WnIBrM
 +5AcT8KcH2T36kKRN8pveegmehXM79FgFRuClVhCS2gt0pcM0azrb27piZF9kHkhJpj9u6
 PH5DKQoLYj0n1Yk8uIp3lQIyOX49mL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1636121008;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8AfklPGPJM4Di+D72ukjNzhDsyAj9tCkVnyScg6Vxew=;
 b=/32HbmMUDGxeyc1Ylxlt13V2krGcvHeBF+lEXcEX3l/7RPO79Cj+yXSOpddmMMI271T/S9
 LwrRbJmqAu6yz2DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4F2A913A2C
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 14:03:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id q0pNErA5hWGneQAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Fri, 05 Nov 2021 14:03:28 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  5 Nov 2021 15:04:25 +0100
Message-Id: <20211105140425.8272-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] metadata: Ignore system macros
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

Ingore all macros that start with underscore. Unless we do that we get
several thousands of __NR_foo macros and the hash table cannot keep up.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 metadata/metaparse.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/metadata/metaparse.c b/metadata/metaparse.c
index b38550550..f71d8628d 100644
--- a/metadata/metaparse.c
+++ b/metadata/metaparse.c
@@ -624,6 +624,9 @@ static void parse_macro(FILE *f)
 
 	macro_get_val(f, val, sizeof(val));
 
+	if (name[0] == '_')
+		return;
+
 	ENTRY e = {
 		.key = strdup(name),
 		.data = strdup(val),
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
