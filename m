Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDerAb5lnWlgPQQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 09:47:58 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F766183F5D
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 09:47:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 323133D0F74
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 09:47:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9F4F93CB958
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 09:47:46 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DCC0320099A
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 09:47:45 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ADFB23F117;
 Tue, 24 Feb 2026 08:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771922864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JlmEth/d7syJjdixEwwDOYV2eELa67/cMSJRCCtpqCQ=;
 b=HMQOZnMt/9kxUYLSMciSfV5JSEeOhqcjULHODbLce/rg25TLifDTTozp5cl+4AT+hrNj8Q
 xoBV638YqfomwQn08zYR3U5v+l0CWqhY8HPugoiYayC9mUMdb4JlECvV0Kp0W5WBkoMiOY
 V2Fl/5DuhxOvzYxy5WkrzTEcXIZV7c4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771922864;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JlmEth/d7syJjdixEwwDOYV2eELa67/cMSJRCCtpqCQ=;
 b=zs/GoBjgPAhjK5P3uoUQql5c9tqrbfdhUeQa/FfH871dKnvR/g7Xx1JYLwbLPRD8UavHIo
 CcOngpAntsg6T+DQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HMQOZnMt;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="zs/GoBjg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771922864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JlmEth/d7syJjdixEwwDOYV2eELa67/cMSJRCCtpqCQ=;
 b=HMQOZnMt/9kxUYLSMciSfV5JSEeOhqcjULHODbLce/rg25TLifDTTozp5cl+4AT+hrNj8Q
 xoBV638YqfomwQn08zYR3U5v+l0CWqhY8HPugoiYayC9mUMdb4JlECvV0Kp0W5WBkoMiOY
 V2Fl/5DuhxOvzYxy5WkrzTEcXIZV7c4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771922864;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JlmEth/d7syJjdixEwwDOYV2eELa67/cMSJRCCtpqCQ=;
 b=zs/GoBjgPAhjK5P3uoUQql5c9tqrbfdhUeQa/FfH871dKnvR/g7Xx1JYLwbLPRD8UavHIo
 CcOngpAntsg6T+DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 880B13EA68;
 Tue, 24 Feb 2026 08:47:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SfR6H7BlnWm4VQAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Tue, 24 Feb 2026 08:47:44 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Tue, 24 Feb 2026 09:47:42 +0100
MIME-Version: 1.0
Message-Id: <20260224-remove_runltp-v3-1-5389b1a985de@suse.com>
X-B4-Tracking: v=1; b=H4sIAK1lnWkC/32MSw6CMBQAr0Le2hr6+BRYeQ9jTAsPaSItaaHRE
 O5uYeVGlzPJzAqenCYPTbKCo6C9tiZCdkqgHaR5ENNdZMAUyxQxZ45GG+juFvOcJ0ZSYK56XqS
 dgthMjnr9On7XW+RB+9m697EPfLe/ToEzzoSSUtSqLGTbXfzi6dzaEfZRwL8xxrjPqqpEWRWqF
 l/xtm0fTtbGI+YAAAA=
X-Change-ID: 20260224-remove_runltp-ea724bf150db
To: Linux Test Project <ltp@lists.linux.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771922864; l=4186;
 i=andrea.cervesato@suse.com; s=20251210; h=from:subject:message-id;
 bh=E+z43qNboj8IXtP/OfKLVtf35lB+O1tdLVzU/fj9MPw=;
 b=p7aGxPYp2sa1MOHAM3iMDE6BB4phZJLQDZHphKlI/3A2BFcdpmD7NgecxPFVjCT0r0a+7+v8a
 SmRShrV99QID3F0+9cxY8N0mMkt8S+tb6lNKxPSk9pWuZtNF/ISv0Xl
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=zKY+6GCauOiuHNZ//d8PQ/UL4jFCTKbXrzXAOQSLevI=
X-Spam-Score: -4.51
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3] Remove runltp `scenario_groups` leftovers
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[suse.de : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	RCPT_COUNT_ONE(0.00)[1];
	NEURAL_HAM(-0.00)[-0.993];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,picard.linux.it:helo,picard.linux.it:rdns,suse.com:mid,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[andrea.cervesato@suse.de,ltp-bounces@lists.linux.it];
	TAGGED_RCPT(0.00)[linux-ltp];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:-]
X-Rspamd-Queue-Id: 9F766183F5D
X-Rspamd-Action: no action

From: Andrea Cervesato <andrea.cervesato@suse.com>

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
Changes in v3:
- remove scenario_groups from Makefile
- Link to v2: https://lore.kernel.org/r/20260224-remove_runltp-v2-1-f38862a85b97@suse.com

Changes in v2:
- forgot to keep runltp script
- Link to v1: https://lore.kernel.org/r/20260224-remove_runltp-v1-1-7baa79b65acd@suse.com
---
 Makefile                 |  4 ++--
 scenario_groups/Makefile | 38 --------------------------------------
 scenario_groups/default  | 28 ----------------------------
 scenario_groups/network  | 20 --------------------
 4 files changed, 2 insertions(+), 88 deletions(-)

diff --git a/Makefile b/Makefile
index d82366489c36b90ba665ee1030f9aebc528c25b8..2a7cf54caa4186b9a16402fefff778d6e0b2943d 100644
--- a/Makefile
+++ b/Makefile
@@ -45,8 +45,8 @@ COMMON_TARGETS		+= testcases tools metadata
 
 # Don't want to nuke the original files if we're installing in-build-tree.
 ifneq ($(BUILD_TREE_STATE),$(BUILD_TREE_SRCDIR_INSTALL))
-INSTALL_TARGETS		+= runtest scenario_groups testscripts
-CLEAN_TARGETS		+= include runtest scenario_groups testscripts
+INSTALL_TARGETS		+= runtest testscripts
+CLEAN_TARGETS		+= include runtest testscripts
 endif
 INSTALL_TARGETS		+= $(COMMON_TARGETS)
 CLEAN_TARGETS		+= $(COMMON_TARGETS) lib libs
diff --git a/scenario_groups/Makefile b/scenario_groups/Makefile
deleted file mode 100644
index fcbc9270829e2e496ef8bcc0fb69e558a0bb81ed..0000000000000000000000000000000000000000
--- a/scenario_groups/Makefile
+++ /dev/null
@@ -1,38 +0,0 @@
-#
-#    scenario-groups Makefile.
-#
-#    Copyright (C) 2010, Linux Test Project.
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
-# Ngie Cooper, November 2010
-#
-
-top_srcdir		?= ..
-
-include $(top_srcdir)/include/mk/env_pre.mk
-
-INSTALL_DIR		:= scenario_groups
-
-# Don't copy over the Makefile
-UNWANTED_FILES		:= Makefile
-
-INSTALL_MODE		:= 00644
-
-INSTALL_TARGETS		:= $(filter-out $(UNWANTED_FILES),$(notdir $(patsubst $(abs_srcdir)/%,%,$(sort $(wildcard $(abs_srcdir)/*)))))
-
-MAKE_TARGETS		:=
-
-include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/scenario_groups/default b/scenario_groups/default
deleted file mode 100644
index 0e76b2bee11c937e878ddf77c94f695129d98dbf..0000000000000000000000000000000000000000
--- a/scenario_groups/default
+++ /dev/null
@@ -1,28 +0,0 @@
-syscalls
-fs
-fs_perms_simple
-dio
-mm
-ipc
-irq
-sched
-math
-nptl
-pty
-containers
-fs_bind
-controllers
-fcntl-locktests
-power_management_tests
-hugetlb
-commands
-hyperthreading
-can
-cpuhotplug
-net.ipv6_lib
-input
-cve
-crypto
-kernel_misc
-uevent
-watchqueue
diff --git a/scenario_groups/network b/scenario_groups/network
deleted file mode 100644
index 974b9fc58317912d194334af28278fa9a22eef65..0000000000000000000000000000000000000000
--- a/scenario_groups/network
+++ /dev/null
@@ -1,20 +0,0 @@
-can
-net.features
-net.ipv6
-net.ipv6_lib
-net.tcp_cmds
-net.multicast
-net.nfs
-net.rpc_tests
-net.tirpc_tests
-net.sctp
-net_stress.appl
-net_stress.broken_ip
-net_stress.interface
-net_stress.ipsec_dccp
-net_stress.ipsec_icmp
-net_stress.ipsec_sctp
-net_stress.ipsec_tcp
-net_stress.ipsec_udp
-net_stress.multicast
-net_stress.route

---
base-commit: f062b34785db121c841f2faed8233b0943cdff27
change-id: 20260224-remove_runltp-ea724bf150db

Best regards,
-- 
Andrea Cervesato <andrea.cervesato@suse.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
