Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 771AD37F476
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 10:54:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1EB483C4B92
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 10:54:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 28F373C2526
 for <ltp@lists.linux.it>; Thu, 13 May 2021 10:54:17 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.116])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7B78D10011C6
 for <ltp@lists.linux.it>; Thu, 13 May 2021 10:54:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1620896055; i=@fujitsu.com;
 bh=MhxX9mbO32qEiubI8rmbJjnnMmQFJTnnd/21iuLEu0w=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=eW12U+XuISrFNV2n+CcMb0NevwNNdaqlpO6bQ7+JZhCcWQ2kJXeoFLu2tcyj+aiYC
 dE/oyW4ORfPZ9eu/WDeYRTKNSdl70O63IH1HF0vb/LGaFF676c+SrFcnDE2q99809z
 1zNUGDxJDVVY01uEZnZev/A96OxfPgcxVc+XvDtYpC9gKNMAQY/mqVCDm+vkj4KSlw
 9yAoIMicvbOy5yIOTJpguJFEXSowMI1pgjSXmTJrq+Jok/zs3PWhbcIklCMI+Gx3js
 8MqcVE+2+5tGKZRPm7oVeKfCrJlf7qBLrC2I8LGGX5M0kpobSbP5s/5r6/UVBwLONS
 nIg64SoagRTxg==
Received: from [100.113.6.193] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 16/49-14259-739EC906;
 Thu, 13 May 2021 08:54:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRWlGSWpSXmKPExsViZ8MxVdf85Zw
 Eg/VH2S2mvzjKZrHi+w5Gi2dHVjE5MHvs+72O1ePMgiPsAUxRrJl5SfkVCawZ57/7Frxgr/hy
 azZzA+Mjti5GLg4hgdeMEie2vGCBcHYzSjTseA/kcHKwCWhKPOtcwAxiiwhoSKxq2cwKYjML2
 Eo8f3iJDcQWFnCUuH70HTuIzSKgKvH9+wOwel4BT4k32/aA1UsIKEhMefgeKi4ocXLmExaIOR
 ISB1+8YIaoUZS41PGNEcKukJgxYxvbBEbeWUhaZiFpWcDItIrRMqkoMz2jJDcxM0fX0MBA19D
 QWNccyDLVS6zSTdJLLdVNTs0rKUoEyuollhfrFVfmJuek6OWllmxiBIZfSiF75g7GyW8+6B1i
 lORgUhLlPek5O0GILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO/Bp3MShASLUtNTK9Iyc4CxAJOW4
 OBREuEVugKU5i0uSMwtzkyHSJ1iVJQS5930HCghAJLIKM2Da4PF3yVGWSlhXkYGBgYhnoLUot
 zMElT5V4ziHIxKwrwtIFN4MvNK4Ka/AlrMBLT4xvRZIItLEhFSUg1MCTrerVfTmQ3XTSmd9DV
 T3UNhb2Pc27n2KxPSVU9Xyy212nd/t25n++QvOss4itwXxbJJOTcKMG1WnLJxw3n5k43u3Q3H
 V2mpVh456/qD83H6PcG75YsKJ34xzi15PtnczebzUo317Ya2Gb+yZijNPb5++ppp/zZGv54/1
 bJLZflM/2tszsrf/FvPTzobyCx8SvhLYV7ZhF33P0vOLr2/93qMvWFr49sG2/yQo+9SVbfcFv
 xw4cUGpf3/pCP7nrzfc/aV4ovj/yZIPX/BJxzGPn1m1WWxQgm7kNSO0vwUVe+fXtK7Kvds3Db
 lqqTv3G73a7Wpiz+dmPFT6DqnkvGHgplJd94XPb3d+NArmvW0rxJLcUaioRZzUXEiAN51OpU6
 AwAA
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-14.tower-248.messagelabs.com!1620896054!130829!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4810 invoked from network); 13 May 2021 08:54:15 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
 by server-14.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 May 2021 08:54:15 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14D8s1H9015113
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Thu, 13 May 2021 09:54:07 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 13 May 2021 09:53:55 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <chrubis@suse.cz>, <mdoucha@suse.cz>
Date: Thu, 13 May 2021 16:54:14 +0800
Message-ID: <1620896054-26151-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/mallinfo01: Disable free fastbin blocks
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

When using malloc to allocate small space, it will use fastbin block firstly if
we have free fastbin free blocks, it is more quickly.
In here, we just test oldblks free chunks, it is the number of ordinary
(i.e. non-fastbin) free blocks. So use mallopt(M_MXFAST, 0) to disable
free fastbin block.

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 testcases/kernel/syscalls/mallinfo/mallinfo01.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/kernel/syscalls/mallinfo/mallinfo01.c b/testcases/kernel/syscalls/mallinfo/mallinfo01.c
index 48fce0132..4e10e352e 100644
--- a/testcases/kernel/syscalls/mallinfo/mallinfo01.c
+++ b/testcases/kernel/syscalls/mallinfo/mallinfo01.c
@@ -64,6 +64,8 @@ static void setup(void)
 {
 	if (sizeof(info1.arena) != sizeof(int))
 		tst_res(TFAIL, "The member of mallinfo struct is not int");
+	if (mallopt(M_MXFAST, 0) == 0)
+		tst_res(TFAIL, "mallopt(M_MXFAST, 0) failed");
 
 	info1 = mallinfo();
 	print_mallinfo("Start", &info1);
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
