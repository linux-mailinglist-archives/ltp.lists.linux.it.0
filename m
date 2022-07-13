Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E77573689
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jul 2022 14:43:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D712C3CA757
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jul 2022 14:43:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 86D403CA52D
 for <ltp@lists.linux.it>; Wed, 13 Jul 2022 14:43:56 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6B5811000B08
 for <ltp@lists.linux.it>; Wed, 13 Jul 2022 14:43:56 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8E8E633CDA;
 Wed, 13 Jul 2022 12:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1657716235; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qtU2LYuWGCdHcSk84T3OFycnSGsg9Lg6xIJMBpa98E8=;
 b=eQ4+0dT1iX0tiulMM9+xiLtVXqFkNfku3PdARKvjq3Zvv6N8lP5XDUQah/aIVvIFwOnUK2
 +Wlkfra6s3kZNTFrqfpXSW2ZMSZ1IkmqitIdg+l/1C2joG3GZqHNsFWcj9I2tOEnHBNgmh
 YYjnrTmcszIZEh1bqN2mKbyQa58WtMU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1657716235;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qtU2LYuWGCdHcSk84T3OFycnSGsg9Lg6xIJMBpa98E8=;
 b=tKBvlfsRqnEyeV+NbNoZTU7UL8G9kWD6l4jPifRYHqsJGtwp2fZwk/2cEljXn9XuhDSab4
 RBaJJbsjfz8MD0Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4554713AAD;
 Wed, 13 Jul 2022 12:43:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qnfhDQu+zmKHLwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 13 Jul 2022 12:43:55 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 13 Jul 2022 14:43:47 +0200
Message-Id: <20220713124347.13593-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] netstress: Restore runtime to 5m
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
Cc: linux-nfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

netstress requires the previous default timeout 5m due longer timeout
for higher message sizes (e.g. 65535):

./sctp_ipsec.sh -6 -p comp -m transport -s 100:1000:65535:R65535
sctp_ipsec 1 TPASS: netstress passed, median time 5 ms, data: 5 9 6 5 5
sctp_ipsec 2 TINFO: run server 'netstress -T sctp -S fd00:1:1:1::1 -D ltp_ns_veth1 -R 500000 -B /tmp/LTP_sctp_ipsec.ARZbGkvjPa'
sctp_ipsec 2 TINFO: run client 'netstress -l -T sctp -H fd00:1:1:1::1 -n 1000 -N 1000 -S fd00:1:1:1::2 -D ltp_ns_veth2 -a 2 -r 100 -d /tmp/LTP_sctp_ipsec.ARZbGkvjPa/tst_netload.res' 5 times
sctp_ipsec 2 TPASS: netstress passed, median time 6 ms, data: 8 6 6 5 6
sctp_ipsec 3 TINFO: run server 'netstress -T sctp -S fd00:1:1:1::1 -D ltp_ns_veth1 -R 500000 -B /tmp/LTP_sctp_ipsec.ARZbGkvjPa'
sctp_ipsec 3 TINFO: run client 'netstress -l -T sctp -H fd00:1:1:1::1 -n 65535 -N 65535 -S fd00:1:1:1::2 -D ltp_ns_veth2 -a 2 -r 100 -d /tmp/LTP_sctp_ipsec.ARZbGkvjPa/tst_netload.res' 5 times
sctp_ipsec 3 TWARN: netstress failed, ret: 2
tst_test.c:1526: TINFO: Timeout per run is 0h 00m 30s
netstress.c:896: TINFO: IP_BIND_ADDRESS_NO_PORT is used
netstress.c:898: TINFO: connection: addr 'fd00:1:1:1::1', port '55097'
netstress.c:900: TINFO: client max req: 100
netstress.c:901: TINFO: clients num: 2
netstress.c:906: TINFO: client msg size: 65535
netstress.c:907: TINFO: server msg size: 65535
netstress.c:979: TINFO: SCTP client
netstress.c:475: TINFO: Running the test over IPv6
Test timeouted, sending SIGKILL!
tst_test.c:1577: TINFO: If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1
tst_test.c:1579: TBROK: Test killed! (timeout?)

Converting netstress.c to use TST_NO_DEFAULT_MAIN (i.e. implementing main)
would require more changes, because it uses .forks_child, .needs_checkpoints,
cleanup function.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
NOTE: there is also needed to increase timeout for sctp_ipsec.sh.
At least on my VM 10 min wasn't enough. Trying to measure reasonable
time with TST_TIMEOUT=-1.

Kind regards,
Petr

 testcases/network/netstress/netstress.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/network/netstress/netstress.c b/testcases/network/netstress/netstress.c
index 6c9e83112..7c222531d 100644
--- a/testcases/network/netstress/netstress.c
+++ b/testcases/network/netstress/netstress.c
@@ -1028,5 +1028,6 @@ static struct tst_test test = {
 		{"B:", &server_bg, "Run in background, arg is the process directory"},
 		{}
 	},
+	.max_runtime = 300,
 	.needs_checkpoints = 1,
 };
-- 
2.37.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
