Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE7B2D90F9
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Dec 2020 23:50:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99BA33C5E85
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Dec 2020 23:50:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 7A9D63C584A
 for <ltp@lists.linux.it>; Sun, 13 Dec 2020 23:50:12 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2127.outbound.protection.outlook.com [40.107.22.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 28C091000992
 for <ltp@lists.linux.it>; Sun, 13 Dec 2020 23:50:12 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHTFl9wZv/JQG7i5/6kedhmrEsJsDqsjcv3shlQH85yVmsUmR5cy13W3f/rCHVpZeECPF6Dox5sJQ5Bgthl8iPvwVgzkXejxsLSKrt2iC66NA+dUeOq/tLQ+0Y62F1Aw/AZGi/Q0UroX5OJNitnQhjoDpc0IQYTcAjKXIaWgBZZeFkzmPwBaIFN3F2mOErQdJuQggLBkTMB8/nYTxTHsGMc/lmib9xcFErYTeiPMaWHKBgKwPrtjN1I9wAPoaAeXv+l9lLZR9BQso0j5Qwvy+hntJx/du5ar43/9Nmxickwn0pkPHH0KU4wNia6gKs0+zZap+axQ8LWm9Oqc/3kFqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ik8jtbV6ff54dpxYVhCI8sIEX1ELreBdBrivWEZRPr4=;
 b=DtZfNMficI5BHeqj8+9nAcXTTSlIxS6UejELkSdqmNRKbO13VI8EHDWPxPzDZgaulgUY7R97cNAklRVIt/U2sERvkqvFJRC4lvTLmvW/6SGsRFBzInXKsFfoqINbNz5Y6DP/rp6LIbBvelYCPhS1KCOHzSKJPCLU6d+/TKfTDE2sIgb9Fsfy26ptAGhCsyoeN3s5RdDLCGretf6FxBXr/9Ds1RLgnX5ogPvpU/RNLZHIBeyQtuEtDPwgi7w95os+2r9IV83VgGgsKREYY3MQ3OMGvvfusKk32n/exL1oKUFs7fSb0nHEK6BLTkhMAx2DmBNXuYihzhrlMqhNsH9iNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ik8jtbV6ff54dpxYVhCI8sIEX1ELreBdBrivWEZRPr4=;
 b=NuFz6oEnXq1/ccaL/x5EBWSfQXkoW8U8y9zPOoPeqql+wYfFKmUGDQLrFQgS950aiRPdjFzAbJVCC98/XXjqv3CC3fwkufgZcfHF42XxYlhZvyLYwoSJDvKDBN/OdXU3bMOisK62sikUK/AoMC/OeI/Zx7MmjeAzbhdPqJ4pmNQ=
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com (2603:10a6:20b:d1::19)
 by AS8PR03MB7496.eurprd03.prod.outlook.com (2603:10a6:20b:2b5::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.18; Sun, 13 Dec
 2020 22:50:11 +0000
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::d897:6156:b3c7:114a]) by AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::d897:6156:b3c7:114a%4]) with mapi id 15.20.3654.024; Sun, 13 Dec 2020
 22:50:11 +0000
From: Filip Bozuta <Filip.Bozuta@syrmia.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH v4 1/1] syscalls/{send|recv}mmsg: add a test case
 for timeout and errno test
Thread-Index: AQHWj2VGFYN6ao0V5USNGbB77mam8Kl0sIAAgH3R9oCAA6LJHQ==
Date: Sun, 13 Dec 2020 22:50:11 +0000
Message-ID: <AM6PR03MB52339D881505195B709E241FEBC80@AM6PR03MB5233.eurprd03.prod.outlook.com>
References: <20200920154633.27255-1-Filip.Bozuta@syrmia.com>
 <20200920154633.27255-2-Filip.Bozuta@syrmia.com>
 <20200922135244.GA4167@yuki.lan>,<X9ONWQwAt8ZXqkms@yuki.lan>
In-Reply-To: <X9ONWQwAt8ZXqkms@yuki.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=syrmia.com;
x-originating-ip: [62.240.24.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2fa31f30-fee6-4b24-15ca-08d89fb97284
x-ms-traffictypediagnostic: AS8PR03MB7496:
x-microsoft-antispam-prvs: <AS8PR03MB7496C7239559D441EDF6024CEBC80@AS8PR03MB7496.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:161;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DbHKPvWGQ+zwL3gp9AfARS/5TPvo6holSnoS2uSRRGPXqI+Z/I/CnEc6VAZJIJJRlZMN8Sv0BjX0RDs+PX/0aeZYdJZwV3YBxE+sRClWoj4rgSMl+2Dsp5Ijrn9osOQbPI83wHlMdFg0xrLJmea8Rlz0DlgJoLqiqRIEdXVr/9eiHe7uEHtCQuqQdsVo06YXAKx4BoMRJz87WxYZ247VeJeKIy3vQvbEml+P1Dlyn4D0UPuwqapLXAEmoTYTc2AkVdy9wC+wHVZXCTQflGWV6z1sQcEsgprofS2sa/WsMCSgNGnYKLlZKeR7kywWlO5pu5LM8zveCOcOpqpNF+iLKxi7ZfA3VShBLcv/Yc7x8Cn47qTNrddVLkjuUNs/wpC6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB5233.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(396003)(346002)(39830400003)(136003)(4326008)(26005)(55016002)(186003)(52536014)(33656002)(6916009)(19627405001)(53546011)(71200400001)(4744005)(316002)(86362001)(7696005)(9686003)(66476007)(66946007)(2906002)(478600001)(64756008)(66556008)(66446008)(5660300002)(8936002)(6506007)(76116006)(91956017)(8676002)(554374003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?+sox7U7xiHQJYVKYPYAJNBFjKfqSJkjeKAxJeGh5mNu3ggnZnAGY7mgA5xu5?=
 =?us-ascii?Q?KUHUkAhy67OKHgGxfYjlNC5fbY+BrngIlxAclPk8E77D2kmn+sKqjfML/VvM?=
 =?us-ascii?Q?5Fw7tPfgxbfbT/eYfF+S5Zc5qyN8yH8hcm/GqOaRWqLZbFg4iQbtvvMyZpYF?=
 =?us-ascii?Q?y/IqPdBetUpBBSd1EYO2BC1ZCkXx1TxbNrMU67aY7JiCL8KWVbHva+hPEEu8?=
 =?us-ascii?Q?CBsQv3oVKCRX7qY4iAMqZvgvGDMXjEBJWpw3Gqems6vgPLDU0AV+vx95lFnd?=
 =?us-ascii?Q?D3hMA+CFecxvfNxxHCn6h2Yf+qI/QGFFS7Rlr9kTLnNOnjpdlh+yqOiszUB8?=
 =?us-ascii?Q?Of+nHj/r6VgjTSacHh7a8aMG0y+M0lXrm5zrnpXPK7nXAR6LgKU4B4ve3SJ/?=
 =?us-ascii?Q?oxZf6rO8w0cpiVvoTgV0HPdIPFQPHBM+ZzJEetorpXWt3wZXoH3lOtEeZ56X?=
 =?us-ascii?Q?JFiqLzfsyqzcVeQedMwsPT9DnKWGL2LfPRTpv7jzoogvgI0BMKKrxuZGU25n?=
 =?us-ascii?Q?4bD/JJlUpTeyJeMe441NekyHkhZZ8pRxmns89Qtd9OUbTEK6BJ5Ebs076lim?=
 =?us-ascii?Q?Lv7PYpumffuePD9EB14WmgRqTCLldRK9eAmgvM/+D5sBhc7IT4PB+9tgXHZi?=
 =?us-ascii?Q?NN7kAmrt8w4aLgT9gKeoSyC9JxUjeA7IgnirVCyUNgcVc4SfqEVF1FQA6lH7?=
 =?us-ascii?Q?5U6GsIcKUJM4az0+jg8A9DjrhJk84dPkW0ysDsrNILDv+M3vztnlOgA9oBbe?=
 =?us-ascii?Q?0lJdEmjTwpaWRe6m0zI2Fhx35Pum07TP3TCrpJ4bRb4tC/IjKm3kwlrsBe2S?=
 =?us-ascii?Q?Ro2eZ2uu2lou3OQpKsen3YyOhSdICk68zqXsVOSAD9Pr1W/1cMf+XfdqbsCz?=
 =?us-ascii?Q?P/WGElhVNoVfzf3hfzGZ97pKM/38w38sEB2RxAdqbgjUnFRRx8iSU83h2bRm?=
 =?us-ascii?Q?CUkb9VGSWDxqRDdzcA2cSSqv3bipH1vY30V13x/WN0I=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB5233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa31f30-fee6-4b24-15ca-08d89fb97284
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2020 22:50:11.1140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SY/inYuu/Y1uwmME1eK1h1g3IdRJVECZSI/TZSCWyF+h5WSxfznRggxELhzzH0cb1Gu6R5BB061fIZ7w2C0cSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7496
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/1] syscalls/{send|recv}mmsg: add a test case
 for timeout and errno test
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
Content-Type: multipart/mixed; boundary="===============1575735199=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1575735199==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM6PR03MB52339D881505195B709E241FEBC80AM6PR03MB5233eurp_"

--_000_AM6PR03MB52339D881505195B709E241FEBC80AM6PR03MB5233eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I had some obligations and I forgot to work on this patch.

I sent a modified v5 of this patch and these modifications include:

    * compilation error fix in 'recvmmsg01.c'
    * a specific test setup for every test
    * removed the useless 'retval' variable in 'recvmmsg01.c'

Sorry about the compilation error in 'revmmsg01.c'. I forgot to commit the =
change before sending my patch in v4.

Best regards,
Filip
________________________________
From: Cyril Hrubis <chrubis@suse.cz>
Sent: Friday, December 11, 2020 4:16 PM
To: Filip Bozuta <Filip.Bozuta@syrmia.com>
Cc: ltp@lists.linux.it <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v4 1/1] syscalls/{send|recv}mmsg: add a test case=
 for timeout and errno test

Hi!
Ping. Are you planning on finishing these?

--
Cyril Hrubis
chrubis@suse.cz

--_000_AM6PR03MB52339D881505195B709E241FEBC80AM6PR03MB5233eurp_
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
Hello,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I had some obligations and I forgot to work on this patch.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I sent a modified v5 of this patch and these modifications include:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp;&nbsp;&nbsp; * compilation error fix in 'recvmmsg01.c'</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp;&nbsp;&nbsp; * a specific test setup for every test</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp;&nbsp;&nbsp; * removed the useless 'retval' variable in 'recvmmsg01.c=
'</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Sorry about the compilation error in 'revmmsg01.c'. I forgot to commit the =
change before sending my patch in v4.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Filip<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Cyril Hrubis &lt;chru=
bis@suse.cz&gt;<br>
<b>Sent:</b> Friday, December 11, 2020 4:16 PM<br>
<b>To:</b> Filip Bozuta &lt;Filip.Bozuta@syrmia.com&gt;<br>
<b>Cc:</b> ltp@lists.linux.it &lt;ltp@lists.linux.it&gt;<br>
<b>Subject:</b> Re: [LTP] [PATCH v4 1/1] syscalls/{send|recv}mmsg: add a te=
st case for timeout and errno test</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi!<br>
Ping. Are you planning on finishing these?<br>
<br>
-- <br>
Cyril Hrubis<br>
chrubis@suse.cz<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM6PR03MB52339D881505195B709E241FEBC80AM6PR03MB5233eurp_--

--===============1575735199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1575735199==--
