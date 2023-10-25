Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 277E07D64FC
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Oct 2023 10:26:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A9CEB3CCBAE
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Oct 2023 10:26:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A0B7F3C6D29
 for <ltp@lists.linux.it>; Wed, 25 Oct 2023 10:26:56 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2234E200AD9
 for <ltp@lists.linux.it>; Wed, 25 Oct 2023 10:26:55 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AF5591FF31;
 Wed, 25 Oct 2023 08:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1698222414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=G6gAiZGPocs0AMzbW6tKRsiaPlOEhxvfnjZCJwDvtIE=;
 b=KThi5aN+p1hy8fxniqRjdqbNRIZH69RpCtf6NleNAUDZ0u3xF8SJDgzXzpCnR56iSYsi2I
 cfhIrc6oP37oEbPHUM/OXtdIcHBDc6K/gPmXLe/d3YCNPxN8XqXuwgGO482C6KYUacj5av
 H0r5fmSk8rtboGgvi5alUOYJecPy23g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1698222414;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=G6gAiZGPocs0AMzbW6tKRsiaPlOEhxvfnjZCJwDvtIE=;
 b=Q473RHOHn6XyE0/14bXQHwK9oqLkd/70E/x/GQ3yaf62K6KQRcPMmETaW1gvssWLJseSGI
 Y/6Qnml71NMabnDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4D67C13524;
 Wed, 25 Oct 2023 08:26:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SeUFEU7ROGX3egAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 25 Oct 2023 08:26:54 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 25 Oct 2023 10:26:49 +0200
Message-ID: <20231025082651.297259-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/2] Fix CI for CentOS 7
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

Changes v1->v2:
* Revert configure.ac change (no need to check for the header, it
  existed since kernel git history) (Cyril)

I also plan to suggest a raise of minimal kernel supported by LTP,
but let's fix the CI first.

Kind regards,
Petr

Petr Vorel (2):
  lapi: Add uinput.h
  input_helper: Fix compilation on CentOS 7

 include/lapi/uinput.h                 | 15 +++++++++++++++
 testcases/kernel/input/input_helper.c |  1 +
 2 files changed, 16 insertions(+)
 create mode 100644 include/lapi/uinput.h

-- 
2.42.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
