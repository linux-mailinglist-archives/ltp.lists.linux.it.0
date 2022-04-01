Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 199674EFCD1
	for <lists+linux-ltp@lfdr.de>; Sat,  2 Apr 2022 00:30:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F7673CA346
	for <lists+linux-ltp@lfdr.de>; Sat,  2 Apr 2022 00:30:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3FEB03C9F01
 for <ltp@lists.linux.it>; Sat,  2 Apr 2022 00:30:41 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 91E9B140013E
 for <ltp@lists.linux.it>; Sat,  2 Apr 2022 00:30:40 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A281A21A90;
 Fri,  1 Apr 2022 22:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1648852239;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kQ7QbXoi9fR90cSi5lKCKtCMBAR568lgdMbt6B6mFC4=;
 b=prfRwmDF4MpedSaPij2ZiQp1Xr/nC1jHBRilxGclS9QF5HJau8FNODGGternNpYLsyBt1N
 rChSZFA7tdzWxHhdMwA8XMmSZeGFEIRzxjNyyZDQHPqCH47tFksbx5/EDOrFXIlUe0Wegq
 L4eE+SaGlXub+yz/4b8so2ketzpv0KA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1648852239;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kQ7QbXoi9fR90cSi5lKCKtCMBAR568lgdMbt6B6mFC4=;
 b=Sr+HWhWS3sogFcx79AbK7rKZZtl3DZjbTfF5a/NZNC0wBnqKb7DinibLCoOzUyYNt7YR82
 VU1V7UkXKAvnoQCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 577D3132C1;
 Fri,  1 Apr 2022 22:30:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id X/GnEg99R2IENAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 01 Apr 2022 22:30:39 +0000
Date: Sat, 2 Apr 2022 00:30:32 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <Ykd9CAXfi9FZ+iHB@pevik>
References: <20220401215951.13976-1-pvorel@suse.cz>
 <20220401215951.13976-2-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220401215951.13976-2-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] tst_test.sh: Cleanup getopts usage
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Martin Doucha <martin.doucha@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

Also dhcp tests should be changed due tst_selinux_enforced being available after
dhcp_lib.sh load.

Yes, defining global variables can be tricky now, we must be careful if they
don't depend on anything (here only library defines setup function, that's why
it's outside of the function).

In case anybody wants to test this latest version is branch
tst_test.sh/cleanup-getopts.fixes in my fork:
https://github.com/pevik/ltp/commits/tst_test.sh/cleanup-getopts.fixes

Kind regards,
Petr

diff --git testcases/network/dhcp/dnsmasq_tests.sh testcases/network/dhcp/dnsmasq_tests.sh
index 8dd43124ed..0183c1da25 100755
--- testcases/network/dhcp/dnsmasq_tests.sh
+++ testcases/network/dhcp/dnsmasq_tests.sh
@@ -5,17 +5,6 @@
 #
 # Author: Alexey Kodanev alexey.kodanev@oracle.com
 
-dhcp_name="dnsmasq"
-log="/var/log/dnsmasq.tst.log"
-
-lease_dir="/var/lib/misc"
-
-lease_file="$lease_dir/dnsmasq.tst.leases"
-
-common_opt="--no-hosts --no-resolv --dhcp-authoritative \
-	--log-facility=$log --interface=$iface0 \
-	--dhcp-leasefile=$lease_file --port=0 --conf-file= "
-
 start_dhcp()
 {
 	dnsmasq $common_opt \
@@ -45,6 +34,17 @@ print_dhcp_version()
 }
 
 . dhcp_lib.sh
+
+lease_dir="/var/lib/misc"
 tst_selinux_enforced && lease_dir="/var/lib/dnsmasq"
 
+dhcp_name="dnsmasq"
+log="/var/log/dnsmasq.tst.log"
+
+lease_file="$lease_dir/dnsmasq.tst.leases"
+
+common_opt="--no-hosts --no-resolv --dhcp-authoritative \
+	--log-facility=$log --interface=$iface0 \
+	--dhcp-leasefile=$lease_file --port=0 --conf-file= "
+
 tst_run

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
