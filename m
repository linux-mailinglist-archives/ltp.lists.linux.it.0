Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C10BD42D03A
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Oct 2021 04:15:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D3733C131B
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Oct 2021 04:15:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3EF9B3C0E6B
 for <ltp@lists.linux.it>; Thu, 14 Oct 2021 04:15:05 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DB5946011E5
 for <ltp@lists.linux.it>; Thu, 14 Oct 2021 04:15:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1634177703; i=@fujitsu.com;
 bh=nZQ2GygtJehJIZsZrdzl16kC06rrL483+EFw0Nger6k=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=xIv2dbQI96xdOmc98a0A6MQfqfldjsPUGeLuuzHpgnXMaPXSpTk1jIlWryu9O8NLV
 19Ohf1puuTGcfiUbNjBe5ngUGK1/isYw948KHFYMIgE1FuTXbQAl6Dxq4BHS4BOJeX
 zr+EsOPfZU47/vP7cmpuQa4nOmlufmgp60wFEX/ioXAOzVGM+ZCj2nbgr1LFmoM6Ts
 Rh1euBrxn60NMi7THC4HBVmaK902XxDH5x3vZUiwWM9y50n5xI0TgQQx02AQfF6VtA
 F8Ol1l4c44UH4DtZWjW0gkhJsqtXFYWOLOlqmeO7bLzgw/5yLtP235viVBmRAXqgPe
 H5kpRHqGsc7/Q==
Received: from [100.113.3.95] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 48/36-09980-6A297616;
 Thu, 14 Oct 2021 02:15:02 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MRortsUnq
 iQWuLpMXmPetYLFZ838HowOSx7/c6Vo/3+66yBTBFsWbmJeVXJLBmNF3ex17Qyl5x595cpgbG
 NrYuRi4OIYHXjBKr/vxlgXD2MEps37GetYuRk4NNQFPiWecCZhBbREBCoqPhLTuIzSxgI9Hx7
 SwjiC0s4Cqx+OUdsBoWAVWJee+WMYHYvAKeEjf/XmABsSUEFCSmPHzPDBEXlDg58wkLxBwJiY
 MvXjBD1ChKXOr4xghhV0jMmtXGNIGRdxaSlllIWhYwMq1itEwqykzPKMlNzMzRNTQw0DU0NNY
 FksYGeolVuol6qaW6yal5JUWJQFm9xPJiveLK3OScFL281JJNjMCwSylkaNrB+O7VB71DjJIc
 TEqivB196YlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHjdW4BygkWp6akVaZk5wBiASUtw8CiJ8
 DpMBErzFhck5hZnpkOkTjEqSonzZoIkBEASGaV5cG2wuLvEKCslzMvIwMAgxFOQWpSbWYIq/4
 pRnINRSZjXFWQKT2ZeCdz0V0CLmYAWB0algCwuSURISTUwRfN+kXEKdnqmtr38e9q05iBn3m3
 OEjvzS/a8lJEwEFrqFVR0cvsp25rVpr1HIoO3tjBI/DLaUKU259ESyYv/XBbpqy0N6DJNnHXp
 w5xnvbnWKxo/nVr4OEb9uhQrU6v69wWhszuDpv83bLbaJ/la5nFtPJ/6o3AbBobjx5MFNMqrx
 NTefy6bffIqo/brD9nRgTfZv60/wCZlqfZC5PQCmRmN1/bFfU25/3unifcBi2v5oqLfn8hw92
 kcWpT+lLWz4/Dbqzs7Nuq7V6Ukzq7eEtuxa4GjyeyHB6Tfsjuo2bcsXe/x36Vd3SmYySiLe5L
 RbLHSU794P5XLbvc78uBH1YO1PZL2Ain/7URuXi9UYinOSDTUYi4qTgQAtPuwTTYDAAA=
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-5.tower-232.messagelabs.com!1634177702!1828540!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21254 invoked from network); 14 Oct 2021 02:15:02 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
 by server-5.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Oct 2021 02:15:02 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19E2Etiq011847
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Thu, 14 Oct 2021 03:14:55 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 14 Oct 2021 03:14:52 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 14 Oct 2021 10:14:11 +0800
Message-ID: <1634177651-16399-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] lib/tst_test.c: Use %u instead of %lu for tmpfs_size
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

Fixes: 21c8759f4 ("lib: adjust the tmpfs size according to .dev_min_size and MemAvailable")
Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 lib/tst_test.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index ec80e17a6..02ae28335 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -906,11 +906,11 @@ static const char *limit_tmpfs_mount_size(const char *mnt_data,
 		tst_brk(TCONF, "No enough memory for tmpfs use");
 
 	if (mnt_data)
-		snprintf(buf, buf_size, "%s,size=%luM", mnt_data, tmpfs_size);
+		snprintf(buf, buf_size, "%s,size=%uM", mnt_data, tmpfs_size);
 	else
-		snprintf(buf, buf_size, "size=%luM", tmpfs_size);
+		snprintf(buf, buf_size, "size=%uM", tmpfs_size);
 
-	tst_res(TINFO, "Limiting tmpfs size to %luMB", tmpfs_size);
+	tst_res(TINFO, "Limiting tmpfs size to %uMB", tmpfs_size);
 
 	return buf;
 }
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
