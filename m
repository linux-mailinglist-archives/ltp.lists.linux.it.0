Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C241473E1
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 23:34:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5685B3C2531
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 23:34:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 25EF63C24FD
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 23:34:11 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 02CEB1A009A6
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 23:34:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579818849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xt1Sx4CJFCZ6eLyvybjIeqLZeBCJ8vZON841MCa4624=;
 b=AxXupAKZ2lCwS29f2jkn6FmOcOqZn1rVfn9ZWo+AWj8+2+BTkQDuskL7ojNYFgovxeK96T
 ilEx2cjql9VLuUmU4K30P26W7/vrRq16cWAA7RryJdnzFHlcQrSWMMY1cejDMXPttjNb19
 EuaNwhQZHbaGyzfM+CGrxJcYe3dURSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-EoAvUN-wMP-8V5_ZWRUBpQ-1; Thu, 23 Jan 2020 17:34:07 -0500
X-MC-Unique: EoAvUN-wMP-8V5_ZWRUBpQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 909FB107ACC4;
 Thu, 23 Jan 2020 22:34:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87BD186457;
 Thu, 23 Jan 2020 22:34:06 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F13A38A1;
 Thu, 23 Jan 2020 22:34:06 +0000 (UTC)
Date: Thu, 23 Jan 2020 17:34:06 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: CKI Project <cki-project@redhat.com>
Message-ID: <600201642.3600472.1579818846276.JavaMail.zimbra@redhat.com>
In-Reply-To: <cki.03B22F835F.RSIEVD547K@redhat.com>
References: <cki.03B22F835F.RSIEVD547K@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.13]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Test report for kernel
 5.4.14-0fce94b.cki (stable)
Thread-Index: TykMIIsk7/3a5DegolQzVCTDuj77RA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E4?=
 =?utf-8?q?=2E14-0fce94b=2Ecki_=28stable=29?=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gICBwcGM2NGxlOgo+ICAgICBIb3N0IDE6
Cj4gICAgICAgIOKchSBCb290IHRlc3QKPiAgICAgICAg4pyFIFBvZG1hbiBzeXN0ZW0gaW50ZWdy
YXRpb24gdGVzdCAoYXMgcm9vdCkKPiAgICAgICAg4pyFIFBvZG1hbiBzeXN0ZW0gaW50ZWdyYXRp
b24gdGVzdCAoYXMgdXNlcikKPiAgICAgICAg4p2MIExUUAoKVGhpcyBpcyBzYWZlIHRvIGlnbm9y
ZS4KCkkgY2FuIHJlcHJvZHVjZSBvbiBhZmZlY3RlZCBzeXN0ZW0sIGl0IGRvZXNuJ3QgaGFuZyBv
biBhbnl0aGluZyBzcGVjaWZpYywKaXQncyBqdXN0IHRoYXQgdGVzdCBpcyB0YWtpbmcgbG9uZ2Vy
IHRoYW4gZXhwZWN0ZWQgYW5kIGhpdHMgdGltZW91dC4KSSdsbCBsb29rIGludG8gcHJvcG9zaW5n
IExUUCBwYXRjaCBmb3IgdGhpcyBpc3N1ZS4KCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
