Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DABD39AFF9
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 03:44:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ABD913C8F28
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 03:44:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0EB543C2836
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 03:44:30 +0200 (CEST)
Received: from esa17.fujitsucc.c3s2.iphmx.com (esa17.fujitsucc.c3s2.iphmx.com
 [216.71.158.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 233AA601419
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 03:44:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1622771069; x=1654307069;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Fa7W1DirYTvMcjZ+w7LSZTW04fg6uiNG4gU4jVsFEKc=;
 b=JcsyCNShCv4WsQJ2ZKk1bleHa0pGcZWhHIAVzSFc9wNo+mKThKMzSxOY
 5Yjattx/hORHRZaNW67zLC9Cy0kHnHdCYxAJN3fQ9hD2KTEfmkSSAU9l0
 /01e12Sf71Hye0+FKL+1I6IEWCmjAptPPyUOVsrR5KIov5hwJJSjN6ciC
 090Wz7Qs8mIGpxs7CvUPepgosyx1aAQwWlTFH6qMJsnOpKbAktfA3ORdO
 c81Ufg/+FIbEx6hFA62usS+Eq/4N1IV1wy/NUPgFwZ3S3NPp9ZK7Ff8lY
 zU4Ku+InKphYGkCnOdPFz0psqoMEKvDIFfg+tiKd5PsVdaiM/PKmXvcmi w==;
IronPort-SDR: y2BTs0W6VJR3EMb34Xl+8tdkXovsvfJmySKUCREGwMD+c6DVvuBcPvy+Mle88m/x36ktGd8O0A
 l0urxDhpgswqGfQOZR8uNTPlnNd3L3CPk8IPAICEVpRJvj5BAv214UBo38+018mYxK61y2yOAd
 Qe3eqHToA0WkfJTRkgnqzDb8mGgAfTi3l9JC1OKMFgcNCOaocXShr2esDl5wmWijTQWHO5tbL9
 PUMIveKHnKMzaChoxIyOhCnY8o/YpzgH/6NSsKB1rgdbWAF+xc1yRgaSkpVjLCfWuI857CzC3f
 tzI=
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="32353891"
X-IronPort-AV: E=Sophos;i="5.83,246,1616425200"; d="scan'208";a="32353891"
Received: from mail-ty1jpn01lp2059.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.59])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 10:44:26 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hq1fK1sSDsErLf/PFZhUb1OMIdbfk31lkNBhR/FicTk+1QQ+y58rAZgaT61LqHUBj7QMzxLhJ4rfagdfZuAuMwMUCpJ2YPTsqNd6AAkscfZWaDy1KAZqWVjJTdfeVq36rCTnn8FxgR1QykLpyfJBJRnfxOKruyFQnYcHGODTI6FUbFf3CxAs+M7PO3VkOE1l65H1F65Hr+do8mv1FyZOcfp9x2yEZVFB//mNmF+rKnZtlxXRVTsER7LnG+F8sO8E/vnLPpILLGLyKONux+xFD2eAKps1Cd0FdqNId5MmW9qzeqEME7ZUz3h2zu9Nh4quioTsPg6MB9HFQRhMHdsAdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fa7W1DirYTvMcjZ+w7LSZTW04fg6uiNG4gU4jVsFEKc=;
 b=F4lgmKJQZNJsVhgRL4SwXP6y8EBoDfHCvA31acpWW0gIihvggUQYtHTe+r2JKPpjhhISh3ANbqliUqw6bzEgI9OKQDnmXY5nG5WQD9NkNgBU3++dk72YjmIynM8Rd3D+MphgLxJ3OQiDD14XXjCGbvk+RZ15CFtlQLUQRdKbdN4mMll+wyz8+dVz3Mhm6qTDYltWs+PgbASUwD9HkJ3Ibi9H7eKhJ07KTYOPbzQA1FsTY2xsmsczpkihrgJqKgHNFX2KiY4Z8TXfErj1RXljvSPuWRa9INShTjJOV6ZE8a8SjLEj2x59iCLP+tZje2EJoI6qZqmCr/b7rIt3qQBguw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fa7W1DirYTvMcjZ+w7LSZTW04fg6uiNG4gU4jVsFEKc=;
 b=PhVSdZoiZOc30IMPgwUpSeZTYzKiLSMvHaPKsMYDMAFqeonSLR3S0HLRUIVzNA1vSW2lbFcFIh5nJ879DVnkS8sxZeut6dc9NsM4sSzlBgS7+IfIkhgMbwhx2BKCF4rl6qLOVnvRhA5rPbXlGDm+aQz31ye2h4sZTDgMyWtIE3A=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYCPR01MB6849.jpnprd01.prod.outlook.com (2603:1096:400:b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Fri, 4 Jun
 2021 01:44:16 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531%6]) with mapi id 15.20.4195.022; Fri, 4 Jun 2021
 01:44:16 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: =?gb2312?B?IkphbWVzIERvbmcgKLatysC9rSki?= <dongshijiang@inspur.com>
Thread-Topic: =?gb2312?B?tPC4tDogW0xUUF0gW1BBVENIXSBsdHAtYWlvZGlvL2Rpb19hcHBlbmQ6IGZp?=
 =?gb2312?Q?x_dio=5Fappend()?=
Thread-Index: AQHXWE4kwSGWgslrMka+KJC7F/CvvqsCD10AgAAGOoCAAQA9AA==
Date: Fri, 4 Jun 2021 01:44:16 +0000
Message-ID: <60B98598.7000905@fujitsu.com>
References: <d87da351dd8cd8c8e51afc8922162e84@sslemail.net>
 <60B8A96C.8080503@fujitsu.com> <befea6726fc7467b9410db3e3b961f3e@inspur.com>
In-Reply-To: <befea6726fc7467b9410db3e3b961f3e@inspur.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: inspur.com; dkim=none (message not signed)
 header.d=none;inspur.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 324ca5fe-e953-4556-fb1a-08d926fa438a
x-ms-traffictypediagnostic: TYCPR01MB6849:
x-microsoft-antispam-prvs: <TYCPR01MB684907D96A24DB0688E52F83FD3B9@TYCPR01MB6849.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0Vj8KBCuT795ejJKr4PVGqxKkzVgYytDeO0/gGLFSm++3P1j8w2moTWiozpQTRd0H1AUJVNeyOh7o4XTG2jTVLtf2ZaR/lxiJgKLDIXhNcUsEhCjMtGHrOMMMHapU42rtnuZm2YzoKRXfePRLGPKDTZ0VpScbpFGDJw9Fym1B7psZxRuFAQ2IDsqUccwTPw1lac822QNsvUrzGHJEsVL/3fmY9UxRHNHZ/O/UMor+7/Tc51ej77RS3/Neq+5sNv7SxHF5KxOzZqoAdtcoE5+eCH9Mgrw3OyFs0BnbKWB4FgqRspqp76lOKpnzDET6r8n9NSwaHvJ6ut9A66Gn4SMIyqrG96ruot7AbNFJ8G7RZaPl1bqP9JsOJR9Z56AXDwzRzJINwFFpgnDnjY7lDoP2qeZLi9qO8LeNxp8t1ZAYr6cbgNuyFxakrF5FnRP/kJ0ha/8OA5LyJeReaTlGH7mt1E/66Zyh0He9XJPiMXW3Tiq+bz8SVaI0ascOXszd2jI2EGj6UVaxDg3DWkDOd3JF4Qt2WT2O8ljbYO4VF6xh3zCDbaE5JsEwOn0CrevLT4v27CIdxfsjXYGjb1jNGrF1T6Yk7ucQyLmiEIP7IKVF4d7F84WkFglN2h6lccJ14qwdWPbUK2kHV+FuSQ+5DrC8Rryy01+LzVbUXKxapUcBI8tUiWBQiSFKuJF0qNzRC8o4Og9tqHcjOmRYyNgJe02L14M3pZ7j/+3TzUz/srSRjY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(33656002)(478600001)(83380400001)(966005)(36756003)(4326008)(2906002)(5660300002)(85182001)(316002)(6916009)(122000001)(71200400001)(38100700002)(87266011)(224303003)(6506007)(64756008)(8936002)(26005)(86362001)(186003)(6486002)(66446008)(66476007)(6512007)(76116006)(91956017)(66556008)(66946007)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?YkNHV2JXWjJDUk9MNys4bWxLZTE2WnhZbitFWm5PeEVJSGZOSDdQeVdDQS9y?=
 =?gb2312?B?bUY5QlEydlVMUzFJTzVHOGZCREg2VjNQSkNodUdrK2psL05CeXZFSzdlZkhN?=
 =?gb2312?B?OGVTOHlBT0FBTy9kMUwrS0l3RVF6U2ZReUVqZm1pSG9CYXo1K29ueEhjNmlW?=
 =?gb2312?B?cUNHeTBUNUNyMEphdEtFYitzSFplN1VjNC9qWHM5and3cng4aVFwZEFrVHBu?=
 =?gb2312?B?dFlmTUJzL1hmV1pIaFZkcmtNMC82bStVK0lOQnBSc3FPencrZ3IzMVdvVDhv?=
 =?gb2312?B?R3hkdlo2MEx3QnFsbzNGTlpCTUJKWGZmQUFrTVo0bFVseG9OcE0wbUtTcnRq?=
 =?gb2312?B?K211TFNvSGJscjhNcm96ayttSnViSHBXbXlETWtiMEpGRmxCY1VpWldlRndh?=
 =?gb2312?B?K1FzenhrcG1BT3poZk9oenB1ZjN3NEd0SFIwcFZ1cTI2MjBKYUNYbmkzbjNY?=
 =?gb2312?B?bGJWUU1hOWRxeHoyMmVQcDQ5WkR4V3czenpXQ1F3d0pDUjZrTHZsU0lXODdU?=
 =?gb2312?B?dmpuUjI5S3YvK3I5aEhtdGlTbE01cC9qbTlIWDJGcHkzM3J2TEhIL2wzdHc5?=
 =?gb2312?B?OGhBdGt4cDBNZitTdisyN3BjdWU4SVMreVFobTdLSXllSWJvanpFaE5QUkJU?=
 =?gb2312?B?ZW80UFYyZ1dQalQ0eGQzZHFvMDZvUndjTTQ2MXNBTnBhL3hSa2s0WFVNeUk2?=
 =?gb2312?B?UHFVV242MlY4VmN5aXZOM0tPbGt3ZkJqRmNzVW12NVhtRjY0UHJZN2Z5bXBw?=
 =?gb2312?B?RFlQcG1ZZVpXL1RJV3pjc1JDQkJzV0s3QkFLN21Oa3RtSUt3VUoxZmI1UkFL?=
 =?gb2312?B?QTZFOVpRYjcwU2oyNlZwc1RGaUZqTlhCajFwWHNaUW10SUxROVd4Tml0MWJi?=
 =?gb2312?B?M05Kb2FsSVM0VEwvdW9RT3hMa0cwcjllWjNocTVkZ3l3Sis3OE1jWENZWGZp?=
 =?gb2312?B?TlhGNFpKbi9Ma2tiREJpK2lqdEovVWxITWFhQnQ5Y0YrTG5TQjV0RzV1U2hK?=
 =?gb2312?B?T3VIMnFEK0U5K0dHYkRFc1BaSWhOcmY0WVFDbFZhV2hMT2d4L3pzWFBMVURX?=
 =?gb2312?B?NTkzZGh4SEV1YTdCcTdxOVI5M2hNUDVCZkszaFlxU3JHb1BsZysxT3krZCtY?=
 =?gb2312?B?dmRKMEk1cUxQNW90SEVPbjlFQTVzQ1FEZjFvVGpoRm51OTROMjVaMm1ibWhN?=
 =?gb2312?B?U2c5WUgyUXhyKzVmbjQ4UVpBMENoUElCTUdwSEczTEJyT1hhNDlweWhaSjAx?=
 =?gb2312?B?SndxK0w3T0ZTcEJvTCt2ZldyRDI3dHhxTlBybGRydC8xU0p0T2lvemZTR0dq?=
 =?gb2312?B?WjB5c3VYZDFlWHZNNFl5WTE2NjVybjFEblBadkNiRThMVmtuczdYeDZFTDFp?=
 =?gb2312?B?TXdsbERDVUlLc3hTRzc0MzhQNEIzejgxSTlJRHd0NWxSZmVtVXYrVDhCY0l3?=
 =?gb2312?B?SEZTa2c0aUkyT25vQWdXVjBhNW1ZYm56OGRDdVk3ckJMRE13WThibDZMeVY0?=
 =?gb2312?B?VlEzb0J4d2lKbVVpQWorYVRSZndyL1ZsQkMwQVBjVlMrUytUdzFNQWVQUzVx?=
 =?gb2312?B?NGJrOGxXcUJWMjJrd1k4Vy9RYTZiMEI0Qi9IcEVIWG0xbDNqc2JaUDR6VnMy?=
 =?gb2312?B?VTNEMmM3NU0vdVJIWlVWbnFoOU5GUnVXVE5WQ1p5dHROUHV2bEY1dWpDVHQy?=
 =?gb2312?B?YytYUVBPQTFld1JmVUlBWjgxUDFHb3dydGl0VFlvVUo4elh1MVArTVhWTVVn?=
 =?gb2312?B?YnNSaUVhcldmUDUrbVFHT1RxYmE1S1UvSlN0cXdNUWZtc1JsNGVVSDdCdHBS?=
 =?gb2312?B?Vmx5djFEclI5cFUzVDNKZz09?=
x-ms-exchange-transport-forked: True
Content-ID: <7212D616661ADD46ADE84D42EB79C8F4@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 324ca5fe-e953-4556-fb1a-08d926fa438a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 01:44:16.5735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M+QPROMolV7O89Lv9I0pMp8+1Vfrp4vsk/mplWssdUaVBVwlpyJOmSETJLr225W7Tq4F03pE47Y1MPxUNCgzmiICFzxMrNqvm+Su3jiBtZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6849
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] =?gb2312?b?tPC4tDogIFtQQVRDSF0gbHRwLWFpb2Rpby9kaW9fYXBw?=
 =?gb2312?b?ZW5kOiBmaXggZGlvX2FwcGVuZCgp?=
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
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgRG9uZw0KDQpQbGVhc2Ugc2VlIGx0cC90ZXN0Y2FzZXMva2VybmVsL2lvL2x0cC1haW9kaW8v
UkVBRE1FDQppdCBzYWlkICINClJ1biB0aGUgbHRwLWFpb2Rpby5zaCBmaWxlIHRvIGV4ZWN1dGUg
YWxsIHRoZSB0ZXN0cy4gVGhlIHRlc3RzIGNhbiBhbHNvDQpiZSBydW4gaW5kaXZpZHVhbGx5LCBq
dXN0IGV4ZWN1dGUgdGhlIHByb2dyYW0gYW5kIHRoZSBleGNlcHRlZCBwYXJhbXMNCndpbGwgYmUg
b3V0cHV0LiBObyBzY3JpcHRzIHdlcmUgY3JlYXRlZCB0byBydW4gdGhlIHRlc3Qgc3RhbmRhbG9u
ZS4iDQoNClNvIHVzZSBydW5sdHAgdG8gZXhjdXRlIGx0cC1haW9kaW8ucGFydDQgd2Fzbid0IHN1
cHBvcnRlZC4NCg0KWm9ycm8gYW5kIEN5cmlsIGFsc28gZGlzY3VzcyBhYm91dCBsdHAtYWlvZGlv
IGRpcmVjdG9yeS9maWxlIG5vbi1leGlzdGVkDQpwcm9ibGVtLiBQbGVhc2Ugc2VlIHRoZSBmb2xs
b3dpbmcgdXJsLg0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2x0cC9wYXRj
aC8yMDIxMDYwMTE1NTQyNy45OTYzMjEtMS16bGFuZ0ByZWRoYXQuY29tLw0KDQoNCkJlc3QgUmVn
YXJkcw0KWWFuZyBYdQ0KPiBIaSB4dXlhbmcNCj4gMS4gaWYgbm90IGNyZWF0ZSBkaXJlY3Rvcnks
IGluIHRoZSBmdW5jdGlvbiBkaW9fYXBwZW5kIFRoZSBvcGVuIGZpbGUgcmV0dXJucyBhIGZhaWx1
cmUsIEJlY2F1c2UgdGhlIGRpcmVjdG9yeSAiYWlvZGlvIiBkb2VzIG5vdCBleGlzdC4NCj4gMi4g
VGhlIG1rZGlyIGNvbW1hbmQgaXMgY2FsbGVkIHRvIHJlY3Vyc2l2ZWx5IGNyZWF0ZSBkaXJlY3Rv
cmllcw0KPiANCj4gLS0tLS3Tyrz+1K28/i0tLS0tDQo+ILeivP7IyzogeHV5YW5nMjAxOC5qeUBm
dWppdHN1LmNvbSBbbWFpbHRvOnh1eWFuZzIwMTguanlAZnVqaXRzdS5jb21dDQo+ILeiy83Ksbzk
OiAyMDIxxOo21MIzyNUgMTg6MDUNCj4gytW8/sjLOiBKYW1lcyBEb25nICi2rcrAva0pPGRvbmdz
aGlqaWFuZ0BpbnNwdXIuY29tPg0KPiCzrcvNOiBsdHBAbGlzdHMubGludXguaXQNCj4g1vfM4jog
UmU6IFtMVFBdIFtQQVRDSF0gbHRwLWFpb2Rpby9kaW9fYXBwZW5kOiBmaXggZGlvX2FwcGVuZCgp
DQo+IA0KPiBIaSBkb25nDQo+PiBXaGVuIHJ1bm5pbmcgdGhlIGRpb19hcHBlbmQgdGVzdCBpbiB0
aGUgbHRwLWFpb2RpaW8ucGFydDQgdGVzdCBpdGVtLCB0aGVyZSB3YXMgYSBwcm9ibGVtIHRoYXQg
dGhlIGZpbGUgY291bGQgbm90IGJlIGNyZWF0ZWQsIGJ1dCB0aGUgdGVzdCByZXN1bHQgd2FzIFBB
U1MuIFRvIHRoaXMgZW5kLCB0aGUgZm9sbG93aW5nIG9wZXJhdGlvbnMgaGF2ZSBiZWVuIGFkZGVk
Lg0KPj4gMS4gY3JlYXRlIHRoZSBkaXJlY3Rvcnkgd2hlcmUgdGhlIGZpbGUgaXMgbG9jYXRlZC4N
Cj4gV2h5IG5lZWQgdG8gY3JlYXRlIGRpcmVjdG9yeT8NCj4+IDIuIHJld3JpdGUgdGhlIGRpb19h
cHBlbmQgQVBJLiBBZGQgcmVsZXZhbnQgcmV0dXJuIHZhbHVlcy4NCj4+DQo+PiBTaWduZWQtb2Zm
LWJ5OiBkb25nc2hpamlhbmc8ZG9uZ3NoaWppYW5nQGluc3B1ci5jb20+DQo+PiAtLS0NCj4+ICAg
IHRlc3RjYXNlcy9rZXJuZWwvaW8vbHRwLWFpb2Rpby9kaW9fYXBwZW5kLmMgfCAyNiArKysrKysr
KysrKysrKystLS0tLS0NCj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL2lvL2x0
cC1haW9kaW8vZGlvX2FwcGVuZC5jIGIvdGVzdGNhc2VzL2tlcm5lbC9pby9sdHAtYWlvZGlvL2Rp
b19hcHBlbmQuYw0KPj4gaW5kZXggM2YwZWQyOWQ1Li41MDBkZmRjMzEgMTAwNjQ0DQo+PiAtLS0g
YS90ZXN0Y2FzZXMva2VybmVsL2lvL2x0cC1haW9kaW8vZGlvX2FwcGVuZC5jDQo+PiArKysgYi90
ZXN0Y2FzZXMva2VybmVsL2lvL2x0cC1haW9kaW8vZGlvX2FwcGVuZC5jDQo+PiBAQCAtNzUsNyAr
NzUsNyBAQCBpbnQgcmVhZF9lb2YoY2hhciAqZmlsZW5hbWUpDQo+PiAgICAJcmV0dXJuIDA7DQo+
PiAgICB9DQo+Pg0KPj4gLXZvaWQgZGlvX2FwcGVuZChjaGFyICpmaWxlbmFtZSkNCj4+ICtpbnQg
ZGlvX2FwcGVuZChjaGFyICpmaWxlbmFtZSkNCj4+ICAgIHsNCj4+ICAgIAlpbnQgZmQ7DQo+PiAg
ICAJdm9pZCAqYnVmcHRyOw0KPj4gQEAgLTg2LDE0ICs4NiwxNCBAQCB2b2lkIGRpb19hcHBlbmQo
Y2hhciAqZmlsZW5hbWUpDQo+Pg0KPj4gICAgCWlmIChmZDwgICAwKSB7DQo+PiAgICAJCXBlcnJv
cigiY2Fubm90IGNyZWF0ZSBmaWxlIik7DQo+PiAtCQlyZXR1cm47DQo+PiArCQlyZXR1cm4gMTsN
Cj4+ICAgIAl9DQo+Pg0KPj4gICAgCVRFU1QocG9zaXhfbWVtYWxpZ24oJmJ1ZnB0ciwgNDA5Niwg
NjQgKiAxMDI0KSk7DQo+PiAgICAJaWYgKFRFU1RfUkVUVVJOKSB7DQo+PiAgICAJCXRzdF9yZXNt
KFRCUk9LIHwgVFJFUlJOTywgImNhbm5vdCBtYWxsb2MgYWxpZ25lZCBtZW1vcnkiKTsNCj4+ICAg
IAkJY2xvc2UoZmQpOw0KPj4gLQkJcmV0dXJuOw0KPj4gKwkJcmV0dXJuIDE7DQo+PiAgICAJfQ0K
Pj4NCj4+ICAgIAltZW1zZXQoYnVmcHRyLCAwLCA2NCAqIDEwMjQpOw0KPj4gQEAgLTEwMiwxNyAr
MTAyLDI5IEBAIHZvaWQgZGlvX2FwcGVuZChjaGFyICpmaWxlbmFtZSkNCj4+ICAgIAkJCWZwcmlu
dGYoc3RkZXJyLCAid3JpdGUgJWQgcmV0dXJuZWQgJWRcbiIsIGksIHcpOw0KPj4gICAgCQl9DQo+
PiAgICAJfQ0KPj4gKwlyZXR1cm4gMDsNCj4+ICAgIH0NCj4+DQo+PiAgICBpbnQgbWFpbih2b2lk
KQ0KPj4gICAgew0KPj4gLQljaGFyIGZpbGVuYW1lW1BBVEhfTUFYXTsNCj4+ICsJY2hhciBmaWxl
bmFtZVtQQVRIX01BWF0sIGZpbGVwYXRoW1BBVEhfTUFYLTVdOw0KPj4gICAgCWludCBwaWRbTlVN
X0NISUxEUkVOXTsNCj4+ICAgIAlpbnQgbnVtX2NoaWxkcmVuID0gMTsNCj4+ICAgIAlpbnQgaTsN
Cj4+ICsJaW50IHJldCA9IC0xOw0KPj4NCj4+IC0Jc25wcmludGYoZmlsZW5hbWUsIHNpemVvZihm
aWxlbmFtZSksICIlcy9haW9kaW8vZmlsZSIsDQo+PiArCXNucHJpbnRmKGZpbGVwYXRoLCBzaXpl
b2YoZmlsZXBhdGgpLCAiJXMvYWlvZGlvIiwNCj4+ICAgIAkJIGdldGVudigiVE1QIikgPyBnZXRl
bnYoIlRNUCIpIDogIi90bXAiKTsNCj4+ICsNCj4+ICsJaWYgKGFjY2VzcyhmaWxlcGF0aCwgRl9P
SykgPT0gLTEpIHsNCj4+ICsJCWNoYXIgY29tbWFuZFtQQVRIX01BWCArIDEwXTsNCj4+ICsNCj4+
ICsJCXNucHJpbnRmKGNvbW1hbmQsIHNpemVvZihjb21tYW5kKSwgIm1rZGlyIC1wICVzIiwgZmls
ZXBhdGgpOw0KPj4gKwkJaWYgKHN5c3RlbShjb21tYW5kKSAhPSAwKQ0KPj4gKwkJCXJldHVybiAx
Ow0KPiBqdXN0IG9ubHkgY2FsbCBta2RpciBzeXNjYWxsIGluc3RlYWQgb2YgY29tbWFuZC4NCj4+
ICsJfQ0KPj4gKw0KPj4gKwlzbnByaW50ZihmaWxlbmFtZSwgc2l6ZW9mKGZpbGVuYW1lKSwgIiVz
L2ZpbGUiLCBmaWxlcGF0aCk7DQo+Pg0KPj4gICAgCXByaW50ZigiQmVnaW4gZGlvX2FwcGVuZCB0
ZXN0Li4uXG4iKTsNCj4+DQo+PiBAQCAtMTM0LDEwICsxNDYsMTAgQEAgaW50IG1haW4odm9pZCkN
Cj4+ICAgIAkgKiBQYXJlbnQgYXBwZW5kcyB0byBlbmQgb2YgZmlsZSB1c2luZyBkaXJlY3QgaS9v
DQo+PiAgICAJICovDQo+Pg0KPj4gLQlkaW9fYXBwZW5kKGZpbGVuYW1lKTsNCj4+ICsJcmV0ID0g
ZGlvX2FwcGVuZChmaWxlbmFtZSk7DQo+Pg0KPj4gICAgCWZvciAoaSA9IDA7IGk8ICAgbnVtX2No
aWxkcmVuOyBpKyspIHsNCj4+ICAgIAkJa2lsbChwaWRbaV0sIFNJR1RFUk0pOw0KPj4gICAgCX0N
Cj4+IC0JcmV0dXJuIDA7DQo+PiArCXJldHVybiByZXQ7DQo+PiAgICB9DQoKLS0gCk1haWxpbmcg
bGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
