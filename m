Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DE042EE18A
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 14:51:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5567D3C24E0
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 14:51:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 2B2A13C240A
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 14:51:44 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 83D4A200DAA
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 14:51:42 +0100 (CET)
Received: from localhost (unknown [62.119.166.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F075821744;
 Mon,  4 Nov 2019 13:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572875499;
 bh=RMjBbcJSX/BFL942aPuRy8u04vdxeLErter4JodBkgs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wa5OwO9yWDZ+m4tm147ehFCtVz7pQqLDS8HUpuWjPiRxj5UUWjwSgI5Zh4aPtG1p0
 fvUXZ6Xvt7EQIBzrtiCcJYqhCdOg8zkaDKYXzdQCZVGt4gen9SegcAhX8f+TPsY5Tf
 1m3LhVVTmtXL0lOqeuRoL+WQxbqLJ/lSalfZtklg=
Date: Mon, 4 Nov 2019 14:51:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191104135135.GA2162401@kroah.com>
References: <cki.1210A7ECB0.BD9Q3APV4K@redhat.com>
 <2029139028.10333037.1572874551626.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2029139028.10333037.1572874551626.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E3?=
 =?utf-8?q?=2E9-rc1-dfe283e=2Ecki_=28stable=29?=
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
Cc: alsa-devel@alsa-project.org, Memory Management <mm-qe@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>,
 Jaroslav Kysela <jkysela@redhat.com>, CKI Project <cki-project@redhat.com>,
 LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMDg6MzU6NTFBTSAtMDUwMCwgSmFuIFN0YW5jZWsgd3Jv
dGU6Cj4gCj4gCj4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+ID4gCj4gPiBIZWxsbywK
PiA+IAo+ID4gV2UgcmFuIGF1dG9tYXRlZCB0ZXN0cyBvbiBhIHJlY2VudCBjb21taXQgZnJvbSB0
aGlzIGtlcm5lbCB0cmVlOgo+ID4gCj4gPiAgICAgICAgS2VybmVsIHJlcG86Cj4gPiAgICAgICAg
Z2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51
eC1zdGFibGUtcmMuZ2l0Cj4gPiAgICAgICAgICAgICBDb21taXQ6IGRmZTI4M2U5ZmRhYyAtIExp
bnV4IDUuMy45LXJjMQo+ID4gCj4gPiBUaGUgcmVzdWx0cyBvZiB0aGVzZSBhdXRvbWF0ZWQgdGVz
dHMgYXJlIHByb3ZpZGVkIGJlbG93Lgo+ID4gCj4gPiAgICAgT3ZlcmFsbCByZXN1bHQ6IEZBSUxF
RCAoc2VlIGRldGFpbHMgYmVsb3cpCj4gPiAgICAgICAgICAgICAgTWVyZ2U6IE9LCj4gPiAgICAg
ICAgICAgIENvbXBpbGU6IE9LCj4gPiAgICAgICAgICAgICAgVGVzdHM6IEZBSUxFRAo+ID4gCj4g
PiBBbGwga2VybmVsIGJpbmFyaWVzLCBjb25maWcgZmlsZXMsIGFuZCBsb2dzIGFyZSBhdmFpbGFi
bGUgZm9yIGRvd25sb2FkIGhlcmU6Cj4gPiAKPiA+ICAgaHR0cHM6Ly9hcnRpZmFjdHMuY2tpLXBy
b2plY3Qub3JnL3BpcGVsaW5lcy8yNjIzODAKPiA+IAo+ID4gT25lIG9yIG1vcmUga2VybmVsIHRl
c3RzIGZhaWxlZDoKPiA+IAo+ID4gICAgIHg4Nl82NDoKPiA+ICAgICAg4p2MIExUUCBsaXRlCj4g
Pgo+IAo+IE5vdCBhIDUuMyAtc3RhYmxlIHJlZ3Jlc3Npb24uCj4gCj4gRmFpbHVyZSBjb21lcyBm
cm9tIHRlc3QgdGhhdCBzYW5pdHkgY2hlY2tzIGFsbCAvcHJvYyBmaWxlcyBieSBkb2luZwo+IDFr
IHJlYWQgZnJvbSBlYWNoLiBUaGVyZSBhcmUgY291cGxlIGlzc3VlcyBpdCBoaXRzIHdydC4gc25k
X2hkYV8qLgo+IAo+IEV4YW1wbGUgcmVwcm9kdWNlcjoKPiAgIGRkIGlmPS9zeXMva2VybmVsL2Rl
YnVnL3JlZ21hcC9oZGF1ZGlvQzBEMy1oZGF1ZGlvL2FjY2VzcyBvZj1vdXQudHh0IGNvdW50PTEg
YnM9MTAyNCBpZmxhZz1ub25ibG9jawoKVGhhdCdzIG5vdCBhIHByb2MgZmlsZSA6KQoKPiBJdCdz
IHNsb3cgYW5kIHRyaWdnZXJzIHNvZnQgbG9ja3VwcyBbMV0uIEFuZCBpdCBhbHNvIHJlcXVpcmVz
IGxvdAo+IG9mIG1lbW9yeSwgdHJpZ2dlcmluZyBPT01zIG9uIHNtYWxsZXIgVk1zOgo+IDB4MDAw
MDAwMDAyNGYwNDM3Yi0weDAwMDAwMDAwMWEzMmIxYzggMTA3Mzc0NTkyMCBzZXFfcmVhZCsweDEz
MS8weDQwMCBwYWdlcz0yNjIxNDQgdm1hbGxvYyB2cGFnZXMgTjA9MjYyMTQ0Cj4gCj4gSSdtIGxl
YW5pbmcgdG93YXJkcyBza2lwcGluZyBhbGwgcmVnbWFwIGVudHJpZXMgaW4gdGhpcyB0ZXN0Lgo+
IENvbW1lbnRzIGFyZSB3ZWxjb21lZC4KClJhbmRvbWx5IHBva2luZyBhcm91bmQgaW4gZGVidWdm
cyBpcyBhIHN1cmUgd2F5IHRvIGNhdXNlIGNyYXNoZXMgYW5kCm1ham9yIHByb2JsZW1zLiAgQWxz
bywgZGVidWdmcyBmaWxlcyBhcmUgTk9UIHN0YWJsZSBhbmQgb25seSBmb3IKZGVidWdnaW5nIGFu
ZCBzaG91bGQgbmV2ZXIgYmUgZW5hYmxlZCBvbiAicmVhbCIgc3lzdGVtcy4KClNvIHdoYXQgZXhh
Y3RseSBpcyB0aGUgdGVzdCB0cnlpbmcgdG8gZG8gaGVyZT8KCnRoYW5rcywKCmdyZWcgay1oCgot
LSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRw
Cg==
