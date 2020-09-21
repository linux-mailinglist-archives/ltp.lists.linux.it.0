Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E692730F0
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Sep 2020 19:40:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A01D3C2A33
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Sep 2020 19:40:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E1D7E3C2A03
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 19:40:20 +0200 (CEST)
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com
 [185.132.183.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0DD4E600556
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 19:40:18 +0200 (CEST)
Received: from pps.filterd (m0209324.ppops.net [127.0.0.1])
 by mx08-001d1705.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08LHeIHW007964; Mon, 21 Sep 2020 17:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=S1;
 bh=KUWTzN5/kmJhJfD5GPTTdflV9V++GewkzDRUJ7tgwpI=;
 b=FC+xEbm8l7xw4cVkIbhfUjzNgTS0hm/ybgw/4BTa1+7T/u9VNFZaGcVC4b542YvmF+ed
 Ygvrra7KeKxi/Pkl4iei1lcE0pAAffZ15xA4NzHVvajSh8JX0KgzUd4ShVO1zzMhNVJA
 V5rCiLkj8jMJAx0izuTGziDBiWPQaqKiSLDApqKaBXvjHivKwmdtOTU5Z8nTWRfw5koo
 UlI0AORn/6V+9Cf4rUwOUB/QWfdErVYsTvNXyG/MXPR8cWcr5L2NayZuQE/cJT/IwHO1
 gXlE2F/Z4aPd/kYD5dc3uhQ5IXqTO0LsWtY+a44CVht/okeqSSFB1xPvWtlhbRpipOM8 XQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by mx08-001d1705.pphosted.com with ESMTP id 33n75412t5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Sep 2020 17:40:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpaHE2lB6pCTz0onidILBF1fv2lh+etxiigqM3s5YXZitnD1y1UwWE2p3gDqFgcKGgEpfw3u83nCJfrWKtxXrXXo2OoEeh+KgalcSFTJNcbB9uaMPN5cLWM1fMUoxgcIf+J4zxdw77bZIWOz/3HFmMyujGKzOVeNdkDEC/VA+JfUSQrBbtjcvwYlkg9tNRMH60a/a3b5kiUXTChKn27jHhU3cD5//FqbIbwhsFq5gh/IeRY8sDvhYx3xVnHnhjE+ePq4JU7i/OVLl1Soa2ygJXrhD1zAe7r8X0HuHuvGHKUXZdn6L64iYWQH3oz93IwuPFua5jdcQU5Gvozchx5cuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUWTzN5/kmJhJfD5GPTTdflV9V++GewkzDRUJ7tgwpI=;
 b=igMzfnjsYPeR+vFa7uoER2Q+8nW13YiTxTlLtLBXHNzO+b1TCXokaXnHYnk4Vpe0WdybELiHWi8sL00k+oBq3OwZsavJRSHYTJ5mUAb8gQu7n+jenxxwo0YDrBexyN/BseFr5PDql1qRj0r2CIZGVeysfuVduVU/+6brOI7iAyvZ0bS7SwWCJgSoHZP5yWPqZNDwns9RoeCElPZo2WiF0NdaFpCz6Fk789LACUHzz41tPtdFEbY5uZSqO+8RowIVQK6OPqc9b24XSagO91SY6djf4zdUrvQSqk+L5DEnlwugLowm2+jvgLEwa/bELvrXyBk5LUGSWjSxVmgK/6hlLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from CY4PR13MB1175.namprd13.prod.outlook.com (2603:10b6:903:40::23)
 by CY4PR1301MB2168.namprd13.prod.outlook.com (2603:10b6:910:3f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.10; Mon, 21 Sep
 2020 17:40:12 +0000
Received: from CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::882:fde6:250d:4bc3]) by CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::882:fde6:250d:4bc3%12]) with mapi id 15.20.3412.017; Mon, 21 Sep 2020
 17:40:12 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Cyril Hrubis <chrubis@suse.cz>, "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: [PATCH 1/2] runtest/smoketest: Add smoketest
Thread-Index: AQHWkAvxf+hR8pvDX0iXXaaTVj/x9alzW5NQ
Date: Mon, 21 Sep 2020 17:40:12 +0000
Message-ID: <CY4PR13MB1175D646B9A4D84ABC6C9276FD3A0@CY4PR13MB1175.namprd13.prod.outlook.com>
References: <20200921114026.11184-1-chrubis@suse.cz>
In-Reply-To: <20200921114026.11184-1-chrubis@suse.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=sony.com;
x-originating-ip: [192.34.114.49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0027cecf-8ad9-4fcb-b92c-08d85e5564bd
x-ms-traffictypediagnostic: CY4PR1301MB2168:
x-microsoft-antispam-prvs: <CY4PR1301MB2168FCBC9E7EF22F3ABED3BBFD3A0@CY4PR1301MB2168.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MKNpY91WIsLlVV+tBLSIVVwlhMe0ybZMCGv4IGCG8EZ4Z4cWE4lthYFRbu/51cITZHNbLOLfTnGsQEaMzft0LP4NoS5hpcr8z6ESgJ+bxCAQEfgXAvuAqZwK8SHGC9wA2DnBefEJKWyceo1+h15bV3GQFB9h4tZJYpWzh7ICtYGWMunpX69YdQePvZMLaziXnUfUiisKQ5JYaP9VEnMuYmvCYsix4S0MOJs8FHeU9diRtF7rtxrKP+ROKLFf5hm2EpQlOYLuIQB7H/jazzWvVMOLmYUOhpcbXZEX3HNgzgIyjdXI25IWEoEQzc6rc7Kt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR13MB1175.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(55016002)(83380400001)(33656002)(8676002)(8936002)(110136005)(9686003)(316002)(52536014)(478600001)(86362001)(2906002)(5660300002)(4326008)(186003)(26005)(71200400001)(66476007)(64756008)(66556008)(66946007)(66446008)(76116006)(7696005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: gJ0pMzLpdQT/BbuPV6asVc490nspoARpHlUMkldrYvgC+eNhmu0H9N9u1aIG/tInaMtGMkcLOh9wWwWG3bNfmx3Oq/EFY8Knw+PGf+PRJL0RzSEeeqPEKrkCu9IuQPcGKz+K+vSTYxDFhUPECCVfxvHIZTW9mcrRV9yr8us4XX+b6LyxImhj6yWKNL/0InnK3dk7m+sq1BPIN7woDYbAZrzQWea6bd+joLBCs3wD3sc0D+DDnD7ZcNR4GZ4qB5Sq+h6x9M1SLZnDTnQ3pBRRPyD1EfYJL/n1RxTfJforljDB6+YDYA9c3b4Xgq1lRkhibyx9N0qE92vKY7xrDWOyypnsguQe+jomAKBVKZtpVrXEeb+t7aKGuLx0bNc0ET13dDOvaBJbVtSUR79N+0a+MaLKsZCEJ5n+A+kYkxfS/93kJQu3qo4H/GZrXKUDzVVAOemdwytqJJzx30G2MNaqcpuKO+hZFPHOYoAFdmtKOxE7PkqB64KAmSP20zXjrOCV+kjRHoDmQ9idH6W1oKU4Yr2N3ORSuVNGcU4LAF8iHTtSQPcuEzLy+sRZ7qBDQt3yHkEqQtx6pJqZosQDuX/FqJaHT31xIGrLaqcMLYWXZqt/OJNVB1D69BcFI1XvUjAjxdP2FzOwTeZbcEUqw3JRwA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR13MB1175.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0027cecf-8ad9-4fcb-b92c-08d85e5564bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2020 17:40:12.6792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gsmR2jIMlImDfdzDKNgnNNl1BAoJZzqh2H0vqrOsuY5gABSY4kxXtZyAFfnIHvNVeVDURTAMTUdSCDdti2oWPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1301MB2168
X-Sony-Outbound-GUID: CYtglwlZITbtuQOqlLbXbG6SN9TXKPrY
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-21_06:2020-09-21,
 2020-09-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009210125
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] runtest/smoketest: Add smoketest
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

Sorry I didn't send mine in over the weekend.  I had planned
to send it in today.  But since you beat me to it I guess you
get naming rights ("smoketest" vs "ltp-selftest-quick"). :-)
That's fine with me.


> -----Original Message-----
> From: Cyril Hrubis <chrubis@suse.cz>
> 
> This runtest file is meant to be used for infrastructure checks i.e. to
> test LTP integration with various frameworks. The testcases were choosen
> so that the testrun is fast and also represents reasonable subset of
> different LTP testcases, e.g. binary, shell, etc.
> 
> The primary reason we are adding this is that we want to get rid of
> quickhit, which has been misused for this purpose.
> 
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> CC: "Bird, Tim" <Tim.Bird@sony.com>
> CC: Petr Vorel <pvorel@suse.cz>
> ---
>  runtest/smoketest | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 runtest/smoketest
> 
> diff --git a/runtest/smoketest b/runtest/smoketest
> new file mode 100644
> index 000000000..218827a12
> --- /dev/null
> +++ b/runtest/smoketest
> @@ -0,0 +1,15 @@
> +# The purpose of this file is to have a quick integration test for various
> +# test frameworks that integrate LTP testsuite.
> +
> +access01 access01
> +chdir01 chdir01
> +fork01 fork01
> +time01 time01
> +wait02 wait02
> +write01 write01
> +symlink01 symlink01
> +stat04 symlink01 -T stat04
> +utime01A symlink01 -T utime01
> +rename01A symlink01 -T rename01
> +splice02 seq 1 20 | splice02
> +route4-change-dst route-change-dist.sh

this should be:
route4-change-dst route-change-dst.sh

$ find . -name "route-change-d*"
./testcases/network/stress/route/route-change-dst.sh

> --
> 2.26.2

Reviewed-by: Tim Bird <tim.bird@sony.com>
  -- Tim


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
