Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AB926C527
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 18:29:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9AEB83C4E9B
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 18:29:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id B47213C13D9
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 18:29:11 +0200 (CEST)
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com
 [185.132.183.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id F2756600F4B
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 18:29:09 +0200 (CEST)
Received: from pps.filterd (m0209329.ppops.net [127.0.0.1])
 by mx08-001d1705.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08GGQ910025550; Wed, 16 Sep 2020 16:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=S1;
 bh=diKk7vahsTI+XQFtPnWN4R9lMHPvosqceL91J1vAz64=;
 b=dbzfEAGtNHXXC7NgyveptpkTMmvnKhVSm77djMpSIYH8hjnYnLyv891aFpf9DETJbcCE
 Yru90T7fgPZagnHwzOxG3KRjGNaYhL5JnO5SoIQuad49Bj8/JR1Df5UPJk5VzE7eNWS7
 /8GckMS+OAJ6TVj1eYuvjm2yzUTPR6/OrXuTHFErl0yFTm8XR0ml+he5gMkNYq0zlLYV
 TpNvTIlYuPcmnVr3xiN70lOJcFbNhghi0sOUzpZ8/GaZor2hb1B2D60L6YDIRbxzD6zB
 JodOglmEZbf3o2V2rxxhcSGcPKKjerpJJcfafAL8eqoQQJzvpPiMSiPNva+zfkIRZHNe fg== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by mx08-001d1705.pphosted.com with ESMTP id 33kkv502m2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Sep 2020 16:29:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R07dCVMb79yObrErr9iRB5xnwEiES/MCGqrpvE5PLaJhi2Hmmb6RPG/1cuwNHh2c6WlHpm8DdZmAvAOGIcK6N5QyAN6SXGGxGWYwhwSxVidcDvIIo6qYLe2UXOn/UY6Setdkm2sKWccnTXDfNWWLgB1xaUEBjInTEJQClWwx8Grx0vFWpMQQAVMiq8lL6f/RhDWfuSfEUj/jc/zO1+oOVxcykHclgj4oV1MbtowGqhPwV2tIwNwdgZCEADXttxQ+OH1b51g+WiA6fXxnDtD3MauSXnClRr6TpQiJmu7b1vJnL6qLRzJeTB0vQwMdtGG+7B/EcpmiBUjPOWIGS4Z8xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diKk7vahsTI+XQFtPnWN4R9lMHPvosqceL91J1vAz64=;
 b=SS3vrAus5UNavuOHUA3pwCPJs4m+pEW7LMMWUQBw5umVBPzCE+u2qSKlUCJNKsT9pnV0p7iLBIO9X/zlmQ1ACtF2AfhZc0uuTw17YIacKlInRL79ErK68Zr4F6EGBjV3fqfBfr4wlp+KxAlEBn60utheHuzyT9CuGTsfxlv778l1BnvWORvxOyYcJkylV/1IxmPSornYgMfNPmfmPRT8KvgAQ3jwNtcnfFgket9z9rxwoocuH6zBEUWP/zf6r2UljZa9EXtEIN/IUW5a2NdRLrUqKQMtuv6VDmsuOly/xo1hZrCjM5vA0/xmihFN8MQUnnHMJwsPYsOZDkrimBngLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from CY4PR13MB1175.namprd13.prod.outlook.com (2603:10b6:903:40::23)
 by CY4PR13MB0936.namprd13.prod.outlook.com (2603:10b6:903:36::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.5; Wed, 16 Sep
 2020 16:29:05 +0000
Received: from CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::882:fde6:250d:4bc3]) by CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::882:fde6:250d:4bc3%12]) with mapi id 15.20.3391.009; Wed, 16 Sep 2020
 16:29:05 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Cyril Hrubis <chrubis@suse.cz>, Petr Vorel <pvorel@suse.cz>
Thread-Topic: TPASS in new test lib
Thread-Index: AdaLohvwsqGG8Y0xRLWAe7TJO4BmlQAVm9oAAAOYvoAAD6caQA==
Date: Wed, 16 Sep 2020 16:29:04 +0000
Message-ID: <CY4PR13MB1175364547D2DA3A96262516FD210@CY4PR13MB1175.namprd13.prod.outlook.com>
References: <CY4PR13MB117565A7BA2A8371A3B94ED9FD200@CY4PR13MB1175.namprd13.prod.outlook.com>
 <20200916071106.GB1433@dell5510> <20200916085405.GB4464@yuki.lan>
In-Reply-To: <20200916085405.GB4464@yuki.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=sony.com;
x-originating-ip: [192.34.114.49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 605890b9-2645-4ff7-8e40-08d85a5da0e6
x-ms-traffictypediagnostic: CY4PR13MB0936:
x-microsoft-antispam-prvs: <CY4PR13MB093688731A38B40FEE1632D5FD210@CY4PR13MB0936.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z3Ep1MYU0gGYiX2PevDnvSixlRE3peepACaWkJsfMeg4Y8Tyu5NH7F8bmGC/sx++d1d754XOh4b4IWt02CJjz+9DVb+7ydTBSUZ80qeCULL20ng+Ts22gfGbMxhXFQwKAkBakTESF9OBFBJWeaeotkNpjiy2Kcctq/BBCogKNseG5L+L/CrIk4jOhS3aQBhwq8QMtLQxMNLH9iC4obDGdTUcL3SLa3+xorXZnO+l/g3gDHLLVvKg9/vHVj9IVsgz2lA5ZsQcA2LYBc6dC1n2YnWXWUE6dGUlyyJ/VntK16Xo91yFG0WUEMA7054VLZYxdpqlo6cDI4iv0SsknbWWBA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR13MB1175.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(52536014)(4326008)(2906002)(76116006)(66946007)(110136005)(71200400001)(186003)(83380400001)(66476007)(26005)(66556008)(64756008)(66446008)(316002)(5660300002)(7696005)(33656002)(8936002)(9686003)(86362001)(6506007)(8676002)(478600001)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: sL599vnKSpzwxY7tA4L7waHj8CmMTdtLuoaSAG0azt5WPrDgy3Mn8GnuBn326KZ9+txLjUytdEXa7BGsz+2wG2ONRRVO49L5mN8RIwxcY3Tuxbv0/fWn8W2jVRCAl+U0ot3eYwL5ovitgckplGmochJ5Ez3ZJb87h7siYf23Zmzm0k5jzCkMgQDLmKSLJgEse6MZA7Iudc3gDRgt1mVrZhJunZ58gbJ2fNvP7ihwahWIPpvsgyfnprj9eOtB93wc2g/RvOY2mS4HgZgUFYhn4ZxevbIeazY327Tqf4Zk3zGg8Xiz+n2DcO3DBQG7IyfLEwrpudD6SxyQU8CLIT60D198uY53Qoe0K2CWbXPIX0bl0aprvkr0HFk0PBjF99ezDQOSzFYUvwhlU6Axa7sxHaOBKrhfK9vfL7Ig0ESmhNqpkaQIOKS2sD32EVXV31eYvxZdBhFmL7xJtAccnKDN+Ei8wOhUlz8l2mAEKoA1h1i5fmnUgXbQHfLxCS6ux57EWmtmFZJFK32rDmy1RqfFZ2/N4nyTQtNzpu0gA0m4Bk/MY1YvCNuim9I5hLBWlIQ+GCYmPuCJB7JjhrL6fr2xOU/Kv9h63sH6DafvfLkbtaBBw7i+///G/rSxDCVSei1hERWZ0/34yR+NRRdQbxaEjQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR13MB1175.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 605890b9-2645-4ff7-8e40-08d85a5da0e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2020 16:29:04.9028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CSvOBISXq9QSqlXf2rp/DKEf5eSLoRHvAtz9FPfirrgatIwxH2fHf+2uwolNkwB7SI63Qr6sWLDzr05ztSIizA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR13MB0936
X-Sony-Outbound-GUID: 63ejdmiDrz29jiD3y0TDZnLRFCeROOsC
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-16_11:2020-09-16,
 2020-09-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009160118
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] TPASS in new test lib
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
> From: Cyril Hrubis <chrubis@suse.cz>
> 
> Hi!
> > Although leaving this to Cyril (although having T prefix or not is quite
> > cosmetic, he had a reason to omit it).  Also there is ongoing rewrite of tests
> > still using legacy API to use new API, thus the inconsistency will disappear in
> > the long term.
> >
> > IMHO: don't care that much about legacy API, but synchronize new C and shell
> > API.
> 
> I do not care that much here, but I do not think that we should expect
> exact test output unless we have specified it somewhere.

That's fine.  But it's probably better to avoid differences in
test output as much as possible, when the change is so trivial.  Petr seems to think
there was a reason that the result string was changed between the old and new C library.
If so, what is the reason?  If the change is only cosmetic, then I'd argue it's worth
being consistent, and I'll submit the patch properly.  (Sorry the earlier version was
inline in the message, rather than formatted correctly.)
 -- Tim


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
