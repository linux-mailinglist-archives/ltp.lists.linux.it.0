Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB72254165
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Aug 2020 11:02:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 238EF3C2E69
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Aug 2020 11:02:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 2DC293C2E61
 for <ltp@lists.linux.it>; Thu, 27 Aug 2020 11:02:39 +0200 (CEST)
Received: from IND01-BO1-obe.outbound.protection.outlook.com
 (mail-eopbgr1390131.outbound.protection.outlook.com [40.107.139.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1354C200C7C
 for <ltp@lists.linux.it>; Thu, 27 Aug 2020 11:02:39 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0OYm5SWV1KmzRU57+9k0qFJ+nbaM3swObQKUtAkPaZOIYsJcj+q81UFeaGzVJyDI5wFtWatJblEvRf8evcTcBXVCstE7zaPclM+qCfdpHHDKdlLuTk+sgOLjbD7dTvdIk3CK6X7Irg9pPwCOISLnclofvIBW1c67BUNyAxyVd3ZQymPTsPRuiSqbxDuAGcrDfz6PQ9Iz/rtMe34Q5ZCkagUAKo8jop44TB5P3n4lAkIFnokN7x/VgtXT5ZKzpxytjrL6MQUM46I+Vk0ZO41ivk8W5+Vxb1YJjbwPIwlVVX3V/Mr8P6cTbwUOxriOHkBn+UVLkfwv3rKVkxoemOhAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zy94N4TTjjAnJi5ucUjofarN+lKRL5C5bqySbykwEOc=;
 b=GQY+iPRwoF9+kcQZkQx0clT0E1lSS6whi3xpNNgmiNY5v2mQVP5JnVi8+yRQK2W7lxIY8yJKCnmEiYnff9qP3onkKRiIH6x7coMnNGhcQiZpbHvEXT2djHYmSoMn97sqaLI5QMDhz46kaoa+nJVrY3NExIqmPIi5/Bi27eKqOXTaktXeyvD9DICwd6kFSOETC3bRQdWPzlcfBcWRMzsa1R497Yp6b69s91H9us7pJRJjrYEpLAlRLcCm5PH4VwnF6uTMNlcH0dsICv5Rdih3WChbz5JLsDBDBp0N79u5gL/Iw+RUbKXAeAcDu0w9cV+38jJFvshiWEA4/ND/VY9EYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zy94N4TTjjAnJi5ucUjofarN+lKRL5C5bqySbykwEOc=;
 b=bq7/lnnwKDey6pWN3BGoMeS2GSdoqO2k52IinV26TCY5Vwck0X/v0JxMzKNtOgfIUQw5me+DCXuMXzcCmxe3yBlaTEopAprN257Avtx6b/skWz6kSCi86KbZEhU83YM6FCotaCT+u9MI3yUX01tII2OxTJSZTzRuRu4WCOqG1eE=
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:36::20)
 by BM1PR0101MB1987.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Thu, 27 Aug
 2020 09:02:32 +0000
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a5b2:8c66:c439:2d46]) by BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a5b2:8c66:c439:2d46%5]) with mapi id 15.20.3305.032; Thu, 27 Aug 2020
 09:02:32 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: Jan Stancek <jstancek@redhat.com>
Thread-Topic: cpu.rt_runtime_us parameter
Thread-Index: AQHWe9TSYcbX2l+z5k+GQakz4OHnp5zcUS+njG9Wlcw=
Date: Thu, 27 Aug 2020 09:02:32 +0000
Message-ID: <BMXPR01MB234405D1265D8DDDF95D22D1EE550@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
References: <BMXPR01MB234411A56DB8E43D593FD1F8EE540@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>,
 <1327942027.10274674.1598512434120.JavaMail.zimbra@redhat.com>
In-Reply-To: <1327942027.10274674.1598512434120.JavaMail.zimbra@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none; redhat.com; dmarc=none action=none header.from=exaleapsemi.com; 
x-originating-ip: [49.35.16.234]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3f099b6-887c-4bf6-89a8-08d84a67ef05
x-ms-traffictypediagnostic: BM1PR0101MB1987:
x-microsoft-antispam-prvs: <BM1PR0101MB198794126B263E86CEA0D365EE550@BM1PR0101MB1987.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KsY8LsHn0WdCqmrizDKv/5jb/R3KnyyJSAy75ER7VOI2jcio+2bG0k3vHWvEenTxLxbUIhwOdmsFiXC730WVF7IFXYGxzVeyplgbNNfV6/AZXiz8mflU2q9aW30eZRQuOvr+1Y8JL1ukQ9cspvEQTCHNK26CXe3mARezHCxNks+3WR8mz4WFgeY3c2Y/C5mWQcHmA/oQ0C+jmLjRv5O3AEQfli0GzMcBtyYw1vvlMnN5jXWRQrG8fbyumgQPlyDNMWF5jJCvroX4DcJwr70g4/lhK5Q7/aViuDsURs/sKvt+h2oXO3kUNPSaMW6HG18pVLVUzbsEWxqs1HFiMNsx6g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(396003)(346002)(39830400003)(366004)(136003)(376002)(33656002)(5660300002)(478600001)(55016002)(316002)(8676002)(8936002)(9686003)(4326008)(2906002)(83380400001)(6916009)(66946007)(66446008)(6506007)(53546011)(76116006)(66556008)(64756008)(52536014)(7696005)(66476007)(26005)(186003)(86362001)(19627405001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 25idmN6g0ajGokjgKS3nc9ma5n7aG11ETIZY50AwTcOGHAGm9CDuvNjdAu2wsTDVkK697MiH2DxBhAyexd6s4It/YbcBpjDHrWws8A4XLoqVCruwMmfsrRtvwOMUE95wSRSwe10E19mILqmrtU+gLaJOceP19u11TzkkKjjg+2V0Q0FukcCzUrFWU5QvYt/rehWeMwbmxdQaQLXGZSySIEp0uHpS2qZE05sB29XL2hD8u1kcCK2agip4S+fluUThEJ6K5ikjkWERz2AhGYz2/lURmifyXSUGxJVQ7drgkHcNNhpQjQReOizBVEGXB1wz0oHv/mb882oMeKfrr7e3RTZzXHI/LkcRPt9ybRP+PxzSgfEfak6KjGcwfvXWpEXxuJ545IblNKsgiLcjd1MdanBpHf5Y4iG9/ZEk/Ic9sw2+ZjSX8XwMizhUAClWxvhoaDC9imA/5BJpE4DvYqf3gSh0z/YqKWWS+Vp+1/xOlKtiARgwlks7dNiSs53i7HYmWGnRe7ty1+FJiCzXuB37Fh6gGsu1dPbxudxR8FSsyinix7gHEaKujmmLC1A6y1dkUCAzH1eo7SU1crQFwmmEa5hbEVITFDhNDaW9MepzA/FNPdgluwDgdndOIQX9vbjopvboksArAGrmJ1KVjK4qMQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f099b6-887c-4bf6-89a8-08d84a67ef05
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2020 09:02:32.3980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 841IJ7mZoYfpZqDIDp90yU6jQNFGeoFHLuAG5M73UlpAVOML7e7Vwxbrw61uHmXdIxbZFi1dnKGbOjD/JyhZBml/TTwDfCRYuaTdE1hALwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR0101MB1987
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] cpu.rt_runtime_us parameter
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
Content-Type: multipart/mixed; boundary="===============0734489678=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0734489678==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB234405D1265D8DDDF95D22D1EE550BMXPR01MB2344INDP_"

--_000_BMXPR01MB234405D1265D8DDDF95D22D1EE550BMXPR01MB2344INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
i am running it as root but when i have checked  /sys/fs/cgroup/cpu,cpuacct=
/system.slice/system-sshd.slice/cpu.rt_runtime_us the default value is 0 an=
d   /proc/sys/kernel/sched_rt_runtime_us is -1.
When i am manually writing into this the test are getting passed but i am n=
ot able to understand why these value are set to 0 and -1 resp. by default =
it should set to 950000 according to kernel documentation.Since /sys is ses=
sion persistent i am lossing value after restart what changes i should made=
 so that i will retain the value of cat  /proc/sys/kernel/sched_rt_runtime_=
us as 950000.

Kindly suggest.

Thanks

________________________________
From: Jan Stancek <jstancek@redhat.com>
Sent: Thursday, August 27, 2020 12:43 PM
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
Cc: Li Wang <liwang@redhat.com>
Subject: Re: cpu.rt_runtime_us parameter



----- Original Message -----
> Hi ,
>
> i was checking  kernel.sched_rt_runtime_us from $ cat
> /sys/fs/cgroup/cpu,cpuacct/system.slice/system-sshd.slice/cpu.rt_runtime_=
us
> which seems to be 0 ,but according to kernel documentation the default
> value of cpu.rt_runtime_us is set 950000 but i am wondering in my case  h=
ow
> i am getting it as 0 with linux kernel 5.5.6 i am not able to understand.=
I
> am running few test which are related to RT and are failing because value=
 of
> cpu.rt_runtime_us is set to 0.

If you're looking help with LTP, you should CC LTP list.

> when i am echoing  $ echo 950000  >
> /sys/fs/cgroup/cpu,cpuacct/system.slice/system-sshd.slice/cpu.rt_runtime_=
us
> the test are getting passed.
>
> Can you suggest why i am getting the default value cpu.rt_runtime_us as 0
> instead of 950000 ??

Most common cause is that you are not running in root cgroup, or you're mis=
sing
kernel config option.

[EXT]

--_000_BMXPR01MB234405D1265D8DDDF95D22D1EE550BMXPR01MB2344INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
i am running it as root but when i have checked&nbsp;<span style=3D"font-fa=
mily: Calibri, &quot;Segoe UI&quot;, Calibri, Thonburi, Arial, Verdana, san=
s-serif, &quot;Mongolian Baiti&quot;, &quot;Microsoft Yi Baiti&quot;, &quot=
;Javanese Text&quot;; font-size: 14.6667px; background-color: rgb(255, 255,=
 255); display: inline !important;">&nbsp;/sys/fs/cgroup/cpu,cpuacct/system=
.slice/system-sshd.slice/cpu.rt_runtime_us
 the default value is 0 and&nbsp;&nbsp; /proc/sys/kernel/sched_rt_runtime_u=
s is -1.<br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, &quot;Segoe UI&quot;, Calibri, Thonbur=
i, Arial, Verdana, sans-serif, &quot;Mongolian Baiti&quot;, &quot;Microsoft=
 Yi Baiti&quot;, &quot;Javanese Text&quot;; font-size: 14.6667px; backgroun=
d-color: rgb(255, 255, 255); display: inline !important;">When i am manuall=
y
 writing into this the test are getting passed but i am not able to underst=
and why these value are set to 0 and -1 resp. by default it should set to 9=
50000 according to kernel documentation.Since /sys is session persistent i =
am lossing value after restart what
 changes i should made so that i will retain the value of&nbsp;cat &nbsp;/p=
roc/sys/kernel/sched_rt_runtime_us as 950000.<br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, &quot;Segoe UI&quot;, Calibri, Thonbur=
i, Arial, Verdana, sans-serif, &quot;Mongolian Baiti&quot;, &quot;Microsoft=
 Yi Baiti&quot;, &quot;Javanese Text&quot;; font-size: 14.6667px; backgroun=
d-color: rgb(255, 255, 255); display: inline !important;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, &quot;Segoe UI&quot;, Calibri, Thonbur=
i, Arial, Verdana, sans-serif, &quot;Mongolian Baiti&quot;, &quot;Microsoft=
 Yi Baiti&quot;, &quot;Javanese Text&quot;; font-size: 14.6667px; backgroun=
d-color: rgb(255, 255, 255); display: inline !important;">Kindly suggest.</=
span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, &quot;Segoe UI&quot;, Calibri, Thonbur=
i, Arial, Verdana, sans-serif, &quot;Mongolian Baiti&quot;, &quot;Microsoft=
 Yi Baiti&quot;, &quot;Javanese Text&quot;; font-size: 14.6667px; backgroun=
d-color: rgb(255, 255, 255); display: inline !important;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, &quot;Segoe UI&quot;, Calibri, Thonbur=
i, Arial, Verdana, sans-serif, &quot;Mongolian Baiti&quot;, &quot;Microsoft=
 Yi Baiti&quot;, &quot;Javanese Text&quot;; font-size: 14.6667px; backgroun=
d-color: rgb(255, 255, 255); display: inline !important;">Thanks</span></di=
v>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Jan Stancek &lt;jstan=
cek@redhat.com&gt;<br>
<b>Sent:</b> Thursday, August 27, 2020 12:43 PM<br>
<b>To:</b> Pankaj Vinadrao Joshi &lt;Pankaj.VJ@exaleapsemi.com&gt;<br>
<b>Cc:</b> Li Wang &lt;liwang@redhat.com&gt;<br>
<b>Subject:</b> Re: cpu.rt_runtime_us parameter</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText"><br>
<br>
----- Original Message -----<br>
&gt; Hi ,<br>
&gt;<br>
&gt; i was checking&nbsp; kernel.sched_rt_runtime_us from $ cat<br>
&gt; /sys/fs/cgroup/cpu,cpuacct/system.slice/system-sshd.slice/cpu.rt_runti=
me_us<br>
&gt; which seems to be 0 ,but according to kernel documentation the default=
<br>
&gt; value of cpu.rt_runtime_us is set 950000 but i am wondering in my case=
&nbsp; how<br>
&gt; i am getting it as 0 with linux kernel 5.5.6 i am not able to understa=
nd.I<br>
&gt; am running few test which are related to RT and are failing because va=
lue of<br>
&gt; cpu.rt_runtime_us is set to 0.<br>
<br>
If you're looking help with LTP, you should CC LTP list.<br>
<br>
&gt; when i am echoing&nbsp; $ echo 950000&nbsp; &gt;<br>
&gt; /sys/fs/cgroup/cpu,cpuacct/system.slice/system-sshd.slice/cpu.rt_runti=
me_us<br>
&gt; the test are getting passed.<br>
&gt;<br>
&gt; Can you suggest why i am getting the default value cpu.rt_runtime_us a=
s 0<br>
&gt; instead of 950000 ??<br>
<br>
Most common cause is that you are not running in root cgroup, or you're mis=
sing<br>
kernel config option.<br>
<br>
[EXT]<br>
</div>
</span></font></div>
</body>
</html>

--_000_BMXPR01MB234405D1265D8DDDF95D22D1EE550BMXPR01MB2344INDP_--

--===============0734489678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0734489678==--
