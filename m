Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D58145AADB
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Nov 2021 19:07:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D93B83C8EE9
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Nov 2021 19:07:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B37D83C3189
 for <ltp@lists.linux.it>; Tue, 23 Nov 2021 19:07:21 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7858D200BC5
 for <ltp@lists.linux.it>; Tue, 23 Nov 2021 19:07:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6E5FF2191E;
 Tue, 23 Nov 2021 18:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1637690838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=5vRCFpWqfNnTZBMGXadkQUJm6TYGY4z4PX3nEnCadmg=;
 b=jmLFPXqtQrQi720V2Mh0QRQsSpmemBcpf+JcX3N676Oj+JMgOiN9EfW2+RPMeMWbrRA33N
 1z6ZN3Hnebu/vXXr5rzKxqY21DPZRcZEQYi01v0DVBb4bmSliHK1CRAY8gaU1nD6Y5++P3
 FxMZhQ6zoFAQKAaj5N1E9IQiEz2+P3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1637690838;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=5vRCFpWqfNnTZBMGXadkQUJm6TYGY4z4PX3nEnCadmg=;
 b=Cvex7LUwV3hbLP/TWSqezeVZOkKONj5KW3I/vF0XSgoy5RIdIO3NkpwjY7OtP5tTj6cvCb
 WrRaeP0EwSQO6sBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 160CB13E38;
 Tue, 23 Nov 2021 18:07:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id L+vMAtYtnWFzDQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 23 Nov 2021 18:07:18 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 23 Nov 2021 19:07:11 +0100
Message-Id: <20211123180711.30274-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] tst_test.sh: Print help ASAP
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

There is no need to run setup before printing help.

Before this change root was required for network tests also for -h:

    $ PATH="$lb:$PATH" nfs01 -h
    nfs01 1 TCONF: Must be super/root for this test!

And with root setup was run:

	# PATH="$lb:$PATH" nfs07.sh -h
	nfs07 1 TINFO: initialize 'lhost' 'ltp_ns_veth2' interface
	nfs07 1 TINFO: add local addr 10.0.0.2/24
	nfs07 1 TINFO: add local addr fd00:1:1:1::2/64
	nfs07 1 TINFO: initialize 'rhost' 'ltp_ns_veth1' interface
	nfs07 1 TINFO: add remote addr 10.0.0.1/24
	nfs07 1 TINFO: add remote addr fd00:1:1:1::1/64
	nfs07 1 TINFO: Network config (local -- remote):
	nfs07 1 TINFO: ltp_ns_veth2 -- ltp_ns_veth1
	nfs07 1 TINFO: 10.0.0.2/24 -- 10.0.0.1/24
	nfs07 1 TINFO: fd00:1:1:1::2/64 -- fd00:1:1:1::1/64
	-t x    Socket type, tcp or udp, default is udp
	-v x    NFS version, default is '3'
	-n x    Create x files and x directories, default is 5000
	-h      Prints this help
	-i n    Execute test n times

Now help is simply printed:

    $ PATH="$lb:$PATH" nfs01 -h
    -t x    Socket type, tcp or udp, default is udp
    -v x    NFS version, default is '3'
    -6      IPv6 tests
    -h      Prints this help
    -i n    Execute test n times

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_test.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 2556b28f5..3cf94adac 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -606,7 +606,6 @@ tst_run()
 
 	while getopts ":hi:$TST_OPTS" _tst_name $TST_ARGS; do
 		case $_tst_name in
-		'h') tst_usage; exit 0;;
 		'i') TST_ITERATIONS=$OPTARG;;
 		'?') tst_usage; exit 2;;
 		*) $TST_PARSE_ARGS "$_tst_name" "$OPTARG";;
@@ -789,4 +788,9 @@ if [ -z "$TST_NO_DEFAULT_RUN" ]; then
 			tst_brk TBROK "Unexpected positional arguments '$@'"
 		fi
 	fi
+
+	if [ "$TST_PRINT_HELP" = 1 ]; then
+		tst_usage
+		exit 0
+	fi
 fi
-- 
2.33.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
