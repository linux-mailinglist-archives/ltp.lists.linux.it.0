Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A65EE4AD
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 17:30:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 077813C24F2
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 17:30:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 534773C2435
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 17:30:40 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3BF4E200B1B
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 17:30:38 +0100 (CET)
Received: from localhost (host6-102.lan-isdn.imaginet.fr [195.68.6.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C8D4420848;
 Mon,  4 Nov 2019 16:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572885036;
 bh=LAgGrLgKpPDH4JoKlSYbiJE2P0LnY+YWKSFwGFoyof4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bLRmcQtayL0Ww8WXWF4NtrWd+fnrVdGADzIgSXa/r38+ParsPH7oMtF/EK/4dtV+G
 j6jnDur3TtCmoDLb3MrA1PjLeMEcONgnS1RR5lALo2HJC1ihUqNz6GpxiT/XUvn1uX
 doyvn5mudQR7Z4l2pSnYkvUAQ6G4sSJyaiNHP+Mo=
Date: Mon, 4 Nov 2019 17:30:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191104163033.GB2253150@kroah.com>
References: <cki.1210A7ECB0.BD9Q3APV4K@redhat.com>
 <2029139028.10333037.1572874551626.JavaMail.zimbra@redhat.com>
 <20191104135135.GA2162401@kroah.com>
 <1341418315.10342806.1572877690830.JavaMail.zimbra@redhat.com>
 <20191104145947.GA2211991@kroah.com>
 <251943262.10356408.1572881121044.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <251943262.10356408.1572881121044.JavaMail.zimbra@redhat.com>
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

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMTA6MjU6MjFBTSAtMDUwMCwgSmFuIFN0YW5jZWsgd3Jv
dGU6Cj4gCj4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+ID4gT24gTW9uLCBOb3YgMDQs
IDIwMTkgYXQgMDk6Mjg6MTBBTSAtMDUwMCwgSmFuIFN0YW5jZWsgd3JvdGU6Cj4gPiA+IAo+ID4g
PiAKPiA+ID4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+ID4gPiA+IE9uIE1vbiwgTm92
IDA0LCAyMDE5IGF0IDA4OjM1OjUxQU0gLTA1MDAsIEphbiBTdGFuY2VrIHdyb3RlOgo+ID4gPiA+
ID4gCj4gPiA+ID4gPiAKPiA+ID4gPiA+IC0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEhlbGxvLAo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gV2Ug
cmFuIGF1dG9tYXRlZCB0ZXN0cyBvbiBhIHJlY2VudCBjb21taXQgZnJvbSB0aGlzIGtlcm5lbCB0
cmVlOgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gICAgICAgIEtlcm5lbCByZXBvOgo+ID4gPiA+
ID4gPiAgICAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3N0YWJsZS9saW51eC1zdGFibGUtcmMuZ2l0Cj4gPiA+ID4gPiA+ICAgICAgICAgICAgIENvbW1p
dDogZGZlMjgzZTlmZGFjIC0gTGludXggNS4zLjktcmMxCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4g
PiBUaGUgcmVzdWx0cyBvZiB0aGVzZSBhdXRvbWF0ZWQgdGVzdHMgYXJlIHByb3ZpZGVkIGJlbG93
Lgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gICAgIE92ZXJhbGwgcmVzdWx0OiBGQUlMRUQgKHNl
ZSBkZXRhaWxzIGJlbG93KQo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgTWVyZ2U6IE9LCj4gPiA+
ID4gPiA+ICAgICAgICAgICAgQ29tcGlsZTogT0sKPiA+ID4gPiA+ID4gICAgICAgICAgICAgIFRl
c3RzOiBGQUlMRUQKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEFsbCBrZXJuZWwgYmluYXJpZXMs
IGNvbmZpZyBmaWxlcywgYW5kIGxvZ3MgYXJlIGF2YWlsYWJsZSBmb3IKPiA+ID4gPiA+ID4gZG93
bmxvYWQKPiA+ID4gPiA+ID4gaGVyZToKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ICAgaHR0cHM6
Ly9hcnRpZmFjdHMuY2tpLXByb2plY3Qub3JnL3BpcGVsaW5lcy8yNjIzODAKPiA+ID4gPiA+ID4g
Cj4gPiA+ID4gPiA+IE9uZSBvciBtb3JlIGtlcm5lbCB0ZXN0cyBmYWlsZWQ6Cj4gPiA+ID4gPiA+
IAo+ID4gPiA+ID4gPiAgICAgeDg2XzY0Ogo+ID4gPiA+ID4gPiAgICAgIOKdjCBMVFAgbGl0ZQo+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBOb3QgYSA1LjMgLXN0YWJsZSByZWdyZXNz
aW9uLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBGYWlsdXJlIGNvbWVzIGZyb20gdGVzdCB0aGF0IHNh
bml0eSBjaGVja3MgYWxsIC9wcm9jIGZpbGVzIGJ5IGRvaW5nCj4gPiA+ID4gPiAxayByZWFkIGZy
b20gZWFjaC4gVGhlcmUgYXJlIGNvdXBsZSBpc3N1ZXMgaXQgaGl0cyB3cnQuIHNuZF9oZGFfKi4K
PiA+ID4gPiA+IAo+ID4gPiA+ID4gRXhhbXBsZSByZXByb2R1Y2VyOgo+ID4gPiA+ID4gICBkZCBp
Zj0vc3lzL2tlcm5lbC9kZWJ1Zy9yZWdtYXAvaGRhdWRpb0MwRDMtaGRhdWRpby9hY2Nlc3Mgb2Y9
b3V0LnR4dAo+ID4gPiA+ID4gICBjb3VudD0xIGJzPTEwMjQgaWZsYWc9bm9uYmxvY2sKPiA+ID4g
PiAKPiA+ID4gPiBUaGF0J3Mgbm90IGEgcHJvYyBmaWxlIDopCj4gPiA+IAo+ID4gPiBSaWdodC4g
SXQncyBzYW1lIHRlc3QgdGhhdCdzIHVzZWQgZm9yIC9wcm9jIHRvby4KPiA+ID4gCj4gPiA+ID4g
Cj4gPiA+ID4gPiBJdCdzIHNsb3cgYW5kIHRyaWdnZXJzIHNvZnQgbG9ja3VwcyBbMV0uIEFuZCBp
dCBhbHNvIHJlcXVpcmVzIGxvdAo+ID4gPiA+ID4gb2YgbWVtb3J5LCB0cmlnZ2VyaW5nIE9PTXMg
b24gc21hbGxlciBWTXM6Cj4gPiA+ID4gPiAweDAwMDAwMDAwMjRmMDQzN2ItMHgwMDAwMDAwMDFh
MzJiMWM4IDEwNzM3NDU5MjAgc2VxX3JlYWQrMHgxMzEvMHg0MDAKPiA+ID4gPiA+IHBhZ2VzPTI2
MjE0NCB2bWFsbG9jIHZwYWdlcyBOMD0yNjIxNDQKPiA+ID4gPiA+IAo+ID4gPiA+ID4gSSdtIGxl
YW5pbmcgdG93YXJkcyBza2lwcGluZyBhbGwgcmVnbWFwIGVudHJpZXMgaW4gdGhpcyB0ZXN0Lgo+
ID4gPiA+ID4gQ29tbWVudHMgYXJlIHdlbGNvbWVkLgo+ID4gPiA+IAo+ID4gPiA+IFJhbmRvbWx5
IHBva2luZyBhcm91bmQgaW4gZGVidWdmcyBpcyBhIHN1cmUgd2F5IHRvIGNhdXNlIGNyYXNoZXMg
YW5kCj4gPiA+ID4gbWFqb3IgcHJvYmxlbXMuICBBbHNvLCBkZWJ1Z2ZzIGZpbGVzIGFyZSBOT1Qg
c3RhYmxlIGFuZCBvbmx5IGZvcgo+ID4gPiA+IGRlYnVnZ2luZyBhbmQgc2hvdWxkIG5ldmVyIGJl
IGVuYWJsZWQgb24gInJlYWwiIHN5c3RlbXMuCj4gPiA+ID4gCj4gPiA+ID4gU28gd2hhdCBleGFj
dGx5IGlzIHRoZSB0ZXN0IHRyeWluZyB0byBkbyBoZXJlPwo+ID4gPiAKPiA+ID4gSXQncyAodW5w
cml2aWxlZ2VkKSB1c2VyIHRyeWluZyB0byBvcGVuL3JlYWQgYW55dGhpbmcgaXQgY2FuICgvcHJv
YywgL3N5cykKPiA+ID4gdG8gc2VlIGlmIHRoYXQgdHJpZ2dlcnMgYW55dGhpbmcgYmFkLgo+ID4g
PiAKPiA+ID4gSXQgY2FuIHJ1biBhcyBwcml2aWxlZ2VkIHVzZXIgdG9vLCB3aGljaCB3YXMgdGhl
IGNhc2UgYWJvdmUuCj4gPiAKPiA+IFN1cmUsIHlvdSBjYW4gZG8gdG9ucyBvZiBiYWQgdGhpbmdz
IGFzIHJvb3QgcG9raW5nIGFyb3VuZCBpbiBzeXNmcywKPiA+IGRlYnVnZnMsIGFuZCBwcm9jZnMu
ICBXaGF0IGV4YWN0bHkgYXJlIHlvdSB0cnlpbmcgdG8gZG8sIGJyZWFrIHRoZQo+ID4gc3lzdGVt
Pwo+IAo+IFdlIGFyZSB0YWxraW5nIGFib3V0IHJlYWQtb25seSBoZXJlLiBJcyBpdCB1bnJlYXNv
bmFibGUgdG8gZXhwZWN0Cj4gdGhhdCByb290IGNhbiByZWFkIGFsbCAvcHJvYyBlbnRyaWVzIHdp
dGhvdXQgY3Jhc2hpbmcgdGhlIHN5c3RlbT8KCllvdSBhcmUgTk9UIHJlYWRpbmcgL3Byb2MvIGhl
cmUuICBZb3UgYXJlIHJlYWRpbmcgZGVidWdmcyB3aGljaCB5b3UKcmVhbGx5IGhhdmUgTk9UIGlk
ZWEgd2hhdCBpcyBpbiB0aGVyZS4gIEFzIHlvdSBzYXcsIHlvdSBhcmUgcmVhZGluZyBmcm9tCmhh
cmR3YXJlIHRoYXQgaXMgc2xvdyBhbmQgZG9pbmcgb2RkIHRoaW5ncyB3aGVuIHlvdSByZWFkIGZy
b20gaXQuCgpBbmQgeWVzLCB0aGVyZSBhcmUgc29tZSAvcHJvYy8gZmlsZXMgdGhhdCB5b3Ugc2hv
dWxkIG5vdCByZWFkIGZyb20gYXMKcm9vdCBhbmQgZXhwZWN0IHRoaW5ncyB0byBhbHdheXMgd29y
ay4gIFBDSSBkZXZpY2VzIGFyZSBub3RvcmlvdXMgZm9yCnRoaXMsIGFuZCBpZiB5b3UgYXJlIHJl
YWRpbmcgdGhvc2UgZmlsZXMgYXMgcm9vdCwgeW91ICJrbm93IiB5b3Uga25vdwp3aGF0IHlvdSBh
cmUgZG9pbmcgYW5kIGNhbiBhY2NlcHQgdGhlIHJpc2sgZm9yIHdoZW4gdGhpbmdzIGdvIHdyb25n
LgoKSXQgaXMgZmluZSB0byB3cml0ZSB0ZXN0cyB0byByZWFkIHNwZWNpZmljIC9wcm9jLyBmaWxl
cyB0aGF0IHlvdSBrbm93CndoYXQgaXMgaGFwcGVuaW5nIGluIHRoZW0uICBUbyBwaWNrIHJhbmRv
bSBvbmVzIGlzIG5ldmVyIGEgZ29vZCBpZGVhLgoKdGhhbmtzLAoKZ3JlZyBrLWgKCi0tIApNYWls
aW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
