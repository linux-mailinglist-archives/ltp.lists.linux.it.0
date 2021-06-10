Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC173A2301
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 06:02:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 87A3C3C8FF5
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 06:02:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7D0A43C5520
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 06:02:04 +0200 (CEST)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D9436201195
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 06:02:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1623297722; i=@fujitsu.com;
 bh=U10W2h4OdHH6TNYlZdHo+qsT5lpFKVVT2Czoe5ll61E=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=yp0M2fZ03pevfeWSAw+2qitYdrh7SnczOIx9JJkNneeSW5s4HssP/OwjXkaGIXnRy
 EHstKxdKSJpzg5mAJ98ZIEY866oMVfLPv4c+zaqKcZbhOzRvfvUowLlfvsigISXxaf
 GPN8mn5fN/sGgteX3cCSNNe+ztzZAYQVWwidOwOodHNxppyrYTZmhiEMJJ/Xi1TyJ5
 hzOL00kzv7Rkic3C9mPiida8U/m/3J2IFeJOFt7lragN4YJCfxu1jkLT8XI+jraQKA
 FisoLkXIxkJAh/JDLcuydW5u33F/g9Zo5MK2mnBkpulxHhzeHd65Y0kWo73ykhBlXb
 Al0C8mcY2bdXg==
Received: from [100.112.192.137] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-a.eu-west-1.aws.symcld.net id F7/B1-34775-9BE81C06;
 Thu, 10 Jun 2021 04:02:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRWlGSWpSXmKPExsViZ8MRqruz72C
 CwfdlkhYrvu9gdGD02Pd7HWsAYxRrZl5SfkUCa8b7xVPYCyZwVHzfMJ2tgfEHWxcjF4eQQAuT
 xMoJp4EcTiBnD6PEpN2aIDabgKbEs84FzCC2iICEREfDW3YQm1lAXWL5pF9MILawQKTEjH8tY
 DaLgKrEvLmzwWxeAQ+Jpvu3wXolBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL15A1ShKXOr4xghhV0
 jMmLGNbQIj7ywkLbOQtCxgZFrFaJ5UlJmeUZKbmJmja2hgoGtoaKRraGmka2Kil1ilm6iXWqp
 bnlpcomuol1herFdcmZuck6KXl1qyiREYXCkFB3R2MP589UHvEKMkB5OSKO/h9wcShPiS8lMq
 MxKLM+KLSnNSiw8xynBwKEnwavceTBASLEpNT61Iy8wBBjpMWoKDR0mE17sHKM1bXJCYW5yZD
 pE6xajL8e7n4kXMQix5+XmpUuK8JSAzBECKMkrz4EbAou4So6yUMC8jAwODEE9BalFuZgmq/C
 tGcQ5GJWHe+yBTeDLzSuA2vQI6ggnoCEfjfSBHlCQipKQamCYs0g9MmF7yXeHyvCb11u3P1nD
 OZUrzuH/edNMFXan8ZXt4DFxSg+UmlG5N6Vuo+lV0+s8yd724juAe/39mJds4Y/7E9ktEypwN
 e35xt4Y/pzXHV0aL7wLf8i7U33mj3LrsVd7Mxa9Ssx5L+EyXElZ03PngVPdH20RbE6viQzXbH
 dKvssxZ5prXP22a0xoV66VP1jZGTPsvxX4jOcgrx6Pj6e82vUnJO7eUuPDYWkmvaQlV+RPTnO
 NzJkj/37V5Xm8X7c54bbDQnSPoUbzuj2ssJ6a76LJJ3brUYNgm03eUO8WZXWaO4Mb0XPHzfe8
 EsgraRVeIpxdK/njnt/DvPP0i+dcz/65QUMls4+RTYinOSDTUYi4qTgQAIZkPWzUDAAA=
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-2.tower-265.messagelabs.com!1623297721!255551!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29369 invoked from network); 10 Jun 2021 04:02:01 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
 by server-2.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Jun 2021 04:02:01 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15A41qMN014205
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 05:02:01 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 10 Jun 2021 05:01:50 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 10 Jun 2021 12:02:05 +0800
Message-ID: <1623297725-3296-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] lib/tst_virt.c: Add fallback when not using Microsoft
 Hyper-V hypervisor
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

If we don't use Microsoft Hyper-V hypervisorm, getrusage04 will report the
following error:
getrusage04    1  TBROK  :  tst_virt.c:175: invalid virt_type flag: 6
getrusage04    2  TBROK  :  tst_virt.c:175: Remaining cases broken

We should add is_hyperv() function when try_systemd_detect_virt returns -1.
But it is a bit complexd according to systemd-detect-virt implementation[1].
Microsoft Hyper-V hypervisor detection has been introduced since long time ago,
most system should support it.

[1]https://github.com/systemd/systemd/blob/main/src/basic/virt.c

Reported-by: Jinhui Huang <huangjh.jy@cn.fujitsu.com>
Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 lib/tst_virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/tst_virt.c b/lib/tst_virt.c
index 14c4d526c..d23d7f564 100644
--- a/lib/tst_virt.c
+++ b/lib/tst_virt.c
@@ -166,6 +166,7 @@ int tst_is_virt(int virt_type)
 	case VIRT_IBMZ_LPAR:
 	case VIRT_IBMZ_ZVM:
 		return is_ibmz(virt_type);
+	case VIRT_HYPERV:
 	case VIRT_OTHER:
 		return 0;
 	}
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
