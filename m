Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8C0494159
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jan 2022 20:55:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 960B13C96B0
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jan 2022 20:55:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4D2F13C95D8
 for <ltp@lists.linux.it>; Wed, 19 Jan 2022 20:55:25 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C393060064A
 for <ltp@lists.linux.it>; Wed, 19 Jan 2022 20:55:24 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 641EF1F3BA;
 Wed, 19 Jan 2022 19:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1642622124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NLl4ebsW/AsRD3vRJlXxvseXyloLXDQOVk0IX98Aj3g=;
 b=hAN80xY7KFM+AsmrXu9fYpGEJ+W5j20orgp+mGFtZZtrMeoeTWVsBPbcI4YkS0LEi/PNXd
 vbAWTG7mRCR9BJTe0ZTPz5S5qKYbhwLOIRBbAqYiVxkYKJzjeWyJte3XMipXwr+ZPkNtvN
 AT9KeTzQDfCvMZrHXuNU5qGXCtCaQX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1642622124;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NLl4ebsW/AsRD3vRJlXxvseXyloLXDQOVk0IX98Aj3g=;
 b=zYHWGsjJ23jcX6MhEAe0eYs4kAksGjMwm4ncPyyJc92ECPKVRgZgzCwvUziH+o1PMmznNg
 i5eW26+PhX+K+/Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0722913BA3;
 Wed, 19 Jan 2022 19:55:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EOH2Oqts6GH2fAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 19 Jan 2022 19:55:23 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 19 Jan 2022 20:55:19 +0100
Message-Id: <20220119195519.3117-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220119195519.3117-1-pvorel@suse.cz>
References: <20220119195519.3117-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 2/2] broken_ip-nexthdr.sh: Check IPv6 support
 before forcing it
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
 testcases/network/stress/broken_ip/broken_ip-nexthdr.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/network/stress/broken_ip/broken_ip-nexthdr.sh b/testcases/network/stress/broken_ip/broken_ip-nexthdr.sh
index ec6643af66..cb4a3dd399 100755
--- a/testcases/network/stress/broken_ip/broken_ip-nexthdr.sh
+++ b/testcases/network/stress/broken_ip/broken_ip-nexthdr.sh
@@ -11,6 +11,7 @@ TST_TESTFUNC="do_test"
 do_test()
 {
 	# not supported on IPv4
+	tst_net_require_ipv6
 	TST_IPV6=6
 	TST_IPVER=6
 
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
