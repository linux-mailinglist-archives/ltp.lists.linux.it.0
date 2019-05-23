Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ED48E284E3
	for <lists+linux-ltp@lfdr.de>; Thu, 23 May 2019 19:26:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B2AFC3EA5FD
	for <lists+linux-ltp@lfdr.de>; Thu, 23 May 2019 19:26:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 534F83EA2F8
 for <ltp@lists.linux.it>; Thu, 23 May 2019 19:26:37 +0200 (CEST)
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C017D140165B
 for <ltp@lists.linux.it>; Thu, 23 May 2019 19:26:36 +0200 (CEST)
Received: by mail-yb1-xb44.google.com with SMTP id z12so2574781ybr.4
 for <ltp@lists.linux.it>; Thu, 23 May 2019 10:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8q2jzEsSc6uQ5CHLryd1rT2DjWt5/og5dmFsaEhKOBw=;
 b=dcJ1+9phmr9PR/7btyVYehTht4hX2r1J6NYNd33Dk0kkupkKvLqRWNbsoWy5iUlS4Q
 pmn6/VhwoFpokZNRDs1tKn2DL5g92ijv2tXTYfUoVlcL6Vxlf07uq9fdMiGgdX5kl8VQ
 m6kDjf6vMlfyvTo6ET29ItlvpDp78s9QY5WlMuDOgPwQRuUtna4iX5fOAITQxd/n66Nb
 X7MbMk0G7lMXK9GqoNadVIK8oXGhTYiUdgdjpzOo2RflQCHo+coUvMSfguwIyFd8IISH
 Llh6AJfwakwMC7OydsNhH3I9ZrD4i0Bu1+mRwIWCEImO91u8tWcsyo9KGyE/pITLT76i
 qvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8q2jzEsSc6uQ5CHLryd1rT2DjWt5/og5dmFsaEhKOBw=;
 b=iYGSvySW59glHKkn9cuM2oUWXLTBowegziYeQf8zM9WZUk7tkbXTn08b3zz3P0EWo8
 EoYKCw2ieIblHcKNDrCmGvxpAB1IdrNELdTXHNXAE9illN2Ji4R+9oOYBsSbB/SZ9H6D
 ubPVEIKuzm1kGUcJLKEH+uiLk+slWldJOlXhi75tD5hhQ9a6JFQt1WhmjTvJz4ZYtQ0e
 qslNWa9ppHuPtkbyDf0/ic1PY1ddNbTg6EPxrSeXfoIsXqkKn841wnXdKjs8byHvxA9r
 eywReDvW1qYdCjyCOAlgrBGnM+/4gn2cztgDHZg2LhXv7j1LAzXrd6Tjr9svc7xdHPVn
 5qSA==
X-Gm-Message-State: APjAAAXxuXBzMkFZPPwPFDaJwU18kN/aFRduER/A4JYOMOjuiOZjsBlg
 cZUsS2THYkIiIIzthbckLp36GBR/Dr+XHVfmJMg=
X-Google-Smtp-Source: APXvYqzOktYYoHGBS/jnm4SdrR+tJe4CKqq1u+qdn7AbncBOk0eNSqr0Z2WztK8RLAdiQS06VFcyYeVDO4lBQnp4Plw=
X-Received: by 2002:a25:a081:: with SMTP id y1mr19109446ybh.428.1558632395534; 
 Thu, 23 May 2019 10:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190523134549.23103-1-chrubis@suse.cz>
 <CAOQ4uxhHVG9f1njmPgei8-QO4UEivXbxoHkqKi4f50XN6Gup9A@mail.gmail.com>
 <20190523164612.GA11083@fieldses.org>
In-Reply-To: <20190523164612.GA11083@fieldses.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 23 May 2019 20:26:24 +0300
Message-ID: <CAOQ4uxg04H6_3ZsoKZwiVFt3LatjWhT8XWJSiMfFK_tCu5G-ww@mail.gmail.com>
To: "J. Bruce Fields" <bfields@fieldses.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: Miklos Szeredi <miklos@szeredi.hu>, ltp@lists.linux.it,
 overlayfs <linux-unionfs@vger.kernel.org>
Subject: Re: [LTP] [PATCH] [COMMITTED] syscalls/fcntl33: Fix typo overlapfs
	-> overlayfs
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

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgNzo0NiBQTSBKLiBCcnVjZSBGaWVsZHMgPGJmaWVsZHNA
ZmllbGRzZXMub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgTWF5IDIzLCAyMDE5IGF0IDA2OjQyOjEy
UE0gKzAzMDAsIEFtaXIgR29sZHN0ZWluIHdyb3RlOgo+ID4gT24gVGh1LCBNYXkgMjMsIDIwMTkg
YXQgNDo0NSBQTSBDeXJpbCBIcnViaXMgPGNocnViaXNAc3VzZS5jej4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IFNpZ25lZC1vZmYtYnk6IEN5cmlsIEhydWJpcyA8Y2hydWJpc0BzdXNlLmN6Pgo+ID4gPiAt
LS0KPiA+ID4gIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNudGwvZmNudGwzMy5jIHwgMiAr
LQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4g
PiA+Cj4gPiA+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZjbnRsL2Zj
bnRsMzMuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNudGwvZmNudGwzMy5jCj4gPiA+
IGluZGV4IDQzZGM1YTJhZi4uNjI3ODIzYzVjIDEwMDY0NAo+ID4gPiAtLS0gYS90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRsMzMuYwo+ID4gPiArKysgYi90ZXN0Y2FzZXMva2Vy
bmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRsMzMuYwo+ID4gPiBAQCAtMTE3LDcgKzExNyw3IEBAIHN0
YXRpYyB2b2lkIGRvX3Rlc3QodW5zaWduZWQgaW50IGkpCj4gPiA+ICAgICAgICAgaWYgKFRTVF9S
RVQgPT0gLTEpIHsKPiA+ID4gICAgICAgICAgICAgICAgIGlmICh0eXBlID09IFRTVF9PVkVSTEFZ
RlNfTUFHSUMgJiYgVFNUX0VSUiA9PSBFQUdBSU4pIHsKPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgdHN0X3JlcyhUSU5GTyB8IFRURVJSTk8sCj4gPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgImZjbnRsKEZfU0VUTEVBU0UsIEZfV1JMQ0spIGZhaWxlZCBvbiBvdmVybGFw
ZnMgYXMgZXhwZWN0ZWQiKTsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
ZmNudGwoRl9TRVRMRUFTRSwgRl9XUkxDSykgZmFpbGVkIG9uIG92ZXJsYXlmcyBhcyBleHBlY3Rl
ZCIpOwo+ID4KPiA+IFlvdSBoYXZlIDMgbW9yZSBvZiB0aGlzIHR5cG8gaW4gZmNudGwgdGVzdHMu
Cj4gPgo+ID4gSWYgeW91IGFzayBtZSwgc2lsZW5jaW5nIHRoaXMgZXJyb3Igc2VlbXMgd3Jvbmcu
Cj4gPiBXaGlsZSB0aGUgZXJyb3IgaXMgKmV4cGVjdGVkKiBpdCBpcyBzdGlsbCBhIGJyb2tlbiBp
bnRlcmZhY2UuCj4gPiBJdCBtYXkgYmUganVzdCBhIG1hdHRlciBvZiB0ZXJtaW5vbG9neSwgYnV0
IEkgYW0gcmVhZGluZyB0aGlzIG1lc3NhZ2UgYXM6Cj4gPgo+ID4gVEVTVCBQQVNTRUQ6IE92ZXJs
YXlmcyBmYWlsZWQgYXMgZXhwZWN0ZWQKPiA+Cj4gPiBXaGlsZSBpdCByZWFsbHkgc2hvdWxkIGJl
IG1vcmUgYWxvbmcgdGhlIGxpbmVzIG9mOgo+ID4KPiA+IFRFU1QgU0tJUFBFRDogT3ZlcmxheWZz
IGRvZXNuJ3Qgc3VwcG9ydCB3cml0ZSBsZWFzZWQKPiA+Cj4gPiBCZXNpZGVzLCB0aGlzIHByb2Js
ZW0gbG9va3MgcXVpdGUgZWFzeSB0byBmaXguCj4gPiBJIHRoaW5rIEJydWNlIHdhcyBhbHJlYWR5
IGxvb2tpbmcgYXQgY2hhbmdpbmcgdGhlIGltcGxlbWVudGF0aW9uIG9mCj4gPiBjaGVja19jb25m
bGljdGluZ19vcGVuKCksIHNvIGlmIHRoZSB0ZXN0IGlzIG5vdCBmYWlsaW5nLCBub2JvZHkgaXMg
Z29pbmcgdG8KPiA+IG51ZGdlIGZvciBhIGZpeC4uLgo+Cj4gVW0sIEkgcmVtZW1iZXIgdGhhdCBk
aXNjdXNzaW9uIGJ1dCBJIGNhbid0IHJlbWVtYmVyIHdoYXQgdGhlIG9ic3RhY2xlcwo+IHdlcmUg
aW4gdGhlIGVuZC4gIFRyeWluZyB0byBmaW5kIHRoYXQgdGhyZWFkLi4uLgo+CgppX3JlYWRjb3Vu
dCBleGlzdHMsIGJ1dCBpdHMgd2l0aCAjaWZkZWYgQ09ORklHX0lNQSBhbmQgaXQgY291bnRzCm9u
bHkgT19SRE9OTFkgdXNlcnMuCgpJdCB3b3VsZG4ndCBpbmNyZWFzZSBzdHJ1Y3QgaW5vZGUgaWYg
d2UgYWx3YXlzIGhhdmUgaV9yZWFkY291bnQgZm9yCjY0Yml0IGFyY2guCgpJIHRoaW5rIEZfV1JM
Q0sgc2hvdWxkIHJlcXVpcmUgaV9yZWFkY291bnQgPT0gMCAmJiBpX3dyaXRlY291bnQgPT0gMS4K
CkNhbid0IHJlbWVtYmVyIGlmIGFuZCB3aHkgeW91IG5lZWRlZCB0aGUgcmVhZGVycyBjb3VudD8K
ClRoYW5rcywKQW1pci4KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK
