Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2E81007CA
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 16:00:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C52153C2385
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 16:00:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 3BFD93C237D
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 16:00:26 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id CE1F3601C82
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 16:00:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574089224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qdovHduOZjHh4CShIpExiT481Sh30pWRYYVggRSMMew=;
 b=Tuq56SpjfkppbOJrxayAwbrGAch3L11Kza5AWBjFOptMQFncxQcIbkedjbWWL7mfMdDKuy
 B55TdRYVoIcuJJ6k5eh55Mr3MjAkijh5jV5mvay+rKHUR4P3vy4UkeSAifoLELwkoi7nt8
 /J8Kotq8SgViklNyLSPptgh/5NM88LY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-H9h_ehSkPcWZs-FjwtSmVA-1; Mon, 18 Nov 2019 10:00:20 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 747E7109213F;
 Mon, 18 Nov 2019 15:00:19 +0000 (UTC)
Received: from localhost.localdomain (ovpn-121-55.rdu2.redhat.com
 [10.10.121.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44E0260BE1;
 Mon, 18 Nov 2019 15:00:09 +0000 (UTC)
To: Jan Stancek <jstancek@redhat.com>, CKI Project <cki-project@redhat.com>
References: <cki.FB80424DEC.V1BSM19IWA@redhat.com>
 <1987216338.12689847.1573913007381.JavaMail.zimbra@redhat.com>
From: Rachel Sibley <rasibley@redhat.com>
Message-ID: <82b4311e-1d2f-8af7-22f1-2883b71a2a80@redhat.com>
Date: Mon, 18 Nov 2019 10:00:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1987216338.12689847.1573913007381.JavaMail.zimbra@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: H9h_ehSkPcWZs-FjwtSmVA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E4?=
 =?utf-8?q?=2E0-rc7-e1918f0=2Ecki_=28stable-next=29?=
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

CgpPbiAxMS8xNi8xOSA5OjAzIEFNLCBKYW4gU3RhbmNlayB3cm90ZToKPiAtLS0tLSBPcmlnaW5h
bCBNZXNzYWdlIC0tLS0tCj4+IEhlbGxvLAo+Pgo+PiBXZSByYW4gYXV0b21hdGVkIHRlc3RzIG9u
IGEgcmVjZW50IGNvbW1pdCBmcm9tIHRoaXMga2VybmVsIHRyZWU6Cj4+Cj4+ICAgICAgICAgS2Vy
bmVsIHJlcG86Cj4+ICAgICAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3Nhc2hhbC9saW51eC1zdGFibGUuZ2l0Cj4+ICAgICAgICAgICAgICBDb21taXQ6
IGUxOTE4ZjBjYzkyYiAtIGtjb3Y6IHJlbW90ZSBjb3ZlcmFnZSBzdXBwb3J0Cj4+Cj4+IFRoZSBy
ZXN1bHRzIG9mIHRoZXNlIGF1dG9tYXRlZCB0ZXN0cyBhcmUgcHJvdmlkZWQgYmVsb3cuCj4+Cj4+
ICAgICAgT3ZlcmFsbCByZXN1bHQ6IEZBSUxFRCAoc2VlIGRldGFpbHMgYmVsb3cpCj4+ICAgICAg
ICAgICAgICAgTWVyZ2U6IE9LCj4+ICAgICAgICAgICAgIENvbXBpbGU6IE9LCj4+ICAgICAgICAg
ICAgICAgVGVzdHM6IEZBSUxFRAo+Pgo+PiBBbGwga2VybmVsIGJpbmFyaWVzLCBjb25maWcgZmls
ZXMsIGFuZCBsb2dzIGFyZSBhdmFpbGFibGUgZm9yIGRvd25sb2FkIGhlcmU6Cj4+Cj4+ICAgIGh0
dHBzOi8vYXJ0aWZhY3RzLmNraS1wcm9qZWN0Lm9yZy9waXBlbGluZXMvMjg4NzUwCj4+Cj4+IE9u
ZSBvciBtb3JlIGtlcm5lbCB0ZXN0cyBmYWlsZWQ6Cj4+Cj4+ICAgICAgeDg2XzY0Ogo+PiAgICAg
ICDinYwgTFRQIGxpdGUKPiBOb3QgYSBrZXJuZWwgcHJvYmxlbS4KPgo+IFJhY2hlbCwKPgo+IFlv
dSBhcHBlYXIgdG8gYmUgcnVubmluZyBMVFAgd2hpY2ggZG9lc24ndCBoYXZlIGNvbW1pdCBiZWxv
dy4KPiBIb3N0IENQVSB3aGVyZSB0aGlzIGZhaWxlZCBpcyBmYW1pbHkgNiwgbW9kZWwgNzEgKElO
VEVMX0ZBTTZfQlJPQURXRUxMX0cpLgo+Cj4gY29tbWl0IDA4MDdhODI1OGZiY2YyMTZiZGQ3OWE4
ZDc0YTM0YjA3YmI0MmQ4ZDMKPiBBdXRob3I6IEphbiBTdGFuY2VrIDxqc3RhbmNla0ByZWRoYXQu
Y29tPgo+IERhdGU6ICAgTW9uIE9jdCAyOCAxNDozMzoyNiAyMDE5ICswMTAwCj4KPiAgICAgIHB0
X3Rlc3Q6IHNraXAgcHRfZGlzYWJsZV9icmFuY2ggb24gQnJvYWR3ZWxsIENQVXMKPiAgICAgIAo+
ICAgICAgY29tbWl0IGQzNTg2OWJhMzQ4ZCAoInBlcmYveDg2L2ludGVsL3B0OiBBbGxvdyB0aGUg
ZGlzYWJsaW5nIG9mIGJyYW5jaCB0cmFjaW5nIikKPiAgICAgIGRpc2FsbG93cyBub3Qgc2V0dGlu
ZyBCUkFOQ0hfRU4gZHVlIHRvIGVycmF0dW0gQkRNMTA2IG9uIEJyb2Fkd2VsbCBDUFVzLgpUaGFu
a3PCoCBKYW4sIEknbSB3b3JraW5nIG9uIHVwZGF0aW5nIExUUCB0byBhIHJlY2VudCBjb21taXQg
bm93LCBJJ2xsIGNjIAp5b3UgaW4gdGhlIHRpY2tldC4KCgotLSAKTWFpbGluZyBsaXN0IGluZm86
IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
