Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A915A3D900C
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jul 2021 16:05:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D8DCB3C9029
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jul 2021 16:05:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 551853C641F
 for <ltp@lists.linux.it>; Wed, 28 Jul 2021 16:05:06 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 342D5601230
 for <ltp@lists.linux.it>; Wed, 28 Jul 2021 16:05:05 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8A1EC1FFB4;
 Wed, 28 Jul 2021 14:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1627481105; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GXMtlZOSpDB+RG/Yn/0AXXEgKK/ZmPHbLAHciz44uTo=;
 b=uPfCweQ0AEeellma6WRTBnec+D2IT+xw+lJb+7AWDtRdg/sEKOrrMKdDaTOr+d86tV4GuH
 1iiyhi+mdyqe4m8BiJr3WmpLXS1g7mmpJPSe6ZerOvDjGo4Zk7xJ+cc3jzdgS+STNaFWFx
 yXOJf70eQyRgxVIqAUMtusPiTPrdPpo=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5C49713BAE;
 Wed, 28 Jul 2021 14:05:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RwlFFBFkAWEyWwAAMHmgww
 (envelope-from <radoslav.kolev@suse.com>); Wed, 28 Jul 2021 14:05:05 +0000
To: ltp@lists.linux.it
Date: Wed, 28 Jul 2021 17:04:53 +0300
Message-Id: <20210728140453.23356-1-radoslav.kolev@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <YQFWT/0MBcZsLNVV@pevik>
References: <YQFWT/0MBcZsLNVV@pevik>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] ipsec_lib.sh: check ip_vti/ip6_vti are enabled or
 skip tests
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
CONFIG_NET_IPVTI/CONFIG_IPV6_VTI to be enabled in the kernel,
and if it's not they fail. There is a check for VTI support in
the ip utility, but not for the kernel. Skip these tests if
there is no ip_vti/ip6_vti support in the kernel.

Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
---
 testcases/network/stress/ipsec/ipsec_lib.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/testcases/network/stress/ipsec/ipsec_lib.sh b/testcases/network/stress/ipsec/ipsec_lib.sh
index e395e1ff3..fce05622d 100644
--- a/testcases/network/stress/ipsec/ipsec_lib.sh
+++ b/testcases/network/stress/ipsec/ipsec_lib.sh
@@ -292,6 +292,14 @@ tst_ipsec_setup_vti()
 
 	tst_res TINFO "Test vti$TST_IPV6 + IPsec[$IPSEC_PROTO/$IPSEC_MODE]"
 
+	if [ "$TST_IPV6" ]; then
+                tst_net_run -q "tst_check_drivers ip6_vti" || \
+                        tst_brk TCONF "ip6_vti driver not available on lhost or rhost"
+        else
+                tst_net_run -q "tst_check_drivers ip_vti" || \
+                        tst_brk TCONF "ip_vti driver not available on lhost or rhost"
+        fi
+
 	tst_ipsec_vti lhost $ip_loc $ip_rmt $tst_vti
 	tst_ipsec_vti rhost $ip_rmt $ip_loc $tst_vti
 
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
