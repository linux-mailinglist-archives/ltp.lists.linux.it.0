Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B834226CEB4
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Sep 2020 00:25:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 384103C4EB3
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Sep 2020 00:25:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 8625C3C209D
 for <ltp@lists.linux.it>; Thu, 17 Sep 2020 00:25:48 +0200 (CEST)
Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com
 [185.183.30.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3D50B1A0065B
 for <ltp@lists.linux.it>; Thu, 17 Sep 2020 00:25:45 +0200 (CEST)
Received: from pps.filterd (m0209321.ppops.net [127.0.0.1])
 by mx08-001d1705.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08GMPiD9022605; Wed, 16 Sep 2020 22:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=S1;
 bh=QAD1HBTioJOzs/v6QB8sVckSHb1Xp28vwgPHicFFcbI=;
 b=W7pWQo2VPznexHZdImCE5jNuJMLRJgc/yfhVTGPOXuTYtUBoMxVYQ9M2uZLGsUXB75yD
 Vm2V2APpbm3KuN/JjMmuxeXF/TrnYqunKkpm5xCrdDB4ix3SdBMlmIwTkQd41hO2RNUJ
 hkmDJHZfgA8mdPGd7PSyY3Esad1bc6P71a0xemVygXgq4GfSySghBX6Z116e7RriZbrt
 koWc2VoMo+2j9TCoINSDzSoXizdnPwMnmBY2NfNPRBlWzUopV/n9zvcNh7V0FSKTDxrW
 sDJeMOp9Ow8knFmtMu+/v5kUFFHY7KlmRBT2Uz25joOqRt7kqVCFW9ovKIhPCNIfSxff OQ== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2044.outbound.protection.outlook.com [104.47.74.44])
 by mx08-001d1705.pphosted.com with ESMTP id 33k69k8puh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Sep 2020 22:25:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cshhbBs4ECDvO03AcQf3CmWTrukm4+1ZSYQwWCh2XWiCkCVKaciVw/0ag1nyiK8qPqaBZl33J6EyKvvk7q7x2FsLxOosKY/clQrWFVTnAvAJsmsHw3sJFaI2Q6LGIvNiyfmsM4VO8zGerD8pHIcAMXohRSflboipO4NxGIb+jpBtmg3wqNvqDtTg0lQt5zopWrCYHU4nP80Xtoub64dwfNeUvpmAq26pXt1p4KSiri8880X1pRxnfh2R+GXZXZ+jYOOgmV5/YRKjdi+0aV2YFb8rk7V2e8Mbf/6xYwIfk1PaJsx7YGuOgPQer7WZpN4xkVmaRi6H9DoncBp60lZZKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAD1HBTioJOzs/v6QB8sVckSHb1Xp28vwgPHicFFcbI=;
 b=Z6w1GkC+Bs2XUAvxZU1TuH5716QuWyc6uMb0XAl4OI7h2kb7QQR0BnJa7Oa+3hjU9EVZ+IfLB1hYkifW/+g8A2OjyC8Wvhnj8WKoZ0rf8ppnab7CQCFAYpaDBNTOPOrg+515JEdBUDR3vJJxthDwMfJ1mSCWqExP4emhzlmH1zPpO6nEVt7elC7FJ08vvzZsEtJ1GDHOR75gGcboJDwHPyKvRO8OlwR5GU6sL5j5U0A6jx+tK9GCYPJWE6nHykiI3z1qJ6brNpnOImdmPzdNsiLGb5SoGVybdNyExLy6pndzsnXago0Xl86eeyt9Y9ieNnayKM/dSzWj9/PQTFh+pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from CY4PR13MB1175.namprd13.prod.outlook.com (2603:10b6:903:40::23)
 by CY4PR13MB1221.namprd13.prod.outlook.com (2603:10b6:903:a2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.4; Wed, 16 Sep
 2020 22:25:41 +0000
Received: from CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::882:fde6:250d:4bc3]) by CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::882:fde6:250d:4bc3%12]) with mapi id 15.20.3391.009; Wed, 16 Sep 2020
 22:25:41 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: ltp-selftest-quick runtest file (was RE: [LTP] LTP release)
Thread-Index: AdaLmqKhHylX96+kQiOlLXoYzEe/RwAXQKkAACAbg3A=
Date: Wed, 16 Sep 2020 22:25:40 +0000
Message-ID: <CY4PR13MB11750B438B7F73126B88240BFD210@CY4PR13MB1175.namprd13.prod.outlook.com>
References: <CY4PR13MB11752979CBBBBCAD98EC86E0FD200@CY4PR13MB1175.namprd13.prod.outlook.com>
 <20200916070440.GA1433@dell5510>
In-Reply-To: <20200916070440.GA1433@dell5510>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=sony.com;
x-originating-ip: [192.34.114.49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d82cd5fb-2a79-46b3-e411-08d85a8f71ed
x-ms-traffictypediagnostic: CY4PR13MB1221:
x-microsoft-antispam-prvs: <CY4PR13MB12214E8586E43DDC516338AAFD210@CY4PR13MB1221.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M02zj3xBAYjodb00Ps4qqxtyACGM1xu37PjbrvcuMuj4IJSHfyVni4GVa0TQCm8a8GnZVrQvKEWiaq7jxSXXhjxqVE1qIe5q5qcTJvsgKPrR02q2lbM89tyemkXZySOHaa1TyM6m99b0M+FcW6Mhb89Bat5I2eCvOfyw0Io44hxD8Nv53htPXAUp7IFgaZX2u7Q5j5cq5wZXFMLf//mHCMF6YK9DO9/xa/K21Gw8+xJBoojEc3TGPdYjrKPW/aoiOn/V4CFeIJPpMOVbrQWNiTSwmD+aHeoaFH1oweT+HeCxBByltwt60huPeyyVHFWvMUW/vT/nsMwX5yp5P0yjpqRvAVvdPZfpbXZ1dEecvetPNs03eVWSnjptd31LxHyy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR13MB1175.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(66446008)(66476007)(66556008)(64756008)(6916009)(8676002)(54906003)(8936002)(86362001)(4744005)(83380400001)(76116006)(9686003)(33656002)(5660300002)(52536014)(55016002)(26005)(66946007)(71200400001)(478600001)(316002)(2906002)(186003)(6506007)(7696005)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 9C7AOaCJwpeDdzJAD9+BgaOzPApmNQTAt6j/kLYr2GQsyJ20cZpIHTRXp9+RWTGQzv9TeuEtJHXAg4KDmtwL05Tpb6p4VyAqj7sjHbf17D8mpGMefdK1Mv0c8mMz5XbRCxgFlIHd/IdlkBT+Q6uPvytQK6UMOn8fHIrneC0SwThDFQiY/mhT+cON+TRGCgQatJtIIRJBE+GD6fw3WCTnEJv/p0wl1+MusknR8NVG1M5y6hOUxoR+dJ0gFbT1zweRaSWzlfeEtQKP1n7LCXx3gKCA8IuVysXIm0CdU0PRVKkNRJLmjTT7GakF6dNWjg35/6B8fhqfUbsjVbSR1nP0xAhsHkfAhJG/Uf8+sIbd1zOXB22r5SftiLxYeOgzlCCbcfS07PYMWEdMUMtiRJRRanuCs8IPgsa3TkuuwQmi+xwpmskS8cdwj/Ibq03OSV7F0Jfu1ovAH7xt3XNkDJ5AGBf/nKGsYz3J+qS5cRpyZ/zPSUvZDRR7cMN/+R78INeOo1WuR2ibgdaBoac562uErhCPm6yM5trAprUihv8ngBBO2O006Zb79sgPw1gvEgX3RzAopPf/HkO15AI1l0s9vizT7peVrby9yq4nDeYMzt2zdfyKh3IFO2EaoNWBYHn5A7rSmHWC9DpzoU6n8sSdBw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR13MB1175.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d82cd5fb-2a79-46b3-e411-08d85a8f71ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2020 22:25:40.9974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: po0NK441GiuHG91kt3xnhEhLnYiaXBPMt86e6nrCOgjeuknIHHAMWi3xIvY3DQZ0W6zur1kmxP1FFqMlD61VPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR13MB1221
X-Sony-Outbound-GUID: eN2BH7pBovTSE3C-MuK1nN9KBf3L8hEO
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-16_13:2020-09-16,
 2020-09-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009160162
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] ltp-selftest-quick runtest file (was RE:  LTP release)
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
> Hi Tim,
> 
> ...
> > > e.g. route tests with netlink also uses shell API and it's really quick (real
> > > time 0m0,687s):
> > > route6-change-netlink-dst route-change-netlink-dst.sh -6
> > This particular one gives me:
> > ...
> >  route-change-netlink-dst 1 TINFO: running route-change-netlink -c 10000 -6 -p 65535 -d ltp_ns_veth2 -r
> 'fd00:23:4::1,fd00:23:3::1,fd00:23:2::1,fd00:23:1::1,fd00:23::1,'
> > tst_test.c:871: CONF: libmnl library and headers are required
> > route-change-netlink-dst 1 TCONF: not supported configuration
> 
> > Is there a networking one with less requirements, that is basically guaranteed to work?
> Good catch. Although TCONF is also a test for shell API :), let's use plan shell
> implementation:
> route6-change-dst route-change-dst.sh -6

This one worked on some of my boards and not others, due to ipv6 not being
configured on some of them.

How about this instead:
route4-change-dst route-change-dist.sh

 -- Tim


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
