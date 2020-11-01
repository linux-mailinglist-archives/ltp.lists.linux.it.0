Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D46492A1DB0
	for <lists+linux-ltp@lfdr.de>; Sun,  1 Nov 2020 12:52:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 939FE3C3089
	for <lists+linux-ltp@lfdr.de>; Sun,  1 Nov 2020 12:52:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id BC7A13C23B1
 for <ltp@lists.linux.it>; Sun,  1 Nov 2020 12:52:24 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9D5CC1000600
 for <ltp@lists.linux.it>; Sun,  1 Nov 2020 12:52:23 +0100 (CET)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7DC6D206E5;
 Sun,  1 Nov 2020 11:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604231541;
 bh=l+cEN+sHBnTnUYn8mP+ZddldI5H73zcAjG+zjQQ9zKs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uy0Ej/XzuyC1YNwUJq7tejIChqCRTmz9SPEQZ5fZnWNmJfwE35DESFCHpl948zTfP
 1Y1UnOAXmlcAvMDDlOdq/uR6iu0GlQjcDVZGK6MnJLzfO8n2EUX1l6T/AWU7zx82yz
 dbk0jAnKUGuifSlvj287myuOgSW+bH7AeZvZRTr8=
Date: Sun, 1 Nov 2020 12:53:04 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20201101115304.GB3349581@kroah.com>
References: <20201031113500.031279088@linuxfoundation.org>
 <CA+G9fYshNJgQFZ_oxb4VgSbe2xWym9am6ajpr-SVH_bw4psa1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYshNJgQFZ_oxb4VgSbe2xWym9am6ajpr-SVH_bw4psa1Q@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5.9 00/74] 5.9.3-rc1 review
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
Cc: pavel@denx.de, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>,
 linux- stable <stable@vger.kernel.org>, patches@kernelci.org,
 Linus Torvalds <torvalds@linux-foundation.org>, lkft-triage@lists.linaro.org,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gU3VuLCBOb3YgMDEsIDIwMjAgYXQgMTI6MzQ6NDJQTSArMDUzMCwgTmFyZXNoIEthbWJvanUg
d3JvdGU6Cj4gT24gU2F0LCAzMSBPY3QgMjAyMCBhdCAxNzoxNywgR3JlZyBLcm9haC1IYXJ0bWFu
Cj4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPiA+Cj4gPiBUaGlzIGlzIHRo
ZSBzdGFydCBvZiB0aGUgc3RhYmxlIHJldmlldyBjeWNsZSBmb3IgdGhlIDUuOS4zIHJlbGVhc2Uu
Cj4gPiBUaGVyZSBhcmUgNzQgcGF0Y2hlcyBpbiB0aGlzIHNlcmllcywgYWxsIHdpbGwgYmUgcG9z
dGVkIGFzIGEgcmVzcG9uc2UKPiA+IHRvIHRoaXMgb25lLiAgSWYgYW55b25lIGhhcyBhbnkgaXNz
dWVzIHdpdGggdGhlc2UgYmVpbmcgYXBwbGllZCwgcGxlYXNlCj4gPiBsZXQgbWUga25vdy4KPiA+
Cj4gPiBSZXNwb25zZXMgc2hvdWxkIGJlIG1hZGUgYnkgTW9uLCAwMiBOb3YgMjAyMCAxMTozNDo0
MiArMDAwMC4KPiA+IEFueXRoaW5nIHJlY2VpdmVkIGFmdGVyIHRoYXQgdGltZSBtaWdodCBiZSB0
b28gbGF0ZS4KPiA+Cj4gPiBUaGUgd2hvbGUgcGF0Y2ggc2VyaWVzIGNhbiBiZSBmb3VuZCBpbiBv
bmUgcGF0Y2ggYXQ6Cj4gPiAgICAgICAgIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL2xpbnV4
L2tlcm5lbC92NS54L3N0YWJsZS1yZXZpZXcvcGF0Y2gtNS45LjMtcmMxLmd6Cj4gPiBvciBpbiB0
aGUgZ2l0IHRyZWUgYW5kIGJyYW5jaCBhdDoKPiA+ICAgICAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC1zdGFibGUtcmMuZ2l0IGxp
bnV4LTUuOS55Cj4gPiBhbmQgdGhlIGRpZmZzdGF0IGNhbiBiZSBmb3VuZCBiZWxvdy4KPiA+Cj4g
PiB0aGFua3MsCj4gPgo+ID4gZ3JlZyBrLWgKPiA+Cj4gCj4gUmVzdWx0cyBmcm9tIExpbmFyb+KA
mXMgdGVzdCBmYXJtLgo+IE5vIHJlZ3Jlc3Npb25zIG9uIGFybTY0LCBhcm0sIHg4Nl82NCwgYW5k
IGkzODYuCj4gCj4gVGVzdGVkLWJ5OiBMaW51eCBLZXJuZWwgRnVuY3Rpb25hbCBUZXN0aW5nIDxs
a2Z0QGxpbmFyby5vcmc+CgpUaGFua3MgZm9yIHRlc3RpbmcgYWxsIG9mIHRoZXNlIGFuZCBsZXR0
aW5nIG1lIGtvbncuCgpncmVnIGstaAoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
