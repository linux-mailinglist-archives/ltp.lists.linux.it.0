Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 651085FDD84
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Oct 2022 17:49:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 98EE33CAEF1
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Oct 2022 17:49:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B16993CA9C7
 for <ltp@lists.linux.it>; Thu, 13 Oct 2022 17:49:37 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 059CB600F29
 for <ltp@lists.linux.it>; Thu, 13 Oct 2022 17:49:36 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 17D1B21D5B;
 Thu, 13 Oct 2022 15:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1665676176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pcxLWcQw1w7QSUUJdzg7YTllmin90U4/AXjFashPbt8=;
 b=sqL7FXFATVgiFjKSeiPPhIQDSPcVGcL9Jm8AtFXKKawCykUllrm33c0ASECWdY1LQclCCy
 mZ8Lr6X+vPlWVdeYMYwXIU3E5vhH/CAClfjY9elTuFAm8q3JdFGAEz3cVv9W82KPTgMz6D
 37DdQQjw5tVVXsnjNZh6ZxEb8DzfbPg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1665676176;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pcxLWcQw1w7QSUUJdzg7YTllmin90U4/AXjFashPbt8=;
 b=S4w1VRvNxhTqALrfNCFevruM7UFbMmiwfaYUCM4RczPJfI6X3rIpuVhBO/W7GhztRBXON9
 ziMLKrPPhFBzlUDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D107013AAA;
 Thu, 13 Oct 2022 15:49:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lyS1MY8zSGMnDQAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Thu, 13 Oct 2022 15:49:35 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: amir73il@gmail.com,
	ltp@lists.linux.it
Date: Thu, 13 Oct 2022 17:49:31 +0200
Message-Id: <20221013154935.20461-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 0/4] Fix fanotify14
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

Fanotify14 tests some fanotify_init() flags which are not supported
on older kernels but doesn't properly check for their availability.
Fix the init flag availability checks, print more verbose information
about which test case is currently being executed and move the LTP copy
of fanotify constants to an LAPI header.

Martin Doucha (4):
  fanotify14: Print human-readable test case flags
  Move fanotify fallback constants and structs to LAPI header
  Add fanotify_get_supported_init_flags() helper function
  fanotify14: Improve check for unsupported init flags

 include/lapi/fanotify.h                       | 210 +++++++++++++++++
 testcases/kernel/syscalls/fanotify/fanotify.h | 219 ++----------------
 .../kernel/syscalls/fanotify/fanotify14.c     | 208 +++++++++--------
 3 files changed, 347 insertions(+), 290 deletions(-)
 create mode 100644 include/lapi/fanotify.h

-- 
2.37.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
