Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6E21D4500
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 06:54:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B13C3C53C0
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 06:54:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 668893C2322
 for <ltp@lists.linux.it>; Fri, 15 May 2020 06:54:21 +0200 (CEST)
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 56DB61401A6E
 for <ltp@lists.linux.it>; Fri, 15 May 2020 06:54:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Mime-Version:Message-ID:Subject:Date:From; bh=dTPrn
 HKQp7g5x2gFzduFhkvD0otphO1LpUuwrH0l4VY=; b=NA1dsAWnmurU537Qrfegt
 8QwLwg3NWXNAODy1wIv+4kuri5S8GrEbvrJ3GdDbSNPrmNtSvXTP+/d6iFn9YGhJ
 4+dzpjSIgm09CcrsVa3tdLNy0UxcqAf+HW2oqiJEm70NxX4sGrinyMgxsc3YifP6
 5piENNNsuvpUR6DxWv9mso=
Received: from localhost (unknown [117.136.66.47])
 by smtp7 (Coremail) with SMTP id C8CowADn7s53IL5eHOX2Bg--.43311S2;
 Fri, 15 May 2020 12:54:16 +0800 (CST)
Mime-Version: 1.0
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
Message-ID: 
Date: Fri, 15 May 2020 12:54:13 +0800 (GMT+08:00)
From: =?UTF-8?B?eHV5YW5nX2p5XzA0MTBAMTYzLmNvbQ==?=<xuyang_jy_0410@163.com>
To: =?UTF-8?B?TGkgV2FuZw==?=<liwang@redhat.com>
X-CM-TRANSID: C8CowADn7s53IL5eHOX2Bg--.43311S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKryDXryrWrWrJF15Xr17GFg_yoW3twc_WF
 Z3Z34kW3yUtan3C34fAFsrZw13CFWrJrW3Aa4UKFs0vryfta17ZrZ0yasrCw1rJrZrKr17
 Aw4YgF45JF42kjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1LiSJUUUUU==
X-Originating-IP: [117.136.66.47]
X-CM-SenderInfo: p0x1t05jbm5saquriqqrwthudrp/1tbiQhglhFaD7Hk6-gAAs-
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_EXCESS_BASE64,
 FROM_MISSP_FREEMAIL,HTML_MESSAGE,MIME_BASE64_TEXT,MIME_HTML_MOSTLY,
 MPART_ALT_DIFF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1501244744=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1501244744==
Content-Type: multipart/alternative; 
	boundary="----=_Part_1_160692.1589518454651"

------=_Part_1_160692.1589518454651
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: base64


------=_Part_1_160692.1589518454651
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IaSBsaTwvZGl2PjxkaXY+U29ycnkgZm9yIHRoYXQuIEl0IG5lZWRzIG1vcmUgZGVidWcg
aW5mbyBpbiBrZXJuZWwuQ2FuIHlvdSBwcm92aWRlIHNvbWUgZG1lc2cgYW5kIHRlbGwgbWUgd2hh
dCBmaWxlc3lzdGVtIG9uIHlvdXIgdG1wZGly77yfIEFsc28gaWYgd2UgZW5hYmxlIGRpcmVjdCBp
byBpbiBzZXR1cO+8jGlzIGl0IHN1Y2Vzc2Z1bO+8nzwvZGl2PjxkaXY+QmVzdCBSZWdhcmRzPC9k
aXY+PGRpdj5ZYW5nIFh1PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48IS0tZW1wdHlzaWduLS0+
PC9kaXY+PGRpdj48ZGl2IHN0eWxlPSJmb250LXNpemU6MTJweDtwYWRkaW5nOjJweCAwOyI+LS0t
T3JpZ2luYWwtLS08L2Rpdj48ZGl2IHN0eWxlPSJmb250LXNpemU6MTJweDtiYWNrZ3JvdW5kOiNm
MGYwZjA7Y29sb3I6IzIxMjEyMTtwYWRkaW5nOjhweCFpbXBvcnRhbnQ7Ym9yZGVyLXJhZGl1czo0
cHg7bGluZS1oZWlnaHQ6MS41OyI+PGRpdj48Yj5Gcm9tOjwvYj4gIkxpIFdhbmciJmx0O2xpd2Fu
Z0ByZWRoYXQuY29tJmd0OzwvZGl2PjxkaXY+PGI+RGF0ZTo8L2I+IEZyaSwgTWF5IDE1LCAyMDIw
IDEyOjE2IFBNPC9kaXY+PGRpdj48Yj5Ubzo8L2I+ICJ4dXlhbmdfanlfMDQxMEAxNjMuY29tIiZs
dDt4dXlhbmdfanlfMDQxMEAxNjMuY29tJmd0Ozs8L2Rpdj48ZGl2PjxiPkNjOjwvYj4gIkxUUCBM
aXN0IiZsdDtsdHBAbGlzdHMubGludXguaXQmZ3Q7OyJDeXJpbCBIcnViaXMiJmx0O2NocnViaXNA
c3VzZS5jeiZndDs7IllhbmcgWHUiJmx0O3h1eWFuZzIwMTguanlAY24uZnVqaXRzdS5jb20mZ3Q7
OzwvZGl2PjxkaXY+PGI+U3ViamVjdDo8L2I+IFJlOiBbTFRQXSBMVFAgcmVsZWFzZTwvZGl2Pjwv
ZGl2Pjxicj48ZGl2IGRpcj0ibHRyIj48ZGl2IGRpcj0ibHRyIj48ZGl2IGNsYXNzPSJnbWFpbF9k
ZWZhdWx0IiBzdHlsZT0iZm9udC1zaXplOnNtYWxsIj48YnI+PC9kaXY+PC9kaXY+PGJyPjxkaXYg
Y2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24g
RnJpLCBNYXkgMTUsIDIwMjAgYXQgMTI6MDcgUE0gPGEgaHJlZj0ibWFpbHRvOnh1eWFuZ19qeV8w
NDEwQDE2My5jb20iPnh1eWFuZ19qeV8wNDEwQDE2My5jb208L2E+ICZsdDs8YSBocmVmPSJtYWls
dG86eHV5YW5nX2p5XzA0MTBAMTYzLmNvbSI+eHV5YW5nX2p5XzA0MTBAMTYzLmNvbTwvYT4mZ3Q7
IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJi
b3JkZXItbGVmdDogMXB4IHNvbGlkIHJnYigyMDQsIDIwNCwgMjA0KTsgbWFyZ2luOiAwcHggMHB4
IDBweCA3LjE4NTE2cHg7IHBhZGRpbmc6IDE0cHggMTZweCAxNHB4IDguOTgxNDVweDsgY29sb3I6
IHJnYigxNDksIDE0OSwgMTQ5KTsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI0NSwgMjQ2LCAyNTAp
OyI+PGRpdj5IaSBMaSZuYnNwOzwvZGl2PjxkaXY+Q2FuIHdlIHB1dCB0aGVzZSBhdHRhY2ggYW5k
IGRpc2F0dGFjaCBzdGVwcyBpbnRvIHZlcmlmeSBmdW5jdGlvbiBsaWtlIGlvY3RsX2xvb3AgMDQu
YyBkb2Vz77yfJm5ic3A7PC9kaXY+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+PGRp
diBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU9ImZvbnQtc2l6ZTpzbWFsbCI+SG93IGRvZXMg
dGhlIGF0dGFjaC9kZXRhY2ggZGV2aWNlIGNhdXNlIHRoZSBmYWlsdXJlPyZuYnNwOyBJIGFjdHVh
bGx5IHJ1biBpbnRvIHRoaXMgZmFpbHVyZSB3aXRob3V0IHBhcmFtZXRlciAiLWkiLjwvZGl2Pjwv
ZGl2PjxkaXY+Jm5ic3A7PC9kaXY+PC9kaXY+LS0gPGJyPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJn
bWFpbF9zaWduYXR1cmUiPjxkaXYgZGlyPSJsdHIiPjxkaXY+UmVnYXJkcyw8YnI+PC9kaXY+PGRp
dj5MaSBXYW5nPGJyPjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PgoKPC9kaXY+
------=_Part_1_160692.1589518454651--


--===============1501244744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1501244744==--

