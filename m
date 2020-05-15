Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4688A1D443D
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 06:07:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9C0C23C543D
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 06:07:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 73F943C104B
 for <ltp@lists.linux.it>; Fri, 15 May 2020 06:07:01 +0200 (CEST)
Received: from m12-18.163.com (m12-18.163.com [220.181.12.18])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2C793100172B
 for <ltp@lists.linux.it>; Fri, 15 May 2020 06:06:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Mime-Version:Message-ID:Subject:Date:From; bh=VoH6R
 4CPkDMSMSowzpqtLyxUf3em3s7icOreYDctuBo=; b=bvxYpVPzx/MVFypsSJevs
 fbDUMG/cG6p4xJQrxnMdJxQ7EDFOlgc6C55nsS/XOUs0+76E0+QcDPv/E5Mmm1jy
 3FPE9VvQ4vxHDNaS9IKnbULVikmhkjKZ1BNO/WDH4F8PmGMIxW1f0qO7nueyATq0
 nA61UDdy56GPJCDZHaxHEc=
Received: from localhost (unknown [117.136.66.47])
 by smtp14 (Coremail) with SMTP id EsCowABnb_dbFb5e+BBABw--.42621S2;
 Fri, 15 May 2020 12:06:52 +0800 (CST)
Mime-Version: 1.0
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
Message-ID: 
Date: Fri, 15 May 2020 12:06:50 +0800 (GMT+08:00)
From: =?UTF-8?B?eHV5YW5nX2p5XzA0MTBAMTYzLmNvbQ==?=<xuyang_jy_0410@163.com>
To: =?UTF-8?B?TGkgV2FuZw==?=<liwang@redhat.com>,
 =?UTF-8?B?Q3lyaWwgSHJ1Ymlz?=<chrubis@suse.cz>,
 =?UTF-8?B?WWFuZyBYdQ==?=<xuyang2018.jy@cn.fujitsu.com>
X-CM-TRANSID: EsCowABnb_dbFb5e+BBABw--.42621S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4UKry8tF4kXr17KF1DAwb_yoW8Wr1UpF
 Z3Wan8KrZ5J343ArZ2gF4xtFyvvw47A39xXr1S9r43AF98ArySyFy8KwsYvrWqyr4Sqa10
 qr18WrWruF18ZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UNqXdUUUUU=
X-Originating-IP: [117.136.66.47]
X-CM-SenderInfo: p0x1t05jbm5saquriqqrwthudrp/1tbiXB4lhFXlv2URLwAAs3
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_EXCESS_BASE64,
 FROM_MISSP_FREEMAIL,HTML_MESSAGE,MIME_BASE64_TEXT,MIME_HTML_MOSTLY,
 MPART_ALT_DIFF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] LTP release
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
Content-Type: multipart/mixed; boundary="===============0894713376=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0894713376==
Content-Type: multipart/alternative; 
	boundary="----=_Part_0_75926543.1589515610931"

------=_Part_0_75926543.1589515610931
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: base64


------=_Part_0_75926543.1589515610931
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IaSBMaSZuYnNwOzwvZGl2PjxkaXY+Q2FuIHdlIHB1dCB0aGVzZSBhdHRhY2ggYW5kIGRp
c2F0dGFjaCBzdGVwcyBpbnRvIHZlcmlmeSBmdW5jdGlvbiBsaWtlIGlvY3RsX2xvb3AgMDQuYyBk
b2Vz77yfJm5ic3A7PC9kaXY+PGRpdj5CZXN0IFJlZ2FyZHM8L2Rpdj48ZGl2PllhbmcgWHU8L2Rp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PjwhLS1lbXB0eXNpZ24tLT48L2Rpdj48ZGl2PjxkaXYgc3R5
bGU9ImZvbnQtc2l6ZToxMnB4O3BhZGRpbmc6MnB4IDA7Ij4tLS1PcmlnaW5hbC0tLTwvZGl2Pjxk
aXYgc3R5bGU9ImZvbnQtc2l6ZToxMnB4O2JhY2tncm91bmQ6I2YwZjBmMDtjb2xvcjojMjEyMTIx
O3BhZGRpbmc6OHB4IWltcG9ydGFudDtib3JkZXItcmFkaXVzOjRweDtsaW5lLWhlaWdodDoxLjU7
Ij48ZGl2PjxiPkZyb206PC9iPiAiTGkgV2FuZyImbHQ7bGl3YW5nQHJlZGhhdC5jb20mZ3Q7PC9k
aXY+PGRpdj48Yj5EYXRlOjwvYj4gRnJpLCBNYXkgMTUsIDIwMjAgMTE6MzcgQU08L2Rpdj48ZGl2
PjxiPlRvOjwvYj4gIkN5cmlsIEhydWJpcyImbHQ7Y2hydWJpc0BzdXNlLmN6Jmd0OzsiWWFuZyBY
dSImbHQ7eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbSZndDs7PC9kaXY+PGRpdj48Yj5DYzo8
L2I+ICJMVFAgTGlzdCImbHQ7bHRwQGxpc3RzLmxpbnV4Lml0Jmd0Ozs8L2Rpdj48ZGl2PjxiPlN1
YmplY3Q6PC9iPiBSZTogW0xUUF0gTFRQIHJlbGVhc2U8L2Rpdj48L2Rpdj48YnI+PGRpdiBkaXI9
Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU9ImZv
bnQtc2l6ZTpzbWFsbCI+SGkmbmJzcDtDeXJpbCw8L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZh
dWx0IiBzdHlsZT0iZm9udC1zaXplOnNtYWxsIj48YnI+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxf
ZGVmYXVsdCIgc3R5bGU9ImZvbnQtc2l6ZTpzbWFsbCI+SSBoYXZlIGZpbmlzaGVkIHRoZSBsYXRl
c3QgTFRQIHRlc3QgYXJvdW5kIFJIRUw3LzggYW5kIG1haW5saW5lIGtlcm5lbCBhY3Jvc3MgYXJj
aGVzLiBBcGFydCZuYnNwO2Zyb20gbWFueSBrbm93biBpc3N1ZXMvYnVncyB0aGUgdGVzdCBsb29r
cyBnb29kLjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2RlZmF1bHQiIHN0eWxlPSJmb250LXNpemU6
c21hbGwiPjxicj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZhdWx0IiBzdHlsZT0iZm9udC1z
aXplOnNtYWxsIj5UaGUgb25seSBmYWlsdXJlIHRvJm5ic3A7Y2F0Y2ggbXkgYXR0ZW50aW9uJm5i
c3A7aXMgdGhlJm5ic3A7aW9jdGxfbG9vcDA1IHN0aWxsIGdldHRpbmcgZmFpbCBvbiBzMzkweCB3
aXRoIFJIRUw4LjIgb3Iga2VybmVsLXY1LjctcmM1LiBJIGhhdmVuJ3QgZGlnIGludG8gdGhlIGRl
dGFpbHMgc2luY2UgaXQgbG9va3MgaW5zaWduaWZpY2FudC4mbmJzcDs8L2Rpdj48ZGl2IGNsYXNz
PSJnbWFpbF9kZWZhdWx0IiBzdHlsZT0iZm9udC1zaXplOnNtYWxsIj48YSBjbGFzcz0iZ21haWxf
cGx1c3JlcGx5IiBpZD0icGx1c1JlcGx5Q2hpcC0wIiBocmVmPSJtYWlsdG86eHV5YW5nMjAxOC5q
eUBjbi5mdWppdHN1LmNvbSIgdGFiaW5kZXg9Ii0xIj5AWWFuZyBYdTwvYT4mbmJzcDtYdSwgZG8g
eW91IGhhdmUgYW55IGlkZWEgYWJvdXQgdGhhdD88YnI+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxf
ZGVmYXVsdCIgc3R5bGU9ImZvbnQtc2l6ZTpzbWFsbCI+PGJyPjwvZGl2PjxkaXYgY2xhc3M9Imdt
YWlsX2RlZmF1bHQiIHN0eWxlPSJmb250LXNpemU6c21hbGwiPiMgLi9pb2N0bF9sb29wMDUgPGJy
PnRzdF90ZXN0LmM6MTI0NjogSU5GTzogVGltZW91dCBwZXIgcnVuIGlzIDBoIDA1bSAwMHM8YnI+
dHN0X2RldmljZS5jOjg4OiBJTkZPOiBGb3VuZCBmcmVlIGRldmljZSAwICcvZGV2L2xvb3AwJzxi
cj5pb2N0bF9sb29wMDUuYzoxMTY6IElORk86IC9kZXYvbG9vcDAgZGVmYXVsdCBsb2dpY2FsX2Js
b2NrX3NpemUgaXMgNTEyPGJyPmlvY3RsX2xvb3AwNS5jOjYyOiBJTkZPOiBXaXRob3V0IHNldHRp
bmcgbG9fb2Zmc2V0IG9yIHNpemVsaW1pdDxicj5pb2N0bF9sb29wMDUuYzo2MzogQlJPSzogaW9j
dGwoMyxMT09QX1NFVF9ESVJFQ1RfSU8sLi4uKSBmYWlsZWQ6IEVJTlZBTCAoMjIpPGJyPjwvZGl2
PjxkaXYgY2xhc3M9ImdtYWlsX2RlZmF1bHQiIHN0eWxlPSJmb250LXNpemU6c21hbGwiPjxicj48
L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNs
YXNzPSJnbWFpbF9hdHRyIj5PbiBUaHUsIE1heSAxNCwgMjAyMCBhdCA1OjU0IFBNIEN5cmlsIEhy
dWJpcyAmbHQ7PGEgaHJlZj0ibWFpbHRvOmNocnViaXNAc3VzZS5jeiIgdGFyZ2V0PSJfYmxhbmsi
PmNocnViaXNAc3VzZS5jejwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFz
cz0iZ21haWxfcXVvdGUiIHN0eWxlPSJib3JkZXItbGVmdDogMXB4IHNvbGlkIHJnYigyMDQsIDIw
NCwgMjA0KTsgbWFyZ2luOiAwcHggMHB4IDBweCA3LjE4NTE2cHg7IHBhZGRpbmc6IDE0cHggMTZw
eCAxNHB4IDguOTgxNDVweDsgY29sb3I6IHJnYigxNDksIDE0OSwgMTQ5KTsgYmFja2dyb3VuZC1j
b2xvcjogcmdiKDI0NSwgMjQ2LCAyNTApOyI+SGkhPGJyPgpUaGlzIGlzIGEgbGFzdCBjYWxsLCBp
ZiB5b3UgdGhpbmsgdGhhdCBzb21ldGhpbmcgaGFzIHRvIGJlIGluY2x1ZGVkIGluPGJyPgp0aGUg
cmVsZWFzZSBzcGVhayB1cCB0b2RheS48YnI+Cjxicj4KVGhlIGxhc3QgdGhpbmcgb24gbXkgcmFk
YXIgaXMgdGhlICJzeXNjYWxsczogRml4IGlzc3VlcyBhcm91bmQgY2FsbGluZzxicj4Kc3lzY2Fs
bHMgd2l0aCBvbGQgdGltZXNwZWMiIHBhdGNoIHRoYXQgc2hvdWxkIGdldCBpbiwgYWZ0ZXIgdGhh
dCBJIHdvdWxkPGJyPgpsaWtlIHRvIHByb2NlZWQgd2l0aCB0aGUgcmVsZWFzZS48YnI+Cjxicj4K
LS0gPGJyPgpDeXJpbCBIcnViaXM8YnI+CjxhIGhyZWY9Im1haWx0bzpjaHJ1YmlzQHN1c2UuY3oi
IHRhcmdldD0iX2JsYW5rIj5jaHJ1YmlzQHN1c2UuY3o8L2E+PGJyPgo8YnI+Ci0tIDxicj4KTWFp
bGluZyBsaXN0IGluZm86IDxhIGhyZWY9Imh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8v
bHRwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cDwvYT48YnI+Cjxicj4KPC9ibG9ja3F1b3RlPjwvZGl2PjxiciBjbGVh
cj0iYWxsIj48ZGl2Pjxicj48L2Rpdj4tLSA8YnI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0
ciI+PGRpdj5SZWdhcmRzLDxicj48L2Rpdj48ZGl2PkxpIFdhbmc8YnI+PC9kaXY+PC9kaXY+PC9k
aXY+PC9kaXY+Cgo8L2Rpdj4=
------=_Part_0_75926543.1589515610931--


--===============0894713376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0894713376==--

