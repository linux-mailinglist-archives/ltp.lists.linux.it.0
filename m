Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 095E4EE244
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 15:28:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D4B23C24E4
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 15:28:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 443D33C240C
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 15:28:19 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 80ED31A00EC0
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 15:28:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572877696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sXs+LDxO88IFopCBCdlf8Wk3p0+58YbIqWF2eEqPtpk=;
 b=SiWavh+6BFiTpH0WLe1Wv+ei1JZoFHUrpoeCT7ztQFGNQ+wWnd6L7dFT3hvcGlRG+cOR5n
 Sf7NlYlI2Xfn5QqZx9z7Y34CdRNyA97mMJD/SlMtX9j3k+PfhrCwf8NZuYPbS9nKftmUjH
 ATAq5yt27SJ0zj63LEVZp3L4Ua0kXRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-t_2Xk-g9NVCNSG-XGMKtLA-1; Mon, 04 Nov 2019 09:28:12 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85AC48017DD;
 Mon,  4 Nov 2019 14:28:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75D2E5D6C5;
 Mon,  4 Nov 2019 14:28:11 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 13CBF4BB5B;
 Mon,  4 Nov 2019 14:28:11 +0000 (UTC)
Date: Mon, 4 Nov 2019 09:28:10 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <1341418315.10342806.1572877690830.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191104135135.GA2162401@kroah.com>
References: <cki.1210A7ECB0.BD9Q3APV4K@redhat.com>
 <2029139028.10333037.1572874551626.JavaMail.zimbra@redhat.com>
 <20191104135135.GA2162401@kroah.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.10]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Test report for kernel
 5.3.9-rc1-dfe283e.cki (stable)
Thread-Index: Kx4pHL9z3NzPO+lMPvoi41zdd+kemg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: t_2Xk-g9NVCNSG-XGMKtLA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gT24gTW9uLCBOb3YgMDQsIDIwMTkgYXQg
MDg6MzU6NTFBTSAtMDUwMCwgSmFuIFN0YW5jZWsgd3JvdGU6Cj4gPiAKPiA+IAo+ID4gLS0tLS0g
T3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+ID4gPiAKPiA+ID4gSGVsbG8sCj4gPiA+IAo+ID4gPiBX
ZSByYW4gYXV0b21hdGVkIHRlc3RzIG9uIGEgcmVjZW50IGNvbW1pdCBmcm9tIHRoaXMga2VybmVs
IHRyZWU6Cj4gPiA+IAo+ID4gPiAgICAgICAgS2VybmVsIHJlcG86Cj4gPiA+ICAgICAgICBnaXQ6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LXN0
YWJsZS1yYy5naXQKPiA+ID4gICAgICAgICAgICAgQ29tbWl0OiBkZmUyODNlOWZkYWMgLSBMaW51
eCA1LjMuOS1yYzEKPiA+ID4gCj4gPiA+IFRoZSByZXN1bHRzIG9mIHRoZXNlIGF1dG9tYXRlZCB0
ZXN0cyBhcmUgcHJvdmlkZWQgYmVsb3cuCj4gPiA+IAo+ID4gPiAgICAgT3ZlcmFsbCByZXN1bHQ6
IEZBSUxFRCAoc2VlIGRldGFpbHMgYmVsb3cpCj4gPiA+ICAgICAgICAgICAgICBNZXJnZTogT0sK
PiA+ID4gICAgICAgICAgICBDb21waWxlOiBPSwo+ID4gPiAgICAgICAgICAgICAgVGVzdHM6IEZB
SUxFRAo+ID4gPiAKPiA+ID4gQWxsIGtlcm5lbCBiaW5hcmllcywgY29uZmlnIGZpbGVzLCBhbmQg
bG9ncyBhcmUgYXZhaWxhYmxlIGZvciBkb3dubG9hZAo+ID4gPiBoZXJlOgo+ID4gPiAKPiA+ID4g
ICBodHRwczovL2FydGlmYWN0cy5ja2ktcHJvamVjdC5vcmcvcGlwZWxpbmVzLzI2MjM4MAo+ID4g
PiAKPiA+ID4gT25lIG9yIG1vcmUga2VybmVsIHRlc3RzIGZhaWxlZDoKPiA+ID4gCj4gPiA+ICAg
ICB4ODZfNjQ6Cj4gPiA+ICAgICAg4p2MIExUUCBsaXRlCj4gPiA+Cj4gPiAKPiA+IE5vdCBhIDUu
MyAtc3RhYmxlIHJlZ3Jlc3Npb24uCj4gPiAKPiA+IEZhaWx1cmUgY29tZXMgZnJvbSB0ZXN0IHRo
YXQgc2FuaXR5IGNoZWNrcyBhbGwgL3Byb2MgZmlsZXMgYnkgZG9pbmcKPiA+IDFrIHJlYWQgZnJv
bSBlYWNoLiBUaGVyZSBhcmUgY291cGxlIGlzc3VlcyBpdCBoaXRzIHdydC4gc25kX2hkYV8qLgo+
ID4gCj4gPiBFeGFtcGxlIHJlcHJvZHVjZXI6Cj4gPiAgIGRkIGlmPS9zeXMva2VybmVsL2RlYnVn
L3JlZ21hcC9oZGF1ZGlvQzBEMy1oZGF1ZGlvL2FjY2VzcyBvZj1vdXQudHh0Cj4gPiAgIGNvdW50
PTEgYnM9MTAyNCBpZmxhZz1ub25ibG9jawo+IAo+IFRoYXQncyBub3QgYSBwcm9jIGZpbGUgOikK
ClJpZ2h0LiBJdCdzIHNhbWUgdGVzdCB0aGF0J3MgdXNlZCBmb3IgL3Byb2MgdG9vLgoKPiAKPiA+
IEl0J3Mgc2xvdyBhbmQgdHJpZ2dlcnMgc29mdCBsb2NrdXBzIFsxXS4gQW5kIGl0IGFsc28gcmVx
dWlyZXMgbG90Cj4gPiBvZiBtZW1vcnksIHRyaWdnZXJpbmcgT09NcyBvbiBzbWFsbGVyIFZNczoK
PiA+IDB4MDAwMDAwMDAyNGYwNDM3Yi0weDAwMDAwMDAwMWEzMmIxYzggMTA3Mzc0NTkyMCBzZXFf
cmVhZCsweDEzMS8weDQwMAo+ID4gcGFnZXM9MjYyMTQ0IHZtYWxsb2MgdnBhZ2VzIE4wPTI2MjE0
NAo+ID4gCj4gPiBJJ20gbGVhbmluZyB0b3dhcmRzIHNraXBwaW5nIGFsbCByZWdtYXAgZW50cmll
cyBpbiB0aGlzIHRlc3QuCj4gPiBDb21tZW50cyBhcmUgd2VsY29tZWQuCj4gCj4gUmFuZG9tbHkg
cG9raW5nIGFyb3VuZCBpbiBkZWJ1Z2ZzIGlzIGEgc3VyZSB3YXkgdG8gY2F1c2UgY3Jhc2hlcyBh
bmQKPiBtYWpvciBwcm9ibGVtcy4gIEFsc28sIGRlYnVnZnMgZmlsZXMgYXJlIE5PVCBzdGFibGUg
YW5kIG9ubHkgZm9yCj4gZGVidWdnaW5nIGFuZCBzaG91bGQgbmV2ZXIgYmUgZW5hYmxlZCBvbiAi
cmVhbCIgc3lzdGVtcy4KPiAKPiBTbyB3aGF0IGV4YWN0bHkgaXMgdGhlIHRlc3QgdHJ5aW5nIHRv
IGRvIGhlcmU/CgpJdCdzICh1bnByaXZpbGVnZWQpIHVzZXIgdHJ5aW5nIHRvIG9wZW4vcmVhZCBh
bnl0aGluZyBpdCBjYW4gKC9wcm9jLCAvc3lzKQp0byBzZWUgaWYgdGhhdCB0cmlnZ2VycyBhbnl0
aGluZyBiYWQuCgpJdCBjYW4gcnVuIGFzIHByaXZpbGVnZWQgdXNlciB0b28sIHdoaWNoIHdhcyB0
aGUgY2FzZSBhYm92ZS4KClsxXSBodHRwczovL2dpdGh1Yi5jb20vbGludXgtdGVzdC1wcm9qZWN0
L2x0cC9ibG9iL21hc3Rlci90ZXN0Y2FzZXMva2VybmVsL2ZzL3JlYWRfYWxsL3JlYWRfYWxsLmMK
CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8v
bHRwCg==
