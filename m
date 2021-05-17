Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CCF382586
	for <lists+linux-ltp@lfdr.de>; Mon, 17 May 2021 09:41:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E94DF3C60A5
	for <lists+linux-ltp@lfdr.de>; Mon, 17 May 2021 09:41:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DE1EB3C26AA
 for <ltp@lists.linux.it>; Mon, 17 May 2021 09:41:25 +0200 (CEST)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380102.outbound.protection.outlook.com [40.107.138.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9A92060080D
 for <ltp@lists.linux.it>; Mon, 17 May 2021 09:41:24 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tnlnlhq4A2eO/79PSHcEZWZTb+yyCwWo/H6rq29/ij6zQwIiIOc3pYMzOoNo922z1+sbjFu8sjD2H7vQX1KJr513Bir5idaO1oHc/cBWEBEZUuqR0uYoa75eWZIrWIsN35gxQMyKILcrC8bwVhAOyoyd85js0tG9GHkeGZTP6Y9rPMd11Uwpw4vdCL8F8NviASiDuBlqFUNHvfE5k8CBVVx9D1DT8+GoE4SxzRDbyanf7ABpEIZ9rDPr+xhKbMTE25R7a5aGp7VbdtL02igvkDlK8lHwxRZkhh/0Q+Ye2lWJTi8eyk3HolI91HjV+1rfocfxLVs5RPyIfSYSG0/SPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+5mWFI+NsI/ksbSRHMX9jTVHm36LTLTq7JfEhi7vRw=;
 b=H2V2VHd+cIp2zWl3AWfa5p5u9gcnYpFQT/fCLob+2JO9JkBWcaMAshQGDeCpI0m9Ebe0Uf6lkyGUBDUtJ8iVCgM6Y9hy9mxRC4rTyMWM5jTmMqD1tP+NStjvEvlp/6G8B8unLESeaR7Tsxk2qZSINO83J4oQGT/E7dgF4snIJ9qoQll9U1xm8i26hYrhQksWtBwy1pbUO+GAE/cJV8pwJPpIbZLC7Gfu16f7sEjEYzoK+EEL0dyRxrvCM9/Zf3oEW29AzWr68q+me2RvhwdEi4Pe5WyrxlBp3vFa/nFn4+BOuqxtfZCYZua459TYtfOhn6KKgahkcpbrh/HanDbFLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+5mWFI+NsI/ksbSRHMX9jTVHm36LTLTq7JfEhi7vRw=;
 b=bcVFkDxSi/2FnC07CF2bx7HCz3FaexCmV9BYO7Kqj2cZ5uS2ETPtuu4a7o7b+kJ8qiyTrq18iOGauI9jv5T7bU0jj2Ovj91R5fHWjx31xAQgvD6da4hMqo2lO6L/k0rMb5NMaS6tGqG1aCybmXJWzelDzmSLpR+tQ6i1uKE3nfo=
Received: from BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2f::22)
 by BMXPR01MB2774.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:38::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 07:41:20 +0000
Received: from BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bd48:bcd1:78ce:125b]) by BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bd48:bcd1:78ce:125b%3]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 07:41:20 +0000
From: "Pankaj  Vinodrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] LTP msgstress03, msgstress04 failure on linux 5.10.19 and
 5.10.22
Thread-Index: AQHXLFXnprJft4mvqE6Igyuj8pAZiaqqWgaAgAACGtyAAA7pAIAACPhmgAZRTgCANrxQUw==
Date: Mon, 17 May 2021 07:41:20 +0000
Message-ID: <BMXPR01MB2870B48DB06939CF5F7FF3FCEE2D9@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
References: <BMXPR01MB287023E7E5B34F6D27B63564EE7E9@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
 <60619D5B.6090507@fujitsu.com>
 <BMXPR01MB2870D0447A89D1BEE08EDCA7EE7E9@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
 <BM1PR01MB2868C0458678E57C87BBC708EE749@BM1PR01MB2868.INDPRD01.PROD.OUTLOOK.COM>
 <YG7Mbc/ZTnD85SAh@yuki>
 <BM1PR01MB28686329F64867227F9F9279EE749@BM1PR01MB2868.INDPRD01.PROD.OUTLOOK.COM>
 <YG7asu6B4EEa1HUD@yuki>
 <BM1PR01MB2868EDABC10031EC53337C1FEE749@BM1PR01MB2868.INDPRD01.PROD.OUTLOOK.COM>,
 <YHQu6l0xp8VmG+ry@yuki>
In-Reply-To: <YHQu6l0xp8VmG+ry@yuki>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=exaleapsemi.com;
x-originating-ip: [2409:4042:e1d:d178:e5a7:74eb:d6d5:973c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5160d2ff-81d1-4a5d-a546-08d919072976
x-ms-traffictypediagnostic: BMXPR01MB2774:
x-microsoft-antispam-prvs: <BMXPR01MB2774EEBD1A7AB091BA959EE1EE2D9@BMXPR01MB2774.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7OOM/Fo9wJH37WrnkLXQGdOgvG9IiRfMjVt46RKR/+uiPoHl2vI41bSKGy7wY47KQuxaSLg92SO1lbalqXPAZACZWtCWEHX/IEhRAqjF4l8SiRBoTJ8SXqpnWSPozgsfyiKLX6qoftsO0I1Q2OPThpM735PumFJ6KDtkOoeKuhOf2yiZ5Qke8wDGR8do5Wq4sUeuqd8mJjnUY2npMjjCme7G5fwslWlV2wIpsNEs0FGnnK7Akm06CGMSBJqZ0QokBakoQVUAKMirJ+g+A/g0o5U2Z8EZUHCcDngrllvsnCPLriWIrLnNjR1z9KShpZz9u89jOJiuOq+VhNbW5aSJel0kDDvOuvt90AZMaWr4v5j7pvHBkBQ/q7lPzaLREi649wmAaKk2lkR42HsFSA6/BmQ0v/NhQZGojImpEvqfjfZAB5BkSI4LuDPjzqSMG96Y3YziA7g36GYPQfmHpGBfJMWa9AILlNa+9g2R1Hs4yqBCHhnfJQhC//P7BxNUgf2EOulV0J0u8LdpF6lG2obkuX1rYTKWyIbHz29dCatt1Els1aIHl9QD+xvztxvXgchKEfGKFMIzi6SVUiBxrrr5VptbQyHMXVTU7oNSWQv3L3E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(39830400003)(376002)(136003)(346002)(396003)(366004)(38100700002)(53546011)(71200400001)(19627405001)(122000001)(52536014)(86362001)(6506007)(6916009)(76116006)(66556008)(8936002)(2906002)(83380400001)(8676002)(316002)(66946007)(186003)(9686003)(64756008)(7696005)(66446008)(478600001)(55016002)(66476007)(4326008)(91956017)(5660300002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?N9RQCZ6R4WWe+DxnkrNvxI6PAdejLHUUHUf6hee9YM2R5c2KH/9omLS7sr0B?=
 =?us-ascii?Q?wP8QeLqLl94oW3Gw4QuVpxRa+pKJz14XUVocmtXEdw58E6haNQsHt0cPZKZV?=
 =?us-ascii?Q?t8fnI/Jd2LqZBadAqOUaGDfvW+7HhPGqBHpvXKBmlSDdrJ3MGVQAqeiP4eQm?=
 =?us-ascii?Q?C3wJsOAtmqcOLL+076JxYybE8ihgEVAk5bBUZCBlqk4GC83vqM8IbF6GrtPH?=
 =?us-ascii?Q?SxhHsPt6LC6Rk5fOzhWr5UpTsNjDU3C6HFQ4qfwrnPQbCGjtc+QoQEuLjqlW?=
 =?us-ascii?Q?1Zo1QkFCVoMZ7NgB32gcyvgT6vmiOeoktsD/+GbKLgi6fXy+9B0t/1+vdZ+1?=
 =?us-ascii?Q?Iz4R1m3qBWqNjhFCaoKCiUqNtUSuWbTe3WWhHVUa2ZWQTjlHjZ/RGgEH0yj6?=
 =?us-ascii?Q?vwewlkXfVHxgB4bB8HP1EaHwVwqQhN/0kFI2PX3xnFNYWUtWKv3WcJH9r3gF?=
 =?us-ascii?Q?st4igKbe/EGwGc6Qe1dOiOd2YuKHF6qu/NA2RwW9mGTCfFYq6ZxftqvZ0k79?=
 =?us-ascii?Q?exwTVJc2eLOzE9T6VkQIdQCqrUiO9VrLcLXik6rT2SovUhmK8k9J0OUkT7nL?=
 =?us-ascii?Q?GRprHAmfK7QpZJCqR9FeTvjtZTC2hMUCDvGs9pTxi2114PE0R1SvnQsww2oj?=
 =?us-ascii?Q?ESMnKvKvNVXdTzwrqL+zNf/E87FdjS9Rj/DqNZjITkwECpEj5OOzJFI1zKuI?=
 =?us-ascii?Q?PeZxp/TjL8U6vv5XT6akjTLr6iXmZr4xzFuShJgwFk71Ws/Q2Qv25bAX4o+0?=
 =?us-ascii?Q?PmCvQ4k9aVRYW+t5s5nqCCsuJ++5M99QS5gDWzMl12VxyV32QBi5DMNMPeM5?=
 =?us-ascii?Q?wV74EdQPorZr/KuzprQ+ewiVjf7Z2Hqxo5lDJMjgueL1v7uN2fCIslAibc3n?=
 =?us-ascii?Q?wlUgJgq5feBq6xNb/ueMff2AdrAgUUpgmc8b1iiz7zt3sJbsaqcYEBHvV/OM?=
 =?us-ascii?Q?sZUeeOdW5JHo4IvcDJ8aTUk/UUbsJakeRf6mEYVQuNmphWsp2cBgL2o3SYG7?=
 =?us-ascii?Q?6qxNxixVLCFE9JNSJl6U7RG3bEL2vw2eItMUxWnaXz5yym5V7XJhvZ8BEYg+?=
 =?us-ascii?Q?5730HKoqlu/F85SvLbSPzMcDu+/MT2OmzRQlDmBwUPsg+mDS74mds86eYmUU?=
 =?us-ascii?Q?mMbbUd4lFpT/UJ03YexmyyNA1fHh837G+M5JrbH64tNBtGliwiC60zV3bSuM?=
 =?us-ascii?Q?VaHVwoGqxKT+2cO4DUuzl9+X4tQ1meDZ5nK05jGowgG8Zw4fKOwE2QsuJa6E?=
 =?us-ascii?Q?LQ1ucxMb1Kd+kIAzfBG+/DpQTdTYFBuOom/nCCjA1DewlYGDgNAdBakdE9Gr?=
 =?us-ascii?Q?yiY2kRh7qWG2vkisSYY5HYZiy65n4gk65hGX1Jo9SotOt5w8ncWZTzS7h+MB?=
 =?us-ascii?Q?tJNqXPNtxrcRKu+sI3LWbvXjEFAc?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5160d2ff-81d1-4a5d-a546-08d919072976
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2021 07:41:20.0153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OtlWWnR1ja04eiiAIdFc5vB1llkXSg1v+Qd6a273bJL+Efpi0/l4mGywiPKdIrt/K9mrkXSIbQTqREFY+SICwIZXYYLIzIawI0csZwl0ZXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2774
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] LTP msgstress03,
 msgstress04 failure on linux 5.10.19 and 5.10.22
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
Content-Type: multipart/mixed; boundary="===============1385854416=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1385854416==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB2870B48DB06939CF5F7FF3FCEE2D9BMXPR01MB2870INDP_"

--_000_BMXPR01MB2870B48DB06939CF5F7FF3FCEE2D9BMXPR01MB2870INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Cyril,

With value of msgmni 8000 it worked well for me but i want to understand wh=
ich part from the log (produced by strace or some other method) i should be=
 focused on to get to know ohkk it is failure because of value of msgmni is=
 more.
How you analyzed and helped me to fix ,what approach you have followed ?

Thanks
________________________________
From: Cyril Hrubis <chrubis@suse.cz>
Sent: Monday, April 12, 2021 4:58 PM
To: Pankaj Vinodrao Joshi <Pankaj.VJ@exaleapsemi.com>
Cc: ltp@lists.linux.it <ltp@lists.linux.it>
Subject: Re: [LTP] LTP msgstress03, msgstress04 failure on linux 5.10.19 an=
d 5.10.22

Hi!
> Thanks for your response and help for understanding the reason of testcas=
e failure
> I too running the test on the machine with 8GB of RAM and the value for t=
he msgmmni is 32000 by default and i have changed 16000 then also i am not =
able to see any diff in output.
>
> Anything else that i can try ??

Try with less, I suppose 8000 should work fine.

If estimating how many processes we can run was easy the test would have
been fixed a long time ago.

--
Cyril Hrubis
chrubis@suse.cz
[EXT]

--_000_BMXPR01MB2870B48DB06939CF5F7FF3FCEE2D9BMXPR01MB2870INDP_
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
Hi Cyril,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
With value of msgmni 8000 it worked well for me but i want to understand wh=
ich part from the log (produced by strace or some other method) i should be=
 focused on to get to know ohkk it is failure because of value of msgmni is=
 more.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
How you analyzed and helped me to fix ,what approach you have followed ?</d=
iv>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Cyril Hrubis &lt;chru=
bis@suse.cz&gt;<br>
<b>Sent:</b> Monday, April 12, 2021 4:58 PM<br>
<b>To:</b> Pankaj Vinodrao Joshi &lt;Pankaj.VJ@exaleapsemi.com&gt;<br>
<b>Cc:</b> ltp@lists.linux.it &lt;ltp@lists.linux.it&gt;<br>
<b>Subject:</b> Re: [LTP] LTP msgstress03, msgstress04 failure on linux 5.1=
0.19 and 5.10.22</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi!<br>
&gt; Thanks for your response and help for understanding the reason of test=
case failure<br>
&gt; I too running the test on the machine with 8GB of RAM and the value fo=
r the msgmmni is 32000 by default and i have changed 16000 then also i am n=
ot able to see any diff in output.<br>
&gt;<br>
&gt; Anything else that i can try ??<br>
<br>
Try with less, I suppose 8000 should work fine.<br>
<br>
If estimating how many processes we can run was easy the test would have<br=
>
been fixed a long time ago.<br>
<br>
--<br>
Cyril Hrubis<br>
chrubis@suse.cz<br>
[EXT]<br>
</div>
</span></font></div>
</body>
</html>

--_000_BMXPR01MB2870B48DB06939CF5F7FF3FCEE2D9BMXPR01MB2870INDP_--

--===============1385854416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1385854416==--
