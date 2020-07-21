Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C00D227B47
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jul 2020 10:57:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C9CC3C2937
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jul 2020 10:57:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id E79D83C26BE
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 10:57:37 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 60D4E1402F9B
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 10:57:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595321855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yZkHjp1ZDtwrrRCh2LPZCwktMHxGMGi99qGMXdXoB4A=;
 b=V0xDEBMx4Wz6IFeB2gKbwkqwHabfa4L/adgBrif1SpNFUamgnZhrrirZtr/GKWJZDmNJCj
 opu2QMaSLafYocM51NURsoJ1NKrvKriw/C4YBuwx1mWPeHEG0+xclO0kXXau9AxxqizetH
 vme8vJNZwnlk1/0tokNktrl1roKBod8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-V--DDNFyPly-u7Dqk8YY8w-1; Tue, 21 Jul 2020 04:57:31 -0400
X-MC-Unique: V--DDNFyPly-u7Dqk8YY8w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3D1F106B205;
 Tue, 21 Jul 2020 08:57:30 +0000 (UTC)
Received: from centennial.enunes.eu (unknown [10.40.192.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19CC75C1BD;
 Tue, 21 Jul 2020 08:57:26 +0000 (UTC)
To: Li Wang <liwang@redhat.com>
References: <20200720194920.22784-1-ernunes@redhat.com>
 <CAEemH2c1Sz+pkcLnCoWWCaMCte7QsmUTOoUxU6fzCF32nrrG+w@mail.gmail.com>
From: Erico Nunes <ernunes@redhat.com>
Message-ID: <98eaa723-1349-272d-3021-d2fef6e1abdd@redhat.com>
Date: Tue, 21 Jul 2020 10:57:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2c1Sz+pkcLnCoWWCaMCte7QsmUTOoUxU6fzCF32nrrG+w@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] lib: add function to check for kernel lockdown
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

VGhhbmtzIGZvciB0aGUgcmV2aWV3LiBJJ2xsIGFkZHJlc3Mgb3RoZXIgY29tbWVudHMgc29vbiwg
anVzdCBhbiBpbml0aWFsCm5vdGUgYmVsb3c6CgpPbiA3LzIxLzIwIDk6NDYgQU0sIExpIFdhbmcg
d3JvdGU6Cj4gTWF5YmUgcmVuYW1pbmcgdGhlIGZ1bmN0aW9uIHRvIHRzdF9sb2NrZG93bl9lbmFi
bGVkKCkgaXMgYmV0dGVyPyBUaGVuIHdlCj4gY2FuIHJldHVybsKgMSBpZiBjb25maXJtIGtlcm5l
bCB1bmRlciBsb2NrZG93biBtb2RlIG90aGVyd2lzZSAwLgo+IAo+ICAgICArewo+ICAgICArwqAg
wqAgwqAgwqBjaGFyIGxpbmVbQlVGU0laXTsKPiAgICAgK8KgIMKgIMKgIMKgRklMRSAqZmlsZTsK
PiAgICAgKwo+ICAgICArwqAgwqAgwqAgwqBpZiAoYWNjZXNzKCIvc3lzL2tlcm5lbC9zZWN1cml0
eS9sb2NrZG93biIsIEZfT0spICE9IDApCj4gCj4gCj4gQWZ0ZXIgdGhpbmtpbmcgb3ZlciwgSSBn
dWVzcyBpdCdzIG5vdCBlbm91Z2ggdG8gb25seSBjaGVjawo+IC9zeXMvLi4vbG9ja2Rvd24gZmls
ZS4gU2VlbXMgd2UgbmVlZCB0byBjb25zaWRlciB0aGUgc2l0dWF0aW9uIHRoYXQKPiBzeXN0ZW0g
d2l0aG91dCBzdXBwb3J0aW5nIHRoaXMgZmlsZT/CoAo+IAo+IGkuZS7CoAo+IMKgIFRlc3Qgb24g
UkhFTDggKG5vIC9zeXMvLi4vbG9ja2Rvd24gZmlsZSkgd2l0aCBrZXJuZWwgcGFyYW1ldGVyCj4g
ImxvY2tkb3duIiBhbmQgZ290IHRoZSByZXN0cmljdGlvbiBlcnJvciB0b28uCj4gCj4gIyBjYXQg
L3Byb2MvY21kbGluZcKgCj4gQk9PVF9JTUFHRT0oaGQwLG1zZG9zMSkvdm1saW51ei00LjE4LjAt
MjI2LmVsOC54ODZfNjQKPiByb290PS9kZXYvbWFwcGVyL3JoZWxfYm9vdHAtLTczLS0zLS0yMDkt
cm9vdCBybyBjb25zb2xlPXR0eVMwLDExNTIwMAo+IC4uLsKgbG9ja2Rvd24KPiDCoCDCoMKgCj4g
IyBsbCAvc3lzL2tlcm5lbC9zZWN1cml0eS9sb2NrZG93bgo+IGxzOiBjYW5ub3QgYWNjZXNzICcv
c3lzL2tlcm5lbC9zZWN1cml0eS9sb2NrZG93bic6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkK
ClRvIG15IHVuZGVyc3RhbmRpbmcsIHRoZSBwYXJhbWV0ZXIgdG8gZW5hYmxlIGxvY2tkb3duIHRo
cm91Z2gga2VucmVsCnBhcmFtZXRlcnMgaXMgImxvY2tkb3duPXtpbnRlZ3JpdHl8Y29uZmlkZW50
aWFsaXR5fSIsIG5vdCBqdXN0CiJsb2NrZG93biIsIGF0IGxlYXN0IG9uIHVwc3RyZWFtIGtlcm5l
bHM6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZh
bGRzL2xpbnV4LmdpdC9jb21taXQvP2lkPWFlZmNmMmY0YjU4MTU1ZDI3MzQwYmE1ZjlkZGJlOTUx
M2RhODI4NmQKCklmIC9zeXMva2VybmVsL3NlY3VyaXR5L2xvY2tkb3duIGRvZXNuJ3QgZXhpc3Qs
IEknbSBub3Qgc3VyZSB0aGVyZSBpcwptdWNoIHdlIGNhbiBkbyBlYXNpbHksIG9yIHRoYXQgaXMg
d29ydGggZG9pbmcgbm93LiBJIHRoaW5rIGl0IGlzIG9rIHRvCmZhbGwgYmFjayBhbmQgZmFpbCBs
aWtlIGl0IGhhcyBiZWVuIGhhcHBlbmluZyBzaW5jZSB0aGUgZmVhdHVyZSB3YXMKbWVyZ2VkIHVw
c3RyZWFtLgpJIGNhbid0IHNlZSBhIHR3ZWFrIHRoYXQgd291bGQgZW5hYmxlIHRoZSBmZWF0dXJl
IGJ1dCBub3QgdGhlIHN5c2ZzIGZpbGUKaW4gdGhlIGtlcm5lbCBzb3VyY2UuIE1heWJlIHRoYXQg
a2VybmVsIG9ubHkgaGFkIHBhcnRpYWwgc3VwcG9ydD8KCkVyaWNvCgoKLS0gCk1haWxpbmcgbGlz
dCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
