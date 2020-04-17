Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F70F1ADC12
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 13:22:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3EB043C2ACE
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 13:22:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 20C353C2AB9
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 13:22:03 +0200 (CEST)
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 19695600B30
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 13:22:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Mime-Version:Message-ID:Subject:Date:From; bh=72s92
 1sx6MfqcKNM9BquS4hlr42bWKV0zsHiMJBgaCw=; b=nEL5ygLnadDfUknIFonyf
 DuuwLOrlS/U+uV++n2SDhekWsyFkm2CPOoy706rWORzDoTdK8MOsCo3kK/UfAz1A
 H1mq8z5MIuWcjBPkkMexfnQj+0qrfL0ZSokIgYUeyoJhvqjve3L9uSqVlLdNy9Ay
 dyRY1U9rq3sh19Y73A+M1E=
Received: from localhost (unknown [223.104.145.164])
 by smtp9 (Coremail) with SMTP id DcCowAB3glpUkZleVEHVAQ--.64S2;
 Fri, 17 Apr 2020 19:21:57 +0800 (CST)
Mime-Version: 1.0
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
Message-ID: 
Date: Fri, 17 Apr 2020 19:21:55 +0800 (GMT+08:00)
From: =?UTF-8?B?eHV5YW5nX2p5XzA0MTBAMTYzLmNvbQ==?=<xuyang_jy_0410@163.com>
To: =?UTF-8?B?TGkgV2FuZw==?=<liwang@redhat.com>,
 =?UTF-8?B?WWFuZyBYdQ==?=<xuyang2018.jy@cn.fujitsu.com>
X-CM-TRANSID: DcCowAB3glpUkZleVEHVAQ--.64S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF15Zw1kXr1kWr45Jr1UJrb_yoW8Gw1Dpr
 WxWrnIkrs3Jr1UXwn7ury7KF97A3y3GryUXF15Gry0v3y5Xr92yF4vgF4fZ3WkZFn8ursF
 yFWSqF95GFWrXa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jU4SrUUUUU=
X-Originating-IP: [223.104.145.164]
X-CM-SenderInfo: p0x1t05jbm5saquriqqrwthudrp/1tbiyhMJhFQHH96n4AABsA
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_EXCESS_BASE64,
 FROM_MISSP_FREEMAIL,HTML_MESSAGE,MIME_BASE64_TEXT,MIME_HTML_MOSTLY,
 MPART_ALT_DIFF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/3] syscalls/pipe2_03: Add new test for pipe2
 O_DIRECT flag
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
Cc: =?UTF-8?B?TFRQIExpc3Q=?= <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1961175413=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1961175413==
Content-Type: multipart/alternative; 
	boundary="----=_Part_0_251011615.1587122516353"

------=_Part_0_251011615.1587122516353
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: base64


------=_Part_0_251011615.1587122516353
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IaSBMaSZuYnNwOzwvZGl2PjxkaXY+dGhlIHNpbXBsZXN0IHdheSBpcyBtZXJnZSB0aGUg
c2FmZSBtYWNyb++8jCB0aGVuIG1lcmdlIG15IHRocmVlIHBhdGNoZXPvvIxhdCBsYXN0IG1lcmdl
IG5vbiBibG9jayB0ZXN0KHVzZSBwaXBlMl8wNCnvvIxvdGhlcndpc2XvvIxpdCB3aWxsIGNvbmZs
aWN0cyBpbiBzeXNjYWxscyBvciAuZ2l0bm9yZS4gQnV0IG15IGNhc2VzIHNob3VsZCBiZSByZXZp
ZXdlZO+8jG1heWJlIG5lZWQgdjQuIFNvIHlvdSBjYW4gbWVyZ2UgYXMgeW91ciB0aG91Z2h0c++8
jCBJIGFtIGFsbCBvay48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkJlc3QgUmVnYXJkczwvZGl2
PjxkaXY+WWFuZyBYdTwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PCEtLWVtcHR5c2lnbi0tPjwv
ZGl2PjxkaXY+PGRpdiBzdHlsZT0iZm9udC1zaXplOjEycHg7cGFkZGluZzoycHggMDsiPi0tLU9y
aWdpbmFsLS0tPC9kaXY+PGRpdiBzdHlsZT0iZm9udC1zaXplOjEycHg7YmFja2dyb3VuZDojZjBm
MGYwO2NvbG9yOiMyMTIxMjE7cGFkZGluZzo4cHghaW1wb3J0YW50O2JvcmRlci1yYWRpdXM6NHB4
O2xpbmUtaGVpZ2h0OjEuNTsiPjxkaXY+PGI+RnJvbTo8L2I+ICJMaSBXYW5nIiZsdDtsaXdhbmdA
cmVkaGF0LmNvbSZndDs8L2Rpdj48ZGl2PjxiPkRhdGU6PC9iPiBGcmksIEFwciAxNywgMjAyMCAx
ODo1MCBQTTwvZGl2PjxkaXY+PGI+VG86PC9iPiAiWWFuZyBYdSImbHQ7eHV5YW5nMjAxOC5qeUBj
bi5mdWppdHN1LmNvbSZndDs7PC9kaXY+PGRpdj48Yj5DYzo8L2I+ICJMVFAgTGlzdCImbHQ7bHRw
QGxpc3RzLmxpbnV4Lml0Jmd0Ozs8L2Rpdj48ZGl2PjxiPlN1YmplY3Q6PC9iPiBSZTogW0xUUF0g
W1BBVENIIHYzIDMvM10gc3lzY2FsbHMvcGlwZTJfMDM6IEFkZCBuZXcgdGVzdCBmb3IgcGlwZTIg
T19ESVJFQ1QgZmxhZzwvZGl2PjwvZGl2Pjxicj48ZGl2IGRpcj0ibHRyIj48ZGl2IGRpcj0ibHRy
Ij48ZGl2IGNsYXNzPSJnbWFpbF9kZWZhdWx0IiBzdHlsZT0iZm9udC1zaXplOnNtYWxsIj48YnI+
PC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBj
bGFzcz0iZ21haWxfYXR0ciI+T24gRnJpLCBBcHIgMTcsIDIwMjAgYXQgNjoxMyBQTSBMaSBXYW5n
ICZsdDs8YSBocmVmPSJtYWlsdG86bGl3YW5nQHJlZGhhdC5jb20iPmxpd2FuZ0ByZWRoYXQuY29t
PC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIg
c3R5bGU9ImJvcmRlci1sZWZ0OiAxcHggc29saWQgcmdiKDIwNCwgMjA0LCAyMDQpOyBtYXJnaW46
IDBweCAwcHggMHB4IDcuMTg1MTZweDsgcGFkZGluZzogMTRweCAxNnB4IDE0cHggOC45ODE0NXB4
OyBjb2xvcjogcmdiKDE0OSwgMTQ5LCAxNDkpOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjQ1LCAy
NDYsIDI1MCk7Ij48ZGl2IGRpcj0ibHRyIj48ZGl2IGRpcj0ibHRyIj48ZGl2IHN0eWxlPSJmb250
LXNpemU6c21hbGwiPjxicj48L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUi
PjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBGcmksIEFwciAxNywgMjAyMCBh
dCA1OjU2IFBNIFlhbmcgWHUgJmx0OzxhIGhyZWY9Im1haWx0bzp4dXlhbmcyMDE4Lmp5QGNuLmZ1
aml0c3UuY29tIiB0YXJnZXQ9Il9ibGFuayI+eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbTwv
YT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0
eWxlPSJib3JkZXItbGVmdDogMXB4IHNvbGlkIHJnYigyMDQsIDIwNCwgMjA0KTsgbWFyZ2luOiAw
cHggMHB4IDBweCA3LjE4NTE2cHg7IHBhZGRpbmc6IDE0cHggMTZweCAxNHB4IDguOTgxNDVweDsg
Y29sb3I6IHJnYigxNDksIDE0OSwgMTQ5KTsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI0NSwgMjQ2
LCAyNTApOyI+SGkgTGk8YnI+Cjxicj4KJmd0OyBIaSBYdSw8YnI+CiZndDsgPGJyPgomZ3Q7IEkg
ZmVlbCBjb25mdXNlZCB0aGF0IGlzIHRoaXMgdGVzdCBkdXBsaWNhdGVkIHdpdGggdGhlIG9uZSBM
YW5pZSdzIDxicj4KJmd0OyBwYXRjaDIvMj8gd2h5IHVzaW5nIHRoZSBzYW1lIHRlc3QgbmFtZT88
YnI+Ck15IHBpcGUyXzAzLmMgaXMgdG8gdGVzdCBPX0RJUkVDVCBmbGFnLCBMYW5pZSdzIHBhdGNo
IGlzIHRvIHRlc3QgPGJyPgpPX05PTkJMT0NLIGZsYWcgYXMgbXkgcGVyaXZvdXMgZW1haWwgc2Fp
ZCwgc2VlWzFdLjxicj4KPGJyPgpJIGRvbid0IHRoaW5rIGl0IGlzIGEgcHJvYmxlbShJIG5lZWQg
dG8gZ2VuZXJhdGUgcGF0Y2gtc2V0LCBzbyBuYW1lZCA8YnI+CnBpcGUyXzAzLmMgaXMgYmV0dGVy
KS48YnI+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+PGRpdiBzdHlsZT0iZm9udC1z
aXplOnNtYWxsIj5CdXQgdGhhdCB3aWxsIGNhdXNlIGdpdCBwYXRjaCBjb25maWxpY3Rpb24mbmJz
cDtiZWNhc3VlJm5ic3A7c2FtZSBmaWxlIG5hbWUsIGlzbid0IGl0PzwvZGl2PjwvZGl2PjxkaXYg
c3R5bGU9ImZvbnQtc2l6ZTpzbWFsbCI+SSdtIGdvaW5nIHRvIGFwcGx5IExhbmllJ3MgdHdvIHBh
dGNoZXMobW9kaWZpZWQgb24gdGhlIGdpdC52MyksIGFuZCBvbmNlIGl0IGRvbmUsIHlvdXIgcGF0
Y2ggd2lsbCBicm9rZW4gb24gZ2l0IGNvbmZpbGljdGlvbi48L2Rpdj48L2Rpdj48ZGl2Pjxicj48
L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxf
ZGVmYXVsdCIgc3R5bGU9ImZvbnQtc2l6ZTpzbWFsbCI+T25lIGZlYXNpYmxlIHdheSBpcyB0aGF0
IEkgaGVscCB0byByZW5hbWUgJm5ic3A7TGFuaWUncyAgcGlwZTJfMDMuYyB0byBwaXBlMl8wNC5j
IGFuZCBhcHBseSB0aGUgcGF0Y2hlcyZuYnNwO2ZpcnN0LCB0aGVuIHlvdSBkbyByZWJhc2UgeW91
ciBjb2RlcyBvbiB0aGUgbGF0ZXN0Jm5ic3A7Y29tbWl0LiBJcyB0aGF0IE9LIGZvciB5b3U/PC9k
aXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+LS0gPGJyPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFp
bF9zaWduYXR1cmUiPjxkaXYgZGlyPSJsdHIiPjxkaXY+UmVnYXJkcyw8YnI+PC9kaXY+PGRpdj5M
aSBXYW5nPGJyPjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PgoKPC9kaXY+
------=_Part_0_251011615.1587122516353--


--===============1961175413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1961175413==--

