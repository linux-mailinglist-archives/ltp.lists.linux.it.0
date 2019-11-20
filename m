Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F901040BE
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 17:26:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 742FB3C0E97
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 17:26:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 26F1B3C0E97
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 17:26:17 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 66D111A01067
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 17:26:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574267174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CPZKFcOjb++YEVI3iE/uLx6tfas9/AXkVZjWZ+0OLVw=;
 b=SbOc+vOc/vERy17iv0yLN6VJx1Hj9ZbjSqdmNjGYy2GzznOcOQPPGqGvn7JXLTW86Titbw
 0J9/6xBbBAG69LypFzNQt8olTl6/5pTk/0w8/i2pLHLqIr9xSLoI+Z5nzmxT7Gt8gzzbDI
 MBCfUqj6VChMY66nMeCcC3q/Y6t5Bwk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-hUKLwo3kNhicvnCPAjqCNw-1; Wed, 20 Nov 2019 11:26:11 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C02EA107ACC6;
 Wed, 20 Nov 2019 16:26:06 +0000 (UTC)
Received: from localhost.localdomain (ovpn-122-154.rdu2.redhat.com
 [10.10.122.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05E842AAB5;
 Wed, 20 Nov 2019 16:25:58 +0000 (UTC)
To: Cyril Hrubis <chrubis@suse.cz>, CKI Project <cki-project@redhat.com>
References: <cki.6D94BD5731.3IAGHB25D8@redhat.com>
 <20191120113534.GC14963@rei.lan>
From: Rachel Sibley <rasibley@redhat.com>
Message-ID: <57f8e29e-1d49-e93f-2b03-75a3fd3e6e21@redhat.com>
Date: Wed, 20 Nov 2019 11:25:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191120113534.GC14963@rei.lan>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: hUKLwo3kNhicvnCPAjqCNw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] ??? FAIL: Test report for kernel 5.4.0-rc8-4b17a56.cki
 (stable-next)
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
Cc: Memory Management <mm-qe@redhat.com>, LTP Mailing List <ltp@lists.linux.it>,
 Linux Stable maillist <stable@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgpPbiAxMS8yMC8xOSA2OjM1IEFNLCBDeXJpbCBIcnViaXMgd3JvdGU6Cj4gSGkhCj4+IE9uZSBv
ciBtb3JlIGtlcm5lbCB0ZXN0cyBmYWlsZWQ6Cj4+Cj4+ICAgICAgcHBjNjRsZToKPj4gICAgICAg
Pz8/IExUUCBsaXRlCj4+ICAgICAgID8/PyB4ZnN0ZXN0czogZXh0NAo+IAo+IEJvdGggbG9ncyBz
aG93cyBtaXNzaW5nIGZpbGVzLCB0aGF0IG1heSBiZSBhbiBpbmZyYXN0cnVjdHVyZSBwcm9ibGVt
IGFzCj4gd2VsbC4KPiAKPiBBbHNvIGNhbiB3ZSBpbmNsdWRlIGxpbmtzIHRvIHRoZSBsb2dmaWxl
cyBoZXJlPyBCb251cyBwb2ludHMgZm9yIHNob3dpbmcKPiB0aGUgc25pcHBldCB3aXRoIHRoZSBh
Y3R1YWwgZmFpbHVyZSBpbiB0aGUgZW1haWwgYXMgd2VsbC4gSSB0YWtlcyBhIGZhaXIKPiBhbW91
bnQgb2YgdGltZSBsb2NhdGluZyB0aGVtIG1hbnVhbGx5IGluIHRoZSBwaXBlbGluZSByZXBvc2l0
b3J5LCBpdAo+IHdvdWxkIGJlIG11Y2ggbXVjaCBlYXNpZXIganVzdCB3aXRoIHRoZSBsaW5rcyB0
byB0aGUgcmlnaHQgbG9nZmlsZS4uLgo+IAoKVGhhbmtzIGZvciB0aGUgZmVlZGJhY2sgQ3lyaWws
IHdlIGRpZCBoYXZlIGxpbmtzIHRvIGVhY2ggZmFpbHVyZSBsaXN0ZWQKYmVmb3JlIGJ1dCB3ZSB3
ZXJlIHRvbGQgaXQgbWFkZSB0aGUgZW1haWwgbG9vayBjbHV0dGVyZWQgZXNwZWNpYWxseQppZiB0
aGVyZSBhcmUgbXVsdGlwbGUgZmFpbHVyZXMuCgpUaGUgdGVzdCBsb2dzIGFyZSBzb3J0ZWQgYnkg
YXJjaHxob3N0fFRDLCBpcyB0aGVyZSBzb21ldGhpbmcgd2UgY2FuCmRvIHRvIG1ha2UgaXQgZWFz
aWVyIHRvIGZpbmQgcmVsYXRlZCBsb2dzID8KaHR0cHM6Ly9hcnRpZmFjdHMuY2tpLXByb2plY3Qu
b3JnL3BpcGVsaW5lcy8yOTY3ODEvbG9ncy8KCk1heWJlIHdlIGNhbiBsb29rIGludG8gYWRkaW5n
IHRoZSBsaW5rZWQgbG9ncyB0byB0aGUgYm90dG9tIG9mIHRoZQplbWFpbCB3aXRoIGEgcmVmZXJl
bmNlIGlkIG5leHQgdG8gdGhlIGZhaWx1cmVzIGluIHRoZSBzdW1tYXJ5LCBzbwpmb3IgZXhhbXBs
ZToKCiAgICAgcHBjNjRsZToKICAgICAg4p2MIExUUCBsaXRlIFsxXQogICAgICDinYwgeGZzdGVz
dHM6IGV4dDQgWzJdCgpXZSBjb3VsZCBhbHNvIGxvb2sgaW50byBtZXJnaW5nIHRoZSBsdHAgcnVu
IGxvZ3MgaW50byBhIHNpbmdsZSBmaWxlCmFzIHdlbGwuCgotUmFjaGVsCgoKLS0gCk1haWxpbmcg
bGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
