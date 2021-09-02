Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F263FED50
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 13:58:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 90D1F3C7598
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 13:58:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CE3A33C29D1
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 13:58:47 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BF20F601B1A
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 13:58:46 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 116AF1FF80;
 Thu,  2 Sep 2021 11:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630583926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=xbJJTLI2bdcRPIPQw9EuWRGNVGYKpW7pua9oiA+KqoY=;
 b=yBK4vBCF4YBlXOZhixsSWjpLBw8mOLUSEz3hWDi7lgjP5zthUaxcoZiklPIfXEYzdP/Jys
 wvyRbTNC5ES+fqIX/dQtabzg7p38JOR7OGgWv1MAr7uR+oJRKS4cR+EftWVWOI66yvgCSN
 G2ZAdgX5V93OESgg5rBYnNz1Hxyw/Ow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630583926;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=xbJJTLI2bdcRPIPQw9EuWRGNVGYKpW7pua9oiA+KqoY=;
 b=wXiL9xh9L6qw2keCFtMi+1VkQByZNCYDZQnpBPD526lsGDSUxIIHHZiKtuFZ1y0TkrnIfZ
 yWjcCEP5i6zhkkAw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 70D0B13732;
 Thu,  2 Sep 2021 11:58:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id gj6dE3W8MGHxfAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 02 Sep 2021 11:58:45 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  2 Sep 2021 13:58:37 +0200
Message-Id: <20210902115837.2199-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 5/5] checkbashisms: Disable 'type' check
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

'type' is part of POSIX, but as part of the X/Open Systems Interfaces
option (XSI). The checkbashisms man page explicitly says:

	Note that the definition of a bashism in this context roughly
	equates to "a shell feature that is not required to be supported
	by POSIX"; this means that some issues flagged may be permitted
	under optional sections of POSIX, such as XSI or User Portability.

'type' is flagged because it is an optional feature. But because it's
supported by all common shells (i.e.  > bash, zsh, dash, busybox sh,
mksh) we use it even in the library => disable the check.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

follow up to patchset "checkbashisms.pl in make check + fixed docs" [1].

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/list/?series=260711

 scripts/checkbashisms.pl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/checkbashisms.pl b/scripts/checkbashisms.pl
index ba417c993..6dc762cb7 100755
--- a/scripts/checkbashisms.pl
+++ b/scripts/checkbashisms.pl
@@ -675,7 +675,8 @@ sub init_hashes {
         $LEADIN . qr'shopt(\s|\Z)'       => q<shopt>,
         $LEADIN . qr'suspend\s'          => q<suspend>,
         $LEADIN . qr'time\s'             => q<time>,
-        $LEADIN . qr'type\s'             => q<type>,
+        # LTP supports type
+        # $LEADIN . qr'type\s'             => q<type>,
         $LEADIN . qr'typeset\s'          => q<typeset>,
         $LEADIN . qr'ulimit(\s|\Z)'      => q<ulimit>,
         $LEADIN . qr'set\s+-[BHT]+'      => q<set -[BHT]>,
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
