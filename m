Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F357E2EA892
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jan 2021 11:25:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9FE683C6B04
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jan 2021 11:25:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 9404D3C23E1
 for <ltp@lists.linux.it>; Thu, 24 Dec 2020 06:56:30 +0100 (CET)
Received: from spam.asrmicro.com (asrmicro.com [210.13.118.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0D5F1140146E
 for <ltp@lists.linux.it>; Thu, 24 Dec 2020 06:56:26 +0100 (CET)
Received: from mail2012.asrmicro.com (mail2012.asrmicro.com [10.1.24.123])
 by spam.asrmicro.com with ESMTPS id 0BO5uDFK067965
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Thu, 24 Dec 2020 13:56:13 +0800 (GMT-8)
 (envelope-from meitaogao@asrmicro.com)
Received: from exch01.asrmicro.com (10.1.24.121) by mail2012.asrmicro.com
 (10.1.24.123) with Microsoft SMTP Server (TLS) id 15.0.847.32; Thu, 24 Dec
 2020 13:56:15 +0800
Received: from exch01.asrmicro.com ([::1]) by exch01.asrmicro.com ([::1]) with
 mapi id 15.00.0847.030; Thu, 24 Dec 2020 13:56:15 +0800
From: =?gb2312?B?R2FvIE1laXRhb6OouN/DtczOo6k=?= <meitaogao@asrmicro.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: LTP testcase(sysctl02) failed
Thread-Index: AdbZuXpPNEiX/kccTjW4wmzi4oV72w==
Date: Thu, 24 Dec 2020 05:56:14 +0000
Message-ID: <0efaa481ffd24bc48fd41385159be66c@exch01.asrmicro.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.170.170]
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: spam.asrmicro.com 0BO5uDFK067965
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 05 Jan 2021 11:25:20 +0100
Subject: [LTP] LTP testcase(sysctl02) failed
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
Content-Type: multipart/mixed; boundary="===============1704304072=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1704304072==
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_0efaa481ffd24bc48fd41385159be66cexch01asrmicrocom_"

--_000_0efaa481ffd24bc48fd41385159be66cexch01asrmicrocom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

QWxsOg0KDQpJIGFtIGN1cnJlbnRseSBjb25kdWx0aW5nIEx0cCB0ZXN0IGZvciBvdXIgb3duIHlv
Y3RvIHByb2plY3QsIG5vdyBJIGVuY291dGVyIGJlbG93IGVycm9yLg0KDQpzeXNjdGwwMl9zaCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBGQUlMICAgICAgIDENCnN5c2N0
bDAyIDEgVEZBSUw6IC9wcm9jL3N5cy9mcy9maWxlLW1heCBvdmVyZmxvd3MgYW5kIGlzIHNldCB0
byAwDQpzeXNjdGwwMiAyIFRJTkZPOiB0cnlpbmcgdG8gc2V0IGZzLmZpbGUtbWF4PTE4NDQ2NzQ0
MDczNzA5NTUxNjE1DQpzeXNjdGwwMiAyIFRQQVNTOiAvcHJvYy9zeXMvZnMvZmlsZS1tYXgga2Vl
cHMgb2xkIHZhbHVlICgzMzM5OCkNCnN5c2N0bDAyIDMgVElORk86IHRyeWluZyB0byBzZXQgZnMu
ZmlsZS1tYXg9OTIyMzM3MjAzNjg1NDc3NTgwOA0Kc3lzY3RsMDIgMyBURkFJTDogL3Byb2Mvc3lz
L2ZzL2ZpbGUtbWF4IG92ZXJmbG93cyBhbmQgaXMgc2V0IHRvIDANCnN5c2N0bDAyIDQgVENPTkY6
IGtlcm5lbCBkb2Vzbid0IHN1cHBvcnQgS0FTQU4NCg0KYWZ0ZXIgaW52ZXN0aWdhdGVkIGl0LCB0
aGlzIHRlc3RjYXNlIGlzIGZvciBidWZmZmVyIG92ZXJmbG93LCBJIGNoZWNrZWQgc291cmNlIGNv
ZGUgKGtlcm5lbCA0LjE5KSwNCmFsbCBvZiByZXF1aXJlZCBwYXRjaGVkIGhhZCBiZWVuIGFwcGxp
ZWQsIEkgZGlnIGludG8gaXQgYW5kIGZvdW5kIG5ldyBwYXRjaCBhcHBsaWVkIGFzIGZsb3cgLCB0
aGF0IG1pZ2h0IG1ha2UgdGVzdGNhc2UgZmFpbGVkDQoNCmNvbW1pdCBiMjI3ZjE1NzEyNjkxMDk2
MDI3MTYzYTQ2MDBhN2FmMWM0ODY0MzIwDQpBdXRob3I6IENocmlzdGlhbiBCcmF1bmVyIDxjaHJp
c3RpYW5AYnJhdW5lci5pbz4NCkRhdGU6ICAgVGh1IE1hciA3IDE2OjI5OjQzIDIwMTkgLTA4MDAN
Cg0KICAgIHN5c2N0bDogaGFuZGxlIG92ZXJmbG93IGZvciBmaWxlLW1heA0KDQogICAgWyBVcHN0
cmVhbSBjb21taXQgMzJhNWFkOWMyMjg1MmU2YmQ5ZTc0YmRlYzU5MzRlZjlkMTQ4MGJjNSBdDQoN
CiAgICBDdXJyZW50bHksIHdoZW4gd3JpdGluZw0KDQogICAgICBlY2hvIDE4NDQ2NzQ0MDczNzA5
NTUxNjE2ID4gL3Byb2Mvc3lzL2ZzL2ZpbGUtbWF4DQoNCiAgICAvcHJvYy9zeXMvZnMvZmlsZS1t
YXggd2lsbCBvdmVyZmxvdyBhbmQgYmUgc2V0IHRvIDAuICBUaGF0IHF1aWNrbHkNCiAgICBjcmFz
aGVzIHRoZSBzeXN0ZW0uDQoNCiAgICBUaGlzIGNvbW1pdCBzZXRzIHRoZSBtYXggYW5kIG1pbiB2
YWx1ZSBmb3IgZmlsZS1tYXguICBUaGUgbWF4IHZhbHVlIGlzDQogICAgc2V0IHRvIGxvbmcgaW50
LiAgQW55IGhpZ2hlciB2YWx1ZSBjYW5ub3QgY3VycmVudGx5IGJlIHVzZWQgYXMgdGhlDQogICAg
cGVyY3B1IGNvdW50ZXJzIGFyZSBsb25nIGludHMgYW5kIG5vdCB1bnNpZ25lZCBpbnRlZ2Vycy4N
Cg0KICAgIE5vdGUgdGhhdCB0aGUgZmlsZS1tYXggdmFsdWUgaXMgdWx0aW1hdGVseSBwYXJzZWQg
dmlhDQogICAgX19kb19wcm9jX2RvdWxvbmd2ZWNfbWlubWF4KCkuICBUaGlzIGZ1bmN0aW9uIGRv
ZXMgbm90IHJlcG9ydCBlcnJvciB3aGVuDQogICAgbWluIG9yIG1heCBhcmUgZXhjZWVkZWQuICBX
aGljaCBtZWFucyBpZiBhIHZhbHVlIGxhcmdlbiB0aGF0IGxvbmcgaW50IGlzDQogICAgd3JpdHRl
biB1c2Vyc3BhY2Ugd2lsbCBub3QgcmVjZWl2ZSBhbiBlcnJvciBpbnN0ZWFkIHRoZSBvbGQgdmFs
dWUgd2lsbCBiZQ0KICAgIGtlcHQuICBUaGVyZSBpcyBhbiBhcmd1bWVudCB0byBiZSBtYWRlIHRo
YXQgdGhpcyBzaG91bGQgYmUgY2hhbmdlZCBhbmQNCiAgICBfX2RvX3Byb2NfZG91bG9uZ3ZlY19t
aW5tYXgoKSBzaG91bGQgcmV0dXJuIGFuIGVycm9yIHdoZW4gYSBkZWRpY2F0ZWQgbWluDQogICAg
b3IgbWF4IHZhbHVlIGFyZSBleGNlZWRlZC4gIEhvd2V2ZXIgdGhpcyBoYXMgdGhlIHBvdGVudGlh
bCB0byBicmVhaw0KICAgIHVzZXJzcGFjZSBzbyBsZXQncyBkZWZlciB0aGlzIHRvIGFuIFJGQyBw
YXRjaC4NCg0Kc28gaXMgdGhpcyB0ZXN0Y2FzZSBvdXQgb2YgZGF0ZSBvciBzb21ldGhpbmcgd3Jv
bmcgd2loIG15IGtlcm5lbCA/DQp3aG8gY2FuIGhlbHAgbWUgZmlndXJlIHRoaXMgb3V0PyBUaGFu
a3MgaW4gYWR2YW5jZS4NCg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
QmVzdCBSZWdhcmRzDQpNZWl0YW8gR2FvDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCg0KDQoNCg==

--_000_0efaa481ffd24bc48fd41385159be66cexch01asrmicrocom_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=CB=CE=CC=E5";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">All:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US">I =
am currently condulting Ltp test for our own yocto project, now I encouter =
below error.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US">sy=
sctl02_sh&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;FAIL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal" style=3D"margin-left:21.0pt;mso-para-margin-left:2.0=
gd"><b><span lang=3D"EN-US" style=3D"color:red">sysctl02 1 TFAIL: /proc/sys=
/fs/file-max overflows and is set to 0</span><span lang=3D"EN-US"><o:p></o:=
p></span></b></p>
<p class=3D"MsoNormal" style=3D"margin-left:21.0pt;mso-para-margin-left:2.0=
gd"><span lang=3D"EN-US">sysctl02 2 TINFO: trying to set fs.file-max=3D1844=
6744073709551615<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:21.0pt;mso-para-margin-left:2.0=
gd"><span lang=3D"EN-US">sysctl02 2 TPASS: /proc/sys/fs/file-max keeps old =
value (33398)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:21.0pt;mso-para-margin-left:2.0=
gd"><span lang=3D"EN-US">sysctl02 3 TINFO: trying to set fs.file-max=3D9223=
372036854775808<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:21.0pt;mso-para-margin-left:2.0=
gd"><span lang=3D"EN-US" style=3D"color:red">sysctl02 3 TFAIL: /proc/sys/fs=
/file-max overflows and is set to 0<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:21.0pt;mso-para-margin-left:2.0=
gd"><span lang=3D"EN-US">sysctl02 4 TCONF: kernel doesn't support KASAN<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">after investigated it, this tes=
tcase is for bufffer overflow, I checked source code (kernel 4.19),
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">all of required patched had bee=
n applied, I dig into it and found new patch applied as flow , that might m=
ake testcase failed
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">commit =
b227f15712691096027163a4600a7af1c4864320<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Author:=
 Christian Brauner &lt;christian@brauner.io&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Date:&n=
bsp;&nbsp; Thu Mar 7 16:29:43 2019 -0800<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp; sysctl: handle overflow for file-max<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;[ Upstream commit 32a5ad9c22852e6bd9e74bdec5934ef9d1480bc5=
 ]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;Currently, when writing<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;echo 18446744073709551616 &gt; /proc/sys/fs/fi=
le-max<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;/proc/sys/fs/file-max will overflow and be set to 0.&nbsp;=
 That quickly<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp; crashes the system.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;This commit sets the max and min value for file-max. &nbsp=
;The max value is<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp; set to long int.&nbsp; Any higher value cannot currently be use=
d as the<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp; percpu counters are long ints and not unsigned integers.<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp;&nbsp;Note that the file-max value is ultimately parsed via<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp; __do_proc_doulongvec_minmax().&nbsp; This function does not rep=
ort error when<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp; min or max are exceeded.&nbsp; Which means if a value largen th=
at long int is<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp; written userspace will not receive an error instead the old val=
ue will be<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp; kept.&nbsp; There is an argument to be made that this should be=
 changed and<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp; __do_proc_doulongvec_minmax() should return an error when a ded=
icated min<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp; or max value are exceeded.&nbsp; However this has the potential=
 to break<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp; userspace so let's defer this to an RFC patch.<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;&=
nbsp;&nbsp; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:16.0pt;color=
:#1F497D">so is this testcase out of date or something wrong wih my kernel =
?
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:16.0pt;color=
:#1F497D">who can help me figure this out? Thanks in advance.<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">-------=
----------------------------<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Best Re=
gards<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Meitao =
Gao<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">-------=
-----------------------------<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_0efaa481ffd24bc48fd41385159be66cexch01asrmicrocom_--

--===============1704304072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1704304072==--
