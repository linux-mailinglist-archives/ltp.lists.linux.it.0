Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF9796B21B
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Sep 2024 08:48:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1725432519; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=VFYib9u3aydq8i4eJUmNTgeUyQRSto9W4xyAP57lsTg=;
 b=l0+VlgLF13asuDQ0K4mHemcFDrUtuUoI+f0WBfjG7N7E53nd6JmTByVxgjvJlTzwpQ41J
 SIrjLDVymifJQm1lIt+ox/GpXKGuf0kWYvjqHSPzsyJoQdQGNuSynccpuKH1WY+a4CxBEu5
 U/FzdExNhz1fwLa7wUx/sUj60xTUe1I=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 26D6F3C180C
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Sep 2024 08:48:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D220D3C0CCD
 for <ltp@lists.linux.it>; Wed,  4 Sep 2024 08:48:26 +0200 (CEST)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9ED8914098C8
 for <ltp@lists.linux.it>; Wed,  4 Sep 2024 08:48:25 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2f51e5f0656so69550981fa.1
 for <ltp@lists.linux.it>; Tue, 03 Sep 2024 23:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1725432504; x=1726037304; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3UC73SzuwSrO3vU6GYHYWY7jkv3dmJjIVaI9FEFOSi8=;
 b=MxwdkbsNhB1/3MjaxVfUshkIg1EGei38WDL1fKVUZTFXBDNh9f4rFq6Y7xeZDp5sHt
 QzR36BNG8c7Qf1nr10iq+Ht97QTEgroVU3kpHepi4gmhkFyrWySwQ2ygdqu6g3HGfbqy
 kORurdgzFR0Pgv6nttrerS2Y3DT1BfecI3cKc6sY+X87kc8ZZb9tJJcB/tF2P93ygWxH
 cdrFYwxex7Dxc+stxhZVRTKZjFykH3tMDh1eloILR7G9ymJ3hb0mg0xk8ZDNHlaWJCLi
 p5XPzDa3qczW4UfLCAdXHK5Rowajl2tXwOGDLviynl6qFPHbHeJsyrBjR3JQSzfjxujC
 dIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725432504; x=1726037304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3UC73SzuwSrO3vU6GYHYWY7jkv3dmJjIVaI9FEFOSi8=;
 b=noivhLhUoUx34TwkMTRHKkHxlc2crkvfKtxSPXLcSZyU5rS1OI91jIMtYYRHV0MKiz
 DFdBWVHLb1RJMQkrBkEyFlT/VYyjKyWnCbWpxbb01WcEr/Xvzii+/BTWicidm1QAAROW
 nPijVdbXXM6KTVdDitanAbKmnaw8WBPrky9zQuPl6Kf/iJEIAQuJgVKpjPOxZdqnlPTn
 PuBrwIathc5ecaCsvq32PNN2/5cGSew4MV2wqLuqYlLGAfNailLmQBUQDcsBhedQNXKk
 JpLNCCvS93g1BjTInXXzGndfuAekeNpWjAFmXyTie5quGGotN8PBz7/PsTcpmBm8Cz1+
 HHaQ==
X-Gm-Message-State: AOJu0YxY3HYZ0SXSU5/GL6l2+vtcdmxIaUqhtPqubfMBv2OejOS5aMq0
 ePLq8GU/uHN/C88b+WrELoqSrJrtAxj3lim8iOCu0Lax1ywu8GaJTBu5ZQl/G9z330TnSlhUKfw
 =
X-Google-Smtp-Source: AGHT+IHyLzwevJ39HjHMgWozvd4reEOUQOEEy5Udq6xuvPvjiT27VnDChlghGuirBTgh82mV/Wsz4Q==
X-Received: by 2002:a05:651c:a0a:b0:2f6:2858:a141 with SMTP id
 38308e7fff4ca-2f62858a557mr90428121fa.39.1725432504037; 
 Tue, 03 Sep 2024 23:48:24 -0700 (PDT)
Received: from localhost ([202.127.77.110]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226cd4bcbsm7302683a12.74.2024.09.03.23.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 23:48:23 -0700 (PDT)
To: ltp@lists.linux.it
Date: Wed,  4 Sep 2024 02:48:17 -0400
Message-Id: <20240904064817.29813-1-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240904035808.5891-1-wegao@suse.com>
References: <20240904035808.5891-1-wegao@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v5] mpls01.sh: Add --allow-unsupported for modprobe
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

In sle-micro we encounter following error when do modprobe:
root# modprobe mpls_router
modprobe: ERROR: module 'mpls_router' is unsupported
modprobe: ERROR: Use --allow-unsupported or set allow_unsupported_modules 1 in
modprobe: ERROR: /etc/modprobe.d/10-unsupported-modules.conf
modprobe: ERROR: could not insert 'mpls_router': Operation not permitted

Signed-off-by: Wei Gao <wegao@suse.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/network/mpls/mpls01.sh   |  4 ++--
 testcases/network/mpls/mpls_lib.sh | 12 +++++++++++-
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/testcases/network/mpls/mpls01.sh b/testcases/network/mpls/mpls01.sh
index 196b5b2f9..e453f8130 100755
--- a/testcases/network/mpls/mpls01.sh
+++ b/testcases/network/mpls/mpls01.sh
@@ -21,7 +21,7 @@ cleanup()
 
 setup()
 {
-	ROD modprobe mpls_router
+	mpls_setup_driver
 }
 
 test1()
@@ -66,5 +66,5 @@ test3()
 	tst_res TPASS "created and removed mpls routes"
 }
 
-. tst_net.sh
+. mpls_lib.sh
 tst_run
diff --git a/testcases/network/mpls/mpls_lib.sh b/testcases/network/mpls/mpls_lib.sh
index 380b568bb..3c63e16a7 100755
--- a/testcases/network/mpls/mpls_lib.sh
+++ b/testcases/network/mpls/mpls_lib.sh
@@ -33,11 +33,21 @@ mpls_virt_cleanup()
 	mpls_cleanup
 }
 
+mpls_setup_driver()
+{
+	local args
+
+	grep -q 'sl-micro' /etc/os-release && args='--allow-unsupported'
+	if [ "$TST_NEEDS_DRIVERS" ]; then
+		tst_net_run -s "modprobe $args -a $TST_NEEDS_DRIVERS"
+	fi
+}
+
 mpls_setup()
 {
 	local label="$1"
 
-	tst_net_run -s "modprobe -a $TST_NEEDS_DRIVERS"
+	mpls_setup_driver
 
 	ROD sysctl -q net.mpls.conf.$(tst_iface).input=1
 	tst_set_sysctl net.mpls.conf.lo.input 1 safe
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
