Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D68AA54F841
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jun 2022 15:17:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 411C43C880A
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jun 2022 15:17:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 83FAF3C72A0
 for <ltp@lists.linux.it>; Fri, 17 Jun 2022 15:17:05 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 629641A01237
 for <ltp@lists.linux.it>; Fri, 17 Jun 2022 15:17:04 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A7CA621E55;
 Fri, 17 Jun 2022 13:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1655471823; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=x+AjfyJ50zXvYURpMChVX5OrDvTzIYUouaDbpah4XUI=;
 b=r/jSBwUQz6jz6rH0vcIjz0FM8qnE1UgMmAxtqQTnGzuJODrGTHDYqvviiF6PkzKWjcwWzO
 Hbo1elqrD3vc7X0eH18u4QiV1YqZtuVG6kW4NveMWBciLzHfwSog4MZDEXSztJMsLPTQfh
 5KqCwrPfEdDOlIINJC7zwQZrXfis7eU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1655471823;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=x+AjfyJ50zXvYURpMChVX5OrDvTzIYUouaDbpah4XUI=;
 b=s9Xu8D39zdkta3DtqoZvHHLTg9UaXHz7Tpu7dIc+T++bxnPr6xILLHIHE5zhwZQpAqrwR6
 YIJBDYS65XdIoiBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7A75F13458;
 Fri, 17 Jun 2022 13:17:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /96GG89+rGIAEAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 17 Jun 2022 13:17:03 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 17 Jun 2022 15:16:59 +0200
Message-Id: <20220617131659.27868-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] ci/ubuntu: impish -> jammy
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

Ubuntu 21.10 impish EOL in 2027-04 (next month).
Replace it with the latest stable release (EOL 2027-04).

Reported-by: Andrea Cervesato <andrea.cervesato@suse.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

It's also a question whether use 20.04 LTS focal instead of 18.04 LTS
bionic. I guess we'd like to cover everything: bleeding edge, used
distros and very old and still used distros. bionic EOL next year
(2023-04).

Kind regards,
Petr

 .github/workflows/ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index fe28e4d05..a412f8904 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -93,7 +93,7 @@ jobs:
               CC: clang
               METADATA: asciidoctor-pdf
 
-          - container: "ubuntu:impish"
+          - container: "ubuntu:jammy"
             env:
               CC: gcc
               METADATA: asciidoctor
-- 
2.36.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
