Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F94E831A
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Oct 2019 09:20:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 331F23C2152
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Oct 2019 09:20:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id C0A893C0428
 for <ltp@lists.linux.it>; Tue, 29 Oct 2019 09:20:34 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 767881A00FF7
 for <ltp@lists.linux.it>; Tue, 29 Oct 2019 09:20:33 +0100 (CET)
Received: from localhost (unknown [91.217.168.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B9FA20717;
 Tue, 29 Oct 2019 08:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572337230;
 bh=CrG2u9UyUZXG3Xr/MHkZ4yqOAoADNz6ZmA0e8aqOJMQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tP2EWmWDTDOwlKQY6OqmtNaVVbLWFdrj7VyVwMH7t57sVVQfl04E5mvl2rFY8xg/U
 FA8Y4x8hqVZDCZNLH1K0QfxAnApHr8bdIolMQZHpr/KPFQRSt1+KFtxtZcqjeaD9+6
 b/SoVB+76aT8kjXLi1pqANXyN/ciYHGSy99WYBHM=
Date: Tue, 29 Oct 2019 09:20:28 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20191029082028.GA554294@kroah.com>
References: <20191027203251.029297948@linuxfoundation.org>
 <CA+G9fYuA+kLqLo1_ev0=QRvYtMrVhwRvm+QO-tOCVYca2Mt97Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYuA+kLqLo1_ev0=QRvYtMrVhwRvm+QO-tOCVYca2Mt97Q@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4.19 00/93] 4.19.81-stable review
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
Cc: Ben Hutchings <ben.hutchings@codethink.co.uk>,
 Linus Torvalds <torvalds@linux-foundation.org>, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 patches@kernelci.org, linux- stable <stable@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMTE6NTE6MjZBTSArMDUzMCwgTmFyZXNoIEthbWJvanUg
d3JvdGU6Cj4gT24gTW9uLCAyOCBPY3QgMjAxOSBhdCAwMjo0NCwgR3JlZyBLcm9haC1IYXJ0bWFu
Cj4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPiA+Cj4gPiBUaGlzIGlzIHRo
ZSBzdGFydCBvZiB0aGUgc3RhYmxlIHJldmlldyBjeWNsZSBmb3IgdGhlIDQuMTkuODEgcmVsZWFz
ZS4KPiA+IFRoZXJlIGFyZSA5MyBwYXRjaGVzIGluIHRoaXMgc2VyaWVzLCBhbGwgd2lsbCBiZSBw
b3N0ZWQgYXMgYSByZXNwb25zZQo+ID4gdG8gdGhpcyBvbmUuICBJZiBhbnlvbmUgaGFzIGFueSBp
c3N1ZXMgd2l0aCB0aGVzZSBiZWluZyBhcHBsaWVkLCBwbGVhc2UKPiA+IGxldCBtZSBrbm93Lgo+
ID4KPiA+IFJlc3BvbnNlcyBzaG91bGQgYmUgbWFkZSBieSBUdWUgMjkgT2N0IDIwMTkgMDg6Mjc6
MDIgUE0gVVRDLgo+ID4gQW55dGhpbmcgcmVjZWl2ZWQgYWZ0ZXIgdGhhdCB0aW1lIG1pZ2h0IGJl
IHRvbyBsYXRlLgo+ID4KPiA+IFRoZSB3aG9sZSBwYXRjaCBzZXJpZXMgY2FuIGJlIGZvdW5kIGlu
IG9uZSBwYXRjaCBhdDoKPiA+ICAgICAgICAgaHR0cHM6Ly93d3cua2VybmVsLm9yZy9wdWIvbGlu
dXgva2VybmVsL3Y0Lngvc3RhYmxlLXJldmlldy9wYXRjaC00LjE5LjgxLXJjMS5nego+ID4gb3Ig
aW4gdGhlIGdpdCB0cmVlIGFuZCBicmFuY2ggYXQ6Cj4gPiAgICAgICAgIGdpdDovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXgtc3RhYmxlLXJjLmdp
dCBsaW51eC00LjE5LnkKPiA+IGFuZCB0aGUgZGlmZnN0YXQgY2FuIGJlIGZvdW5kIGJlbG93Lgo+
ID4KPiA+IHRoYW5rcywKPiA+Cj4gPiBncmVnIGstaAo+ID4KPiAKPiBSZXN1bHRzIGZyb20gTGlu
YXJv4oCZcyB0ZXN0IGZhcm0uCj4gTm8gcmVncmVzc2lvbnMgb24gYXJtNjQsIGFybSwgeDg2XzY0
LCBhbmQgaTM4Ni4KPiAKPiBOb3RlOgo+IFRoZSBuZXcgdGVzdCBjYXNlICBmcm9tIExUUCB2ZXJz
aW9uIHVwZ3JhZGUgc3lzY2FsbHMgc3luY19maWxlX3JhbmdlMDIgaXMgYW4KPiBpbnRlcm1pdHRl
bnQgZmFpbHVyZS4gV2UgYXJlIGludmVzdGlnYXRpbmcgdGhpcyBjYXNlLgo+IFRoZSBsaXN0ZWQg
Zml4ZXMgaW4gdGhlIGJlbG93IHNlY3Rpb24gYXJlIGR1ZSB0byBMVFAgdXBncmFkZSB0byB2MjAx
OTA5MzAuCgpUaGFua3MgZm9yIHRlc3RpbmcgdHdvIG9mIHRoZXNlIGFuZCBsZXR0aW5nIG1lIGtu
b3cuCgpncmVnIGstaAoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cAo=
