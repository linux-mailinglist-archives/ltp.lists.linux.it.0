Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5322C3725C1
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 08:19:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1DCA73C5820
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 08:19:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B35543C57EB
 for <ltp@lists.linux.it>; Tue,  4 May 2021 08:19:46 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 11C9D200B83
 for <ltp@lists.linux.it>; Tue,  4 May 2021 08:19:43 +0200 (CEST)
Received: from dggeml755-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FZ8kp33brz5yGL;
 Tue,  4 May 2021 14:17:06 +0800 (CST)
Received: from dggpemm100003.china.huawei.com (7.185.36.68) by
 dggeml755-chm.china.huawei.com (10.1.199.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 4 May 2021 14:19:39 +0800
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggpemm100003.china.huawei.com (7.185.36.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 4 May 2021 14:19:39 +0800
Received: from dggpemm500022.china.huawei.com ([7.185.36.162]) by
 dggpemm500022.china.huawei.com ([7.185.36.162]) with mapi id 15.01.2176.012;
 Tue, 4 May 2021 14:19:39 +0800
From: xieziyao <xieziyao@huawei.com>
To: Petr Vorel <pvorel@suse.cz>, Jan Stancek <jstancek@redhat.com>
Thread-Topic: [LTP] [PATCH 0/3] syscalls/aio: Convert libaio wrapper function
 to kernel syscall
Thread-Index: AQHXQE8LXcHtLibFzk221XAKR2oEhKrSL5QAgAASLACAAJiOBw==
Date: Tue, 4 May 2021 06:19:39 +0000
Message-ID: <f4927571ebe74ea4b378e475befda3c7@huawei.com>
References: <20210429115021.24128-1-xieziyao@huawei.com>
 <YJBJB/S1ThSsNvCk@pevik>
 <CAASaF6w3xihoQRakDsBB52jnTimexy3V6eoj2wVbtT43Yq9iCQ@mail.gmail.com>,
 <YJDYAnOZgAgu5y6A@pevik>
In-Reply-To: <YJDYAnOZgAgu5y6A@pevik>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] syscalls/aio: Convert libaio wrapper function
 to kernel syscall
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1459912071=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1459912071==
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_f4927571ebe74ea4b378e475befda3c7huaweicom_"

--_000_f4927571ebe74ea4b378e475befda3c7huaweicom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGksIFBldHIsIEphbiwNCg0KSSBhbSB3b3JraW5nIG9uIGFkYXB0aW5nIHRoZSBuZXcgQVBJIHRv
IHRoZSB0ZXN0c3VpdGUgb2Ygc3lzY2FsbHMvaW9fKi4NCg0KQXQgdGhlIHNhbWUgdGltZSwgSSBw
cmVmZXIgdG8gcmVwbGFjZSBsaWJhaW8gd3JhcHBlciBmdW5jdGlvbiB3aXRoIHJhdyBzeXN0ZW0g
Y2FsbCh0c3Rfc3lzY2FsbChfX05SX2lvXyopKSBqdXN0IGZvciB0aGUgYWlvIHRlc3RjYXNlcyBv
ZiBrZXJuZWwvc3lzY2FsbHMsIHNpbmNlIHRoaXMgbWV0aG9kIG1heSBiZSBtb3JlIHN0cmFpZ2h0
Zm9yd2FyZCwgbm8gbmVlZCB0byByZWx5IG9uIG90aGVyIGxpYnJhcmllcy4NCg0KR2xhZCB0byBz
ZWUgeW91ciBkaXNjdXNzaW9uIGFuZCBwYXJ0aWNpcGF0aW9uLCB0aGFua3MuDQoNCktpbmQgcmVn
YXJkcywNClppeWFvDQpGcm9tOiBQZXRyIFZvcmVsPHB2b3JlbEBzdXNlLmN6PG1haWx0bzpwdm9y
ZWxAc3VzZS5jej4+DQpUbzogSmFuIFN0YW5jZWs8anN0YW5jZWtAcmVkaGF0LmNvbTxtYWlsdG86
anN0YW5jZWtAcmVkaGF0LmNvbT4+DQpDYzogeGlleml5YW88eGlleml5YW9AaHVhd2VpLmNvbTxt
YWlsdG86eGlleml5YW9AaHVhd2VpLmNvbT4+O2x0cDxsdHBAbGlzdHMubGludXguaXQ8bWFpbHRv
Omx0cEBsaXN0cy5saW51eC5pdD4+O1JpY2hhcmQgUGFsZXRob3JwZTxycGFsZXRob3JwZUBzdXNl
LmNvbTxtYWlsdG86cnBhbGV0aG9ycGVAc3VzZS5jb20+Pg0KU3ViamVjdDogUmU6IFtMVFBdIFtQ
QVRDSCAwLzNdIHN5c2NhbGxzL2FpbzogQ29udmVydCBsaWJhaW8gd3JhcHBlciBmdW5jdGlvbiB0
byBrZXJuZWwgc3lzY2FsbA0KVGltZTogMjAyMS0wNS0wNCAxMzoxMzo1Mw0KDQpIaSBKYW4sDQoN
Cj4gT24gTW9uLCBNYXkgMywgMjAyMSBhdCA5OjAzIFBNIFBldHIgVm9yZWwgPHB2b3JlbEBzdXNl
LmN6PiB3cm90ZToNCg0KPiA+IEhpIFppeWFvLA0KDQo+ID4gPiBJbnN0ZWFkIG9mIHVzaW5nIHRo
ZSBsaWJhaW8gd3JhcHBlciBmdW5jdGlvbiwgdGhlIHN5c3RlbSBjYWxsIGlzIGNoYW5nZWQNCj4g
PiB0byBiZSBpbnZva2VkIHZpYSBzeXNjYWxsKDIpLg0KDQoNCj4gSSBwcm9iYWJseSBtaXNzZWQg
c29tZSBkaXNjdXNzaW9uLiBXaHkgYXJlIHdlIHJlcGxhY2luZyBpdCB3aXRoIHN5c2NhbGw/DQoN
CnlvdSBoYXZlbid0IG1pc3NlZCBhbnl0aGluZy4gaW9fZGVzdHJveShjdHgpIChsaWJhaW8uaCkg
aXMgYmVpbmcgcmVwbGFjZWQgd2l0aA0KcmF3IHN5c2NhbGwgKHRzdF9zeXNjYWxsKF9fTlJfaW9f
ZGVzdHJveSwgY3R4KS4NCg0KS2luZCByZWdhcmRzLA0KUGV0cg0K

--_000_f4927571ebe74ea4b378e475befda3c7huaweicom_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div style=3D"font-family:Calibri,Helvetica!important; font-size:17.0px; co=
lor:#333333">
<span style=3D"color:#333333; font-size:17.0px">Hi,&nbsp;Petr,&nbsp;Jan,</s=
pan><br>
<br>
<span style=3D"color:#333333; font-size:17.0px">I&nbsp;am&nbsp;working&nbsp=
;on&nbsp;adapting&nbsp;the&nbsp;new&nbsp;API&nbsp;to&nbsp;the&nbsp;testsuit=
e&nbsp;of&nbsp;syscalls/io_*.&nbsp;</span><br>
<br>
<span style=3D"color:#333333; font-size:17.0px">At&nbsp;the&nbsp;same&nbsp;=
time,&nbsp;I&nbsp;prefer&nbsp;to&nbsp;replace&nbsp;libaio&nbsp;wrapper&nbsp=
;function&nbsp;with&nbsp;raw&nbsp;system&nbsp;call(tst_syscall(__NR_io_*))&=
nbsp;just&nbsp;for&nbsp;the&nbsp;aio&nbsp;testcases&nbsp;of&nbsp;kernel/sys=
calls,&nbsp;since&nbsp;this&nbsp;method&nbsp;may&nbsp;be&nbsp;more&nbsp;str=
aightforward,&nbsp;no&nbsp;need&nbsp;to&nbsp;rely&nbsp;on&nbsp;other&nbsp;l=
ibraries.</span><br>
<br>
<span style=3D"color:#333333; font-size:17.0px">Glad&nbsp;to&nbsp;see&nbsp;=
your&nbsp;discussion&nbsp;and&nbsp;participation,&nbsp;thanks.</span><br>
<br>
<span style=3D"color:#333333; font-size:17.0px">Kind&nbsp;regards,</span><b=
r>
<span style=3D"color:#333333; font-size:17.0px">Ziyao</span><br>
</div>
<div name=3D"x_AnyOffice-Background-Image" style=3D"border-top:1px solid #B=
5C4DF; padding:8px">
<div><b>From: </b>Petr Vorel&lt;<a href=3D"mailto:pvorel@suse.cz">pvorel@su=
se.cz</a>&gt;</div>
<div><b>To: </b>Jan Stancek&lt;<a href=3D"mailto:jstancek@redhat.com">jstan=
cek@redhat.com</a>&gt;</div>
<div><b>Cc: </b>xieziyao&lt;<a href=3D"mailto:xieziyao@huawei.com">xieziyao=
@huawei.com</a>&gt;;ltp&lt;<a href=3D"mailto:ltp@lists.linux.it">ltp@lists.=
linux.it</a>&gt;;Richard Palethorpe&lt;<a href=3D"mailto:rpalethorpe@suse.c=
om">rpalethorpe@suse.com</a>&gt;</div>
<div><b>Subject: </b>Re: [LTP] [PATCH 0/3] syscalls/aio: Convert libaio wra=
pper function to kernel syscall</div>
<div><b>Time: </b>2021-05-04 13:13:53</div>
<br>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Hi Jan,<br>
<br>
&gt; On Mon, May 3, 2021 at 9:03 PM Petr Vorel &lt;pvorel@suse.cz&gt; wrote=
:<br>
<br>
&gt; &gt; Hi Ziyao,<br>
<br>
&gt; &gt; &gt; Instead of using the libaio wrapper function, the system cal=
l is changed<br>
&gt; &gt; to be invoked via syscall(2).<br>
<br>
<br>
&gt; I probably missed some discussion. Why are we replacing it with syscal=
l?<br>
<br>
you haven't missed anything. io_destroy(ctx) (libaio.h) is being replaced w=
ith<br>
raw syscall (tst_syscall(__NR_io_destroy, ctx).<br>
<br>
Kind regards,<br>
Petr<br>
</div>
</span></font>
</body>
</html>

--_000_f4927571ebe74ea4b378e475befda3c7huaweicom_--

--===============1459912071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1459912071==--
