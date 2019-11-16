Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA82FEC8F
	for <lists+linux-ltp@lfdr.de>; Sat, 16 Nov 2019 15:03:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D5FEB3C242A
	for <lists+linux-ltp@lfdr.de>; Sat, 16 Nov 2019 15:03:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id A3EF03C220E
 for <ltp@lists.linux.it>; Sat, 16 Nov 2019 15:03:32 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 7E5821A013A1
 for <ltp@lists.linux.it>; Sat, 16 Nov 2019 15:03:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573913009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=phs4W9YYs6fFscGsJ+vXifjWd7XE9aJ9PgFGanJA3aM=;
 b=fEyuVfgptMiMXCBYezK9aZPVb6C8IM3d7eRe2Lb+cXu5xmsjA9tAqC8UD6snUHgyUV5dWm
 4hq8U3G/Eogqputm9UojY8O3pxqfkz8NT80yjr8e0TK5JCNkmssKOcRyNpNFH7Wk+2QMh2
 I32RSpk/W016CTT2lCcW4URWtvUK7Jw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-TlcCh86_MImICTnr8E7qUQ-1; Sat, 16 Nov 2019 09:03:28 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6A121005512;
 Sat, 16 Nov 2019 14:03:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B0038608D0;
 Sat, 16 Nov 2019 14:03:27 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9FA7118095FF;
 Sat, 16 Nov 2019 14:03:27 +0000 (UTC)
Date: Sat, 16 Nov 2019 09:03:27 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: CKI Project <cki-project@redhat.com>, Rachel Sibley <rasibley@redhat.com>
Message-ID: <1987216338.12689847.1573913007381.JavaMail.zimbra@redhat.com>
In-Reply-To: <cki.FB80424DEC.V1BSM19IWA@redhat.com>
References: <cki.FB80424DEC.V1BSM19IWA@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.45, 10.4.195.27]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Test report for kernel
 5.4.0-rc7-e1918f0.cki (stable-next)
Thread-Index: RfJRajFbYqwEY7sbNpESrUw1VYb7Ew==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: TlcCh86_MImICTnr8E7qUQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiAKPiBIZWxsbywKPiAKPiBXZSByYW4gYXV0
b21hdGVkIHRlc3RzIG9uIGEgcmVjZW50IGNvbW1pdCBmcm9tIHRoaXMga2VybmVsIHRyZWU6Cj4g
Cj4gICAgICAgIEtlcm5lbCByZXBvOgo+ICAgICAgICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvc2FzaGFsL2xpbnV4LXN0YWJsZS5naXQKPiAgICAgICAgICAg
ICBDb21taXQ6IGUxOTE4ZjBjYzkyYiAtIGtjb3Y6IHJlbW90ZSBjb3ZlcmFnZSBzdXBwb3J0Cj4g
Cj4gVGhlIHJlc3VsdHMgb2YgdGhlc2UgYXV0b21hdGVkIHRlc3RzIGFyZSBwcm92aWRlZCBiZWxv
dy4KPiAKPiAgICAgT3ZlcmFsbCByZXN1bHQ6IEZBSUxFRCAoc2VlIGRldGFpbHMgYmVsb3cpCj4g
ICAgICAgICAgICAgIE1lcmdlOiBPSwo+ICAgICAgICAgICAgQ29tcGlsZTogT0sKPiAgICAgICAg
ICAgICAgVGVzdHM6IEZBSUxFRAo+IAo+IEFsbCBrZXJuZWwgYmluYXJpZXMsIGNvbmZpZyBmaWxl
cywgYW5kIGxvZ3MgYXJlIGF2YWlsYWJsZSBmb3IgZG93bmxvYWQgaGVyZToKPiAKPiAgIGh0dHBz
Oi8vYXJ0aWZhY3RzLmNraS1wcm9qZWN0Lm9yZy9waXBlbGluZXMvMjg4NzUwCj4gCj4gT25lIG9y
IG1vcmUga2VybmVsIHRlc3RzIGZhaWxlZDoKPiAKPiAgICAgeDg2XzY0Ogo+ICAgICAg4p2MIExU
UCBsaXRlCgpOb3QgYSBrZXJuZWwgcHJvYmxlbS4gCgpSYWNoZWwsCgpZb3UgYXBwZWFyIHRvIGJl
IHJ1bm5pbmcgTFRQIHdoaWNoIGRvZXNuJ3QgaGF2ZSBjb21taXQgYmVsb3cuCkhvc3QgQ1BVIHdo
ZXJlIHRoaXMgZmFpbGVkIGlzIGZhbWlseSA2LCBtb2RlbCA3MSAoSU5URUxfRkFNNl9CUk9BRFdF
TExfRykuCgpjb21taXQgMDgwN2E4MjU4ZmJjZjIxNmJkZDc5YThkNzRhMzRiMDdiYjQyZDhkMwpB
dXRob3I6IEphbiBTdGFuY2VrIDxqc3RhbmNla0ByZWRoYXQuY29tPgpEYXRlOiAgIE1vbiBPY3Qg
MjggMTQ6MzM6MjYgMjAxOSArMDEwMAoKICAgIHB0X3Rlc3Q6IHNraXAgcHRfZGlzYWJsZV9icmFu
Y2ggb24gQnJvYWR3ZWxsIENQVXMKICAgIAogICAgY29tbWl0IGQzNTg2OWJhMzQ4ZCAoInBlcmYv
eDg2L2ludGVsL3B0OiBBbGxvdyB0aGUgZGlzYWJsaW5nIG9mIGJyYW5jaCB0cmFjaW5nIikKICAg
IGRpc2FsbG93cyBub3Qgc2V0dGluZyBCUkFOQ0hfRU4gZHVlIHRvIGVycmF0dW0gQkRNMTA2IG9u
IEJyb2Fkd2VsbCBDUFVzLgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5s
aW51eC5pdC9saXN0aW5mby9sdHAK
