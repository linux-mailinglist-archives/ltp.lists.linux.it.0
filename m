Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B9B2005F
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2019 09:33:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B15E3EA37B
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2019 09:33:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 757113EA2E0
 for <ltp@lists.linux.it>; Thu, 16 May 2019 09:33:10 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AC09D6002D6
 for <ltp@lists.linux.it>; Thu, 16 May 2019 09:33:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4296B31760FD
 for <ltp@lists.linux.it>; Thu, 16 May 2019 07:33:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38CB460BE5
 for <ltp@lists.linux.it>; Thu, 16 May 2019 07:33:07 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2AAAA1806B11;
 Thu, 16 May 2019 07:33:07 +0000 (UTC)
Date: Thu, 16 May 2019 03:33:07 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Message-ID: <10143454.23082805.1557991987095.JavaMail.zimbra@redhat.com>
In-Reply-To: <1905751327.22994884.1557943061388.JavaMail.zimbra@redhat.com>
References: <cki.4E6B4F994B.7AOFC8BJSR@redhat.com>
 <1905751327.22994884.1557943061388.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.10]
Thread-Topic: =?utf-8?B?4p2OIEZBSUw6?= Test report for kernel
 5.1.0-8317cc1.cki (mainline.kernel.org)
Thread-Index: 4uu4n3pSgQXl3zEQnHWqSnxY4hTX1mpLeF0p
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 16 May 2019 07:33:07 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: Memory Management <mm-qe@redhat.com>, Li Wang <liwan@redhat.com>,
 CKI Project <cki-project@redhat.com>
Subject: [LTP] shmctl01 failure // Was: Re: FAIL: Test report for kernel
 5.1.0-8317cc1.cki (mainline.kernel.org)
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiAKPiAKPiAtLS0tLSBPcmlnaW5hbCBNZXNz
YWdlIC0tLS0tCj4gPiBIZWxsbywKPiA+IAo+ID4gV2UgcmFuIGF1dG9tYXRlZCB0ZXN0cyBvbiBh
IHJlY2VudCBjb21taXQgZnJvbSB0aGlzIGtlcm5lbCB0cmVlOgo+ID4gCj4gPiAgICAgICAgS2Vy
bmVsIHJlcG86Cj4gPiAgICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0Cj4gPiAgICAgICAgICAgICBDb21taXQ6IDVh
Yzk0MzMyMjQ4ZSAtIE1lcmdlIHRhZyAnZm9yLWxpbnVzJyBvZgo+ID4gICAgICAgICAgICAgZ2l0
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3JkbWEvcmRtYQo+ID4g
Cj4gPiBUaGUgcmVzdWx0cyBvZiB0aGVzZSBhdXRvbWF0ZWQgdGVzdHMgYXJlIHByb3ZpZGVkIGJl
bG93Lgo+ID4gCj4gPiAgICAgT3ZlcmFsbCByZXN1bHQ6IEZBSUxFRCAoc2VlIGRldGFpbHMgYmVs
b3cpCj4gPiAgICAgICAgICAgICAgTWVyZ2U6IE9LCj4gPiAgICAgICAgICAgIENvbXBpbGU6IE9L
Cj4gPiAgICAgICAgICAgICAgVGVzdHM6IEZBSUxFRAo+ID4gCj4gPiAKPiA+IE9uZSBvciBtb3Jl
IGtlcm5lbCB0ZXN0cyBmYWlsZWQ6Cj4gPiAKPiA+ICAgeDg2XzY0Ogo+ID4gICAgIOKdjiBMVFAg
bGl0ZQo+IAo+CgpjYyBMVFAgbGlzdAoKPiBUZXN0IGZhaWxzIG9uIFNITV9TVEFUOgo+ICAgc2ht
Y3RsMDEgICAgNSAgVEZBSUwgIDogIHNobWN0bDAxLmM6MTczOiBzaG1jdGwwMSBjYWxsIGZhaWxl
ZCAtIGVycm5vID0gMjIKPiAgIDogSW52YWxpZCBhcmd1bWVudAo+ICAgc2htY3RsKDAsIFNITV9T
VEFULCAweDYwMTA2MCkgICAgICAgICAgID0gLUVJTlZBTAo+IAo+IFdoaWNoIGxpa2VseSBzdGFy
dGVkIGZhaWxpbmcgYWZ0ZXI6Cj4gICBjb21taXQgOTlkYjQ2ZWEyOTI3ODBjZDk3OGQ1NjkzMmQ5
NDQ1YjFlOGJkYWZlOAo+ICAgQXV0aG9yOiBNYW5mcmVkIFNwcmF1bCA8bWFuZnJlZEBjb2xvcmZ1
bGxpZmUuY29tPgo+ICAgRGF0ZTogICBUdWUgTWF5IDE0IDE1OjQ2OjM2IDIwMTkgLTA3MDAKPiAg
ICAgaXBjOiBkbyBjeWNsaWMgaWQgYWxsb2NhdGlvbiBmb3IgdGhlIGlwYyBvYmplY3QuCj4gCj4g
UGVyIG1hbiBwYWdlOgo+ICJBIHN1Y2Nlc3NmdWwgSVBDX0lORk8gb3IgU0hNX0lORk8gb3BlcmF0
aW9uIHJldHVybnMgdGhlIGluZGV4IG9mIHRoZSBoaWdoZXN0Cj4gdXNlZCBlbnRyeQo+IGluIHRo
ZSBrZXJuZWwncyBpbnRlcm5hbCBhcnJheSByZWNvcmRpbmcgaW5mb3JtYXRpb24gYWJvdXQgYWxs
IHNoYXJlZCBtZW1vcnkKPiBzZWdtZW50cy4KPiAoVGhpcyBpbmZvcm1hdGlvbiBjYW4gYmUgdXNl
ZCB3aXRoIHJlcGVhdGVkIFNITV9TVEFUIG9yIFNITV9TVEFUX0FOWQo+IG9wZXJhdGlvbnMgdG8g
b2J0YWluCj4gaW5mb3JtYXRpb24gYWJvdXQgYWxsIHNoYXJlZCBtZW1vcnkgc2VnbWVudHMgb24g
dGhlIHN5c3RlbS4pIgo+IAo+IFdoaWNoIGhvd2V2ZXIgZG9lc24ndCBndWFyYW50ZWUgdGhlcmUg
d29uJ3QgYmUgYW55IGdhcHMuCj4gSSdtIGxlYW5pbmcgdG93YXJkcyB1cGRhdGluZyB0ZXN0IGF0
IHRoZSBtb21lbnQuCj4gCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwCg==
