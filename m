Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F2F26AEF6
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Sep 2020 22:54:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E7123C2B5D
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Sep 2020 22:54:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 0ACB93C1CB6
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 22:54:40 +0200 (CEST)
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com
 [185.132.183.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5F1461A003F1
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 22:54:38 +0200 (CEST)
Received: from pps.filterd (m0209324.ppops.net [127.0.0.1])
 by mx08-001d1705.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08FKsckZ021716; Tue, 15 Sep 2020 20:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=S1; bh=voXCgK6Lqr0Ar4kSfLAdNJwIcRzsPu30+sOdUHtqjBw=;
 b=bqA6xAtcnDv9o05zfWJcqt5b5rkfbhj9HhGkQyjaqfr5rjtSEOixT8GA56ErDWnWSJLB
 giudtkn+VSec57mbq14YdBiQkgEpU/t2KyrqxC4bJmT3r2Ax54PMbCmom8EYQyA8PcHV
 aLzDy0lwR+XVGeoLUPopDpK4kGI9Ftwvr+9cFtWkvyntKasxBUDuvBiV1cjJS4HpMRd/
 nsJgoWG7IDldyTb/A+j9MnGfE+ZdQPl8Cd/1qZWB2SdYnlHH53vTISAFkVTU1ubcCcib
 4iFXzvHHNPXNuY7MBVKC7RO7DL9D1ZKkiaBMG8p5LM71n1NkHTCxBJGxgJaLaj6F5Nk4 mA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by mx08-001d1705.pphosted.com with ESMTP id 33gssw9w02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Sep 2020 20:54:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5Oo6/IHTh0lCZcXiXgaj8oLtkPJjBqaTJxSlWQhm/YQrl+4KF6IA3Cu64/b3zWJ+rODrFWilSzeU3kddCTisVxiLSdgPcVg6R7GB4j3K7yal4EaKaCvtyfN36AemDaR9CAePSLixWFf2BTblnvZi6ys7Ebsit5/G7Sdb46a6FWOxPoMBYkJp8CKN83X+7zZtjXOqcrE/cf4mYvV9D4tWVP2ZdvUp1K5GZZ/9E/tSyeycRx/JaDrtMp35DvhyMfgAZp3PMXToSwUUUC4O7iXZrEJX6zxdzJKaDU2GyibpiJWikCisttedq4OLbYjEKBMg4gq5dsVswDc684AVUG+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voXCgK6Lqr0Ar4kSfLAdNJwIcRzsPu30+sOdUHtqjBw=;
 b=ANXxw5kelHSyxUiD2yzxmBDLKkeGRxuKROJWGaHPHe7UlNXqgGt9bjseZajLhEuOCUWmQuEd6gbv3U6iht2o+OxZiM6HvP8piuG+JyNh187W5T339z2MqyFH7FCAjy4OHnrX8ZUTa0z7ewLSNWreqvbzu2Ho9OZaSWUfy3aFVymC83IGZsqfmLqLcC+zvlC9G7MyYFhE0Evzk5kSkhctRZKaPsNwSRBKLlKF1TollyDSEMYDOLe9ITXSFXYT/M6Ek26A7UyjPpM0sOLKBSvwp4bgMRVeS5R6/9pw/bVOY1Mc3b7V0sPd02tT0SUxOVo2Vphcxps3qiccCb/u3oK9mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from CY4PR13MB1175.namprd13.prod.outlook.com (2603:10b6:903:40::23)
 by CY4PR13MB0885.namprd13.prod.outlook.com (2603:10b6:903:4::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.4; Tue, 15 Sep
 2020 20:54:35 +0000
Received: from CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::882:fde6:250d:4bc3]) by CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::882:fde6:250d:4bc3%12]) with mapi id 15.20.3391.009; Tue, 15 Sep 2020
 20:54:35 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: TPASS in new test lib
Thread-Index: AdaLohvwsqGG8Y0xRLWAe7TJO4BmlQ==
Date: Tue, 15 Sep 2020 20:54:35 +0000
Message-ID: <CY4PR13MB117565A7BA2A8371A3B94ED9FD200@CY4PR13MB1175.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=sony.com;
x-originating-ip: [192.34.114.49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a5f1b483-6056-48a8-8cb2-08d859b98d85
x-ms-traffictypediagnostic: CY4PR13MB0885:
x-microsoft-antispam-prvs: <CY4PR13MB0885596AE7819A62547A25B5FD200@CY4PR13MB0885.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /yRgwVR6W1N1NsN7AXD0icijoLBSwUE9XjkRVKy2KtUioxkTEe1PZDSsZrH+JX+RAkNjd38SY44NawE1a6LWf8MDWMNzz1mzL2i8FNRQZkB0NlzswLYl6O/BFmJoiGNm7fP2A46E4z51pZnyRcpvcir2nMoO/M0nYfhcXf6ss0XZcK1T9onufja/b+bBWWbyzPdwHs4uK4KQP+uLCXqWZoLqXKt0UIKsL7crptxxOYkhhrYkHZnT7Mou/z5ZzIwAJVfxNx7wd8mLPSCAS5h0uIfmLZzC5/hCget+r/X6iBcRJFPPrIWvH40GTUdsD7XJWOcFfdzzc3Z0ul2manRleg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR13MB1175.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(8936002)(186003)(66476007)(66946007)(8676002)(71200400001)(33656002)(55016002)(66556008)(66446008)(64756008)(86362001)(9686003)(52536014)(26005)(7696005)(2906002)(6916009)(83380400001)(54906003)(4326008)(53546011)(6506007)(316002)(76116006)(5660300002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: XG5jWp/3UNTOezd/9GR541XtQaeGiXLmQHkG80zmBQUHWeXJkT7HMCGNsjchp9QGNR3Cs8q5sB5NDMeHIC5BuFcP9vwTKYkwiSlOW8EDKJShr5KpnfXhS6stnhx9uIDh9jAk4hdpMUV/dCCWdEmKRdQpuq66sb+52BjslQ+cZODdZhxJlI+rMqOsjGgSUepJViKnmqxbEVe7psH5Wir7yj2b2ire1yGm9115hnACEzgPALeHzlv71c5Z4G24zGLKCP1K2NWRNdIklrdJ2C+rmgIGB8ik4KnihsiQGPrQcKspCjWI3BGYF/A/x/X6LFd4ZaLj1E9yNRMI9fv6khxaUGa68HIR/0eDOi7aD2BMo3tm3ITpcP34Yji4l97qTPWh0TfeKAIw3juSxE1zGO7CvodG/8uejU6S3LFWBjb7qzSREnZPMzYLM+jnnxhSotlpdu2ZR1d8/avK2uwc68hyKePpAwzok7rJUh87VCRdeHhb7ZebI5QpRflsiz3/txYZzWhexxmBP/I9+pHyTdkfUjUsd4q41Aiu75yb1RKC+Hfv8DkZBuXuo2+oK8tDMJva72/kc8G+B4u8wdt5SkCm/xYjuvgdEaMLi9FvyD4lIju8S3SBXwrOd5er+MSkslgu1ipuwM92mMRQaKPHO9FTQQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR13MB1175.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f1b483-6056-48a8-8cb2-08d859b98d85
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 20:54:35.0816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yh62uA8HHFXmFh0xhe44pwOIlFnQZKQA0SHhXhPRvmIJezolCyAZ/U2jxZ8ReWRBy5l2i2ygYkGX32OvPx/4HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR13MB0885
X-Sony-Outbound-GUID: wAh4WUgrQAqAUkJQofknpDL3nB40_Nwk
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-15_13:2020-09-15,
 2020-09-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009150158
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] TPASS in new test lib
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



> -----Original Message-----
> From: Petr Vorel <pvorel@suse.cz>
> 
...
> > P.P.S How come some tests produce TPASS and some produce just PASS?
> Legacy C API and shell API (both legacy and new) add T (i.e. TPASS), new C API
> don't add it (i.e. PASS). It's a minor detail we could fix that.

Well, Fuego's parser only checks for PASS (probably due to the inconsistency),
but personally I'd prefer if it was consistent. The string "TPASS" is much less
likely to appear in unrelated output than "PASS" is.

It looks like it comes from print_result() in ltp/lib/tst_test.c.

Here's a patch, in case there's interest in changing it:

From 151168bf384135d7c79b0c09bb95267ba1293205 Mon Sep 17 00:00:00 2001
From: Tim Bird <tim.bird@sony.com>
Date: Tue, 15 Sep 2020 14:18:37 -0600
Subject: [PATCH] tst_test: Change result strings to use T prefix

Change PASS to TPASS in the new C library.
Change other results strings to also include the "T" prefix.
This makes the new library consistent with previous LTP
output, and with the shell output.

Signed-off-by: Tim Bird <tim.bird@sony.com>
---
 lib/tst_test.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index 175dea7..8cc76d5 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -193,22 +193,22 @@ static void print_result(const char *file, const int lineno, int ttype,
 
 	switch (TTYPE_RESULT(ttype)) {
 	case TPASS:
-		res = "PASS";
+		res = "TPASS";
 	break;
 	case TFAIL:
-		res = "FAIL";
+		res = "TFAIL";
 	break;
 	case TBROK:
-		res = "BROK";
+		res = "TBROK";
 	break;
 	case TCONF:
-		res = "CONF";
+		res = "TCONF";
 	break;
 	case TWARN:
-		res = "WARN";
+		res = "TWARN";
 	break;
 	case TINFO:
-		res = "INFO";
+		res = "TINFO";
 	break;
 	default:
 		tst_brk(TBROK, "Invalid ttype value %i", ttype);
-- 
2.1.4




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
