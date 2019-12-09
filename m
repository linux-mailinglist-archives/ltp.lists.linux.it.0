Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F90F1166F8
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2019 07:35:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C4D483C22D9
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2019 07:35:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id D4CE03C13E0
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 07:35:31 +0100 (CET)
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8AAEA600A0B
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 07:35:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=cuYaN
 5lwgCuQEbskRZZY+/MkOF9QwCkXk+W/S8JAvK4=; b=VfQl22nfdYcOY+nIZhhPr
 NWE4CE4qjIKPUmbVkc/tELRw5lZg/jxBsgmkgZZP7PVBhn0UqRptb23wH7SUTuNZ
 o42azMfEEnZ5sUfyZ77HsFImuN7KTM+Lgse6peHXdTasZmtMjrFoAYXv7x8MwxZl
 iLyTQ5+dtTvkc0QZpM1wkE=
Received: from localhost.localdomain (unknown [183.211.129.120])
 by smtp10 (Coremail) with SMTP id DsCowADHzbks6+1dxZNVGQ--.1539S2;
 Mon, 09 Dec 2019 14:35:25 +0800 (CST)
From: Xiao Yang <ice_yangxiao@163.com>
To: ltp@lists.linux.it
Date: Mon,  9 Dec 2019 14:35:22 +0800
Message-Id: <20191209063522.12888-1-ice_yangxiao@163.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CM-TRANSID: DsCowADHzbks6+1dxZNVGQ--.1539S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RAVyxDUUUU
X-Originating-IP: [183.211.129.120]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiMw+GXlXl04XALwAAst
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] runtest/syscalls: Add vmsplice03 to runtest/syscalls
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

Signed-off-by: Xiao Yang <ice_yangxiao@163.com>
---
 runtest/syscalls | 1 +
 1 file changed, 1 insertion(+)

diff --git a/runtest/syscalls b/runtest/syscalls
index 15dbd9971..fa87ef63f 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1547,6 +1547,7 @@ vhangup02 vhangup02
 #vmsplice test cases
 vmsplice01 vmsplice01
 vmsplice02 vmsplice02
+vmsplice03 vmsplice03
 
 wait01 wait01
 wait02 wait02
-- 
2.21.0



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
