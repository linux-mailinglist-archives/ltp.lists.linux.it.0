Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8292AC3CF
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 19:27:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 410693C538F
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 19:27:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 899EE3C2453
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 19:27:57 +0100 (CET)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F25FB6009F1
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 19:27:56 +0100 (CET)
X-Originating-IP: 78.113.208.212
Received: from kmaincent-XPS-13-7390 (212.208.113.78.rev.sfr.net
 [78.113.208.212]) (Authenticated sender: kory.maincent@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id BF6191C0002;
 Mon,  9 Nov 2020 18:27:55 +0000 (UTC)
Date: Mon, 9 Nov 2020 19:27:53 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20201109192753.70167ef1@kmaincent-XPS-13-7390>
In-Reply-To: <5de346c3-ccd6-743e-c83c-e16c592c7ac5@oracle.com>
References: <20201106143605.27230-1-kory.maincent@bootlin.com>
 <5de346c3-ccd6-743e-c83c-e16c592c7ac5@oracle.com>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] tcp_cmds/ping/ping02: Make it compatible with
 Busybox
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8gQWxleGV5LAoKVGhhbmsgZm9yIHlvdXIgZmVlZGJhY2suCgpPbiBNb24sIDkgTm92IDIw
MjAgMTQ6MDk6MjQgKzAzMDAKQWxleGV5IEtvZGFuZXYgPGFsZXhleS5rb2RhbmV2QG9yYWNsZS5j
b20+IHdyb3RlOgoKPiBPbiAwNi4xMS4yMDIwIDE3OjM2LCBLb3J5IE1haW5jZW50IHdyb3RlOgo+
ID4gVGhlIHBpbmcgZnJvbSBidXN5Ym94IGRvZXMgbm90IGhhdmUgLWYgcGFyYW1ldGVyLCB1c2Ug
LWkgcGFyYW1ldGVyIGluc3RlYWQuCj4gPiBCdXN5Qm94IGRvZXMgbm90IGFjY2VwdCBwYXR0ZXJu
IGxvbmdlciB0aGFuIDIgYnl0ZXMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEtvcnkgTWFpbmNl
bnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+Cj4gPiAtLS0KPiA+ICB0ZXN0Y2FzZXMvbmV0
d29yay90Y3BfY21kcy9waW5nL3BpbmcwMi5zaCB8IDQgKystLQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS90
ZXN0Y2FzZXMvbmV0d29yay90Y3BfY21kcy9waW5nL3BpbmcwMi5zaAo+ID4gYi90ZXN0Y2FzZXMv
bmV0d29yay90Y3BfY21kcy9waW5nL3BpbmcwMi5zaCBpbmRleCBlMGE2M2M1ZjYuLjI3ODRjODE2
MAo+ID4gMTAwNzU1IC0tLSBhL3Rlc3RjYXNlcy9uZXR3b3JrL3RjcF9jbWRzL3BpbmcvcGluZzAy
LnNoCj4gPiArKysgYi90ZXN0Y2FzZXMvbmV0d29yay90Y3BfY21kcy9waW5nL3BpbmcwMi5zaAo+
ID4gQEAgLTIwLDcgKzIwLDcgQEAgZG9fc2V0dXAoKQo+ID4gIAo+ID4gIGRvX3Rlc3QoKQo+ID4g
IHsKPiA+IC0JbG9jYWwgcGF0PSIwMDAxMDIwMzA0MDUwNjA3MDgwOTBhMGIwYzBkMGUwZiIKPiA+
ICsJbG9jYWwgcGF0PSJhYSIKPiA+ICAgIAo+IAo+IEhpIEtvcnksCj4gCj4gSSB0aGluayB3ZSBz
aG91bGQgcmVwbGFjZSB0aGUgb3B0aW9ucyBvbmx5IGlmIHBpbmcgZG9lc24ndCBzdXBwb3J0Cj4g
Jy1mJywgaS5lLiBzb21ldGhpbmcgbGlrZSBpbiB0aGUgZmlyc3QgdmVyc2lvbiBhbmQgdGhpcyBw
YXRjaDoKPiAKPiBsb2NhbCBwaW5nX29wdHM9Ii1mIC1wIDAwMDEwMjAzMDQwNTA2MDcwODA5MGEw
YjBjMGQwZTBmIgo+IGxvY2FsIGlwYWRkcj0kKHRzdF9pcGFkZHIgcmhvc3QpCj4gbG9jYWwgcwo+
IAo+ICRQSU5HIC1oIDI+JjEgfCBncmVwIC1xICdbLV1mJyB8fCBwaW5nX29wdHM9Ii1pIDAuMDEg
LXAgYWEiCgpUaGUgZ3JlcCBpbiBwYXJhbWV0ZXIgaXMgbm90IHdvcmtpbmcgZm9yIGFsbCBjYXNl
cy4KRm9yIGV4YW1wbGUgdGhlIHBpbmcgdXNhZ2Ugb2YgbXkgVWJ1bnR1IGxhcHRvcCBpczoKVXNh
Z2U6IHBpbmcgWy1hQWJCZERmaExuT3FyUlV2VjY0XSBbLWMgY291bnRdIFstaSBpbnRlcnZhbF0g
Wy1JIGludGVyZmFjZV0KICAgICAgICAgICAgWy1tIG1hcmtdIFstTSBwbXR1ZGlzY19vcHRpb25d
IFstbCBwcmVsb2FkXSBbLXAgcGF0dGVybl0gWy1RIHRvc10KICAgICAgICAgICAgWy1zIHBhY2tl
dHNpemVdIFstUyBzbmRidWZdIFstdCB0dGxdIFstVCB0aW1lc3RhbXBfb3B0aW9uXQogICAgICAg
ICAgICBbLXcgZGVhZGxpbmVdIFstVyB0aW1lb3V0XSBbaG9wMSAuLi5dIGRlc3RpbmF0aW9uCgoK
SSBtYXkgdXNlIHRlc3QgbGlrZSB0aGlzOgokUElORyAtYyAxIC1mICRpcGFkZHIgPi9kZXYvbnVs
bCAyPiYxIHx8IHBpbmdfb3B0cz0iLWkgMC4wMSAtcCBhYSIKCldoYXQgZG8geW91IHRoaW5rPwoK
UmVnYXJkcywKCj4gCj4gZm9yIHMgaW4gJFBBQ0tFVFNJWkVTOyBkbwo+IAlFWFBFQ1RfUEFTUyAk
UElORyAtYyAkQ09VTlQgLXMgJHMgJGlwYWRkciAkcGluZ19vcHRzIFw+L2Rldi9udWxsCj4gZG9u
ZQo+IAo+IAo+ID4gIAl0c3RfcmVzIFRJTkZPICJmbG9vZCAkUElORzogSUNNUCBwYWNrZXRzIGZp
bGxlZCB3aXRoIHBhdHRlcm4KPiA+ICckcGF0JyIgCj4gPiBAQCAtMjgsNyArMjgsNyBAQCBkb190
ZXN0KCkKPiA+ICAJbG9jYWwgcwo+ID4gIAo+ID4gIAlmb3IgcyBpbiAkUEFDS0VUU0laRVM7IGRv
Cj4gPiAtCQlFWFBFQ1RfUEFTUyAkUElORyAtYyAkQ09VTlQgLWYgLXMgJHMgJGlwYWRkciAtcCAi
JHBhdCIKPiA+IFw+L2Rldi9udWxsCj4gPiArCQlFWFBFQ1RfUEFTUyAkUElORyAtYyAkQ09VTlQg
LWkgMC4wMDEgLXMgJHMgJGlwYWRkciAtcAo+ID4gIiRwYXQiIFw+L2Rldi9udWxsIGRvbmUKPiA+
ICB9Cj4gPiAgCj4gPiAgIAo+IAoKCgotLSAKS8O2cnkgTWFpbmNlbnQsIEJvb3RsaW4KRW1iZWRk
ZWQgTGludXggYW5kIGtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgotLSAK
TWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
