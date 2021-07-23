Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EEE3D33FB
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 07:20:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9409B3C6934
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 07:20:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C87213C2794
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 07:20:41 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 58A341001161
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 07:20:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1627017640; i=@fujitsu.com;
 bh=p4g6oAP/SSHIUwY+41hBlboORNs3LVvCv0w4L53LlBY=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=DsX3CksrZCKLERpfspUfBKO5Qg5PC9Mb/XNS2OPnlYoyVNSDcVjMZ0DHpjQb9R2Vh
 touduC0IDmjJY5WiEleYiYpQ4cC1i8DauBXegbXPKsqT2vnNVG6JexSe/eoaDtFM3M
 Txk1bfMQlGzHDJvE+FkSg9WaDBhrUvn7Gqr+z1cx2K1eY9nICzIDNUKEH9gd/tVF05
 gWb06q2m8OQ6L2FTAosHKZvUm5VKHet7shJplUZbxnBTlv5hhx0uQlASap58bDm4Pd
 tXpFMr7qCKrW9hN7eqT0pvFDRkoxbQqz+ybQnCnD5FI3vVwPFDYD3rpgt0bAmHR3x5
 N886stO5NepOQ==
Received: from [100.113.1.116] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 31/A6-07211-8A15AF06;
 Fri, 23 Jul 2021 05:20:40 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MRqlsW+Cv
 B4Po8A4sV33cwOjB67Pu9jjWAMYo1My8pvyKBNePp3272glcsFb9f7mVrYFzK0sXIxSEk0MIk
 sbdxBZSzh1Fi4vt3bF2MnBxsApoSzzoXMIPYIgISEh0Nb9lBbGYBdYnlk34xgdjCAp4Sf482g
 dksAqoSzS8XMYLYvEDxFZNbwGwJAQWJKQ/fg83hFPCSuLj0CpgtBFRz6P4GVoh6QYmTM5+wQM
 yXkDj44gUzRK+ixKWOb1BzKiRmzNjGNoGRfxaSlllIWhYwMq1itEgqykzPKMlNzMzRNTQw0DU
 0NNY11DU11Eus0k3USy3VTU7NKylKBErqJZYX6xVX5ibnpOjlpZZsYgQGZEoho/EOxoOvP+gd
 YpTkYFIS5RU3/5UgxJeUn1KZkVicEV9UmpNafIhRhoNDSYK3MQAoJ1iUmp5akZaZA4wOmLQEB
 4+SCO8yV6A0b3FBYm5xZjpE6hSjopQ47zt/oIQASCKjNA+uDRaRlxhlpYR5GRkYGIR4ClKLcj
 NLUOVfMYpzMCoJQ0zhycwrgZv+CmgxE9DiU10/QRaXJCKkpBqYMguOurbMaHZ//Fz/kdGeHdJ
 xH1hvz0xwfyWy97HM/9meH9gee0g3q0wqvKeZdTvjbErJ95wT7OLLQzmF7J/8TCmuZV68NOpE
 vjWr8OHkX+3rogv2ufmvsr8lu0PyQZyM8v/odtkPxt/sLvl071Z8LBysudjd3TEsuzpF8IH13
 OYlNeziQsLP1twtkejpXnCzxNk3UbHw09IlWWv3zrT/Kc+xR2H+LwWHWeet8+dVyCzXYj5oPj
 87sOmryau7PEcElyfOl+JLzdowf7qK6wMT5k2sl09fVNvD+EJFcT0XP+u+S2VVjSyGspFZemm
 xGo/7p67siFHL6953ftLh2MsGPofuL3kb6mYZsnqaW5MSS3FGoqEWc1FxIgCnngfOQwMAAA==
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-7.tower-226.messagelabs.com!1627017590!37172!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3928 invoked from network); 23 Jul 2021 05:19:50 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
 by server-7.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Jul 2021 05:19:50 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16N5Jixc024600
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 06:19:49 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 23 Jul 2021 06:19:34 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 23 Jul 2021 13:19:44 +0800
Message-ID: <1627017584-30405-2-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1627017584-30405-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <1627017584-30405-1-git-send-email-xuyang2018.jy@fujitsu.com>
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
Subject: [LTP] [PATCH 2/2] syscalls/shmget02: Use TST_NO_HUGEPAGES instead
 of 0
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

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 testcases/kernel/syscalls/ipc/shmget/shmget02.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget02.c b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
index 7fcd376f5..66a4b94ee 100644
--- a/testcases/kernel/syscalls/ipc/shmget/shmget02.c
+++ b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
@@ -110,5 +110,5 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.test = do_test,
 	.tcnt = ARRAY_SIZE(tcases),
-	.request_hugepages = 0,
+	.request_hugepages = TST_NO_HUGEPAGES,
 };
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
