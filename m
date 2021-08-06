Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 285CA3E26BE
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 11:06:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 95D133CA396
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 11:06:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6ED1D3C7AE6
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 11:06:37 +0200 (CEST)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 48E821400138
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 11:06:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1628240795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xQmczkg4Oizf0gupQImN/ZVBWAr2dnpb+PG30K5geBM=;
 b=SBDkQqSVEKOGQnL/D/iPOzpnML8KI3kkA+uDs1nOzp5iyiP9hW2SKV/Ea5sHTRfJnici6K
 Aprf2YHS4LuzzlHlTfkGSC2j1nKupO3leqJ8T3KbZSekCtO7XOJyccPFsYXziCo85ON/v0
 o9dkzXhI7WK+C00+0e/y/3qJJuJoJjY=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-Fh_q_a5KNry3p5AA7Qgy5w-1; Fri, 06 Aug 2021 11:06:34 +0200
X-MC-Unique: Fh_q_a5KNry3p5AA7Qgy5w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzDC2ES8PkhWbyKOtJ5+8mrHZNAImpZMycZMBXMwkIaZNXjf0rVgTaxrC399CmaR6ay48lqVaXAw7/UUJ3tM3yvR6dap3f8c/A7/TwcjKHLNNAleAt+LgIEQ7/WTdcvX6BPcGq9oytyUmC3kx5C4AOi6yBxNORIG6Y/52iLuIkqoYsgNQ2QCruo2wDSmUpzg5gXuzTON6eFQkgChgqdb5IWoPMEattvMVpdr4oidsGZDpf/pckGhheCM/ucZuTJ/SPXtraJuj4LwckVxpS2EyTyEUir4BzHKNAWbZ3U65gxcVdSCReH8YX2lJK5mvXPwYFU+j/zatqZLObAOlVJF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQmczkg4Oizf0gupQImN/ZVBWAr2dnpb+PG30K5geBM=;
 b=cF9SarKR5wpRvbEyxGDg3mMGP1TimLPFTC/DrEc2rYbWctLMSS35nrjpLUNdTYsyIML1fftymuQinlOC7Y2AXZNW1Z1fobdQ4k8Y8jM2GShKtVXLZBAZzHKmWZjMcm4SVDBWM5Th1Res5IPuHQ+qRMV/Vt1WxIZJXmI2ChrRJZYYxozI0y5vemNvIZ+AWevmeHoP6Yw8wGKWqw2dFFDLhfJMUm/Q+auEC1YD4o3yEJ4s02Id4V8tt3YyDts/UwVFiHi0gbuKgjOi3rEXbz2ZaB+7EAc1Y4MD93BLNeCBHI4I0g4CLLzUuul3WD+41LY3x2PHg6Xyns7PR9byu91+EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from VI1PR04MB4958.eurprd04.prod.outlook.com (2603:10a6:803:60::23)
 by VI1PR04MB4063.eurprd04.prod.outlook.com (2603:10a6:803:43::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.23; Fri, 6 Aug
 2021 09:06:32 +0000
Received: from VI1PR04MB4958.eurprd04.prod.outlook.com
 ([fe80::24fb:2049:fc5f:fbed]) by VI1PR04MB4958.eurprd04.prod.outlook.com
 ([fe80::24fb:2049:fc5f:fbed%6]) with mapi id 15.20.4394.017; Fri, 6 Aug 2021
 09:06:32 +0000
To: Joerg Vehlow <lkml@jv-coder.de>, Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH v1] connectors/cn_pec: improve reliability
Thread-Index: AQHXigNTFnJRT5+geUyN05b9R3TKK6tmGu8AgAAHKQCAAAu2hA==
Date: Fri, 6 Aug 2021 09:06:32 +0000
Message-ID: <VI1PR04MB4958D95FE7A478B771C73A4493F39@VI1PR04MB4958.eurprd04.prod.outlook.com>
References: <20210805140806.3884-1-bogdan.lezhepekov@suse.com>
 <YQzpXHDvFmoaSFhi@pevik>,<bb73135b-4ee3-71c3-5442-bf39064b3534@jv-coder.de>
In-Reply-To: <bb73135b-4ee3-71c3-5442-bf39064b3534@jv-coder.de>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jv-coder.de; dkim=none (message not signed)
 header.d=none;jv-coder.de; dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d70dd2e8-91bc-4eab-5870-08d958b97c24
x-ms-traffictypediagnostic: VI1PR04MB4063:
x-microsoft-antispam-prvs: <VI1PR04MB40633E69719029A018DB79B793F39@VI1PR04MB4063.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +h4/jtmy79MgcEfCLNAUFrgVMjSTh9DeCXDPHjDI/dKi++HmTFCXVFDegacf5bLegb09zuLU33Doa31iUlriyAuJc55c5MPRvhrhHUK8ozImPcIG+qp7KUU60UG1/YhBn6VYB4juiZHTtSjbsUpSiHKT5XjMovSs0uG1SwLjZLWmZmSLQJFwuCf2gDFKUXfbA/ScyDhheoJDr3ckfy1KLy/9+yrza4MbheiAOjrrclsZNLMXsw1sOj50sNRK8o3p2TivZy91bTBMhG+pQ2UZ4+HU5M0XWLCPgZyb62mfpDUm8qau47guX9ELM6PTol7vri95JmlVbaeKU3LQ5SThTTnC3Atd5lOf14U6lP2Ezq+kDpx6ShoiKYBR4wiFaobixixp1Oe3VAHsKs3H0Q6Hp34RCslP53/itZEO9L0zow73iV6bAAUvCiTs6bpf9ltxwY/7f/mOteq/a3Bs1jSeeKfh8yxLenzJeNJU+FqFAz1KQrizwynOuYs91I3Cl7xs770jidkPy6BPyWspSXu1x0myPHjvlPOd/p0w0zsEog7Xtxyu93EUGQib9Oh3FHABfpSp9FaKOlBSz0Y6vr09B/BITm5jPso3HFiCaSCyjWI4AsHZ3jrtRp8Yf0d8z/AeEzZDxDZZpwmSoC+w/wYBx7NXhFqKd3rsUqKYsE+KoMjHT1Zj2xixIOi1ZJ2AStj8kTVonrfWga1/cZ+yz+/aEg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB4958.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(136003)(39850400004)(396003)(376002)(186003)(8676002)(26005)(8936002)(52536014)(33656002)(5660300002)(478600001)(4326008)(38100700002)(122000001)(53546011)(2906002)(9686003)(38070700005)(55016002)(6506007)(76116006)(71200400001)(83380400001)(44832011)(66476007)(66556008)(64756008)(66446008)(91956017)(19627405001)(66946007)(110136005)(7696005)(316002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RhsvJOTO7YxguchOLzRUophTDjfpFk4rSO0E5JX+c1cHSOeK1VKINDtg3GVx?=
 =?us-ascii?Q?Z8BJ2iteC05JvHo/+7OTfv3s3kgyRzI5lIxbNE7gnJci/RXdbI4fq5Bqntip?=
 =?us-ascii?Q?XKcBWpQOpEyqi3FRndMdW9PqKTuE7F3yZqdkZqGbMaAzdCGu3RbdTZJ2ytlX?=
 =?us-ascii?Q?NhyrK6S9ak2ANzP/7OhOvFFBfGKl7w+pifw0Vv+yPqPgfPMGRuXWEMWMWb0S?=
 =?us-ascii?Q?WjJ+9Zbpy5gUN6OD7xtzpjQ97YKovtFEltyS03TF68Pyq+J3AZkCJonZ0QL4?=
 =?us-ascii?Q?aPGCB0R5Jk8TbIFGCnNOmz1FCIgllrOOBhsJ0iDW5ftt/KsAhZ4eAVluZ2Il?=
 =?us-ascii?Q?hqCmSigMmzfOX6VvNswyqywC0DpkipeLhFVF2gIjP3ynX6cTq3km5rBYkKyU?=
 =?us-ascii?Q?NkIr4kw2dx7bz5zfim2W0dLMIwe3UAJEiOrfAaf0O6CeSzzHY3tim5w53C/m?=
 =?us-ascii?Q?ZAdpoeEilEiWOvC51z6T/4GFVeYpkG8MPSiiOVm8q7fjEwSnygYeL+LgjAl8?=
 =?us-ascii?Q?ZUzb5UjVt86ODZofhTPZ5ADFzgUSBIp0T8+gL1LuW5GCSJYNomwKeYfjblCM?=
 =?us-ascii?Q?FIvRgPRhs4xBV5IYQmCc7Or8qV28/c4m2m63MznhF361C/+2X19YsUDnfqb1?=
 =?us-ascii?Q?LEVHkG679TwD2MTmXL6q37ENeo457RDOijJOTcvTY9ljHL3wHokuJ5EHA5gF?=
 =?us-ascii?Q?wfYyXIQOIGcxvD2zal4NJp5cITKR+aHAVKMCZWn17aORxoXiTgs8h5L7LVFf?=
 =?us-ascii?Q?Ma72EXnxE2Wxpg7EVrT4mCFoff3R0+KbnkLQ2Hpd8bvZ2WJUCevyCqqEtdek?=
 =?us-ascii?Q?oJz6dV32LwmF9dnc58HQ5Q2WI7CBIRcDJuqCHApe363dAPBcpZgqcscHRQku?=
 =?us-ascii?Q?xBi+lfKKVere7E+mr1qndniIWdz/hX++8okAKyRPfNOtQg/xqDZOMXSR3EVs?=
 =?us-ascii?Q?P+reaIP4hPOYMaVU2gf+ZpVz8lv4IdPtOtYJ+sz344YPF9zpziC+QS9vaxHe?=
 =?us-ascii?Q?x1tV3tyvvq4ewOi+LncXsallVi+qhvC7ADDUm9ouMSVdlmzO8lsIOLm7uxae?=
 =?us-ascii?Q?1qFJw+kzI1PfmcsosOpqBFvDMDHEhBLPsm5z40V9H9hXLb3AQklvm9mmaHJM?=
 =?us-ascii?Q?4v/liE1/xLBgkr9gHfBrRMSR8wtkDy8U6oecYOQ38p80LLI8ibdgSSLR8c0P?=
 =?us-ascii?Q?VR40pwiIPh+y/oNvqFKKesTnyc/7lU432GLYzACPnr8R5+50G5hoNTLM5Bvo?=
 =?us-ascii?Q?pggLwIv39cWqn+5CNElDqyQEDpcjQCM3O3+v9xzax6OSeOmFa+5qJPZngT2n?=
 =?us-ascii?Q?H8M=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4958.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d70dd2e8-91bc-4eab-5870-08d958b97c24
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2021 09:06:32.3877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Br1rxRPdk++jWjcH56rkHTF9+SultfJkernRNGLIj49KHN0Y38FCGhoGMBkWLCGiQAOfYh5OxxwsvrJqgoIdMTDKey166zbu7g7sfbDr3kU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4063
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] connectors/cn_pec: improve reliability
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
From: Bogdan Lezhepekov via ltp <ltp@lists.linux.it>
Reply-To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0970783279=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0970783279==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB4958D95FE7A478B771C73A4493F39VI1PR04MB4958eurp_"

--_000_VI1PR04MB4958D95FE7A478B771C73A4493F39VI1PR04MB4958eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Joerg, Petr!

Thanks for reviewing and commenting! I don't have a strong opinion on how t=
he test flow should look like, but I can say this sleep definitely makes th=
e test much more reliable.

The results, we get on known to both of you SUSE Carwos, are pretty consist=
ent. My feeling is that 8/10 runs end up with some sporadic failures. The f=
act that extra sleep solves the problem obviously indicates a lack of synch=
ronization.

@Joerg: if you need more info about the environment, please reach out to me=
.

-Bogdan
________________________________
From: Joerg Vehlow <lkml@jv-coder.de>
Sent: Friday, August 6, 2021 11:14
To: Petr Vorel <pvorel@suse.cz>; Bogdan Lezhepekov <bogdan.lezhepekov@suse.=
com>
Cc: ltp@lists.linux.it <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v1] connectors/cn_pec: improve reliability

Hi Petr,

On 8/6/2021 9:48 AM, Petr Vorel wrote:
>
> If I understand the code correctly, pec_listener keeps receiving msg from=
 PEC
> until got signaled by kill. We generally try to avoid sleep in tests [1].
>
> @Joerg: I'm not sure if it's reasonable to add another signal handler in =
which
> pec_listener would print number of already handled requests (with write()=
 as
> printf() is not reentrant). Then we could loop for certain time before se=
nding INT.
>
The problem is, that it is hard to know, if all expected events were
received. pec_listener receives events from all processes.
The only way to reliably handle the issue without sleeping is tracking
exit-events in pec_listener and to tell it to die, once it received an
exit event from event_generator.
Only then we can be sure, that all events generated by the generator
(and hopefully all it's children) were received.

We could also get rid of the other sleep (after starting the listener
using some kind of synchronization (I guess right after
PROC_CN_MCAST_LISTEN should work). I think checkpoints are not part of
the new lib...

Joerg


--_000_VI1PR04MB4958D95FE7A478B771C73A4493F39VI1PR04MB4958eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Joerg, Petr!
<div><br>
</div>
<div>Thanks for reviewing and commenting! I don't have a strong opinion on =
how the test flow should look like, but I can say this sleep definitely mak=
es the test much more reliable.
</div>
<div><br>
</div>
<div>The results, we get on known to both of you SUSE Carwos, are pretty co=
nsistent. My feeling is that 8/10 runs end up with some sporadic failures.
<span class=3D"VIiyi" lang=3D"en"><span class=3D"JLqJ4b ChMk0b" data-langua=
ge-for-alternatives=3D"en" data-language-to-translate-into=3D"ru" data-phra=
se-index=3D"2"><span>The fact that extra sleep solves the problem obviously=
 indicates a lack of synchronization.</span></span></span>
</div>
<div><br>
</div>
@Joerg: if you need more info about the environment, please reach out to me=
.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
-Bogdan</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Joerg Vehlow &lt;lkml=
@jv-coder.de&gt;<br>
<b>Sent:</b> Friday, August 6, 2021 11:14<br>
<b>To:</b> Petr Vorel &lt;pvorel@suse.cz&gt;; Bogdan Lezhepekov &lt;bogdan.=
lezhepekov@suse.com&gt;<br>
<b>Cc:</b> ltp@lists.linux.it &lt;ltp@lists.linux.it&gt;<br>
<b>Subject:</b> Re: [LTP] [PATCH v1] connectors/cn_pec: improve reliability=
</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Petr,<br>
<br>
On 8/6/2021 9:48 AM, Petr Vorel wrote:<br>
&gt;<br>
&gt; If I understand the code correctly, pec_listener keeps receiving msg f=
rom PEC<br>
&gt; until got signaled by kill. We generally try to avoid sleep in tests [=
1].<br>
&gt;<br>
&gt; @Joerg: I'm not sure if it's reasonable to add another signal handler =
in which<br>
&gt; pec_listener would print number of already handled requests (with writ=
e() as<br>
&gt; printf() is not reentrant). Then we could loop for certain time before=
 sending INT.<br>
&gt;<br>
The problem is, that it is hard to know, if all expected events were <br>
received. pec_listener receives events from all processes.<br>
The only way to reliably handle the issue without sleeping is tracking <br>
exit-events in pec_listener and to tell it to die, once it received an <br>
exit event from event_generator.<br>
Only then we can be sure, that all events generated by the generator <br>
(and hopefully all it's children) were received.<br>
<br>
We could also get rid of the other sleep (after starting the listener <br>
using some kind of synchronization (I guess right after <br>
PROC_CN_MCAST_LISTEN should work). I think checkpoints are not part of <br>
the new lib...<br>
<br>
Joerg<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB4958D95FE7A478B771C73A4493F39VI1PR04MB4958eurp_--


--===============0970783279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0970783279==--

