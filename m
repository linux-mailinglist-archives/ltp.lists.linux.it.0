Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C1958C7A4
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Aug 2022 13:38:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 088423C949E
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Aug 2022 13:38:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CD9B93C91F1
 for <ltp@lists.linux.it>; Mon,  8 Aug 2022 13:38:02 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2E813200222
 for <ltp@lists.linux.it>; Mon,  8 Aug 2022 13:38:01 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 068F637983;
 Mon,  8 Aug 2022 11:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1659958681; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=oEmp0gr61AIvw2BaXPVXHzbcJaxGQZm1wl8HoZPaG1M=;
 b=TkoMFoqmMEGWsscpEyXV3vu8mfy/iAv9PA7ZYKfHuXUXzepHdXQEp+rHoDyvqAoddMSGym
 ZGK+1cZy2CWJDsM2ymaPVIj1C7yVVZ//zz9JOlc5AkNgq2zyM9QUhhmjSADIbUQ+QbKFaW
 ne1uiQ2JSNXf0JVVgj7K9vXbi6CHuZE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1659958681;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=oEmp0gr61AIvw2BaXPVXHzbcJaxGQZm1wl8HoZPaG1M=;
 b=LtRwiGPMoZ6RezPG/QTOq8Y4JZtFJ9SjTawuRO2zd9WezF/yaOnQPFpDfpkCPt7y59ZR1a
 m4376yYk4LFFtsBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C17B113AB3;
 Mon,  8 Aug 2022 11:38:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 11O+LZj18GJ0LgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 08 Aug 2022 11:38:00 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  8 Aug 2022 13:37:52 +0200
Message-Id: <20220808113756.11582-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v4 0/4] set -e and bashism fixes
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

changes v3->v4:
* Really fix tst_ansi_color.sh

Petr Vorel (4):
  tst_test.sh: runtest.sh: Remove unused code
  tst_ansi_color.sh: Allow to run with set -e
  tst_test.sh: Fix _tst_cleanup_timer() on set -e
  generate_lvm_runfile.sh: Fix bashism

 lib/newlib_tests/runtest.sh                |  3 ---
 testcases/lib/tst_ansi_color.sh            | 13 +++++++------
 testcases/lib/tst_test.sh                  |  5 +----
 testcases/misc/lvm/generate_lvm_runfile.sh |  5 +++--
 4 files changed, 11 insertions(+), 15 deletions(-)

-- 
2.37.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
