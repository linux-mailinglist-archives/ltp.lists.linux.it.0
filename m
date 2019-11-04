Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 017F3EE2FB
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 15:59:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99F3A3C24E6
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 15:59:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 680833C240B
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 15:59:54 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 80C9F600C21
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 15:59:53 +0100 (CET)
Received: from localhost (unknown [62.119.166.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5AF6E21D7F;
 Mon,  4 Nov 2019 14:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572879591;
 bh=4DM6PsVNusVwUXpvzXvmTrY1JRmZq07AfglvQsNWuDI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=izAGyOFkCY9FsTpZBGaRHf0qnEd7WX44JLuBknCFkhnUGbHwpnrCz7mSNciXMvPRy
 83GSqSmyoIF+MN78AEJvMOsyEpDkP2u6hWCXbaTYnHqBXZespraAz3S9RA1c7MOBqA
 Kqm8avdiINBAZ2gcfb+NcUmznvPESeNtiEJe7wFE=
Date: Mon, 4 Nov 2019 15:59:47 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191104145947.GA2211991@kroah.com>
References: <cki.1210A7ECB0.BD9Q3APV4K@redhat.com>
 <2029139028.10333037.1572874551626.JavaMail.zimbra@redhat.com>
 <20191104135135.GA2162401@kroah.com>
 <1341418315.10342806.1572877690830.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1341418315.10342806.1572877690830.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMDk6Mjg6MTBBTSAtMDUwMCwgSmFuIFN0YW5jZWsgd3Jv
dGU6Cj4gCj4gCj4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+ID4gT24gTW9uLCBOb3Yg
MDQsIDIwMTkgYXQgMDg6MzU6NTFBTSAtMDUwMCwgSmFuIFN0YW5jZWsgd3JvdGU6Cj4gPiA+IAo+
ID4gPiAKPiA+ID4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+ID4gPiA+IAo+ID4gPiA+
IEhlbGxvLAo+ID4gPiA+IAo+ID4gPiA+IFdlIHJhbiBhdXRvbWF0ZWQgdGVzdHMgb24gYSByZWNl
bnQgY29tbWl0IGZyb20gdGhpcyBrZXJuZWwgdHJlZToKPiA+ID4gPiAKPiA+ID4gPiAgICAgICAg
S2VybmVsIHJlcG86Cj4gPiA+ID4gICAgICAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXgtc3RhYmxlLXJjLmdpdAo+ID4gPiA+ICAgICAg
ICAgICAgIENvbW1pdDogZGZlMjgzZTlmZGFjIC0gTGludXggNS4zLjktcmMxCj4gPiA+ID4gCj4g
PiA+ID4gVGhlIHJlc3VsdHMgb2YgdGhlc2UgYXV0b21hdGVkIHRlc3RzIGFyZSBwcm92aWRlZCBi
ZWxvdy4KPiA+ID4gPiAKPiA+ID4gPiAgICAgT3ZlcmFsbCByZXN1bHQ6IEZBSUxFRCAoc2VlIGRl
dGFpbHMgYmVsb3cpCj4gPiA+ID4gICAgICAgICAgICAgIE1lcmdlOiBPSwo+ID4gPiA+ICAgICAg
ICAgICAgQ29tcGlsZTogT0sKPiA+ID4gPiAgICAgICAgICAgICAgVGVzdHM6IEZBSUxFRAo+ID4g
PiA+IAo+ID4gPiA+IEFsbCBrZXJuZWwgYmluYXJpZXMsIGNvbmZpZyBmaWxlcywgYW5kIGxvZ3Mg
YXJlIGF2YWlsYWJsZSBmb3IgZG93bmxvYWQKPiA+ID4gPiBoZXJlOgo+ID4gPiA+IAo+ID4gPiA+
ICAgaHR0cHM6Ly9hcnRpZmFjdHMuY2tpLXByb2plY3Qub3JnL3BpcGVsaW5lcy8yNjIzODAKPiA+
ID4gPiAKPiA+ID4gPiBPbmUgb3IgbW9yZSBrZXJuZWwgdGVzdHMgZmFpbGVkOgo+ID4gPiA+IAo+
ID4gPiA+ICAgICB4ODZfNjQ6Cj4gPiA+ID4gICAgICDinYwgTFRQIGxpdGUKPiA+ID4gPgo+ID4g
PiAKPiA+ID4gTm90IGEgNS4zIC1zdGFibGUgcmVncmVzc2lvbi4KPiA+ID4gCj4gPiA+IEZhaWx1
cmUgY29tZXMgZnJvbSB0ZXN0IHRoYXQgc2FuaXR5IGNoZWNrcyBhbGwgL3Byb2MgZmlsZXMgYnkg
ZG9pbmcKPiA+ID4gMWsgcmVhZCBmcm9tIGVhY2guIFRoZXJlIGFyZSBjb3VwbGUgaXNzdWVzIGl0
IGhpdHMgd3J0LiBzbmRfaGRhXyouCj4gPiA+IAo+ID4gPiBFeGFtcGxlIHJlcHJvZHVjZXI6Cj4g
PiA+ICAgZGQgaWY9L3N5cy9rZXJuZWwvZGVidWcvcmVnbWFwL2hkYXVkaW9DMEQzLWhkYXVkaW8v
YWNjZXNzIG9mPW91dC50eHQKPiA+ID4gICBjb3VudD0xIGJzPTEwMjQgaWZsYWc9bm9uYmxvY2sK
PiA+IAo+ID4gVGhhdCdzIG5vdCBhIHByb2MgZmlsZSA6KQo+IAo+IFJpZ2h0LiBJdCdzIHNhbWUg
dGVzdCB0aGF0J3MgdXNlZCBmb3IgL3Byb2MgdG9vLgo+IAo+ID4gCj4gPiA+IEl0J3Mgc2xvdyBh
bmQgdHJpZ2dlcnMgc29mdCBsb2NrdXBzIFsxXS4gQW5kIGl0IGFsc28gcmVxdWlyZXMgbG90Cj4g
PiA+IG9mIG1lbW9yeSwgdHJpZ2dlcmluZyBPT01zIG9uIHNtYWxsZXIgVk1zOgo+ID4gPiAweDAw
MDAwMDAwMjRmMDQzN2ItMHgwMDAwMDAwMDFhMzJiMWM4IDEwNzM3NDU5MjAgc2VxX3JlYWQrMHgx
MzEvMHg0MDAKPiA+ID4gcGFnZXM9MjYyMTQ0IHZtYWxsb2MgdnBhZ2VzIE4wPTI2MjE0NAo+ID4g
PiAKPiA+ID4gSSdtIGxlYW5pbmcgdG93YXJkcyBza2lwcGluZyBhbGwgcmVnbWFwIGVudHJpZXMg
aW4gdGhpcyB0ZXN0Lgo+ID4gPiBDb21tZW50cyBhcmUgd2VsY29tZWQuCj4gPiAKPiA+IFJhbmRv
bWx5IHBva2luZyBhcm91bmQgaW4gZGVidWdmcyBpcyBhIHN1cmUgd2F5IHRvIGNhdXNlIGNyYXNo
ZXMgYW5kCj4gPiBtYWpvciBwcm9ibGVtcy4gIEFsc28sIGRlYnVnZnMgZmlsZXMgYXJlIE5PVCBz
dGFibGUgYW5kIG9ubHkgZm9yCj4gPiBkZWJ1Z2dpbmcgYW5kIHNob3VsZCBuZXZlciBiZSBlbmFi
bGVkIG9uICJyZWFsIiBzeXN0ZW1zLgo+ID4gCj4gPiBTbyB3aGF0IGV4YWN0bHkgaXMgdGhlIHRl
c3QgdHJ5aW5nIHRvIGRvIGhlcmU/Cj4gCj4gSXQncyAodW5wcml2aWxlZ2VkKSB1c2VyIHRyeWlu
ZyB0byBvcGVuL3JlYWQgYW55dGhpbmcgaXQgY2FuICgvcHJvYywgL3N5cykKPiB0byBzZWUgaWYg
dGhhdCB0cmlnZ2VycyBhbnl0aGluZyBiYWQuCj4gCj4gSXQgY2FuIHJ1biBhcyBwcml2aWxlZ2Vk
IHVzZXIgdG9vLCB3aGljaCB3YXMgdGhlIGNhc2UgYWJvdmUuCgpTdXJlLCB5b3UgY2FuIGRvIHRv
bnMgb2YgYmFkIHRoaW5ncyBhcyByb290IHBva2luZyBhcm91bmQgaW4gc3lzZnMsCmRlYnVnZnMs
IGFuZCBwcm9jZnMuICBXaGF0IGV4YWN0bHkgYXJlIHlvdSB0cnlpbmcgdG8gZG8sIGJyZWFrIHRo
ZQpzeXN0ZW0/CgpUaGF0IHNvdW5kcyBsaWtlIGEgaG9ycmlibGUgdGVzdCB0aGF0IGlzIGp1c3Qg
c2V0dGluZyBpdHNlbGYgdXAgdG8gbG9jawp0aGUgc3lzdGVtIHVwLCB5b3Ugc2hvdWxkIHJldmlz
aXQgaXQuLi4KCnRoYW5rcywKCmdyZWcgay1oCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
