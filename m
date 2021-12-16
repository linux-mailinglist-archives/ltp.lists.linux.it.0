Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E75477246
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Dec 2021 13:55:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC4DE3C8F38
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Dec 2021 13:55:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 302073C268E
 for <ltp@lists.linux.it>; Thu, 16 Dec 2021 13:55:03 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 33EC5200BD2
 for <ltp@lists.linux.it>; Thu, 16 Dec 2021 13:55:02 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0EEA61F3A7;
 Thu, 16 Dec 2021 12:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1639659302; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DOVXPmcfUSXbBN9uPJCU/TeIK+ERBzlCfT6+BWywhX4=;
 b=HrYCR/cMiCxr0skFI6l0H/YmHdlORCU6viZTSnwh3CIEH2bDFLlfcxJuc/S1uhN/BsF4j5
 k0X7CdRYcnkwzxMlkv6hI/mJJU/kt7aPKKbRpM7HFIOLeQaZAPgolJtZpNchgQm+azhA/I
 UCRdpVU1Ss/g7rx+lDwTxx325WMi/LI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1639659302;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DOVXPmcfUSXbBN9uPJCU/TeIK+ERBzlCfT6+BWywhX4=;
 b=9pp2S8dCefMS/Ja4t3oeMbGKReyamOpYxJu7HLtMhRY5UnBEqOTaA/T2PGkClUCzZYWCgE
 nRj/v5tg7UnEXkBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD72C13E3B;
 Thu, 16 Dec 2021 12:55:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PDHcMCU3u2EsYQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 16 Dec 2021 12:55:01 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 16 Dec 2021 13:54:56 +0100
Message-Id: <20211216125456.6760-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] tst_af_alg: Another fix for disabled weak cyphers
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

e.g. md5 and sm3 on enabled FIPS (fips=1 on cmdline) on SLES 15-SP4.
Similar fix to 4fa302ef9d. It fixes:

tst_af_alg.c:84: TBROK: unexpected error binding AF_ALG socket to hash algorithm 'md5': ELIBBAD (80)
become
af_alg01.c:26: TCONF: kernel doesn't have hash algorithm 'md5'
af_alg01.c:26: TCONF: kernel doesn't have hash algorithm 'md5-generic'
...
af_alg01.c:26: TCONF: kernel doesn't have hash algorithm 'sm3'
af_alg01.c:26: TCONF: kernel doesn't have hash algorithm 'sm3-generic'

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/tst_af_alg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tst_af_alg.c b/lib/tst_af_alg.c
index 05caa63016..e1cb480f77 100644
--- a/lib/tst_af_alg.c
+++ b/lib/tst_af_alg.c
@@ -77,7 +77,7 @@ bool tst_have_alg(const char *algtype, const char *algname)
 
 	ret = bind(algfd, (const struct sockaddr *)&addr, sizeof(addr));
 	if (ret != 0) {
-		if (errno != ENOENT) {
+		if (errno != ENOENT && errno != ELIBBAD) {
 			tst_brk(TBROK | TERRNO,
 				"unexpected error binding AF_ALG socket to %s algorithm '%s'",
 				algtype, algname);
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
