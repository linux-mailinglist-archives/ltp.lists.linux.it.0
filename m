Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B3A3E0419
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 17:24:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6691E3C80BC
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 17:24:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CC73A3C57C1
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 17:24:54 +0200 (CEST)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2E91B200D3D
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 17:24:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1628090693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ayA9mzVByGgyXs3Vq/I4XEGXTjwAeq4yeWI/az3ng6E=;
 b=iyAK9ffc0eCuLwnDm7/A41gISJmFbP4svlgeRoRdxvMAxc/synguiaN1j36UQyea8ZUVQG
 WqoGEeHXfm5RHBRzM1WXogGOamuQ9WWrVuEALcT24zY9KXl85xElZDcUb+wntGsCyWuhEb
 85Kq76nElE32DqT+yAtdYReNBYnDt/M=
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2054.outbound.protection.outlook.com [104.47.0.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-mhsreZ1pP8eOXZDZP2BXPQ-1; Wed, 04 Aug 2021 17:24:52 +0200
X-MC-Unique: mhsreZ1pP8eOXZDZP2BXPQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hj305bQs0OPX4ZaB5/vNiEo97K5so5Ojdvyjhj5qBGm75v0QrwtH16F8iBoK/RMKRB30B2wtnADrwg7eXulpVWKxvVAZi4aBG0PjFCWUBEkB1PLzkobBt2okqCvXxCWJY7ErgqNfIBtq7jebsgi3YP4tTfB4b3Cx4IsZZ1y7EQNS1p0bo2ZWU89uCsoyghhOeo0enUvaKU0BtfV6+LMoW+s9+FV+x6KpiMVibi7MjkwUzkXyZNTDrUk3rJ/L64aNREvPNB6beCDoLhRNcRH2h0hCcEu45gyc1y1cakLfpG0tp1+QySYBHgyDfog8rI9GAXzEiKQfg/4iRH9cbpIk+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayA9mzVByGgyXs3Vq/I4XEGXTjwAeq4yeWI/az3ng6E=;
 b=VtnTkNq5M2jZ08qExtaVtTbI+RBtbQWh8gdkiT6IhEs4wPzpEKK5/PrNf8VaafPt6Yghtgc3bZdpBusZ8xHa++THnr1XTbh9tS9mDw5EIOxvcNP+U8k4XiNsdLRhFHWgHyf4sShDyMuDRfHMN5A/cuYxvefmQqoas1aKTsdick6ovIH2TQL6ZPyJeBXg+BFl9zTeXpfjjhL40Wt1a1Bfj/BMgDYtEDYAYl3Q10qHWrC07jKg3A9X4GpZorhsjC8SHCNn0zYDXuGc5/Jf3qCFNUbH02dTlbKkuLn3VSw4AM5fHFJiucqWDazwC+6tWKy7nZXzDpS4tgskKPFrJlvzmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from VI1PR04MB4958.eurprd04.prod.outlook.com (2603:10a6:803:60::23)
 by VI1PR0401MB2382.eurprd04.prod.outlook.com (2603:10a6:800:23::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 15:24:51 +0000
Received: from VI1PR04MB4958.eurprd04.prod.outlook.com
 ([fe80::318d:5853:c054:1d16]) by VI1PR04MB4958.eurprd04.prod.outlook.com
 ([fe80::318d:5853:c054:1d16%3]) with mapi id 15.20.4373.027; Wed, 4 Aug 2021
 15:24:51 +0000
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH v3] shmget02: check if CONFIG_HUGETLBFS enabled in
 kernel
Thread-Index: AQHXiRShsVEjN45N3U2rp7cyy9nl36tjauIAgAAMdr4=
Date: Wed, 4 Aug 2021 15:24:51 +0000
Message-ID: <VI1PR04MB495841C26CD4F6E1D756515993F19@VI1PR04MB4958.eurprd04.prod.outlook.com>
References: <20210804093918.1087-1-bogdan.lezhepekov@suse.com>,
 <YQqmnkRd/AWgQthp@yuki>
In-Reply-To: <YQqmnkRd/AWgQthp@yuki>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03f23ae2-8b7f-4d30-d056-08d9575c00df
x-ms-traffictypediagnostic: VI1PR0401MB2382:
x-microsoft-antispam-prvs: <VI1PR0401MB2382D6FF32D90D5C56390EFA93F19@VI1PR0401MB2382.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4UHvV2kx6WGV0DrJaqOPtr31JpIHzuo68DvuLlTvxGzL6Ps7vv1bYU+wC2F8J6fM4qq25+ibtcSfwQi4CoFGeAMi2vQeP0wwjAECrvufJzp+kF/1OozM4F4TFfQ/R267KfZOv2e4FlpV3SWWIDvgnpRzxc3HuWPv0WRBA/6QjHrOSYVDc2QY88Bv+U/LQI2RPTHNRuxe3JnxKHIeBhHKWFeMEdpgBJNFFwmzBC+lJPBwsaLiUvNOWvMQy5PbwlM0dJkD4cLwSkEIi2mv6K3pFMgZfiNTJVlegqw9yNCafIBxZfJ5f4/WFM0wK0hDcaHFsAhKTRDSuxucEQrmfJ9RKNM0zCdFdC3OHBE6QfEEvF4zWF0VBDauF67qFD2uqIy6ksFCDIZ86UyZ1/NZA9d5bRdmDGMdgb7m/OPF7XcjCYH5PBPOvk3YVgrmTVPAKqW4CujFCYOakSr0CFdUl/JkuRa17oAb/GAmtBntNsV7U9Gtq3K5kv5hYdoI4s5PoeEnISZRPpJrDL9H49rgzeer49cRMaw5UIljnPgQqjZm2p4vpvW44WsJre9oj9OyClhRDpgSprefiCioYE/jBzcqzmZSLjb76A7aO4DAS2nKhppO+17uUzKV/M/M1Au8YnBG5uJnsitGvrZhQsO8Bhq3oOlIWDAKc+MsXWO38imBzSPbA9RwY1kd/Y5ofOUA88tpHPJcJjg4pk3zBjtI+sCNKQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB4958.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(136003)(366004)(39860400002)(346002)(55016002)(86362001)(478600001)(4326008)(6506007)(53546011)(6916009)(316002)(38070700005)(83380400001)(2906002)(52536014)(91956017)(186003)(66476007)(19627405001)(9686003)(76116006)(66556008)(33656002)(8936002)(5660300002)(66446008)(26005)(122000001)(8676002)(66946007)(38100700002)(71200400001)(7696005)(44832011)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JSWD42k7J5I9V0b1Z5pkKpOEd8A4XaXT9rFjIVVAJG4Hsc8VDaoi2fU73OSO?=
 =?us-ascii?Q?dCSYBcaiar4MRlvVjvIvc4GwWAJh0fc0UP1ZXs7gp0RNEEIfPh5if4DtVFpf?=
 =?us-ascii?Q?e6AYF9QtQ85UVXp9lNF6OpXhWLPx5V96Y3Pr33ysJs4GSlDNNq9Jz54d20jZ?=
 =?us-ascii?Q?3n01Ew07rac7x1czyhb7lDiaQExLcxK/5AlXX5KJpbp+V72+4lpGh++2hfCY?=
 =?us-ascii?Q?CQvZYjSZd54/6Y6RmTpAMIikIxHh7TUxRW1SAx8QbH1cyBvQnedCI1An+Ebv?=
 =?us-ascii?Q?DyIISNqG43/KtEy7kXLixh3Rg8+dqeRBp+TZ+MuUMC/c5rcyvFYS/7GAtZ5z?=
 =?us-ascii?Q?65+3lNhkuh3OwuZ1KQ+8DMSObDe3Cx2zUpoxglT3JkPiXh710L+QdrzQRX50?=
 =?us-ascii?Q?Vw8woeDnJklIRijcPYpsohmhuusHoSQR6y13UrjvQUb6uSxAz4UsQ+D6JUsU?=
 =?us-ascii?Q?LMcI4XCjUsSuVYcQE9Limpdx+dkcsFpgWebpLR5tXlzUPo0U0+CC6XpKrupq?=
 =?us-ascii?Q?Aa72KkPHYWGAY+QWnKE8YVa0YKdm7o4qkqrJ9n1JZ3iyV6fIXp2/Av4Itv1A?=
 =?us-ascii?Q?0keqUyxPCQDwt+476IMnKALruFhqLNX6Cgm3pR6v+uvkvubVDH33pJ8EBxku?=
 =?us-ascii?Q?fyivxjgKC60s9rXczsKvWI5CXBe7QXgmoeZKGXTsaAoD6DyX5QCZGduIfkMZ?=
 =?us-ascii?Q?6BYb09X8nqc5bMr2MOZFQcBXiLutHVZyLblAIdl5DEIZakj2W69e2zna9+nU?=
 =?us-ascii?Q?aYS6AtkAucTQispDJycu8lh3qsXGmXL8Z/b6+zl9Z/6yhjc/rGzzmpitkz4M?=
 =?us-ascii?Q?cR/BSttaqwqnDWxNY7OLf3S8YJol4qKPh5IxA2EOhhjwBnpehnB57U+HJGdT?=
 =?us-ascii?Q?4NxFMLQdSfmcmk/u6rqZeWfg1TGzFpY28q9Sz+LeU3q7DMVPvd+mOsV8pmNn?=
 =?us-ascii?Q?FKlryUBRBYqYTuSzKBy+LWE0w6MjLQgXQuvG6/Ef+z1ljTqVzEozWEOxQslB?=
 =?us-ascii?Q?nCkjsrBv1MvkvTbqwgRKpXej1Lt/Kouy8gF7NqIEA1MP2H+rM1jirPvHJ/J6?=
 =?us-ascii?Q?GWceAoGyA9XsZwxSyzIF+mZFTvABi8CLb6o/vw8VTqnfC0MyF8loG+HcaCsR?=
 =?us-ascii?Q?+BX7BOjwI0ufRTqsHk+eEqMsc2/mdzIRUBXVq81PRuOJwYt4RweX1Ia3jBdU?=
 =?us-ascii?Q?x97kPVeNWcPWlYlrG2Fr0hPjZYAQWzuqSFsJJ9smUjPHLhndYKCLR3U4TyoX?=
 =?us-ascii?Q?RVkpIeH6Wg4Seg1KbrRkpPiZyHIx0fir4QCy9m8FA84Suq/r+RUH66CjS7TU?=
 =?us-ascii?Q?CpA=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4958.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f23ae2-8b7f-4d30-d056-08d9575c00df
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2021 15:24:51.1922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IVHs96MQ4opzKoafkGRZGkEtLNuS4wyjzxpIiXDdu3F+VFBz1P4O0GiYd1Adt54PUVv7RxUolYJFJrtt+b/dHeqMy76/HyK2/TIsZNh8Tzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2382
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] shmget02: check if CONFIG_HUGETLBFS enabled in
 kernel
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
Content-Type: multipart/mixed; boundary="===============0310533154=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0310533154==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB495841C26CD4F6E1D756515993F19VI1PR04MB4958eurp_"

--_000_VI1PR04MB495841C26CD4F6E1D756515993F19VI1PR04MB4958eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Cyril,

Taken a note for future, thanks!

-Bogdan
________________________________
From: Cyril Hrubis <chrubis@suse.cz>
Sent: Wednesday, August 4, 2021 17:39
To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
Cc: ltp@lists.linux.it <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v3] shmget02: check if CONFIG_HUGETLBFS enabled i=
n kernel

Hi!
Pushed with a minor change, thanks.

The inline variable definition is valid on in C99 and we still have to
support old distributions that compile LTP with GNU89 which does not
allow it. I've also changed the type to unsigned in order to avoid a
warning.

Full diff:

diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget02.c b/testcases/ke=
rnel/syscalls/ipc/shmget/shmget02.c
index 7856c2b8e..effd33799 100644
--- a/testcases/kernel/syscalls/ipc/shmget/shmget02.c
+++ b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
@@ -110,10 +110,11 @@ static void setup(void)
         pw =3D SAFE_GETPWNAM("nobody");

         if (!hugetlbfs_supported()) {
+               unsigned int i;

                 tst_res(TINFO, "SHM_HUGETLB not supported by kernel");

-               for (int i =3D 0; i < ARRAY_SIZE(tcases); i++) {
+               for (i =3D 0; i < ARRAY_SIZE(tcases); i++) {
                         if (tcases[i].flags & SHM_HUGETLB)
                                 tcases[i].exp_err =3D EINVAL;
                 }

--
Cyril Hrubis
chrubis@suse.cz


--_000_VI1PR04MB495841C26CD4F6E1D756515993F19VI1PR04MB4958eurp_
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
Hi&nbsp;Cyril,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Taken a note for future, thanks!</div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Cyril Hrubis &lt;chru=
bis@suse.cz&gt;<br>
<b>Sent:</b> Wednesday, August 4, 2021 17:39<br>
<b>To:</b> Bogdan Lezhepekov &lt;bogdan.lezhepekov@suse.com&gt;<br>
<b>Cc:</b> ltp@lists.linux.it &lt;ltp@lists.linux.it&gt;<br>
<b>Subject:</b> Re: [LTP] [PATCH v3] shmget02: check if CONFIG_HUGETLBFS en=
abled in kernel</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi!<br>
Pushed with a minor change, thanks.<br>
<br>
The inline variable definition is valid on in C99 and we still have to<br>
support old distributions that compile LTP with GNU89 which does not<br>
allow it. I've also changed the type to unsigned in order to avoid a<br>
warning.<br>
<br>
Full diff:<br>
<br>
diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget02.c b/testcases/ke=
rnel/syscalls/ipc/shmget/shmget02.c<br>
index 7856c2b8e..effd33799 100644<br>
--- a/testcases/kernel/syscalls/ipc/shmget/shmget02.c<br>
+++ b/testcases/kernel/syscalls/ipc/shmget/shmget02.c<br>
@@ -110,10 +110,11 @@ static void setup(void)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pw =3D SAFE_GETPWNAM(&quot=
;nobody&quot;);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!hugetlbfs_supported()=
) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; unsigned int i;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; tst_res(TINFO, &quot;SHM_HUGETLB not supported by ker=
nel&quot;);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; for (int i =3D 0; i &lt; ARRAY_SIZE(tcases); i++) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; for (i =3D 0; i &lt; ARRAY_SIZE(tcases); i++) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (t=
cases[i].flags &amp; SHM_HUGETLB)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcases[i].exp_err =3D EINVAL;<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
<br>
-- <br>
Cyril Hrubis<br>
chrubis@suse.cz<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB495841C26CD4F6E1D756515993F19VI1PR04MB4958eurp_--


--===============0310533154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0310533154==--

