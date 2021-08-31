Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5473FC23C
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 07:46:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E1DAA3C9A47
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 07:46:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C7DBA3C26A5
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 07:46:07 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8B824200976
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 07:46:06 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 35E799F66D;
 Tue, 31 Aug 2021 05:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1630388763; bh=vhEuHxR47JQzOiv+KMV3lU/cKZnwPGh1yJ8J+vJz59c=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=WL+8r70RMMazTGAQIm0K8IcDh7tJs3yJa5QIfBb6TwDKr4orgEN9KMFo0akRNgPYR
 q5TnOIQAZN8b3CJqnQVYAGKDs7dKoJGjBf6od5FB9sUoxZ34QGLHblo1xn392HhiiZ
 Gjxib38iUp9ccDwCUuGIfy1nGEsED7XYjvvd1efg=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	rpalethorpe@suse.com
Date: Tue, 31 Aug 2021 07:45:57 +0200
Message-Id: <20210831054557.944172-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] broken_ip: Fix runtest for broken_ip4-plen
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

Fixes: 5d8f9dfd6b8 ("broken_ip: Remove duplicate broken_ip-totlen")
Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 runtest/net_stress.broken_ip | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/runtest/net_stress.broken_ip b/runtest/net_stress.broken_ip
index 75791986e..a5536c0c2 100644
--- a/runtest/net_stress.broken_ip
+++ b/runtest/net_stress.broken_ip
@@ -6,7 +6,7 @@
 broken_ip4-version broken_ip-version.sh
 broken_ip4-ihl broken_ip-ihl.sh
 broken_ip4-fragment broken_ip-fragment.sh
-broken_ip6-plen broken_ip-plen.sh
+broken_ip4-plen broken_ip-plen.sh
 broken_ip4-protcol broken_ip-protcol.sh
 broken_ip4-checksum broken_ip-checksum.sh
 broken_ip4-dstaddr broken_ip-dstaddr.sh
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
