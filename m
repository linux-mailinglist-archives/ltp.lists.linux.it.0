Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F3127314A
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Sep 2020 19:56:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 78E8B3C2A45
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Sep 2020 19:56:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 576EF3C2A03
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 19:56:21 +0200 (CEST)
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com
 [185.132.183.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D441F140012C
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 19:56:19 +0200 (CEST)
Received: from pps.filterd (m0209328.ppops.net [127.0.0.1])
 by mx08-001d1705.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08LHt9o6015785; Mon, 21 Sep 2020 17:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=S1;
 bh=4PN7JBxM3kQiY3YuOXd5nz3TaYzdn1HYImV7CjGVbAM=;
 b=jENVa8pdURUnIuwZ308p3PbrzhyH9cvKcxHpBDbufvN8BTQWdVvM2sl4T3gLimTCCul+
 H4tw5XT5xjVa1ccbYodDD/Btlh/vEgib87h7YKw1CyBukoA+LWggyymdJa4AZKW3b5CZ
 RvP2YxJC98c/du3UHY3Psbh59yqvMtpnCT584AtHz+SIFwZgZ3/zij4V7ydKWR2EYrzi
 BzcUSOoj8+y7oNiOznmu4U/7YAcmkbX7kCt++KjT+wm2sPtN6bJW2eGPSuXHpdrgF2V1
 c+f+YCYVhISEAgCVszBBUnEfXDNVATKW8AhlPdPWnfNpMunkhbjy/bRghM8nVaXYscIZ Fg== 
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2053.outbound.protection.outlook.com [104.47.37.53])
 by mx08-001d1705.pphosted.com with ESMTP id 33nb5k90fu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Sep 2020 17:56:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pws0PbFPwaKFDWngVQ2yHiZsmSVIwpidjqyJ7x9h7qd0AdvUUarBihbaZrLNyrBYTpF2MQVY/aJiFH6VDwSqL1f/Z0oWqUzhekivWJaAIFt5eGH2knmGzLxbP3j1Fk4JQWyzA6L2IlECwnHDjj8ImRKA87/cbIcvUmU+tJ92Ky+knYXTd2Sz1IQe1MBZMplLVctsc9EIgADVbHorpRZfykrNoWpeHwukOqlcgGcCQhAZUUImBUxbgs2OcI6T/SE5FKKRD6ncdf5e8JhCa09POk4EBjgtpzkHnltmo3GIJmlM3qrPO/oziaB8YAwMqJWDNUxwHei+s+z9Bl+YPUqVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PN7JBxM3kQiY3YuOXd5nz3TaYzdn1HYImV7CjGVbAM=;
 b=KlhXhj4/6hpEYzHXsDf2u17YmkdMJLh8cJ5o3ZwtJd+RihW9FPEUKiltn/FKEsIiaGSBeW8oVh79zB0vBooK7nUtvB8+HAXJLx+2NSEguHblDFriwbFV5kHzVa2X0oun/MNXRIfp5s1qcHXnwdSaKw2wZnSArb7r43OO7d3F5dw0q0S1KuE/Y6yGxCbL5lmzZ6KNo9svYmscAmLRyBJlManhfOVLwmUUsNG9nN3DdE4B51xWzmwNqAFdnnSaIq7+DmtZ5CJ0Gy72EGDe2AoUwXatAZBj1Xmy0fmJkjBNIkYPM4xrVRL7cEfohv63mfBBkEOOeIBVTGvqYQn1bCVJfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from CY4PR13MB1175.namprd13.prod.outlook.com (2603:10b6:903:40::23)
 by CY4PR13MB1557.namprd13.prod.outlook.com (2603:10b6:903:13a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.8; Mon, 21 Sep
 2020 17:56:04 +0000
Received: from CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::882:fde6:250d:4bc3]) by CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::882:fde6:250d:4bc3%12]) with mapi id 15.20.3412.017; Mon, 21 Sep 2020
 17:56:04 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Cyril Hrubis <chrubis@suse.cz>, "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: [PATCH 2/2] runtest/quickhit: Remove
Thread-Index: AQHWkAvxiGDfOL6tQEqhdR8n1Nbzn6lzYCyg
Date: Mon, 21 Sep 2020 17:56:04 +0000
Message-ID: <CY4PR13MB1175AC20849F3C4AD8AB9C78FD3A0@CY4PR13MB1175.namprd13.prod.outlook.com>
References: <20200921114026.11184-1-chrubis@suse.cz>
 <20200921114026.11184-2-chrubis@suse.cz>
In-Reply-To: <20200921114026.11184-2-chrubis@suse.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=sony.com;
x-originating-ip: [192.34.114.49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 625d3f4a-06a3-49bd-c7fd-08d85e579c17
x-ms-traffictypediagnostic: CY4PR13MB1557:
x-microsoft-antispam-prvs: <CY4PR13MB1557F6DA53632C52E3BA5664FD3A0@CY4PR13MB1557.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jU+t7FmEnvypyADrtLQazgNPn5mgrFtTsb1y7sHq9w2sAJJNM26GIH5kfIYYUgqTSt33gP0AnhFhQwFWSnXgXGn/o6mSwPZO9EKYUeUt3ymeySMiIyISN8zymkNKoPuvkrByjaisX/NH162lWMfMpSmuWMNST9WR+dbZ0qwugz6L9dE8bcdY0rcHc9WWxqC+XPbh0M/ZJYu9a3KHim1Z6QJgXJFWdAq1YvyjY5LW1ccukxSrmWQMfvn5xU/1GldHrgPsiN41K/oZw33CgMYsa5PqBhnmDJmV5PjxkpWvF3zWguo2a6TJHY+TFzlfUv6uqgYBKiVkX+591fPvcl9tUg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR13MB1175.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(5660300002)(66446008)(8936002)(76116006)(66946007)(8676002)(71200400001)(2906002)(66476007)(66556008)(64756008)(86362001)(55016002)(26005)(316002)(7696005)(52536014)(4744005)(33656002)(6506007)(9686003)(478600001)(110136005)(186003)(4326008)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: pG2WyJmEqIjszUr8U0qeyoApSm9H6CEmf6lVCOQBu3LAvEACMl8g5bovkV3nVN60quAoE6gKNusEuEpfm6srpCstrMSUo3toMvIOGY5q2bNGp65QOGUmpo2xR5vzT+DC4pNm8Prn2SpARRZwtBsF9/FEuV1iMEAQcWlmj396nYl7hKBWTfu6xV4NDkaZK+AWe3vS+Xc01SgTuDNkYlHu+2wy9oB+Rv+Hqr2xFQb3J4EXvVs5LMsLYW+N7QHTwzZNDUjvNET77MJARxZzZWR0SQ9CPWBbbPNa2w65QdBBKlwGgEorgDQbjSDasq2moveou0VDhWXI+Drzx0ymDAmIc1VsO2h/haqfLDJtI9+dXMGZEbhtCflufO3i+PupAl21rpFACiC9HeN4NOkqqm/DW0yKuQVb4CWFbGy8EmGu6v5w07xZjd47DQmmamreErY9oNj0jnVbYM8lkb8YQH9/zdjH+qsy5FV914O3WGsfzcygg68A40z0hd4M2Wo13jhpgHihMAh2FZ94Z3RnX2idc+2Ri81s7Xz85nxgeZ/TDnEdOtOBaU1SIEQUV8+22SI1qBRbVlj0b8Wy/gfT7QZt+/lIOZXd0K10wOf8a4f3sWV+DUMkYjesFChcHd0prj9tiqemR2gCBfBPsZk2hxRyrg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR13MB1175.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 625d3f4a-06a3-49bd-c7fd-08d85e579c17
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2020 17:56:04.5745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +sfQLtJut4G/lQDdjpDj0GCprqrUgGLv4Wx9Kwhz37cwhkziK7ifFeRCeorD9t/GdO6pN9wJke7FKaEphtNJGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR13MB1557
X-Sony-Outbound-GUID: e7KZopejpsJylDuEtzhrwX3fNPgIuiw8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-21_06:2020-09-21,
 2020-09-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009210126
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] runtest/quickhit: Remove
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

> -----Original Message-----
> From: Cyril Hrubis <chrubis@suse.cz>
> 
> The file wasn't properly maintained for last ten years, 99% of the
> patches touching it were only removing removed tests. We should stop
> pretending that it's useful anyhow it clearly does not contain well
> selected set of tests for quick testrun anymore.
> 
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> CC: "Bird, Tim" <Tim.Bird@sony.com>
> CC: Petr Vorel <pvorel@suse.cz>
> ---
>  runtest/quickhit | 316 -----------------------------------------------
>  1 file changed, 316 deletions(-)
>  delete mode 100644 runtest/quickhit

Reviewed-by: Tim Bird <tim.bird@sony.com>

Thanks for holding off on this until we got the smoketest replacement.
I'm fine with this now!
 -- Tim


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
