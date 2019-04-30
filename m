Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC61F206
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 10:31:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C81803EACAD
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 10:31:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id D82323EACA1
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 10:31:02 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F1AF720117A
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 10:31:01 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 09F75C05D275
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 08:31:00 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73B136C52C;
 Tue, 30 Apr 2019 08:30:57 +0000 (UTC)
Date: Tue, 30 Apr 2019 16:30:56 +0800
From: Murphy Zhou <xzhou@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190430083056.b6q2p6yzqbp2q6fm@XZHOUW.usersys.redhat.com>
References: <20190430071446.13716-1-xzhou@redhat.com>
 <CAEemH2c0FYg+WoCJfzWmaUiANE3pcpdXT2fHVGXsL_qnRJUn+A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2c0FYg+WoCJfzWmaUiANE3pcpdXT2fHVGXsL_qnRJUn+A@mail.gmail.com>
User-Agent: NeoMutt/20180716-1400-f2a658
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 30 Apr 2019 08:31:00 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] syscalls/swapon02: Do not fail on overlayfs
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMDQ6MTQ6MjNQTSArMDgwMCwgTGkgV2FuZyB3cm90ZToK
PiBPbiBUdWUsIEFwciAzMCwgMjAxOSBhdCAzOjIxIFBNIE11cnBoeSBaaG91IDx4emhvdUByZWRo
YXQuY29tPiB3cm90ZToKPiAKPiA+IEN1cnJlbnRseSBzd2FwZmlsZXMgb24gT3ZlcmxheWZzIGFy
ZSBub3Qgc3VwcG9ydGVkLgo+ID4KPiA+IFNvIGlmIHdlIGFyZSBvbiBvdmVybGF5ZnMgYW5kIHdl
IGdldCBFSU5WQUwgZnJvbSBzd2Fwb24oKSB3ZSByZXR1cm4gVENPTkYuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogTXVycGh5IFpob3UgPHh6aG91QHJlZGhhdC5jb20+Cj4gPiAtLS0KPiA+ICB0ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9zd2Fwb24wMi5jIHwgNSArKysrKwo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDIuYwo+ID4gYi90ZXN0Y2FzZXMva2Vy
bmVsL3N5c2NhbGxzL3N3YXBvbi9zd2Fwb24wMi5jCj4gPiBpbmRleCA0YWY1MTA1YzYuLjIxMWNk
ZmM0ZSAxMDA2NDQKPiA+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL3N3
YXBvbjAyLmMKPiA+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBv
bjAyLmMKPiA+IEBAIC04Niw2ICs4NiwxMSBAQCBzdGF0aWMgdm9pZCB2ZXJpZnlfc3dhcG9uKHN0
cnVjdCB0ZXN0X2Nhc2VfdCAqdGVzdCkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
bjsKPiA+ICAgICAgICAgfQo+ID4KPiA+ICsgICAgICAgaWYgKGZzX3R5cGUgPT0gVFNUX09WRVJM
QVlGU19NQUdJQyAmJiBlcnJubyA9PSBFSU5WQUwpIHsKPiA+ICsgICAgICAgICAgICAgICB0c3Rf
cmVzbShUQ09ORiwgIlN3YXBmaWxlIG9uIG92ZXJsYXlmcyBub3QgaW1wbGVtZXRlZCIpOwo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKyAgICAgICB9Cj4gPgo+IAo+IFRo
ZSBjb2RlIGxvb2tzIGNvcnJlY3QuCj4gCj4gQnV0IGl0IGFscmVhZHkgaGFzIGEgdGVzdCBza2lw
cGluZyBmb3IgQlRSRlMsIGlzIHRoZXJlIGFueSBwb3NzaWJpbGl0eSB0bwo+IGNvbWJpbmUgdGhl
c2UgZmlsZXN5c3RlbXMgY2hlY2sgdG9nZXRoZXI/CgpHb29kIGlkZWF+ICBTZW5kaW5nIFYyLgoK
VGhhbnNrIQpNCgo+IAo+IAo+ID4gKwo+ID4gICAgICAgICB0c3RfcmVzbShURkFJTCwgInN3YXBv
bigyKSBmYWlsZWQgdG8gcHJvZHVjZSBleHBlY3RlZCBlcnJvcjoiCj4gPiAgICAgICAgICAgICAg
ICAgICIgJWQsIGVycm5vOiAlcyBhbmQgZ290ICVkLiIsIHRlc3QtPmV4cF9lcnJubywKPiA+ICAg
ICAgICAgICAgICAgICAgdGVzdC0+ZXhwX2VycnZhbCwgVEVTVF9FUlJOTyk7Cj4gPiAtLQo+ID4g
Mi4yMS4wCj4gPgo+ID4KPiA+IC0tCj4gPiBNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0
cy5saW51eC5pdC9saXN0aW5mby9sdHAKPiA+Cj4gCj4gCj4gLS0gCj4gUmVnYXJkcywKPiBMaSBX
YW5nCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGlu
Zm8vbHRwCg==
