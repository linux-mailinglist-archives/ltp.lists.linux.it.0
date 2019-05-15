Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5D11F696
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 16:30:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DFAAB294AC1
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 16:30:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 749F23EA19D
 for <ltp@lists.linux.it>; Wed, 15 May 2019 16:30:21 +0200 (CEST)
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C61661401AE4
 for <ltp@lists.linux.it>; Wed, 15 May 2019 16:30:20 +0200 (CEST)
Received: by mail-yw1-xc41.google.com with SMTP id e68so16766ywf.3
 for <ltp@lists.linux.it>; Wed, 15 May 2019 07:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U4HxZekHoLmLCK5kAOT0osqgy/TjEZ++y4gu6gwfWv8=;
 b=e/X+BtpQu2BYH3mlcuVKRyTr9ATp0iD42w2EhxMtpYvJdbiCD4UlBzOCfspNCQuTt4
 +t/ZIhWTfZb693uFdicHmHHlotg+2l0ZxlErdLW0yFNTeFSeGIjImV9qV2mso8KN5epY
 GXmH35SzqhoUee21aRhsivpera/s5F/Z13ZNQSWaSeeRXZGJJu6V25isElHAc2z6xVmg
 HtDYdTmjWfZ3kLNK4LY/4gs/OD4xM2GluepJKfT0Z25gnedcHFJ4AYCB7E1UYsQv4DkG
 K8XLiBGL8yMTLvU0lMgIH6x7nuvTiSTGN3kZ3ZtndMDm6M15ShDGi7eX/udelIXLIxoy
 6Y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U4HxZekHoLmLCK5kAOT0osqgy/TjEZ++y4gu6gwfWv8=;
 b=jjaVWTCW0lSmX568GgdOI6ly5D7YBltkg/MkkqOmklPHcD/Q+FdoTb949JjrDSIIjq
 lU6u1NtZlarTKV+ljq2yj2aUbTX+cPwoQTr9qcjhGz6ESW7687IeRs6FJfrYsRzrk47c
 vR214/ThnOJmybB5FDhBHe45Rm5w+3G7qMom+uvkhXu0OWDTuPsSQkX2lbAwcD8bZa3u
 CgYCAnUT2+HzOCFvOfcBQZ5AlxvRv3BRM0yyhf26mf1emmZv6lfIwI9C0q4Dupu83FVc
 b+yW748r2sbNBXevp5XaOVFABfdNwETnCoD18naa7rLik85F3or65nSlhXC8YCqRjP4N
 2Tyg==
X-Gm-Message-State: APjAAAUdWmqhMwFlCQOad6kyD3nXynFyiYYnt6mBBc2jXmw43r9FmGgU
 /SGilUOC2jSop65HbNYjn8HXMZumJHo5ATAMZWY=
X-Google-Smtp-Source: APXvYqzihrzco9VVzhbffcSaJQh+lJ5W1zTwrAAXSUc4gMM43sOjXEYUi1YTAayciqnzZcNWRQ0NMxb4HfAG5Kk8lro=
X-Received: by 2002:a81:9850:: with SMTP id p77mr21047198ywg.176.1557930619560; 
 Wed, 15 May 2019 07:30:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190503210005.GA18171@x230>
 <20190515092129.26336-1-xzhou@redhat.com>
 <20190515133102.GA5429@dell5510> <20190515134245.GC5429@dell5510>
In-Reply-To: <20190515134245.GC5429@dell5510>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 15 May 2019 17:30:08 +0300
Message-ID: <CAOQ4uxhaSBiKY7nLNnbvpc7mpcnyOJ8Ecf3Es8n_VTPBRnfF7g@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: Li Wang <liwan@redhat.com>, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 1/2] OVL_MNT: add setup_overlay helper
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

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgNDo0MiBQTSBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5j
ej4gd3JvdGU6Cj4KPiBIaSBNdXJwaHksCj4KPiA+IC4uLgo+ID4gPiAraW50IHNldHVwX292ZXJs
YXkoaW50IG1vdW50b3ZsKQo+ID4gPiArewo+ID4gPiArICAgaW50IHJldDsKPiA+ID4gKwo+ID4g
PiArICAgLyogU2V0dXAgYW4gb3ZlcmxheSBtb3VudCB3aXRoIGxvd2VyIGRpciBhbmQgZmlsZSAq
Lwo+ID4gPiArICAgU0FGRV9NS0RJUihPVkxfTE9XRVIsIDA3NTUpOwo+ID4gPiArICAgU0FGRV9N
S0RJUihPVkxfVVBQRVIsIDA3NTUpOwo+ID4gPiArICAgU0FGRV9NS0RJUihPVkxfV09SSywgMDc1
NSk7Cj4gPiA+ICsgICBTQUZFX01LRElSKE9WTF9NTlQsIDA3NTUpOwo+ID4gPiArCj4gPiA+ICsg
ICAvKiBPbmx5IGNyZWF0ZSBkaXJzLCBkbyBub3QgbW91bnQgKi8KPiA+ID4gKyAgIGlmIChtb3Vu
dG92bCA9PSAwKQo+ID4gPiArICAgICAgICAgICByZXR1cm4gMDsKPiA+IEluc3RlYWQgb2YgaGF2
aW5nIGludCBwYXJhbWV0ZXIsIHRoZXJlIGNvdWxkIGJlIGNyZWF0ZV9vdmVybGF5X2RpcnMoKQo+
ID4gYW5kIG1vdW50X292ZXJsYXkoKSwgd2hpY2ggd291bGQgY2FsbCBjcmVhdGVfb3ZlcmxheV9k
aXJzKCkuCj4gPiAobm8gbmVlZCB0byBsb29rdXAgbWVhbmluZyBvZiBwYXJhbWV0ZXIpLgo+Cj4g
PiA+ICsKPiA+ID4gKyAgIHJldCA9IG1vdW50KCJvdmVybGF5IiwgT1ZMX01OVCwgIm92ZXJsYXki
LCAwLCAibG93ZXJkaXI9Ik9WTF9MT1dFUgo+ID4gPiArICAgICAgICAgICAgICAgIix1cHBlcmRp
cj0iT1ZMX1VQUEVSIix3b3JrZGlyPSJPVkxfV09SSyk7Cj4gPiA+ICsgICBpZiAocmV0IDwgMCkg
ewo+ID4gPiArICAgICAgICAgICBpZiAoZXJybm8gPT0gRU5PREVWKSB7Cj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgdHN0X3JlcyhUSU5GTywKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJvdmVybGF5ZnMgaXMgbm90IGNvbmZpZ3VyZWQgaW4gdGhpcyBrZXJuZWwuIik7Cj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgcmV0dXJuIDE7Cj4gPiBGaXJzdCBJIHRob3VnaHQgd2UnZCBp
bXBsZW1lbnQgaXQgYXMgYSB0ZXN0IGZsYWcgKG1lbWJlciBvZiBzdHJ1Y3QgdHN0X3Rlc3QpLgo+
ID4gV2hlbiB3ZSBoYXZlIGl0IGFzIHNlcGFyYXRlIGZ1bmN0aW9uIEkgd29uZGVyIHdoZXRoZXIg
d2UgY291bGQgVENPTkYgb24gRU5PREVWCj4gPiBpbnN0ZWFkIG9mIFRJTkZPIGFuZCByZXR1cm4u
IE1heWJlIHRoZXJlIGNvdWxkIGJlIGhlcmUgZm9yIGludCBzdHJpY3QgcGFyYW1ldGVyLAo+ID4g
d2hlcmUgMSB3b3VsZCBiZSBmb3JjZSBzYWZlIChpLmUuIFRDT05GKSwgb3RoZXJ3aXNlIG9ubHkg
VElORk8uCj4gPiBUaGlzIGNvdWxkIGFsc28gdG8gaGF2ZSBTQUZFX01PVU5UX09WRVJMQVkoKSBt
YWNybyB3aGljaCB3b3VsZCB1c2UgbW91bnRfb3ZlcmxheSgpLgo+ID4gU2ltaWxhciBhcHByb2Fj
aCBhcyBTQUZFX1NFTkQoKSBhbmQgc2FmZV9zZW5kKCkuCj4KPiBGcm9tIG5leHQgcGF0Y2g6Cj4g
PiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lub3RpZnkvaW5vdGlmeTA3LmMKPiA+
IC0jZGVmaW5lIE9WTF9NTlQgIm92bCIKPiA+ICAjZGVmaW5lIERJUl9OQU1FICJ0ZXN0X2RpciIK
PiA+ICAjZGVmaW5lIERJUl9QQVRIIE9WTF9NTlQiLyJESVJfTkFNRQo+ID4gICNkZWZpbmUgRklM
RV9OQU1FICJ0ZXN0X2ZpbGUiCj4gPiAgI2RlZmluZSBGSUxFX1BBVEggT1ZMX01OVCIvIkRJUl9O
QU1FIi8iRklMRV9OQU1FCj4KPiA+ICBzdGF0aWMgaW50IG92bF9tb3VudGVkOwo+ID4gK3N0YXRp
YyBjb25zdCBjaGFyIG1udHBvaW50W10gPSBPVkxfQkFTRV9NTlRQT0lOVDsKPgo+ID4gIHN0YXRp
YyBzdHJ1Y3QgZXZlbnRfdCBldmVudF9zZXRbRVZFTlRfTUFYXTsKPgo+ID4gQEAgLTE2NCwxNCAr
MTY0LDExIEBAIHN0YXRpYyB2b2lkIHNldHVwKHZvaWQpCj4gPiAgICAgICBpbnQgcmV0Owo+Cj4g
PiAgICAgICAvKiBTZXR1cCBhbiBvdmVybGF5IG1vdW50IHdpdGggbG93ZXIgZGlyIGFuZCBmaWxl
ICovCj4gPiAtICAgICBTQUZFX01LRElSKCJsb3dlciIsIDA3NTUpOwo+ID4gLSAgICAgU0FGRV9N
S0RJUigibG93ZXIvIkRJUl9OQU1FLCAwNzU1KTsKPiA+IC0gICAgIFNBRkVfVE9VQ0goImxvd2Vy
LyJESVJfTkFNRSIvIkZJTEVfTkFNRSwgMDY0NCwgTlVMTCk7Cj4gPiAtICAgICBTQUZFX01LRElS
KCJ1cHBlciIsIDA3NTUpOwo+ID4gLSAgICAgU0FGRV9NS0RJUigid29yayIsIDA3NTUpOwo+ID4g
LSAgICAgU0FGRV9NS0RJUihPVkxfTU5ULCAwNzU1KTsKPiA+IC0gICAgIHJldCA9IG1vdW50KCJv
dmVybGF5IiwgT1ZMX01OVCwgIm92ZXJsYXkiLCAwLAo+ID4gLSAgICAgICAgICAgICAgICAgImxv
d2VyZGlyPWxvd2VyLHVwcGVyZGlyPXVwcGVyLHdvcmtkaXI9d29yayIpOwo+ID4gKyAgICAgc2V0
dXBfb3ZlcmxheSgwKTsKPiA+ICsgICAgIFNBRkVfTUtESVIoT1ZMX0xPV0VSIi8iRElSX05BTUUs
IDA3NTUpOwo+ID4gKyAgICAgU0FGRV9UT1VDSChPVkxfTE9XRVIiLyJESVJfTkFNRSIvIkZJTEVf
TkFNRSwgMDY0NCwgTlVMTCk7Cj4gPiArICAgICByZXQgPSBtb3VudCgib3ZlcmxheSIsIE9WTF9N
TlQsICJvdmVybGF5IiwgMCwgImxvd2VyZGlyPSJPVkxfTE9XRVIKPiA+ICsgICAgICAgICAgICAg
ICAgICIsdXBwZXJkaXI9Ik9WTF9VUFBFUiIsd29ya2Rpcj0iT1ZMX1dPUkspOwo+ID4gICAgICAg
aWYgKHJldCA8IDApIHsKPiA+ICAgICAgICAgICAgICAgaWYgKGVycm5vID09IEVOT0RFVikgewo+
ID4gICAgICAgICAgICAgICAgICAgICAgIHRzdF9icmsoVENPTkYsCj4gSW4gaGVyZSBpbiBpbm90
aWZ5MDcuYyBhbmQgaW4gaW5vdGlmeTA4LmMgeW91IGNyZWF0ZSBkaXJzICgwIHBhcmFtZXRlcikg
Zm9yIGJlY2F1c2UgeW91IGl0J3MKPiBuZWVkZWQgdG8gY3JlYXRlIG1vcmUgZGlycy4gVGhhbiB0
aGUgcmVzdCAobW91bnQsIFRDT05GIG9uIEVOT0RFViwgVEJST0sKPiBvdGhlcndpc2UpIGlzIHN0
aWxsIGNvcHkgcGFzdGVkLiBJIHdvbmRlciBob3cgdG8gbW92ZSBldmVyeXRoaW5nIGludG8KPiBz
ZXR1cF9vdmVybGF5KCkgaGVscGVyLiBNYXliZSBzdHJ1Y3Qgd2l0aCBmaWxlcyBvciBkaXJlY3Rv
cmllcyBhbmQgcGVybWlzc2lvbnMKPiB0byBmb3IgdG91Y2gvbWtkaXI/IFdpdGggdGhpcywgaW50
IG1vdW50b3ZsIGRpciBjcmVhdGVfb3ZlcmxheV9kaXJzKCkgbWlnaHQgbm90Cj4gYmUgbmVlZGVk
Lgo+Cj4KCkkgbGlrZWQgeW91ciBpZGVhIG9mIGNyZWF0ZV9vdmVybGF5X2RpcnMvbW91bnRfb3Zl
cmxheSBiZXR0ZXIuCkl0IGlzIG1vcmUgZmxleGlibGUgZm9yIGZ1dHVyZSB0ZXN0cyB0aGF0IG1h
eSB3YW50IHRvIHVtb3VudCBhbmQKbW91bnQgb3ZlcmxheSBzZXZlcmFsIHRpbWVzIGFuZCB0aGUg
c2V0dXAgb2YgbG93ZXIvdXBwZXIgZmlsZXMKY291bGQgYmUgdmVyeSBkaWZmZXJlbnQgaW4gZnV0
dXJlIHRlc3RzLCBub3QgbGltaXRlZCB0byBqdXN0IGNyZWF0aW5nCmZpbGVzIChtYXliZSBzeW1s
aW5rcywgeGF0dHIpLgpUaGUgZXhwZXJpZW5jZSBmcm9tIHhmc3Rlc3RzIG92ZXJsYXkgdGVzdHMg
c3VnZ2VzdHMgdGhhdCB0aGUKY3JlYXRlX292ZXJsYXlfZGlycy9tb3VudF9vdmVybGF5IGhlbHBl
cnMgYXJlIGEgZ29vZCBtb2RlbCB0byBmb2xsb3cuCgpUaGFua3MsCkFtaXIuCgotLSAKTWFpbGlu
ZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
