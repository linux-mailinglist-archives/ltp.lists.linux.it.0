Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4259A3A8691
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 18:33:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 89FC73C99BE
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 18:33:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 059C13C2794
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 18:33:16 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8F3251000BDB
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 18:33:16 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3F35C1FD69;
 Tue, 15 Jun 2021 16:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623774796; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+BkacY5kYxwRXa2lLZj+EA2KPzQpYCxYq9808mHAoc=;
 b=VChuAAf9LOADKMaabKqDCDE+C6edqM0ARnQUW1k6BbLYPMoKmafCPw/x/h7IkbV6tFk5+y
 qWT1zV93baQhShPLNETudrTn7lliYvR8flj/iCiT/Vhs97gvzSP64XH3JZ+eL9A1adi4TI
 VzCt7sAwZY+1eqlEG1X9qGr//iytMRU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623774796;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+BkacY5kYxwRXa2lLZj+EA2KPzQpYCxYq9808mHAoc=;
 b=/u7KoX30zcuwWUwRTCwId9cCLo9WEa/xUif0hBZCiKIObhAmB8/fkTBn0y5UAPAo0jojG/
 XEhzQ9US0jeDZcBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id D6629118DD;
 Tue, 15 Jun 2021 16:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623774796; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+BkacY5kYxwRXa2lLZj+EA2KPzQpYCxYq9808mHAoc=;
 b=VChuAAf9LOADKMaabKqDCDE+C6edqM0ARnQUW1k6BbLYPMoKmafCPw/x/h7IkbV6tFk5+y
 qWT1zV93baQhShPLNETudrTn7lliYvR8flj/iCiT/Vhs97gvzSP64XH3JZ+eL9A1adi4TI
 VzCt7sAwZY+1eqlEG1X9qGr//iytMRU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623774796;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+BkacY5kYxwRXa2lLZj+EA2KPzQpYCxYq9808mHAoc=;
 b=/u7KoX30zcuwWUwRTCwId9cCLo9WEa/xUif0hBZCiKIObhAmB8/fkTBn0y5UAPAo0jojG/
 XEhzQ9US0jeDZcBQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id aG6XMkvWyGDdfQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 15 Jun 2021 16:33:15 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 15 Jun 2021 18:33:07 +0200
Message-Id: <20210615163307.10755-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210615163307.10755-1-pvorel@suse.cz>
References: <20210615163307.10755-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 3/3] doc: Update LTPROOT and PATH environment
 variables
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

to address changes in two previous commits.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 README.md          | 2 +-
 doc/user-guide.txt | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/README.md b/README.md
index 703395c6b..b0ad47dfa 100644
--- a/README.md
+++ b/README.md
@@ -162,7 +162,7 @@ $ testcases/bin/ioctl01 -h
 Many require certain environment variables to be set
 
 ```
-$ LTPROOT=/opt/ltp PATH="$PATH:$LTPROOT/testcases/bin" testcases/bin/wc01.sh
+$ LTPROOT=/opt/ltp testcases/bin/wc01.sh
 ```
 
 Most commonly, the path variable needs to be set and also `LTPROOT`, but there
diff --git a/doc/user-guide.txt b/doc/user-guide.txt
index 8df29e688..ab2d773a7 100644
--- a/doc/user-guide.txt
+++ b/doc/user-guide.txt
@@ -11,6 +11,7 @@ For running LTP network tests see `testcases/network/README.md`.
 | 'KCONFIG_PATH'        | The path to the kernel config file, (if not set, it tries
                           the usual paths '/boot/config-RELEASE' or '/proc/config.gz').
 | 'LTPROOT'             | Prefix for installed LTP, the default is '/opt/ltp'.
+                          Used for setting 'PATH' and other environment variables.
 | 'LTP_COLORIZE_OUTPUT' | Force colorized output behaviour. 'y' or '1': always colorize
                           'n' or '0': never colorize.
 | 'LTP_DEV'             | Path to the block device to be used
@@ -19,8 +20,10 @@ For running LTP network tests see `testcases/network/README.md`.
 | 'LTP_TIMEOUT_MUL'     | Multiply timeout, must be number >= 1 (> 1 is useful for
                           slow machines to avoid unexpected timeout).
                           Variable is also used in shell tests, but ceiled to int.
-| 'PATH'                | It's required to addjust path:
-                          `PATH="$PATH:$LTPROOT/testcases/bin"`
+| 'PATH'                | Testcases are installed into 'LTPROOT/testcases/bin',
+                          'PATH' is set by library API. You need to add it into
+                          'PATH' only if you use custom runner (not runltp neither
+                          [runltp-ng](https://github.com/metan-ucw/runltp-ng).
 | 'TMPDIR'              | Base directory for template directory (C: '.needs_tmpdir = 1'
                           and others, which imply it, shell: 'TST_NEEDS_TMPDIR=1').
 | 'TST_NO_CLEANUP'      | Disable running test cleanup (defined in 'TST_CLEANUP').
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
