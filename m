Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BE718EDF8
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 03:26:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 02A3F3C4F29
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 03:26:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id CA04F3C0431
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 03:26:09 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id A4741600D79
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 03:26:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584930367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KA8i33OE3crakW63RTYEJl6zGvV0gUsyDfsUtbp2Eu0=;
 b=XKTDUxqJHNoQj6Pss6xY9NepPZvk2vPAZrqAv4gJZX/cUdghP8bMiumz1VfambPEnReTbV
 D/5HJuGUzYG1fAj3Q2RoNVkWlKpCSUuEpOoyzaoAgHAxb97w4/n01zijNjcO0ti/AkD17J
 WSPdTfqhYqND8dhIxq8ZPEUp0+Hx9So=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-oQ8E0ntNOKWkdG7SH2caag-1; Sun, 22 Mar 2020 22:26:05 -0400
X-MC-Unique: oQ8E0ntNOKWkdG7SH2caag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EA3213F7;
 Mon, 23 Mar 2020 02:26:04 +0000 (UTC)
Received: from localhost (dhcp-12-196.nay.redhat.com [10.66.12.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 940299081F;
 Mon, 23 Mar 2020 02:25:58 +0000 (UTC)
Date: Mon, 23 Mar 2020 10:25:57 +0800
From: Murphy Zhou <xzhou@redhat.com>
To: Sasha Levin <sashal@kernel.org>
Message-ID: <20200323022557.vm3hlc3ndggp5yws@xzhoux.usersys.redhat.com>
References: <cki.D9E02DA05E.6L1W61X8RG@redhat.com>
 <20200323015828.GS4189@sasha-vm>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200323015828.GS4189@sasha-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=F0=9F=92=A5_PANICKED=3A_Test_report_for_kernel_?=
 =?utf-8?q?5=2E5=2E11-6df57ed=2Ecki_=28stable-queue=29?=
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
Cc: Memory Management <mm-qe@redhat.com>, Ondrej Mosnacek <omosnace@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>,
 CKI Project <cki-project@redhat.com>, Ondrej Moris <omoris@redhat.com>,
 LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gU3VuLCBNYXIgMjIsIDIwMjAgYXQgMDk6NTg6MjhQTSAtMDQwMCwgU2FzaGEgTGV2aW4gd3Jv
dGU6Cj4gT24gU3VuLCBNYXIgMjIsIDIwMjAgYXQgMTE6NTA6MTFQTSAtMDAwMCwgQ0tJIFByb2pl
Y3Qgd3JvdGU6Cj4gPiAKPiA+IEhlbGxvLAo+ID4gCj4gPiBXZSByYW4gYXV0b21hdGVkIHRlc3Rz
IG9uIGEgcmVjZW50IGNvbW1pdCBmcm9tIHRoaXMga2VybmVsIHRyZWU6Cj4gPiAKPiA+ICAgICAg
IEtlcm5lbCByZXBvOiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9zdGFibGUvbGludXgtc3RhYmxlLXJjLmdpdAo+ID4gICAgICAgICAgICBDb21taXQ6IDZk
ZjU3ZWQxNGRkZiAtIFJldmVydCAiZHJtL2ZiZGV2OiBGYWxsYmFjayB0byBub24gdGlsZWQgbW9k
ZSBpZiBhbGwgdGlsZXMgbm90IHByZXNlbnQiCj4gPiAKPiA+IFRoZSByZXN1bHRzIG9mIHRoZXNl
IGF1dG9tYXRlZCB0ZXN0cyBhcmUgcHJvdmlkZWQgYmVsb3cuCj4gPiAKPiA+ICAgIE92ZXJhbGwg
cmVzdWx0OiBGQUlMRUQgKHNlZSBkZXRhaWxzIGJlbG93KQo+ID4gICAgICAgICAgICAgTWVyZ2U6
IE9LCj4gPiAgICAgICAgICAgQ29tcGlsZTogT0sKPiA+ICAgICAgICAgICAgIFRlc3RzOiBQQU5J
Q0tFRAo+ID4gCj4gPiBBbGwga2VybmVsIGJpbmFyaWVzLCBjb25maWcgZmlsZXMsIGFuZCBsb2dz
IGFyZSBhdmFpbGFibGUgZm9yIGRvd25sb2FkIGhlcmU6Cj4gPiAKPiA+ICBodHRwczovL2NraS1h
cnRpZmFjdHMuczMudXMtZWFzdC0yLmFtYXpvbmF3cy5jb20vaW5kZXguaHRtbD9wcmVmaXg9ZGF0
YXdhcmVob3VzZS8yMDIwLzAzLzIyLzUwMDYwMAo+ID4gCj4gPiBPbmUgb3IgbW9yZSBrZXJuZWwg
dGVzdHMgZmFpbGVkOgo+ID4gCj4gPiAgICBwcGM2NGxlOgo+ID4gICAgIOKdjCBMVFAKPiA+IAo+
ID4gICAgYWFyY2g2NDoKPiA+ICAgICDinYwgQm9vdCB0ZXN0Cj4gPiAKPiA+ICAgIHg4Nl82NDoK
PiA+ICAgICDwn5KlIHhmc3Rlc3RzIC0gZXh0NAo+IAo+IFNvIEkgZ28gaW4gdGhlIHhmc3Rlc3Rz
X19fZXh0NC8gZGlyZWN0b3J5IHRvIHNlZSB3aGF0IHBhbmljZWQsIHJpZ2h0PyBJCj4gZG9uJ3Qg
c2VlIHBhbmljcyBpbiB0aG9zZSBsb2dzLi4uCgpJdCdzIGluIHRoZSB4ODZfNjRfM19jb25zb2xl
LmxvZwoKWyAgMjQ3LjYyMzI1MV0gQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNl
LCBhZGRyZXNzOiAwMDAwMDAwMDAwMDAwMDAwIApbICAyNDcuNjMxMDIxXSAjUEY6IHN1cGVydmlz
b3Igd3JpdGUgYWNjZXNzIGluIGtlcm5lbCBtb2RlIApbICAyNDcuNjM2ODQ4XSAjUEY6IGVycm9y
X2NvZGUoMHgwMDAyKSAtIG5vdC1wcmVzZW50IHBhZ2UgClsgIDI0Ny42NDI1NzldIFBHRCAwIFA0
RCAwICAKWyAgMjQ3LjY0NTQwMl0gT29wczogMDAwMiBbIzFdIFNNUCBQVEkgClsgIDI0Ny42NDky
OTJdIENQVTogMiBQSUQ6IDE4OTcgQ29tbToga3dvcmtlci8yOjQwIFRhaW50ZWQ6IEcgICAgICAg
ICAgSSA1LjUuMTEtNmRmNTdlZC5ja2kgIzEgClsgIDI0Ny42NTkxOTJdIEhhcmR3YXJlIG5hbWU6
IElCTSBTeXN0ZW0geDMyNTAgTTQgLVsyNTgzRUNVXS0vMDBEMzcyOSwgQklPUyAtW0pRRTE2OEJV
Uy0xLjA5XS0gMDkvMTcvMjAxNCAKWyAgMjQ3LjY2OTU4MF0gV29ya3F1ZXVlOiBjZ3JvdXBfZGVz
dHJveSBjc3Nfa2lsbGVkX3dvcmtfZm4gClsgIDI0Ny42NzU1MDZdIFJJUDogMDAxMDpiZnFfYmZx
cV9tb3ZlKzB4MjEvMHgxNjAgClsgIDI0Ny42ODA0NjJdIENvZGU6IGMwIGMzIDBmIDFmIDgwIDAw
IDAwIDAwIDAwIDBmIDFmIDQ0IDAwIDAwIDQxIDU1IDQxCjU0IDQ5IDg5IGZjIDU1IDQ4IDg5IGY1
IDUzIDQ4IDg5IGQzIDQ4IDM5IGI3IGEwIDAwIDAwIDAwIDBmIDg0IDIyIDAxIDAwCjAwIDw4Mz4g
NDUgMDAgMDEgNDggODkgZWYgZTggYTMgODcgZmYgZmYgODUgYzAgMGYgODUgZDcgMDAgMDAgMDAg
ODAgYmQgClsgIDI0Ny43MDE0MTVdIFJTUDogMDAxODpmZmZmYjYxMzQwZTg3ZGIwIEVGTEFHUzog
MDAwMTAwODYgClsgIDI0Ny43MDcyNDJdIFJBWDogMDAwMDAwMDAwMDAwMDAwMCBSQlg6IGZmZmY5
OWQ5YjFkZDgwMDAgUkNYOiAwMDAwMDAwMDAwMDAwMDAwIApbICAyNDcuNzE1MjAyXSBSRFg6IGZm
ZmY5OWQ5YjFkZDgwMDAgUlNJOiAwMDAwMDAwMDAwMDAwMDAwIFJESTogZmZmZjk5ZDliMWRkYTAw
MCAKWyAgMjQ3LjcyMzE2MV0gUkJQOiAwMDAwMDAwMDAwMDAwMDAwIFIwODogMDAwMDAwMDAzYjlh
Y2EwMCBSMDk6IGZmZmY5OWQ5YjFkODczMDAgClsgIDI0Ny43MzExMjNdIFIxMDogMDAwMDAwMDAw
MDAwMDAwMCBSMTE6IGZmZmY5OWQ5YjFkODczMDAgUjEyOiBmZmZmOTlkOWIxZGRhMDAwIApbICAy
NDcuNzM5MDgzXSBSMTM6IGZmZmY5OWQ5ODQ5MmQxYjAgUjE0OiBmZmZmOTlkOWIxZGRhM2YwIFIx
NTogZmZmZjk5ZDk4NDkyZDA5OCAKWyAgMjQ3Ljc0NzA0NF0gRlM6ICAwMDAwMDAwMDAwMDAwMDAw
KDAwMDApIEdTOmZmZmY5OWQ5YjdjODAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMCAK
WyAgMjQ3Ljc1NjA3M10gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4
MDA1MDAzMyAKWyAgMjQ3Ljc2MjQ4MV0gQ1IyOiAwMDAwMDAwMDAwMDAwMDAwIENSMzogMDAwMDAw
MDIzMDYwYTAwNSBDUjQ6IDAwMDAwMDAwMDAxNjA2ZTAgClsgIDI0Ny43NzA0NDFdIENhbGwgVHJh
Y2U6IApbICAyNDcuNzczMTcwXSAgYmZxX3BkX29mZmxpbmUrMHg4Ny8weGYwIApbICAyNDcuNzc3
MjU0XSAgYmxrZ19kZXN0cm95KzB4NTIvMHhmMCAKWyAgMjQ3Ljc4MTE0M10gIGJsa2NnX2Rlc3Ry
b3lfYmxrZ3MrMHg0Zi8weGEwIApbICAyNDcuNzg1NzEwXSAgY3NzX2tpbGxlZF93b3JrX2ZuKzB4
NGQvMHhkMCAKWyAgMjQ3Ljc5MDE4MV0gIHByb2Nlc3Nfb25lX3dvcmsrMHgxYjUvMHgzNjAgClsg
IDI0Ny43OTQ2NTFdICB3b3JrZXJfdGhyZWFkKzB4NTAvMHgzYzAgClsgIDI0Ny43OTg3MzNdICBr
dGhyZWFkKzB4ZjkvMHgxMzAgClsgIDI0Ny44MDIyMzRdICA/IHByb2Nlc3Nfb25lX3dvcmsrMHgz
NjAvMHgzNjAgClsgIDI0Ny44MDY4OTldICA/IGt0aHJlYWRfcGFyaysweDkwLzB4OTAgClsgIDI0
Ny44MTA5ODNdICByZXRfZnJvbV9mb3JrKzB4MzUvMHg0MCAKPiAKPiAtLSAKPiBUaGFua3MsCj4g
U2FzaGEKPiAKCi0tIApNdXJwaHkKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
