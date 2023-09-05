Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A2B792246
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Sep 2023 13:55:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 25F443CB8C0
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Sep 2023 13:55:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 958913CB1B7
 for <ltp@lists.linux.it>; Tue,  5 Sep 2023 13:55:13 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 62C931A00A26
 for <ltp@lists.linux.it>; Tue,  5 Sep 2023 13:55:11 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A21BB2198B;
 Tue,  5 Sep 2023 11:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693914911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=6jevUJqg+J3Vx1n+FKbsUXuE8TFWEco3zn4Yr+yaNT0=;
 b=eVmU43zPLI27evzvvmktL7iHfK4Lu7iKlnYNIXqCYMSlM9WWyvdLYcrPq7kRtLgr5IHp5o
 k1T1ZBVLZpJ2XMwDZfqPCOckHRDd8SQ8kw39vW+emEOw0k8wfHpzzTn0A24HjTKX3dGVyb
 EIfi5EzhAcI6jTulTRd6g/znzMmXWh8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693914911;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=6jevUJqg+J3Vx1n+FKbsUXuE8TFWEco3zn4Yr+yaNT0=;
 b=oCVqjC/omAGUbjEkM/pb33h65FXK5Pr+6dExMfaWSUxpaCA03KJBO+eN8ZNDq2HWC1kWo4
 WjxJVaJ/x0DCbgDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7F12413911;
 Tue,  5 Sep 2023 11:55:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0vv4HR8X92SIAgAAMHmgww
 (envelope-from <mkittler@suse.de>); Tue, 05 Sep 2023 11:55:11 +0000
From: Marius Kittler <mkittler@suse.de>
To: martchus@gmx.net,
	ltp@lists.linux.it
Date: Tue,  5 Sep 2023 13:55:06 +0200
Message-ID: <20230905115508.31117-1-mkittler@suse.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] Improve ioctl02.c
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

Improve ioctl02.c

Marius Kittler (2):
  Refactor ioctl02.c to use the new test API
  Use correct binary operand in ioctl02.c

 testcases/kernel/syscalls/ioctl/ioctl02.c | 227 +++++++++-------------
 1 file changed, 95 insertions(+), 132 deletions(-)

-- 
2.41.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
