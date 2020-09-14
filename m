Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C9670269416
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Sep 2020 19:51:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6EFE63C4F14
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Sep 2020 19:51:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 654D43C224B
 for <ltp@lists.linux.it>; Mon, 14 Sep 2020 19:51:14 +0200 (CEST)
Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com
 [185.183.30.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BF414600067
 for <ltp@lists.linux.it>; Mon, 14 Sep 2020 19:51:12 +0200 (CEST)
Received: from pps.filterd (m0209318.ppops.net [127.0.0.1])
 by mx08-001d1705.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08EHlgqg011664; Mon, 14 Sep 2020 17:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=S1;
 bh=YfRffu6gyfqbElno3fh44kEwAJhXuD6hz/gKZRsRPXs=;
 b=JYHCS8WvJU/4OIrL2wSMxumv4WOD39Q/ayiC7d6iUHCcKuefoFZgc8QlRbuqLUQ6cZnt
 8RXQLTZYnHxag4f4Pp31/s0hHpFRFj/QeqH6hD99l+X8Wabj7yL/gDz9z5BgottBuKIH
 ReC+cfQfTZvzC4m6U4XexAOP3d2XRDriU01nimODjavmgWtBLNiWyoKi0SgjzPxwUNxs
 evfJtGV8PO4QuQee8owK0ecZ5mMWCXpIlELhR3k6zGbbgGuFz+Upqy98DlWOEVBgmOFR
 93bxjBv366ksmnKrbtZ34rEGVNfMRh4Fgf00YGWa/U3fNyZ1bMx8oTe4SAHjeykPLzR5 UQ== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by mx08-001d1705.pphosted.com with ESMTP id 33gtp7h3wp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Sep 2020 17:51:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQKfFbea4zxTWc+Mr7ogasGOxd715QGAqsHIpHqj1Ct/1WcmlZacpEFoyz9BENpx5lPepRoIwCCSrGwA+UBmQm2Olxx0u938i97VtnSSTDdf2tHM4diUXrg0f/l1WZ/ZEXpTsr+gXtlajE6OfyqyJWqMSqQyVqhoR9SradT5FRX3wz1UdSRjRsPsrpd9USJQurDxL/jaGVERN9UEiLifgfzo7HDxBGRfpKBxKkq0vQyyZ3sU2lYshxjU8SsGf2XsYHySx3FFuhQw64ZIz9QRMdBMpkrOdxLdajphw1o3pyKCROqECsaNOvaLj4rXZpd51uNinfAEpg4UVFTXfc3oxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfRffu6gyfqbElno3fh44kEwAJhXuD6hz/gKZRsRPXs=;
 b=LsOxe57P51Pc6l9+I6TEBCy8Px1ZHOtRpO6MZ3rixVeaHjkgKrJEm98Qin+v7vXYfdPP4nSJRupncEQ/2jyPNSlOrWDb1yhm+TmuRxepz9kqQ1oAKfxWBhASGs3AKO9y8GxTkl+8Dy5qnSum2XLC2gpNmSUUCpGyMmi3stdz+cfXjhfeYH6CYGaPzEYLbgAI2BBV1FuRAxcmWI+G13EEWRBC9CVvrDILOkFPAitgwbfIVQMvH6cMf7rXJUiRhM1NvBfGphIf3oHi9His1RAxf++wUL4Fq/8XsQFpo4aEhUeKg+1V53sXJhR9M3/scbp0Nt9xXFvUFrwg8DKUah9Z3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from CY4PR13MB1175.namprd13.prod.outlook.com (2603:10b6:903:40::23)
 by CY4PR13MB1717.namprd13.prod.outlook.com (2603:10b6:903:15b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.8; Mon, 14 Sep
 2020 17:51:04 +0000
Received: from CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::882:fde6:250d:4bc3]) by CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::882:fde6:250d:4bc3%12]) with mapi id 15.20.3391.009; Mon, 14 Sep 2020
 17:51:04 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Cyril Hrubis <chrubis@suse.cz>, Cixi Geng <gengcixi@gmail.com>
Thread-Topic: [LTP] LTP release
Thread-Index: AQHWhbIQCGbLXijA4EiknupaabeIZqleXLWAgACDroCAAR+kgIAAOsGAgAAP1oCAAAPMgIABK5eAgAAigACABjAhgIAANGIAgABrhyA=
Date: Mon, 14 Sep 2020 17:51:04 +0000
Message-ID: <CY4PR13MB117519BB030877EC596EDB75FD230@CY4PR13MB1175.namprd13.prod.outlook.com>
References: <20200908073138.GB2475@yuki.lan>
 <CAEemH2cHvM_KD7W6fyX6z3bc0qfVtkp=yEM8MDvvohouyj5N2w@mail.gmail.com>
 <20200908153659.GA16066@yuki.lan>
 <CAEemH2eq0fwF8zt1uez5vuwM0vtrLtoFd_45sFqE=iQ8hpudfQ@mail.gmail.com>
 <CAEemH2es3sMSfAar8Xj4_Vr+2nsD0isPws4v=8=csLyYROAQGQ@mail.gmail.com>
 <20200909131327.GA3241@yuki.lan> <20200909132703.GB3241@yuki.lan>
 <CAEemH2e+Ck8M22gdgL0OQ24ekBPyDu4FwGrdG+da9E62UZWjRQ@mail.gmail.com>
 <CAEemH2eJCUuf=SQF_GdQ7U9q_8+BD9LsxPAgwuJS9wx8zBzNww@mail.gmail.com>
 <CAF12kFs+Wzm2rt5uE7WoHDXZSpdtZaZPgspKTACpYnw7zR+sgA@mail.gmail.com>
 <20200914110006.GD5524@yuki.lan>
In-Reply-To: <20200914110006.GD5524@yuki.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=sony.com;
x-originating-ip: [192.34.114.49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 22171387-35c4-498b-9cad-08d858d6c024
x-ms-traffictypediagnostic: CY4PR13MB1717:
x-microsoft-antispam-prvs: <CY4PR13MB171753B90D5100A8DD5ABC28FD230@CY4PR13MB1717.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: psoccQrE2BnsgurUvW4Q6s8HwhO0NhbI7KV8zfen6DY66Duni8KNtZgqQKFwiNNTdsj+jfAJN55T8R0Z4LPdO8hsGSbHy6VUsVOtaMdDxtHaXiPHIyo/EMuJvr3bTrfdYB/gy9A7MldBs7RjHrvleACc6wEjKx51qFDAbWKHXKjdJMcUjUK+MG8v7Zk8ujF3VgObkngTBv8OxZujOHfvQvnuHJt5OPm11hhZkUkFA4fWG4wMIm5+EJFMZCb/+oa3nKCxqzDGD/AC/GTX057N2oeBsP418woG0TI4dWWM8zu2unzgxP4UTk8EGQhjXuynjJrJjA0Z5w6sd9MbwQ2JJA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR13MB1175.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(8936002)(71200400001)(86362001)(8676002)(33656002)(4326008)(83380400001)(52536014)(9686003)(5660300002)(55016002)(2906002)(76116006)(54906003)(110136005)(6506007)(26005)(186003)(66446008)(316002)(508600001)(7696005)(66946007)(66556008)(66476007)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: C2KxC8lQXkOqcnWOhpzNrPi4CfTmRoOvCerKdeUBDOVfbaNWGVJ60CPRfGTKRfF4IlLLtvYYJcA3b2sKY7eWwOeX+Y1Jpsl2i9kC0GmYP9GOyHggoCvm0wYlPw+dbMi6LGkbrgK/m2/sbLguSMjVcaPLSM4M/OAzsBlE7K8yhkZBdZBKFRCKT83aOG2gA0MT4Qi17O+OlOGk5HT6VVtiLZPuVCCeAc7zHdnTcOrQ5vyzxPmKbxX2fmTqLkc7dOKaGg4NCB+rKyngK37sRWrafcdUgK3KbDtgD4wZj02yKFdxYt/QeoVaysvy7aTsa9kcYBD3lBEUVivgT37EPMJcr/ZhoHbm+ElgWT0AycugOYswP2KAIe9Wcty7kzZaHUtrws+EvHHjGGEDSBHOjKd/VsMCqhmsCRp+Gy4OTC+ePXIgtfueyMiUneKnYFm5/RHdLu0g2vkN8KRf6r35Ns3+JKGi6CXV87jioe19mAFS27simv8IlwmsB22PcoftMFMLvWYze4m2eKo+LDFc+f+Ydp8k06tK/gD26czWUcN79p1YJ4mBhANmJAI2dBTU4zkoY/LHo2KsRjOXfDXwVa6VVjihIUVf6nfz8+d5bgQ/q0ACrCsynn0DBKgJyIUV8VI52WPQZwCat5osBQG8MYJWGg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR13MB1175.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22171387-35c4-498b-9cad-08d858d6c024
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2020 17:51:04.2046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z9HomCxAUOAreFYCemUqOxSyXXpkY4kTBPHEoVsbMO9Ohj2LUxaMqFpKZAmVa1806kHp+4W/r1ED/zyeBdA04A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR13MB1717
X-Sony-Outbound-GUID: k3KBMTzjtQvCoe6kEvdNvSfxxB11Km6d
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-14_07:2020-09-14,
 2020-09-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 clxscore=1011 impostorscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009140143
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] LTP release
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
Cc: "Pravin Raghul S." <pravinraghul@zilogic.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 "xingfeng.kang@unisoc.com" <xingfeng.kang@unisoc.com>,
 LTP List <ltp@lists.linux.it>, "Vijay Kumar B." <vijaykumar@zilogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> -----Original Message-----
> From: Cyril Hrubis
> 
> Hi!
> > Can we merge the uart device driver testcase and the device-discover
> > framework ???
> 
> Can we please postpone it a little bit again? I've been talking to Tim
> Bird recenlty and he is interesting in helping to shape the interface so
> better that it fits into existing hardware labs.

I'm very interested in this work, and how to integrate it with 
external test frameworks that manage lab equipment (and may
need to communicate test parameters to tests).

I'm not sure the best way to proceed.  I reviewed the device-discovery
code on patchworks, but I'm not sure I understand the anticipated flow of
control between the LTP test, the device discovery part, and the test
framework.

I know you're busy with the LTP release, so I'm not sure this is the best
time to open up a big thread asking a lot of questions about device discovery
or describing my own proposal for this - to work towards harmonizing the two.

But I'm keen on following up on this in the short term (next 4 weeks or so).
I'm giving a talk at Open Source Summit Europe the end of October,
where I'll be talking about lab management APIs, and this dovetails
into that work.

Let me know when would be a good time to try to hash this out.
 -- Tim


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
