Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAC8A35C62
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Feb 2025 12:22:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 33BDC3C9AF2
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Feb 2025 12:22:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 79ADC3C9B09
 for <ltp@lists.linux.it>; Fri, 14 Feb 2025 12:21:36 +0100 (CET)
Authentication-Results: in-5.smtp.seeweb.it;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ipv4:195.135.223.131/32) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A307062FBA6
 for <ltp@lists.linux.it>; Fri, 14 Feb 2025 12:21:35 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4981A2121A
 for <ltp@lists.linux.it>; Fri, 14 Feb 2025 11:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1739532090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VMfVHVMba/SQCf+BZt/GAElK76gLdWyeYEr5qT3S9Q4=;
 b=d6ttkAZNVvyLd/xGBl1KsGZ26+1QpbVVC0YLYj75IfqJOs7PQDrqaiSaz1A5BEInKmRa97
 Awws3kh8wLjUIBJUl5AJ8DAcEwZ8UDxvCs5yMhxyLnVjEqOO951Cv0WeMMi6f7q+OxFo2V
 ifToSAXxB6ethg2UE1lu5kuB/rlgfGM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1739532090;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VMfVHVMba/SQCf+BZt/GAElK76gLdWyeYEr5qT3S9Q4=;
 b=NF1lt9relOtQYnjhIXV1sEt/OasQyhO0aTgkbBXyMtsQGfFuNd+MAXkycabsAHMlLiwP6W
 RdrdVzaTL7k2OzBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1739532090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VMfVHVMba/SQCf+BZt/GAElK76gLdWyeYEr5qT3S9Q4=;
 b=d6ttkAZNVvyLd/xGBl1KsGZ26+1QpbVVC0YLYj75IfqJOs7PQDrqaiSaz1A5BEInKmRa97
 Awws3kh8wLjUIBJUl5AJ8DAcEwZ8UDxvCs5yMhxyLnVjEqOO951Cv0WeMMi6f7q+OxFo2V
 ifToSAXxB6ethg2UE1lu5kuB/rlgfGM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1739532090;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VMfVHVMba/SQCf+BZt/GAElK76gLdWyeYEr5qT3S9Q4=;
 b=NF1lt9relOtQYnjhIXV1sEt/OasQyhO0aTgkbBXyMtsQGfFuNd+MAXkycabsAHMlLiwP6W
 RdrdVzaTL7k2OzBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 35354137DB
 for <ltp@lists.linux.it>; Fri, 14 Feb 2025 11:21:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wJ+XCjonr2fpXwAAD6G6ig
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Fri, 14 Feb 2025 11:21:30 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 14 Feb 2025 12:21:34 +0100
Message-ID: <20250214112135.18947-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250214112135.18947-1-chrubis@suse.cz>
References: <20250214112135.18947-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_ONE(0.00)[1];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TO_DN_NONE(0.00)[];
 PREVIOUSLY_DELIVERED(0.00)[ltp@lists.linux.it];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,T_SPF_PERMERROR
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/2] testcases/lib/run_tests.sh
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

Enable TESTS_TBROK

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/lib/run_tests.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/lib/run_tests.sh b/testcases/lib/run_tests.sh
index 0abca2f3c..168dbb451 100755
--- a/testcases/lib/run_tests.sh
+++ b/testcases/lib/run_tests.sh
@@ -90,6 +90,7 @@ run_tests()
 
 run_tests 0 $TESTS_PASS
 run_tests 32 $TESTS_TCONF
+run_tests 2 $TESTS_TBROK
 
 echo
 echo "*** Testing LTP test -h option ***"
-- 
2.45.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
