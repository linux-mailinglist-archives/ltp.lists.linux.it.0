Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AED305AF5
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 13:14:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB0793C79D8
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 13:14:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 69F7F3C00DD
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 13:14:51 +0100 (CET)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.219])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id B68D060047F
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 13:14:48 +0100 (CET)
HMM_SOURCE_IP: 172.18.0.48:39922.1156615695
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-10.133.11.243?logid-b3612aa001044c71b22c90411390849e
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id D69C7280096;
 Wed, 27 Jan 2021 20:14:35 +0800 (CST)
X-189-SAVE-TO-SEND: liuxp11@chinatelecom.cn
Received: from  ([172.18.0.48])
 by App0024 with ESMTP id b3612aa001044c71b22c90411390849e for chrubis@suse.cz; 
 Wed Jan 27 20:14:45 2021
X-Transaction-ID: b3612aa001044c71b22c90411390849e
X-filter-score: filter<0>
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Date: Wed, 27 Jan 2021 20:14:33 +0800
From: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
To: "Cyril Hrubis" <chrubis@suse.cz>, 
	mdoucha <mdoucha@suse.cz>
References: <20210127115606.28985-1-mdoucha@suse.cz>, 
 <YBFWrJoS1tVmWGFx@yuki.lan>
X-Priority: 3
X-GUID: F63FCF95-606F-4B6D-A99E-1EEB70627C64
X-Has-Attach: no
X-Mailer: Foxmail 7.2.18.111[cn]
Mime-Version: 1.0
Message-ID: <2021012720143348660139@chinatelecom.cn>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Fix tst_pollute_memory() safety margin for huge
 systems
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
Content-Type: multipart/mixed; boundary="===============1395757874=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.

--===============1395757874==
Content-Type: multipart/alternative;
	boundary="----=_001_NextPart272137148161_=----"

This is a multi-part message in MIME format.

------=_001_NextPart272137148161_=----
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

QWNjb3JkaW5nIG15IHRlc3QsbWFsbG9jIGFtb3VudCBncmVhdGVyIHRoYW4gYXZhaWxhYmxlIG1l
bW9yeSx0aGVuIGludm9rZSB0aGUgb29tLWtpbGxlci4NCiNtYW4gZnJlZSAgDQpFc3RpbWF0aW9u
IG9mIGhvdyBtdWNoIG1lbW9yeSBpcyBhdmFpbGFibGUgZm9yIHN0YXJ0aW5nIG5ldyBhcHBsaWNh
dGlvbnMsIHdpdGhvdXQgc3dhcHBpbmcuDQoNCiAgICBbcm9vdEBsaXV4cCBteXdvcmtdIyBoZWFk
IC9wcm9jL21lbWluZm8NCiAgICBNZW1Ub3RhbDogICAgICAgMTk4MTAxNzQ0IGtCDQogICAgTWVt
RnJlZTogICAgICAgIDE4OTMwMzE0OCBrQg0KICAgIE1lbUF2YWlsYWJsZTogICAxODg1NjY3MzIg
a0INCg0KU2V0IHNhZmV0eSBtYXJnaW4gdG8gbGFyZ2VyIHZhbHVlLCBtYXkgYmUgbm90IHNlbnNp
YmxlLg0KDQpGcm9tOiBDeXJpbCBIcnViaXMNCkRhdGU6IDIwMjEtMDEtMjcgMjA6MDMNClRvOiBN
YXJ0aW4gRG91Y2hhDQpDQzogbGl1eHAxMTsgbHRwDQpTdWJqZWN0OiBSZTogW0xUUF0gW1BBVENI
XSBGaXggdHN0X3BvbGx1dGVfbWVtb3J5KCkgc2FmZXR5IG1hcmdpbiBmb3IgaHVnZSBzeXN0ZW1z
DQpIaSENCkFjdHVhbGx5IEkndmUgYmVlbiB0aGlua2luZyBhYm91dCB0aGlzIG9uZSBhbmQgc2lu
Y2UgdGhpcyBpcyBhIHN0cmljdGx5DQpiZXN0IGVmZm9ydCBhY3Rpb24gSSB0aGluayB3ZSBzaG91
bGQgYmUgbW9yZSBhZ2dyZXNzaXZlIGFib3V0IHRoZSBzYWZldHkNCm1hcmdpbi4NCiANCkkgYWxz
byBzdGFydGVkIHRvIHRhbGsgdG8ga2VybmVsIGRldmVsb3BlcnMgYWJvdXQgdGhpcyBhbmQgZ2Vu
ZXJhbGx5DQphYm91dCB0ZXN0cyB0aGF0IHRyeSB0byBhbGxvY2F0ZSBtYXhpbWFsIGFtb3VudCBv
ZiBtZW1vcnkgd2l0aG91dA0KdHJpZ2dlcmluZyBPT00gc2luY2Ugd2UgaGF2ZSBhIGZldyBpbiB0
aGUgdHJlZS4gSSB3aWxsIHNlbmQgdGhlIHJlc3VsdHMNCm9mIHRoaXMgZGlzY3Vzc2lvbiBvbmNl
IEkgaGF2ZSBhbnkgaGVyZSBhcyB3ZWxsLg0KIA0KLS0gDQpDeXJpbCBIcnViaXMNCmNocnViaXNA
c3VzZS5jeg0K

------=_001_NextPart272137148161_=----
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DISO-8859-1"><style>body { line-height: 1.5; }blockquote { margin-top: =
0px; margin-bottom: 0px; margin-left: 0.5em; }body { font-size: 14px; font=
-family: 'Microsoft YaHei UI'; color: rgb(0, 0, 0); line-height: 1.5; }</s=
tyle></head><body>=0A<div><span></span>According my test,malloc amount gre=
ater than available memory,then invoke the oom-killer.</div><div>#man free=
 &nbsp;</div><div><b style=3D"background-color: rgb(204, 232, 207);">Estim=
ation of how much memory is available for starting new applications, witho=
ut swapping.</b></div><div><br></div><div><div style=3D"background-color: =
rgb(204, 232, 207);">&nbsp; &nbsp; [root@liuxp mywork]# head /proc/meminfo=
</div><div style=3D"background-color: rgb(204, 232, 207);">&nbsp; &nbsp; M=
emTotal: &nbsp; &nbsp; &nbsp; 198101744 kB</div><div style=3D"background-c=
olor: rgb(204, 232, 207);">&nbsp; &nbsp; MemFree: &nbsp; &nbsp; &nbsp; &nb=
sp;189303148 kB</div><div style=3D"background-color: rgb(204, 232, 207);">=
&nbsp; &nbsp; MemAvailable: &nbsp; 188566732 kB</div></div>=0A<blockquote =
style=3D"margin-Top: 0px; margin-Bottom: 0px; margin-Left: 0.5em; margin-R=
ight: inherit"><div><br></div><div><span style=3D"color: rgb(63, 70, 77); =
font-family: 'Microsoft YaHei UI', Tahoma; font-size: 16px; font-weight: b=
old; line-height: 24px; background-color: rgb(219, 226, 232);">Set safety&=
nbsp;margin to larger value, may be not sensible.</span></div><div><br></d=
iv><div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt =
0cm 0cm 0cm"><div style=3D"PADDING-RIGHT: 8px; PADDING-LEFT: 8px; FONT-SIZ=
E: 12px;FONT-FAMILY:tahoma;COLOR:#000000; BACKGROUND: #efefef; PADDING-BOT=
TOM: 8px; PADDING-TOP: 8px"><div><b>From:</b>&nbsp;<a href=3D"mailto:chrub=
is@suse.cz">Cyril Hrubis</a></div><div><b>Date:</b>&nbsp;2021-01-27&nbsp;2=
0:03</div><div><b>To:</b>&nbsp;<a href=3D"mailto:mdoucha@suse.cz">Martin D=
oucha</a></div><div><b>CC:</b>&nbsp;<a href=3D"mailto:liuxp11@chinatelecom=
.cn">liuxp11</a>; <a href=3D"mailto:ltp@lists.linux.it">ltp</a></div><div>=
<b>Subject:</b>&nbsp;Re: [LTP] [PATCH] Fix tst_pollute_memory() safety mar=
gin for huge systems</div></div></div><div><div>Hi!</div>=0A<div>Actually =
I've been thinking about this one and since this is a strictly</div>=0A<di=
v>best effort action I think we should be more aggressive about the safety=
</div>=0A<div>margin.</div>=0A<div>&nbsp;</div>=0A<div>I also started to t=
alk to kernel developers about this and generally</div>=0A<div>about tests=
 that try to allocate maximal amount of memory without</div>=0A<div>trigge=
ring OOM since we have a few in the tree. I will send the results</div>=0A=
<div>of this discussion once I have any here as well.</div>=0A<div>&nbsp;<=
/div>=0A<div>-- </div>=0A<div>Cyril Hrubis</div>=0A<div>chrubis@suse.cz</d=
iv>=0A</div></blockquote>=0A</body></html>
------=_001_NextPart272137148161_=------


--===============1395757874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1395757874==--

