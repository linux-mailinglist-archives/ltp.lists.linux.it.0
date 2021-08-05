Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB143EF822
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 04:37:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 12EE53C9AD1
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 04:37:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6FB813C1D73
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 04:37:43 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 775AA1A01072
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 04:37:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1629254261; i=@fujitsu.com;
 bh=Ba57tXRVN1v/HKsFrJHETOqhYvjvXYFKgGXjgvpRtNc=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=CYTreM1tm7av3AnH+J44yGU5+3IcMzeH/e38eymgLYO+mzNp8TKNjLICv71Ln5m/q
 fnxVfA+54Kfxeb534nSbSSHrBV/IcsbC2lIS0udx42XCHdJMqVpBvV4+dH11O5NeAH
 9IRKSzYBNXFvgap6uL43TEs5dolsFUH7VAKfi7ToiRX6sAVtfzVqkKnsu24PGsUmsY
 FUk6HZPVFQ9Ya/8zD3/V5vtLy+2Xek71Goub5r+yDFnllXyf3r+kSUSPoujaGSYdBb
 eYkqCrE5S0i4jO77u6g5vNeDI5vwcYiuoHAXljlH23HPwO5Lq/QfKgoirDh89pBeVq
 BnUGTGWWTISJA==
Received: from [100.113.1.232] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 74/2A-17140-5727C116;
 Wed, 18 Aug 2021 02:37:41 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MRoltaJJN
 ocOkqo8WK7zsYHRg99v1exxrAGMWamZeUX5HAmrHvwUmmgibOipkb3rA2MF5j72Lk4hASaGGS
 2HxgAQuEs4dRYta704xdjJwcbAKaEs86FzCD2CICEhIdDW/ZQWxmAXWJ5ZN+MYHYwgK+Etf29
 bGA2CwCKhKLDuxm62Lk4OAV8JB49E4cJCwhoCAx5eF7sDG8AoISJ2c+YYEYIyFx8MULZogaRY
 lLHd8YIewKiVmz2pgmMPLOQtIyC0nLAkamVYwWSUWZ6RkluYmZObqGBga6hobGuka6poZ6iVW
 6iXqppbrJqXklRYlASb3E8mK94src5JwUvbzUkk2MwPBKKWQy3sF47fUHvUOMkhxMSqK8191l
 EoX4kvJTKjMSizPii0pzUosPMcpwcChJ8N7PA8oJFqWmp1akZeYAQx0mLcHBoyTCa5AFlOYtL
 kjMLc5Mh0idYtTleP9k7iJmIZa8/LxUKXHewkKgIgGQoozSPLgRsLi7xCgrJczLyMDAIMRTkF
 qUm1mCKv+KUZyDUUmY1x1kCk9mXgncpldARzABHeFjIAlyREkiQkqqgcnodd6iqPrsNf3dnQJ
 pMxdxHc6Z6y4R2jxpa4fU72kc3vefrPtcszbO7OWJazv6n4Y/9zmR/8M1dMYs2/gmwZrZ7fsu
 216QCJh6db4X/wUhpfruvMebrK1Oa/bfld5+ulGo+4hDp4WJ+eX5Zz84sJ9NaTvvZq7Y4Tu7v
 INzb1pW4lLHwyedl/Sm3z5ur7bh/pzfcY/31/NXfmULWem4ecPyHV/FLMzOXNje0GnKYnYul2
 FC+05Wp8AF1yT5O94IfdhqZ9G9z76yKvpIw4T1zmql2jN66zQ10spPhexxVNZ1mShfULL34dX
 QjMb0CzaKHI+eXV8QGeOitjFpZ/OmLa2MyUKdrxI/l6ver2HMU2Ipzkg01GIuKk4EAHR04vs2
 AwAA
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-12.tower-232.messagelabs.com!1629254260!2048223!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10971 invoked from network); 18 Aug 2021 02:37:40 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
 by server-12.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Aug 2021 02:37:40 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17I2bZ44008315
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 03:37:40 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 18 Aug 2021 03:37:33 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 5 Aug 2021 14:27:35 +0800
Message-ID: <1628144855-5924-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.2 required=7.0 tests=DATE_IN_PAST_96_XX, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] userns/userns08.c: Enable userns in
 max_user_namespaces file
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

On old distros ie centos7, the default value of max_user_namespaces is set to 0.
Enable it by increasing this value.

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 testcases/kernel/containers/userns/userns08.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/testcases/kernel/containers/userns/userns08.c b/testcases/kernel/containers/userns/userns08.c
index aedfc6c4e..0910ea7d4 100644
--- a/testcases/kernel/containers/userns/userns08.c
+++ b/testcases/kernel/containers/userns/userns08.c
@@ -120,6 +120,11 @@ static void setup(void)
 
 	SAFE_WRITE(fd, 1, "\n", 1);
 	SAFE_CLOSE(fd);
+
+	/* The default value of max_user_namespaces is set to 0 on some distros,
+	 * We need to change the default value to call clone().
+	 */
+	SAFE_FILE_PRINTF("/proc/sys/user/max_user_namespaces", "%d", 10);
 }
 
 static struct tst_test test = {
@@ -133,6 +138,10 @@ static struct tst_test test = {
 		"CONFIG_USER_NS",
 		NULL
 	},
+	.save_restore = (const char * const[]) {
+		"?/proc/sys/user/max_user_namespaces",
+		NULL,
+	},
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "d2f007dbe7e4"},
 		{"CVE", "CVE-2018-18955"},
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
