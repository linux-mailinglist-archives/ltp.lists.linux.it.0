Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2DE607684
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Oct 2022 13:54:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 84D113CB21F
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Oct 2022 13:54:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EB2D13C6E8B
 for <ltp@lists.linux.it>; Fri, 21 Oct 2022 13:53:40 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id EDBD96005E9
 for <ltp@lists.linux.it>; Fri, 21 Oct 2022 13:53:39 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7541021ACC;
 Fri, 21 Oct 2022 11:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1666353219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aovnm5ZwyCh5ydXB2NnFeXAQOgnYRUjGZz/4xBEINP0=;
 b=tm75h8LNFMU2sbYk6bCGg/zSGecpasC/8alx8DjHUeY/orfHv4AYBikYVtQxWYuh4HtEkC
 KQKusPheWipxIFGBCPBHnXH5gQO1+o+nHBvRGF/AaYq0uEsSZw3B4RC6DRF/J6IMg2xFTr
 2NWfSbHUXjJAoL3HKCvkzm1ZNOLuPlI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1666353219;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aovnm5ZwyCh5ydXB2NnFeXAQOgnYRUjGZz/4xBEINP0=;
 b=SbvIaVjyQAoIwIfRvN9xetjB+k9JG9XVZdShGDt8y+HO/61SzLm2gwoqotCXcLoiukHhNG
 EtPZk9I16EZOaUCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 20C3F13A0E;
 Fri, 21 Oct 2022 11:53:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8JLDBEOIUmOdTAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 21 Oct 2022 11:53:39 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 21 Oct 2022 13:53:32 +0200
Message-Id: <20221021115333.13725-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221021115333.13725-1-pvorel@suse.cz>
References: <20221021115333.13725-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] Makefile: Update copyright, use SPDX
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

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 Makefile | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/Makefile b/Makefile
index ea11ac7f3..1ccb301a0 100644
--- a/Makefile
+++ b/Makefile
@@ -1,25 +1,7 @@
-#
-#    Top-level Makefile for LTP. See INSTALL for more info.
-#
-#    Copyright (c) Linux Test Project, 2009-2020
-#    Copyright (c) Cisco Systems Inc., 2009-2010
-#
-#    This program is free software; you can redistribute it and/or modify
-#    it under the terms of the GNU General Public License as published by
-#    the Free Software Foundation; either version 2 of the License, or
-#    (at your option) any later version.
-#
-#    This program is distributed in the hope that it will be useful,
-#    but WITHOUT ANY WARRANTY; without even the implied warranty of
-#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-#    GNU General Public License for more details.
-#
-#    You should have received a copy of the GNU General Public License along
-#    with this program; if not, write to the Free Software Foundation, Inc.,
-#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) Linux Test Project, 2009-2022
+# Copyright (c) Cisco Systems Inc., 2009-2010
 # Ngie Cooper, July 2009
-#
 
 # Avoid funny character set dependencies
 export LANG=C
-- 
2.38.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
