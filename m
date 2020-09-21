Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAA727336C
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Sep 2020 22:02:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 219713C2A45
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Sep 2020 22:02:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 9DE0C3C20D7
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 22:02:15 +0200 (CEST)
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com
 [185.132.183.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 656A260047B
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 22:02:12 +0200 (CEST)
Received: from pps.filterd (m0209327.ppops.net [127.0.0.1])
 by mx08-001d1705.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08LK2BXb028389; Mon, 21 Sep 2020 20:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=S1; bh=6xpQF02TQImAcNIdNPcoQ0T2RMAYsCFEX+Vh8KW04MU=;
 b=Z3RBT6Asy40zpNBFa0eZPP/IOS2ScV75KQdi0jIP7CuDHJGebYDeX3S4gKUkVWZiBgAT
 uviOr08St6C33Bw6XH22rMwlun2pGIhLO6o/QhYmvOXs1OilUofVjN4ary1mBHkcPjpP
 TvDLiVkMZFBCqMx1dK6tFZ3/rg9ezv6Nam/fjUWrnfFAxgWAc9GXvl8FaPqclLVjh1qY
 Dwh1qEF0c2sv7HVUXDPZBQ4zDEHbQ8/M42TQaWjc0d6KtePdMpXUm/LV+g7XRCzNy2gt
 vIWTpgOL7WYoz5+fKjXfWI82mdbebbEUey+vw3rh5lMDNdPJ65KaOodxyaORzwYr9AiQ uQ== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by mx08-001d1705.pphosted.com with ESMTP id 33n8v013px-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Sep 2020 20:02:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWDzaOF2R423VI6EejrMm0mnHV7O0YQYChdnvB9A4aKllFHShwZnX6tuGzdCOoyvc1rROmW2B93VmwxJYRolFrI4m0QBO7KIKzYnHKmmpCSM+9vUZski/9fM0djtBQC4oeDOkvNTXp+5Hb7al3kzKtaXH1TaVu51eLZ6wtgOkqu8OGwy97xFiicChpehdMqLgZ8GuJyo0yRg+Tc29TGtTPtvtIlmzE5vgT0jJBct+uQAqDj62gWDKhZIleExb6uSHspJk8RE8PT+qoyLX84y7v4IQczON8A0UnOp61BqYPBL3FCOER1i4IvvKDKC4h6i0bbPU4qE9S2EdkLgsX9SfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xpQF02TQImAcNIdNPcoQ0T2RMAYsCFEX+Vh8KW04MU=;
 b=dUx8tWZlCHa2ADTmMowdQ+er29jOWQ0W+0zCclC48exZta73CxRm2D74DKLdQINbKnFD/w8/g8+7F2nT2c8FU77meM3m7vxw0A+/Fwf0yAU4JliwYBbYnD/hv4Xg31ABSmbNQeJecXhifD/p/M5U1sZ8AhicUS78FBzp4j2TJWoANCEjUHxBY89qKVtrwc06cjwELVrRCmzNEpIKZ6KRlPCypi75jOuQxWXdbIAf3c0ovoWw2+IcsQawHb5ldssHy3E0i6191BBqJNCb3kKhBjqc0kZTWZimvXlSxLZYQ8vkRKTBcDKg9U6D+xJ5UazL0sCXd9p+HyUXq200KxtTLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from CY4PR13MB1175.namprd13.prod.outlook.com (2603:10b6:903:40::23)
 by CY4PR13MB1640.namprd13.prod.outlook.com (2603:10b6:903:15d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.19; Mon, 21 Sep
 2020 20:02:08 +0000
Received: from CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::882:fde6:250d:4bc3]) by CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::882:fde6:250d:4bc3%12]) with mapi id 15.20.3412.017; Mon, 21 Sep 2020
 20:02:08 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: [PATCH] tst_test: Change result strings to use T prefix
Thread-Index: AdaQUfzK+A3WljFFT6eyTwcbyfMNtQ==
Date: Mon, 21 Sep 2020 20:02:08 +0000
Message-ID: <CY4PR13MB117552ABCAA299CEB5F0A52AFD3A0@CY4PR13MB1175.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=sony.com;
x-originating-ip: [192.34.114.49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a3e52642-4b4e-4d16-ee2c-08d85e69387b
x-ms-traffictypediagnostic: CY4PR13MB1640:
x-microsoft-antispam-prvs: <CY4PR13MB164014A2CB1E5360EE64E299FD3A0@CY4PR13MB1640.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MIvrn5ZlpiEFRSdqHKsKCt56vExYmokX1BeF/0ICPDMVQMDYIuE9GukohxcRGIPKz87Xuy4JSfTy7lYOhbUp92nA/hmhzhZE9i1ImgfQdDdypAQoUm7bRgRYXw6VQxVx2nRi/nM7qcIAFRljeuKcUFgD+5l5j5UpQuta1+3o1iI5c+FwRq0mM8JcDS9fs3q0FqPdLOGZa5i9RiGwMlgydur1aphnkrT4yW0bBMav7Jdh6+1iC3nM5TRlsbEk86G885I0TfBIw+VJaf/DlTwQTYiyljUz05LWvCtakhVfUw4VZxY0kS9zntjq77ydPxRiMg1wZTvg9LCqClOixiaz5H5edDEFGHTDIqL0DScSm0zp1yU4WyB7Fbki5EHahFX/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR13MB1175.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(8676002)(8936002)(316002)(2906002)(7696005)(33656002)(4744005)(71200400001)(9686003)(76116006)(6506007)(6916009)(66946007)(66476007)(64756008)(66446008)(66556008)(55016002)(86362001)(186003)(4326008)(5660300002)(26005)(54906003)(478600001)(83380400001)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: xiTibq12YKsyZ8eBsT0jLnA6iNbED5W6z9xitsM8Yj5HIHs3nlcRp4UNVuDhKeunJfK4tbtWTBi8VFaGJhpZ99zBfgDGVcnIxFrJt5015g5h/mm5R5so72HGPunael7TFKqXwIpKDq7lSZnyZgvAXLXo+6siosPLVzd55mrmcGtndfWqOkVH26rxMGBK33nvNTCj7nq3SqYrGmoW8DvbBkI+EJahPMzWqc5vuk806nulnNL0oPqTSP820uGEdEQ9q5XRK8dM70DHEkj3v1xQLsWKjY0lg9M+NhgEFZDf9tk85kBmN8fYUiLg7qqMSkMquf+8LKPk+PRtT37HHiicf97MXdU7zZshtu/vd0XRUgYIC6a+OkEo1lxImx9uemxgvPN43H0zlDYcMjlQG3qifpavhJ52z4k4wef53/0y5Aya0Aqdv4yZpFghFiQbwJEZVtDfEPjCr9w427Xqi9ezJF1Ob+FNbwR8v7dhSkvSaTTBwGYEZfnDKvSlrOLwWvHFCVF+MHTdtUNK0ZsFjrI1pDdFv9JBPxXR/Fd+SGIlQQ1K4G7SuS04MOkOw67BAbQZgrM477RjDAL/MxYJk+W94mJlww67opujvy1kP2eaIPgq4EZWHV9HJJtxXx6m2lNjX+8OpvIHAEuMyUefWjibUw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR13MB1175.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e52642-4b4e-4d16-ee2c-08d85e69387b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2020 20:02:08.3438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kSziAyYSA1HYL9qRD3mcIPJaS6xPwL5nf1x2wumYwRyUy1JYx4gvVCWYixaAs4aLnjYx+GklmnQVyJU8e4NCFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR13MB1640
X-Sony-Outbound-GUID: YJup9hXGplJGYHnPI18GjAofV6v1ZdHx
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-21_09:2020-09-21,
 2020-09-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009210145
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] tst_test: Change result strings to use T prefix
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
