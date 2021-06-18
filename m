Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CFC3ACBF3
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 15:17:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7C7023C31CC
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 15:17:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A79113C27EF
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 15:17:01 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0CF3C1000285
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 15:16:59 +0200 (CEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G5zs13Ph7zZjWx
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 21:13:57 +0800 (CST)
Received: from dggpemm100023.china.huawei.com (7.185.36.248) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 21:16:54 +0800
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggpemm100023.china.huawei.com (7.185.36.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 21:16:54 +0800
Received: from dggpemm500022.china.huawei.com ([7.185.36.162]) by
 dggpemm500022.china.huawei.com ([7.185.36.162]) with mapi id 15.01.2176.012;
 Fri, 18 Jun 2021 21:16:54 +0800
From: xieziyao <xieziyao@huawei.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP][PATCH 3/3 v2] getrusage: Cleanup and bugfix for getrusage03
Thread-Index: AQHXY2c+9wmDyANsA0GA/Uskb99s56sZK7MAgACV6Ac=
Date: Fri, 18 Jun 2021 13:16:54 +0000
Message-ID: <021a65c83ac448e882077e7dabe1667b@huawei.com>
References: <20210617105556.130869-1-xieziyao@huawei.com>
 <20210617105556.130869-4-xieziyao@huawei.com>,<YMyPhiiKwuwEdj7N@yuki>
In-Reply-To: <YMyPhiiKwuwEdj7N@yuki>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3 v2] getrusage: Cleanup and bugfix for
 getrusage03
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
Cc: ltp <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1659899777=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1659899777==
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_021a65c83ac448e882077e7dabe1667bhuaweicom_"

--_000_021a65c83ac448e882077e7dabe1667bhuaweicom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

WWVzLCBwbGVhc2UgZG8uDQoNCkZlZWwgZmluZSB3aXRoIHlvdXIgbW9kaWZpY2F0aW9uIGFuZCB0
aGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KDQpLaW5kIFJlZ2FyZHMsDQpaaXlhbw0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KDQpYaWUgWml5YW8NCkVtYWlsOiB4aWV6aXlhb0Bo
dWF3ZWkuY29tPG1haWx0bzp4aWV6aXlhb0BodWF3ZWkuY29tPg0KDQoNCkZyb206IEN5cmlsIEhy
dWJpczxjaHJ1YmlzQHN1c2UuY3o8bWFpbHRvOmNocnViaXNAc3VzZS5jej4+DQpUbzogeGlleml5
YW88eGlleml5YW9AaHVhd2VpLmNvbTxtYWlsdG86eGlleml5YW9AaHVhd2VpLmNvbT4+DQpDYzog
bHRwPGx0cEBsaXN0cy5saW51eC5pdDxtYWlsdG86bHRwQGxpc3RzLmxpbnV4Lml0Pj47bWRvdWNo
YTxtZG91Y2hhQHN1c2UuY3o8bWFpbHRvOm1kb3VjaGFAc3VzZS5jej4+DQpTdWJqZWN0OiBSZTog
W0xUUF1bUEFUQ0ggMy8zIHYyXSBnZXRydXNhZ2U6IENsZWFudXAgYW5kIGJ1Z2ZpeCBmb3IgZ2V0
cnVzYWdlMDMNClRpbWU6IDIwMjEtMDYtMTggMjA6NDY6MTQNCg0KSGkhDQo+ICBzdGF0aWMgdm9p
ZCBzaWdfaWduKHZvaWQpDQo+ICB7DQo+IC0gICAgIHRzdF9yZXNtKFRJTkZPLCAiVGVzdGNhc2Ug
IzA2OiBTSUdfSUdOIik7DQo+IC0NCj4gLSAgICAgU0FGRV9HRVRSVVNBR0UoY2xlYW51cCwgUlVT
QUdFX0NISUxEUkVOLCAmcnUpOw0KPiAtICAgICB0c3RfcmVzbShUSU5GTywgImluaXRpYWwuY2hp
bGRyZW4gPSAlbGQiLCBydS5ydV9tYXhyc3MpOw0KPiAtICAgICBzaWduYWwoU0lHQ0hMRCwgU0lH
X0lHTik7DQo+ICsgICAgIFNBRkVfU0lHTkFMKFNJR0NITEQsIFNJR19JR04pOw0KPiArICAgICBT
QUZFX0dFVFJVU0FHRShSVVNBR0VfQ0hJTERSRU4sICZydSk7DQo+ICAgICAgICBtYXhyc3NfaW5p
dCA9IHJ1LnJ1X21heHJzczsNCj4NCj4gLSAgICAgc3dpdGNoIChwaWQgPSBmb3JrKCkpIHsNCj4g
LSAgICAgY2FzZSAtMToNCj4gLSAgICAgICAgICAgICB0c3RfYnJrbShUQlJPSywgY2xlYW51cCwg
ImZvcmsgIzYiKTsNCj4gLSAgICAgY2FzZSAwOg0KPiAtICAgICAgICAgICAgIHJldHZhbCA9IHN5
c3RlbSgiZ2V0cnVzYWdlMDNfY2hpbGQgLW4gNTAwIik7DQo+IC0gICAgICAgICAgICAgaWYgKChX
SUZFWElURUQocmV0dmFsKSAmJiBXRVhJVFNUQVRVUyhyZXR2YWwpICE9IDApKQ0KPiAtICAgICAg
ICAgICAgICAgICAgICAgdHN0X2Jya20oVEJST0sgfCBURVJSTk8sIGNsZWFudXAsICJzeXN0ZW0i
KTsNCj4gLSAgICAgICAgICAgICBleGl0KDApOw0KPiAtICAgICBkZWZhdWx0Og0KPiAtICAgICAg
ICAgICAgIGJyZWFrOw0KPiAtICAgICB9DQo+ICsgICAgIHBpZF90IHBpZCA9IFNBRkVfRk9SSygp
Ow0KPiArDQo+ICsgICAgIGlmICghcGlkKQ0KPiArICAgICAgICAgICAgIFNBRkVfRVhFQ0xQKCJn
ZXRydXNhZ2UwM19jaGlsZCIsICJnZXRydXNhZ2UwM19jaGlsZCIsDQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgImNvbnN1bWUiLCAiNTAwIiwgTlVMTCk7DQo+DQo+IC0gICAgIHNsZWVwKDEp
OyAgICAgICAgICAgICAgIC8qIGNoaWxkcmVuIGJlY29tZSB6b21iaWUgKi8NCj4gLSAgICAgU0FG
RV9HRVRSVVNBR0UoY2xlYW51cCwgUlVTQUdFX0NISUxEUkVOLCAmcnUpOw0KPiAtICAgICB0c3Rf
cmVzbShUSU5GTywgImFmdGVyX3pvbWJpZS5jaGlsZHJlbiA9ICVsZCIsIHJ1LnJ1X21heHJzcyk7
DQo+ICsgICAgIFRTVF9QUk9DRVNTX0VYSVRfV0FJVChwaWQsIDApOw0KPiArICAgICBTQUZFX0dF
VFJVU0FHRShSVVNBR0VfQ0hJTERSRU4sICZydSk7DQo+ICAgICAgICBpZiAoaXNfaW5fZGVsdGEo
cnUucnVfbWF4cnNzIC0gbWF4cnNzX2luaXQpKQ0KPiAtICAgICAgICAgICAgIHRzdF9yZXNtKFRQ
QVNTLCAiaW5pdGlhbC5jaGlsZHJlbiB+PSBhZnRlcl96b21iaWUuY2hpbGRyZW4iKTsNCj4gKyAg
ICAgICAgICAgICB0c3RfcmVzKFRQQVNTLCAiaW5pdGlhbC5jaGlsZHJlbiB+PSBhZnRlcl96b21i
aWUuY2hpbGRyZW4iKTsNCj4gICAgICAgIGVsc2UNCj4gLSAgICAgICAgICAgICB0c3RfcmVzbShU
RkFJTCwgImluaXRpYWwuY2hpbGRyZW4gIX49IGFmdGVyX3pvbWJpZS5jaGlsZHJlbiIpOw0KPiAt
ICAgICBzaWduYWwoU0lHQ0hMRCwgU0lHX0RGTCk7DQo+IC19DQo+ICsgICAgICAgICAgICAgdHN0
X3JlcyhURkFJTCwgImFmdGVyX3pvbWJpZS5jaGlsZHJlbiA9ICVsaSwgZXhwZWN0ZWQgJWxpIiwN
Cj4gKyAgICAgICAgICAgICAgICAgICAgIHJ1LnJ1X21heHJzcywgbWF4cnNzX2luaXQpOw0KDQpJ
IGd1ZXNzIHRoYXQgdGhlc2UgbWVzc2FnZXMgY291bGQgYmUgYmV0dGVyLCB0ZWNoaW5jYWxseSBp
dCdzIG5vdCBhDQp6b21iaWUgYnV0IHJhdGhlciBpZ25vcmVkIGNoaWxkLCBzbyBJIHdvdWxkIGNo
YW5nZSB0aGlzIHRvOg0KDQoiaW5pdGlhbC5jaGlsZHJlbiB+PSBpZ25vcmVkX2NoaWxkLmNoaWxk
cmVuIg0KDQpPdGhlciB0aGFuIHRoaXMgdGhlIHJlc3QgaXMgZ29vZC4NCg0KUmV2aWV3ZWQtYnk6
IEN5cmlsIEhydWJpcyA8Y2hydWJpc0BzdXNlLmN6Pg0KDQoNCkFsc28gaWYgeW91IGFncmVlIEkg
Y2FuIGZpeCB0aGUgdHdvIG1pbm9yIGlzc3VlcyBpbiB0aGUgcGF0Y2hzZXQgYmVmb3JlDQptZXJn
ZSwgbm8gbmVlZCB0byBzZW5kIHYzLg0KDQotLQ0KQ3lyaWwgSHJ1YmlzDQpjaHJ1YmlzQHN1c2Uu
Y3oNCg==

--_000_021a65c83ac448e882077e7dabe1667bhuaweicom_
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
<span style=3D"color:#333333; font-size:17.0px">Yes,&nbsp;please&nbsp;do.</=
span><br>
<br>
<span style=3D"color:#333333; font-size:17.0px">Feel&nbsp;fine&nbsp;with&nb=
sp;your&nbsp;modification&nbsp;and&nbsp;thanks&nbsp;for&nbsp;your&nbsp;revi=
ew.</span><br>
<br>
<span style=3D"color:#333333; font-size:17.0px">Kind&nbsp;Regards,</span><b=
r>
<span style=3D"color:#333333; font-size:17.0px">Ziyao</span><br>
<br>
<span style=3D"color:#333333; font-size:17.0px">
<hr id=3D"x_client_signature_separator" style=3D"border-top:dotted 1px">
</span><br>
<span style=3D"color:#333333; font-size:17.0px">Xie&nbsp;Ziyao</span><br>
<span style=3D"color:#333333; font-size:17.0px">Email:&nbsp;<a href=3D"mail=
to:xieziyao@huawei.com" target=3D"_BLANK">xieziyao@huawei.com</a></span><br=
>
<br>
<br>
</div>
<div name=3D"x_AnyOffice-Background-Image" style=3D"border-top:1px solid #B=
5C4DF; padding:8px">
<div><b>From: </b>Cyril Hrubis&lt;<a href=3D"mailto:chrubis@suse.cz">chrubi=
s@suse.cz</a>&gt;</div>
<div><b>To: </b>xieziyao&lt;<a href=3D"mailto:xieziyao@huawei.com">xieziyao=
@huawei.com</a>&gt;</div>
<div><b>Cc: </b>ltp&lt;<a href=3D"mailto:ltp@lists.linux.it">ltp@lists.linu=
x.it</a>&gt;;mdoucha&lt;<a href=3D"mailto:mdoucha@suse.cz">mdoucha@suse.cz<=
/a>&gt;</div>
<div><b>Subject: </b>Re: [LTP][PATCH 3/3 v2] getrusage: Cleanup and bugfix =
for getrusage03</div>
<div><b>Time: </b>2021-06-18 20:46:14</div>
<br>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Hi!<br>
&gt;&nbsp; static void sig_ign(void)<br>
&gt;&nbsp; {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; tst_resm(TINFO, &quot;Testcase #06: SIG_IGN&=
quot;);<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SAFE_GETRUSAGE(cleanup, RUSAGE_CHILDREN, &am=
p;ru);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; tst_resm(TINFO, &quot;initial.children =3D %=
ld&quot;, ru.ru_maxrss);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; signal(SIGCHLD, SIG_IGN);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; SAFE_SIGNAL(SIGCHLD, SIG_IGN);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; SAFE_GETRUSAGE(RUSAGE_CHILDREN, &amp;ru)=
;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; maxrss_init =3D ru.ru_maxrss=
;<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; switch (pid =3D fork()) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; case -1:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; tst_brkm(TBROK, cleanup, &quot;fork #6&quot;);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; case 0:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; retval =3D system(&quot;getrusage03_child -n 500&quot;);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if ((WIFEXITED(retval) &amp;&amp; WEXITSTATUS(retval) !=3D 0))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tst_brkm(TBROK | TERRNO=
, cleanup, &quot;system&quot;);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; exit(0);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; break;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; pid_t pid =3D SAFE_FORK();<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (!pid)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; SAFE_EXECLP(&quot;getrusage03_child&quot;, &quot;getrusage03_child&=
quot;,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;consume&quot;, &quot;500&quot;, NULL);<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; sleep(1);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* children become zombie=
 */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; SAFE_GETRUSAGE(cleanup, RUSAGE_CHILDREN, &am=
p;ru);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; tst_resm(TINFO, &quot;after_zombie.children =
=3D %ld&quot;, ru.ru_maxrss);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; TST_PROCESS_EXIT_WAIT(pid, 0);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; SAFE_GETRUSAGE(RUSAGE_CHILDREN, &amp;ru)=
;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_in_delta(ru.ru_maxrss=
 - maxrss_init))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; tst_resm(TPASS, &quot;initial.children ~=3D after_zombie.children&quot;=
);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; tst_res(TPASS, &quot;initial.children ~=3D after_zombie.children&qu=
ot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; tst_resm(TFAIL, &quot;initial.children !~=3D after_zombie.children&quot=
;);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; signal(SIGCHLD, SIG_DFL);<br>
&gt; -}<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; tst_res(TFAIL, &quot;after_zombie.children =3D %li, expected %li&qu=
ot;,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ru.ru_maxrss, maxrs=
s_init);<br>
<br>
I guess that these messages could be better, techincally it's not a<br>
zombie but rather ignored child, so I would change this to:<br>
<br>
&quot;initial.children ~=3D ignored_child.children&quot;<br>
<br>
Other than this the rest is good.<br>
<br>
Reviewed-by: Cyril Hrubis &lt;chrubis@suse.cz&gt;<br>
<br>
<br>
Also if you agree I can fix the two minor issues in the patchset before<br>
merge, no need to send v3.<br>
<br>
-- <br>
Cyril Hrubis<br>
chrubis@suse.cz<br>
</div>
</span></font>
</body>
</html>

--_000_021a65c83ac448e882077e7dabe1667bhuaweicom_--

--===============1659899777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1659899777==--
