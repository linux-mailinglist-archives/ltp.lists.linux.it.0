Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9963D1E4F
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 08:34:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D67C3C61EF
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 08:34:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1F9E33C5A5A
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 08:34:53 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7A09C140111E
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 08:34:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9444A2036F;
 Thu, 22 Jul 2021 06:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1626935692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fGUWhRAASDFIXh+U6yDi5HZ0fMKaUR1ib4cOe7U/buM=;
 b=d1CxsYyfIhz2IBjqpwWx+t4uYZP3sKU1PRHwvfNONbrSCaYosO5PqkC7Dh8YIbDMK88oMN
 k4vd4q6+8/OPju/KfyWvuExQVFrSw9ov3W+ufvlM40T/asYXveWMvDGSfqgRuzsD1aJETe
 xXBcMVrRZfqBmY5051Mg1w/Mhpuiutg=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 663AB13DA5;
 Thu, 22 Jul 2021 06:34:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7rTaFowR+WDOTwAAMHmgww
 (envelope-from <radoslav.kolev@suse.com>); Thu, 22 Jul 2021 06:34:52 +0000
To: radosla.kolev@suse.com,
	ltp@lists.linux.it
Date: Thu, 22 Jul 2021 09:34:22 +0300
Message-Id: <20210722063422.18059-1-radoslav.kolev@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v1] lib/tst_test.sh: skip test if ip returns "Error:
 Unknown device type"
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
From: Radoslav Kolev via ltp <ltp@lists.linux.it>
Reply-To: Radoslav Kolev <radoslav.kolev@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

In network stress test groups there are tests expecting
CONFIG_NET_IPVTI to be enabled in the kernel, and if it's not they
fail. There is a check for VTI support in the ip utility, but not
for the kernel. Skip these tests if vti device type is not known by
the kernel.

Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
---
 testcases/lib/tst_test.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index c6aa2c487..0458c90c2 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -241,12 +241,13 @@ TST_RTNL_CHK()
 	local msg1="RTNETLINK answers: Function not implemented"
 	local msg2="RTNETLINK answers: Operation not supported"
 	local msg3="RTNETLINK answers: Protocol not supported"
+	local msg4="Error: Unknown device type"
 	local output="$($@ 2>&1 || echo 'LTP_ERR')"
 	local msg
 
 	echo "$output" | grep -q "LTP_ERR" || return 0
 
-	for msg in "$msg1" "$msg2" "$msg3"; do
+	for msg in "$msg1" "$msg2" "$msg3" "$msg4"; do
 		echo "$output" | grep -q "$msg" && tst_brk TCONF "'$@': $msg"
 	done
 
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
