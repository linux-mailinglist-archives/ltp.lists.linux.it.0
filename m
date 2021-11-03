Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46991443FC4
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Nov 2021 11:02:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C48CB3C714B
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Nov 2021 11:02:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 50D2A3C0956
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 11:02:44 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4B449140138B
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 11:02:43 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 7913F1F782;
 Wed,  3 Nov 2021 10:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1635933763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=s4r4C6y0YVKv1S2A3cwjIkvCookL8uiOqUMaNDm233o=;
 b=acAj5g1QpDRui1UVBJzO8atpMMzXzf5V8TQosxp08kgBHx2Si7AnHULBE/lqeZLrdNiuK9
 ENo7K5/p2pLmFCQIDzZSrfyfp3Ea3nDKmsRkiFZWCyTUpNg5b8xkFXaKRYWrbB0OhSFovG
 NRyi8SxgpSzV/yQT8rlyKxFPd62YCjE=
Received: from localhost.suse.de (unknown [10.163.30.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 4966D2C154;
 Wed,  3 Nov 2021 10:02:43 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed,  3 Nov 2021 12:02:35 +0200
Message-Id: <20211103100235.22007-1-bogdan.lezhepekov@suse.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v1] netns_netlink: Ensure tuntap is enabled in kernel
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
From: Bogdan Lezhepekov via ltp <ltp@lists.linux.it>
Reply-To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

---
 testcases/kernel/containers/netns/netns_netlink.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/containers/netns/netns_netlink.c b/testcases/kernel/containers/netns/netns_netlink.c
index ddd8ce910..f9ae255f5 100644
--- a/testcases/kernel/containers/netns/netns_netlink.c
+++ b/testcases/kernel/containers/netns/netns_netlink.c
@@ -120,6 +120,7 @@ static struct tst_test test = {
 	.forks_child = 1,
 	.needs_kconfigs = (const char *[]) {
 		"CONFIG_NET_NS=y",
+		"CONFIG_TUN=y",
 		NULL
 	},
 };
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
